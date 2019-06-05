---
layout: post
title: 'Install ESXi through Foreman using iPXE bootstrapping'
date: 2019-06-21 14:25:45
author:
  name: Amardeep Kahali
tags:
- foreman
- esxi
- vmware
- ipxe
- bootstrapping
- uefi
guest_post: true
---

This post is intended to simplify the ESXi installation process [described in the previous post](https://theforeman.org/2018/08/deploying-esxi-through-foreman.html) using the new iPXE bootstrapping feature of Foreman introduced in v1.20.

### Requirements

* A fully working Foreman instance. Follow the [manual](https://theforeman.org/manuals/latest/index.html#3.InstallingForeman) to install Foreman. After installation, please configure Foreman so that a Linux OS (for e.g. Centos) can be deployed successfully through Foreman.

* An [ESXi ISO](https://my.vmware.com/en/group/vmware/evalcenter). For this demo we will use `VMware-VMvisor-Installer-6.7.0-8169922.x86_64.iso` but the same process will work on any version of ESXi.  

Note: This demo is run on a Ubuntu system. 

### 1: Enable iPXE in Foreman

---

Since `foreman-installer` doesn't support creating an iPXE based Foreman instance yet, we need to make some changes to the DHCP configuration manually to enable iPXE. The `dhcpd.conf` should look like this:

    ```
    # Bootfile Handoff
    next-server X.X.X.X;  # Replace with actual IP address of Foreman Server
    option architecture code 93 = unsigned integer 16 ;

    if exists user-class and option user-class = "iPXE" {
      filename "http://FOREMAN_SERVER_FQDN/unattended/iPXE?bootstrap=1";  # Replace with actual FQDN of Foreman Server
    } elsif option architecture = 00:06 {
      filename "ipxe.efi";
    } elsif option architecture = 00:07 {
      filename "snp.efi";
    } elsif option architecture = 00:09 {
      filename "ipxe.efi";
    } else {
      filename "undionly.kpxe";
    }

    ```

**Note:** For both Legacy BIOS and UEFI configs, we are using the iPXE bootloaders that use the iPXE drivers of the network card (undionly.kpxe/snp.efi) as we faced issues with the native drivers (ipxe.pxe/ipxe.efi) on our hardware (Dell PowerEdge 14G with Broadcom NICs).  
References: [1](http://forum.ipxe.org/showthread.php?tid=5806), [2](https://github.com/warewulf/warewulf3/issues/84)


Now let's build the iPXE bootloaders. In this example, the ISO images will be hosted on the Foreman server itself. Since HTTP is already used, we have to use FTP to expose the images. So the iPXE bootloaders need to have FTP support. If you use a separate HTTP based image repository, you may skip that step.

  ```sh
  #We need lzma libraries
  apt-get install liblzma-dev
  cd /tmp
  git clone git://git.ipxe.org/ipxe.git
  cd ipxe/src
  # Enable FTP Support in iPXE
  sed -i -e 's/#undef\s*DOWNLOAD_PROTO_FTP/#define DOWNLOAD_PROTO_FTP/g' config/general.h
  # Build the EFI bootloader first
  make bin-x86_64-efi/snp.efi
  # The ESXi Legacy BIOS bootloader mboot.c32 needs COMBOOT enabled in iPXE
  sed -i -e 's/\/\/#define\s*IMAGE_COMBOOT/#define       IMAGE_COMBOOT/g' config/general.h
  # Build the Legacy BIOS Bootloader
  make bin/undionly.kpxe
  # Copy bootloaders to TFTP root
  cp bin/undionly.kpxe /var/lib/tftpboot/
  cp bin-x86_64-efi/snp.efi /var/lib/tftpboot/
  ```

### 2: Prepare the OS medium

---

* [Install and configure FTP.](https://www.g-loaded.eu/2008/12/02/set-up-an-anonymous-ftp-server-with-vsftpd-in-less-than-a-minute/) Enable anonymous login.

* If FTP root is set to /var/ftp, we will mount the ESXi ISO under `/var/ftp/ESXi-6.7.0-8169922`

  ```sh
  cd /var/ftp
  mkdir ESXi-6.7.0-8169922
  mount ~/Desktop/VMware-VMvisor-Installer-6.7.0-8169922.x86_64.iso /var/ftp/ESXi-6.7.0-8169922
  ```

* The path to the OS medium needs to be added as a prefix parameter to the boot.cfg file.

  ```sh
  cd /var/ftp
  cp ESXi-6.7.0-8169922/boot.cfg boot-ESXi-6.7.0-8169922.cfg
  # Replace with actual IP/FQDN of Foreman server
  sed -e "s#/##g" -e "3s#^#prefix=ftp://FOREMAN_SERVER_FQDN/ESXi-6.7.0-8169922\n#" -i boot-ESXi-6.7.0-8169922.cfg
  ```

  **Note:** These steps can be automatically done whenever a host is set to build mode by using [Foreman-Hooks](https://github.com/theforeman/foreman_hooks). Please have a look at the [previous post](https://theforeman.org/2018/08/deploying-esxi-through-foreman.html) for help on using it.

### 3: Create an entry for the ESXi OS in Foreman

---

**3.1: Create the OS Medium**  
  * Open https://{foreman-url}/media and click on **Create Medium**.  
  Now create a dummy entry for ESXi since each OS entry in Foreman needs an installation media. The actual path to the medium needs to be in the boot.cfg file.

**3.2: Create the OS**  
  * Open https://{foreman-url}/operatingsystems and click on **Create Operating System** 
  * Under Operating System, enter the following:  

    Name            -  ESXi-6.7.0-8169922 (ESXi-{**OS Version**}-{**Build Number**})  
    Major version   -  6  
    Minor version   -  7  
    Description     -  ESXi-6.7.0-8169922  
    Family          -  Redhat  
    Root pass hash  -  [SHA512](https://www.virtuallyghetto.com/2018/05/quick-tip-what-hashing-algorithm-is-supported-for-esxi-kickstart-password.html)  
    Architectures   -  x86_64 

**3.3: Create provisioning templates**
  * **3.3.1:** Create the common iPXE template for both Legacy BIOS and UEFI modes
    * Open https://{foreman-url}/templates/provisioning_templates and click on **Create Template**
    * Name - **ESXi iPXE Common**
    * Template contents:

      ```
      #!ipxe
      # Detect firmware type of iPXE and set appropriate ESXi Bootloader
      iseq ${platform} efi && set esxi_bootloader efi/boot/bootx64.efi || set esxi_bootloader mboot.c32
      dhcp
      kernel ftp://<%= foreman_server_fqdn %>/<%= @host.operatingsystem.name %>/${esxi_bootloader}-c ftp://<%= foreman_server_fqdn %>/boot-<%= @host.operatingsystem.name %>.cfg ks=<%= foreman_url("provision") %> BOOTIF=01-<%= @host.mac.gsub(":", "-") %>
      boot
      ```
  
    * Template Type - **iPXE template**

    * Template Association - Select **"ESXi 6.7 Build 8169922"**

    * Click Submit

    Note: We are using Foreman's template variables instead of hardcoded values. This will allow us to reuse same templates for multiple ESXi versions.

  * **3.3.2:** Create the Kickstart Template  
    * Name - ESXi Minimal Kickstart
    * Contents:

      ```
      vmaccepteula
      keyboard 'US Default'
      reboot
      rootpw --iscrypted <%= root_pass %>
      install --firstdisk --overwritevmfs --novmfsondisk

      # Set the network to DHCP on the first network adapter
      network --bootproto=dhcp --device=<%= @host.mac %>

      %post --interpreter=busybox
      # Add temporary DNS resolution so the foreman call works
      echo "nameserver <%= @host.subnet.dns_primary %>" >> /etc/resolv.conf

      # Inform Foreman that we are done.
      wget -O /dev/null <%= foreman_url('built') %>
      echo "Done with Foreman call"
      ```


**3.4: Set default provisioning templates**  
  Now that the templates are created, we need to set those as default.
  * Navigate to https://{foreman-url}/operatingsystems and click on the ESXi OS **"ESXi 6.7 Build 8169922"**
  * Open the "Templates" tab
  * Select the "ESXi Minimal Kickstart" under Provisioning template.
  * Under iPXE template, select "ESXi iPXE Common" and click Submit.

Now we are ready to deploy this OS on to a host.

**3.5:** Open https://{foreman-url}/hosts/ and edit the host on which you want to deploy ESXi.  

**3.6:** Under the 'Operating System' tab, select the following values:

  Operating System : ESXi 6.7 Build 8169922  
  Media : ESXi Dummy  
  Partition table: Kickstart default  
  **PXE Loader : None**  

Click 'Resolve' beside Provisioning templates and you should see the ESXi iPXE and Kickstart templates. Click Submit.

**3.7:** Click 'Build' and reboot the host to PXE. You should see iPXE boot up and fetch the iPXE script from DHCP. On getting this request, Foreman sees the host is in build mode and provides "ESXi iPXE Common" script. The installer loads up and completes the installation automatically. Upon build complete when the host reboots, Foreman will automatically provide a localboot iPXE script. Pretty cool!

_References:_  
<https://community.theforeman.org/t/discovery-ipxe-efi-workflow-in-foreman-1-20/13026>  
<https://projects.theforeman.org/projects/foreman/wiki/Fetch_boot_files_via_http_instead_of_TFTP/>
