---
layout: post
title: Provisioning Ubuntu Autoinstall
date: 2024-02-27 09:41:32
author: Maximilian Kolb
tags:
- foreman
- provisioning
- ubuntu
- autoinstall
---

Foreman supports provisioning hosts running Debian and Ubuntu on VMware, Proxmox, cloud providers such as Microsoft Azure, and bare metal hosts.
With the Katello plug-in, provisioned and registered hosts receive versioned DEB content based on their lifecycle.
This blog article is a short summary of _what_ happened behind the scenes to provisioning hosts running Ubuntu 20.04.3+, _why_ you need new templates, and _how_ to use the new deployment mechanism.

<!--more-->

## TL;DR

Provisioning Ubuntu 20.04.3+ uses the new [Ubuntu Autoinstall](https://ubuntu.com/server/docs/install/autoinstall) mechanism which is based on cloud-init to perform image-based deployments.
In your Foreman+Katello instance, you need the ISO image, boot files, and a user data template.
Associate the `Autoinstall` provisioning templates to your operating system entry.

For Ubuntu 20.04.z deployments, Foreman decides based on the minor OS version whether to use the `Preseed` or `Autoinstall` mechanism:

- Minor OS version 0, 1, 2: Preseed
- Minor OS version 3 or above: Autoinstall

Ensure that the mechanism matches the associated templates and that your managed host has at least 3 GiB of memory.
Ubuntu 22.04 "Jammy Jellyfish" deployment is Autoinstall-only and not affected by the minor OS version.

## Previous approach: using "debian-installer"

Provisioning hosts with Debian and Ubuntu up to Ubuntu 20.04.2 supports `debian-installer` with `Preseed` templates.
With Ubuntu 20.04.3+ and Ubuntu 22.04, you have to use Autoinstall, a cloud-init-based mechanism, to perform network-based deployments.

## Introducing "Subiquity" aka. Ubuntu Autoinstall

Ubuntu 20.04 comes with a new `Subiquity` installer, but .0, .1, and .2 still supported `debian-installer` and therefore `Preseed` templates.
With Ubuntu 20.04.2 and below, Ubuntu relied on the same deployment mechanism as Debian to install the operating system in an unattended way.
Foreman still contains different well tested and maintained `Preseed` templates to provision hosts running all Debian and Ubuntu 20.04.2 and older.

For the Foreman community, this meant additional development time to provide `Autoinstall` templates and the option to use the minor OS version for Ubuntu 20.04 to optionally select `debian-installer` on Ubuntu 20.04.0, 20.04.1, and 20.04.2.

### Comparing "Preseed" Templates and "Autoinstall" Templates

Autoinstall templates are much shorter and simpler:

#### Preseed Default template

```shell
# This preseed file was rendered from the Foreman provisioning template "Preseed default".
# for debian12.example.com running Debian 12
# Organization: Example
# Location: Munich

# Locale
d-i debian-installer/locale string en_US
# country and keyboard settings are automatic. Keep them ...
# ... for wheezy and newer:
d-i keyboard-configuration/xkb-keymap seen true

# Network configuration
d-i netcfg/choose_interface select auto
d-i netcfg/get_hostname string debian12.example.com
d-i netcfg/get_domain string example.com
d-i netcfg/wireless_wep string

d-i hw-detect/load_firmware boolean true

# Mirror settings
d-i mirror/country string manual
d-i mirror/http/hostname string ftp.debian.org:80
d-i mirror/http/directory string /debian
d-i mirror/http/proxy string
d-i mirror/codename string bookworm
d-i mirror/suite string bookworm
d-i mirror/udeb/suite string bookworm

# Time settings
d-i clock-setup/utc boolean true
d-i time/zone string UTC

# NTP
d-i clock-setup/ntp boolean true
d-i clock-setup/ntp-server string 0.debian.pool.ntp.org

# Set alignment for automatic partitioning
# Choices: cylinder, minimal, optimal
#d-i partman/alignment select cylinder

# Use the first detected hard disk
d-i partman/early_command string \
  INSTALL_DISK="$(list-devices disk | head -n1)"; \
  debconf-set partman-auto/disk "$INSTALL_DISK"; \
  debconf-set grub-installer/bootdev "$INSTALL_DISK"

### Partitioning
# The presently available methods are: "regular", "lvm" and "crypto"
d-i partman-auto/method string regular

# If one of the disks that are going to be automatically partitioned
# contains an old LVM configuration, the user will normally receive a
# warning. This can be preseeded away...
d-i partman-lvm/device_remove_lvm boolean true
# The same applies to pre-existing software RAID array:
d-i partman-md/device_remove_md boolean true
# And the same goes for the confirmation to write the lvm partitions.
d-i partman-lvm/confirm boolean true
d-i partman-lvm/confirm_nooverwrite boolean true

# You can choose one of the three predefined partitioning recipes:
# - atomic: all files in one partition
# - home:   separate /home partition
# - multi:  separate /home, /var, and /tmp partitions (/usr was removed in jessie)
d-i partman-auto/choose_recipe select atomic

# If you just want to change the default filesystem to something
# else, you can do that without providing a full recipe.

# This makes partman automatically partition without confirmation, provided
# that you told it what to do using one of the methods above.
d-i partman/confirm_write_new_label boolean true
d-i partman/choose_partition select finish
d-i partman/confirm boolean true
d-i partman/confirm_nooverwrite boolean true

# User settings
d-i passwd/root-password-crypted password _My_Password_
user-setup-udeb passwd/root-login boolean true
d-i passwd/make-user boolean false
user-setup-udeb passwd/make-user boolean false

# If we are using Katello for content management, then we do not want to use
# upstream mirrors prior to Katello registration.
d-i apt-setup/use_mirror boolean false
d-i apt-setup/service-select multiselect
d-i apt-setup/services-select multiselect

# Install minimal task set (see tasksel --task-packages minimal)
tasksel tasksel/first multiselect minimal, ssh-server, openssh-server

# Install some base packages
d-i pkgsel/include string lsb-release wget python3
d-i pkgsel/update-policy select unattended-upgrades
d-i pkgsel/upgrade select none

popularity-contest popularity-contest/participate boolean false

# Boot loader settings
#grub-pc grub-pc/hidden_timeout boolean false
#grub-pc grub-pc/timeout string 10
d-i grub-installer/only_debian boolean true
d-i grub-installer/with_other_os boolean true
d-i finish-install/reboot_in_progress note

d-i preseed/late_command string wget -Y off http://foreman.example.com/unattended/finish -O /target/tmp/finish.sh && in-target chmod +x /tmp/finish.sh && in-target /tmp/finish.sh
```

#### Preseed Autoinstall Cloud-init user data template

```yaml
#cloud-config
autoinstall:
  version: 1
  apt:
    geoip: false
    preserve_sources_list: false
    primary:
      - arches: [amd64, i386]
        uri: http://foreman.example.com:80/pub/installation_media/ubuntu/22.04-x86_64/
    disable_components: [multiverse]
    disable_suites: [backports,security,updates]
  user-data:
    disable_root: false
    fqdn: ubuntu2204.example.com
    users:
    - name: root
      gecos: root
      lock-passwd: false
      hashed_passwd: _My_Password_
      ssh_authorized_keys: ["ssh-rsa _My_Foreman_Proxy_SSH_Key_ foreman-proxy@foreman.example.com"]
  keyboard:
    layout: us
    toggle: null
    variant: ''
  locale: en_US.UTF-8
  network:
    version: 2
    ethernets:
      ens160:
        dhcp4: true
        dhcp6: false
  ssh:
    allow-pw: true
    install-server: true
  updates: security

  storage:
    layout:
      name: lvm
  late-commands:
  - wget -Y off http://foreman.example.com/unattended/finish -O /target/tmp/finish.sh
  - curtin in-target -- chmod +x /tmp/finish.sh
  - curtin in-target -- /tmp/finish.sh
```

## Behind the Scenes

Behind the scenes, there are changes in Ubuntu, Foreman, and the provisioning workflow.

### New Installer

With Ubuntu 20.04.3+, the server installer changed from `debian-installer` to `Subiquity` installer.
This installer brings various changes:

* UEFI/BIOS boot templates require different Kernel parameters
* Installation media file layout changed, for example the file structure in the ISO image
* Unattended installations require a different config file format

This means that Foreman has to search for the boot files in different paths depending on the Ubuntu version and provisioning method to provide the boot files during the host deployment.
This is technically independent of the used installation mechanism, but the provisioning templates associated with the OS and the installation mechanism of the OS have to match.

Overall, provisioning hosts running Ubuntu 20.04.3+ requires different provisioning templates, a way to handle the ISO image and boot files on Foreman Server and Smart Proxy Servers, and a user data template for Autoinstall.

### Changes in Foreman

- With `Autoinstall`, you need a new type of template called "user data template" similar to cloud deployments. (before: `Preseed` templates)
- Provide the ISO image and extracted ISO image. (before: installation with `debian-installer` was based on a repository)

With these two changes, the location of the ISO image and the Autoinstall template must be passed to the Kernel.
Therefore, the new `PXELinux Autoinstall` and `PXEGrub2 Autoinstall` templates contain the URLs where to find the user data template and ISO image.

### Boot Files: Linux Kernel and `initrd`

- For Ubuntu with major OS version `18.04` or `20.04.z` with minor OS version `0`, `1`, or `2`: Foreman searches for `initrd.gz` and `linux` in `dists/bionic/main/installer-amd64/current/images/netboot/ubuntu-installer/amd64/` for 18.04 and `dists/focal/main/installer-amd64/current/legacy-images/netboot/ubuntu-installer/amd64/` for 20.04.
This means that you have to use `Preseed` templates suitable for the `debian-installer` mechanism.
- For Ubuntu with major OS version `20.04` with minor OS version `3` or above, or `22.04.z`: Foreman searches for `initrd` and `vmlinuz` in `casper/`.
This means that you have to use `Autoinstall` templates suitable for the `Subiquity` installer.

When you create a host, Foreman retrieves the boot files from the URL of the installation media.
For Debian and Ubuntu prior to 20.04.3, you could use `http://archive.ubuntu.com` and Foreman would find the required files based on the code name configured for the OS entry.
For Ubuntu 20.04.3+, those files are no longer present in the official upstream repositories.
Therefore, you have to extract the ISO image and make it accessible for Foreman Server or Smart Proxy Server during provisioning.
For example, you can place it in `FQDN/pub/installation_media/ubuntu/20.04/`.

### Provisioning Debian/Ubuntu Compared to Enterprise Linux

In contrast to Enterprise Linux such as Red Hat Enterprise Linux or AlmaLinux, you cannot provision Ubuntu based on synchronized content.
This is due to the missing Linux Kernel and initrd files in the synchronized Pulp repositories.
The alternative for both Debian and Ubuntu has mostly been to either use the upstream repositories (downside: you need access to the internet), or by extracting the installation files from the ISO image and providing them under `pub/` on your Foreman Server (downside: depends on the z-release).

### Provisioning process

- Foreman provides the rendered user data template on `FQDN/userdata/`.
This interface is already in use for all image-based deployments that use `cloud-init` templates.
- Because the ISO image is also required for the deployment but Foreman does not provide any dedicated interface for this, we have documented a way to place the ISO image into the `FQDN/pub/installation_media` directory on Foreman Server.
This means Foreman serves the ISO image over `http`.
If you want to deploy a host from a Smart Proxy Server, you have to copy the ISO image to your Smart Proxy Server.
- Ubuntu Autoinstall deployments also require the extracted ISO image.
You have to place the extracted ISO image in `FQDN/pub/installation_media/` on your Foreman Server and name the directory identical to the ISO image without the `.iso` file ending.
If you want to deploy a host from a Smart Proxy Server, you have to copy the extracted ISO image to your Smart Proxy Server.

Ensure that you provide the ISO and extracted ISO under the same name, for example `22_04.iso` and `22_04/`, to use the URL for the installation media as path for both.
For more information, see [Creating an Installation Medium for Ubuntu 22.04](https://docs.theforeman.org/3.9/Provisioning_Hosts/index-katello.html#Creating_an_Installation_Medium_for_Ubuntu_22_04_provisioning) in _Provisioning Hosts_.

#### preseed_kernel_options_autoinstall.erb

The `preseed_kernel_options_autoinstall.erb` template sets the path to the ISO image based on the URL of the installation media and configure the Kernel parameters.

```erb
<%#
kind: snippet
name: preseed_kernel_options_autoinstall
model: ProvisioningTemplate
snippet: true
description: options for the kernel / preseed startup initialization
oses:
- ubuntu
test_on:
- ubuntu_autoinst4dhcp
-%>
<%
  ...
  image_path = @preseed_path.sub(/\/?$/, '.iso')
  userdata_option = "ds=nocloud-net;s=http://#{foreman_request_addr}/userdata/"
  options = []

  ...

  options << "BOOTIF=#{mac}" if mac
  options << 'ramdisk_size=1500000'
  options << 'fsck.mode=skip'
  options << 'autoinstall'
  options << "url=http://#{@preseed_server}#{image_path}"
  options << 'cloud-config-url=/dev/null'
  if @add_userdata_quotes
    options << "\"#{userdata_option}\""
  else
    options << userdata_option
  end
  options << 'console-setup/ask_detect=false'
  options << "locale=#{host_param('lang') || 'en_US'}"
  options << 'localechooser/translation/warn-light=true'
  options << 'localechooser/translation/warn-severe=true'
  options << "hostname=#{hostname}"
  options << "domain=#{domain}"
%>
<%= options.join(' ') -%>
```

For more information, see [app/views/unattended/provisioning_templates/snippet/preseed_kernel_options_autoinstall.erb](https://github.com/theforeman/foreman/blob/develop/app/views/unattended/provisioning_templates/snippet/preseed_kernel_options_autoinstall.erb) in the _foreman_ repository.

To complete the provisioning process, the user data template configures a user, sets up remote access using authorized SSH keys, configures networking and the disk layout, and fetches the rendered finish data template from Foreman.
The `Preseed default finish` template installs `subscription-manager` and registers the host to Foreman.

### Provisioning Templates

- Debian 10 "Buster", Debian 11 "Bullseye", Debian 12 "Bookworm", Ubuntu 18.04 "Bionic", and Ubuntu 20.04, 20.04.1, 20.04.2 "Focal": `Preseed default` provisioning templates
- Ubuntu 20.04 "Focal" and Ubuntu 22.04 "Jammy": `Autoinstall` provisioning templates

#### Provisioning Templates for "Preseed" and "Autoinstall"

| Template Type                       | Preseed                        | Autoinstall                              |
|-------------------------------------|--------------------------------|------------------------------------------|
| Finish template                     | Preseed default finish         | Preseed default finish                   |
| Host initial configuration template | Linux host_init_config default | Linux host_init_config default           |
| iPXE template                       | Preseed default iPXE           | Preseed default iPXE Autoinstall         |
| Provisioning template               | Preseed default                | -                                        |
| PXEGrub template                    | -                              | -                                        |
| PXEGrub2 template                   | Preseed default PXEGrub2       | Preseed default PXEGrub2 Autoinstall     |
| PXELinux template                   | Preseed default PXELinux       | Preseed default PXELinux Autoinstall     |
| User data template                  | -                              | Preseed Autoinstall cloud-init user data |

## Example Workflow: Provisioning Ubuntu 22.04 through a Smart Proxy Server

This example guides you through the extensive Foreman documentation and its _Provisioning Hosts_ guide.
It assumes you have a running Foreman 3.9 with Katello 4.11 instance.

1. Create an operating system entry on your Foreman+Katello.
For more information, see [Creating an Operating System for Ubuntu](https://docs.theforeman.org/3.9/Provisioning_Hosts/index-katello.html#Creating_an_Operating_System_for_Ubuntu_provisioning).
    - Set the *OS major version* to `22.04` for Ubuntu 22.04 "Jammy Jellyfish".
    - The *OS minor version* does not impact your OS deployment.
    - Set the *Release Name* to `jammy`.
    - Select the `Preseed default Autoinstall` templates and `Preseed Autoinstall cloud-init user data` as user data template.
    - Ensure to use the `PXELinux Autoinstall` template as PXELinux template.
2. If you have made any changes to `Preseed default` templates, replicate those, if required, in the `Autoinstall` templates.
Be aware that customized templates in Foreman do not receive any updates.
For more information, see [Associating Templates with Operating Systems](https://docs.theforeman.org/3.9/Provisioning_Hosts/index-katello.html#Associating_Templates_with_Operating_Systems_provisioning).
3. Provide the Ubuntu 22.04 ISO image and extracted ISO image on your Foreman Server: [Creating an Installation Medium for Ubuntu 22.04](https://docs.theforeman.org/3.9/Provisioning_Hosts/index-katello.html#Creating_an_Installation_Medium_for_Ubuntu_22_04_provisioning).
Ensure that the name of the ISO image and the directory of the extracted ISO image match as described above.
4. Copy the ISO image and extracted ISO image to your Smart Proxy Server: [Provisioning Ubuntu Autoinstall Through Smart Proxies](https://docs.theforeman.org/3.9/Provisioning_Hosts/index-katello.html#Provisioning_Ubuntu_Autoinstall_Through_Smart_Proxies_provisioning).
5. Create two installation media entries and associate them with your operating system entry: [Adding Installation Media to Foreman](https://docs.theforeman.org/3.9/Provisioning_Hosts/index-katello.html#adding-installation-media_provisioning).
    - Create an installation media entry for the extracted ISO image on your Foreman Server.
    - Create an installation media entry for the extracted ISO image on your Smart Proxy Server.
6. Synchronize the Foreman Client for Ubuntu 22.04 from oss.atix.de: [Adding DEB Repository Example for Ubuntu 22.04](https://docs.theforeman.org/3.9/Managing_Content/index-katello.html#Adding_Custom_DEB_Repository_Example_for_Ubuntu_22_04_content-management).
For more information, see [oss.atix.de](https://oss.atix.de/).
Ensure to add the Foreman Client repository to your content view.
7. Tie everything together in a host group: [Creating a Host Group](https://docs.theforeman.org/3.9/Managing_Hosts/index-katello.html#Creating_a_Host_Group_managing-hosts).
Ensure that your host group uses the proper installation media entry to provision Ubuntu 22.04 through Smart Proxy Servers.
8. Deploy a host. 🎉

If you have any questions, please open a thread in the [Foreman Community Forum](https://community.theforeman.org/).
