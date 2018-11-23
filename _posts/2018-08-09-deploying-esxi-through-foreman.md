---
layout: post
title: 'Deploying ESXi through Foreman'
date: 2018-08-09 14:25:45
author:
  name: Amardeep Kahali
tags:
- foreman
- esxi
- vmware
guest_post: true
---
At the time of writing this (Foreman v1.18), ESXi deployment through Foreman is not supported natively. The problem is exacerbated by the fact that the ESXi Legacy BIOS bootloader depends on an older Syslinux (v3.86) and [GRUB2 not being able to chainload the ESXi EFI bootloader](https://communities.vmware.com/thread/463818?start=15&tstart=0). However there are [quite](http://blog.reversion.org/sysadmin/deploying-esxi-with-satellite-6/) [a](http://www.c0t0d0s0.de/esxwithforeman/esxwithforeman.html) [few](https://beryju.org/en/blog/getting-started-foreman-part-3) articles on the Internet that have attempted to work around these issues.  
This post is an attempt to bring all the information together in one place, simplify the process and most importantly, support both Legacy BIOS and UEFI modes of installation.  
Huge thanks to the foreman developers for helping me out whenever I was stuck.

### Requirements

* A fully working Foreman instance. Follow the [manual](https://theforeman.org/manuals/latest/index.html#3.InstallingForeman) to install Foreman. After installation, please configure Foreman so that a Linux OS (for e.g. Centos) can be deployed successfully through Foreman.
* Please make sure the Bootfile Handoff section in `dhcpd.conf` looks like this:

    ```
    # Bootfile Handoff
    next-server 127.0.0.1;
    option architecture code 93 = unsigned integer 16 ;
    if option architecture = 00:06 {
      filename "grub2/bootia32.efi";
    } elsif option architecture = 00:07 {
      filename "grub2/bootx64.efi";
    } elsif option architecture = 00:09 {
      filename "grub2/bootx64.efi";
    } else {
      filename "pxelinux.0";
    }
    ```

* [Foreman-Hooks](https://github.com/theforeman/foreman_hooks). Run the following command to install:  

    `foreman-installer --enable-foreman-plugin-hooks`

* [Syslinux version 3.86](https://mirrors.edge.kernel.org/pub/linux/utils/boot/syslinux/3.xx/syslinux-3.86.tar.gz).
* An [ESXi ISO](https://my.vmware.com/en/group/vmware/evalcenter). For this demo we will use `VMware-VMvisor-Installer-6.7.0-8169922.x86_64.iso` but the same process will work on any version of ESXi.  

Note: This demo is run on a Ubuntu system. The paths may be different for other OSes. Please refer to the documentation for details.

### 1: Create an entry for the ESXi OS in Foreman

---

**1.1: Create the OS Medium**
  * Open https://{foreman-url}/media and click on **Create Medium**.  
  Now create a dummy entry for ESXi since each OS entry in Foreman needs an installation media.
    <p float='left' align='left'>
      <img src="/static/images/blog_images/2018-08-16-deploying-esxi-through-foreman/dummy_esxi_media.png" width="400" />
    </p>

**1.2: Create the OS**
  * Open https://{foreman-url}/operatingsystems and click on **Create Operating System** 
  * Under Operating System, enter the following:  
    Name            -  ESXi-6.7.0-8169922 (ESXi-{**OS Version**}-{**Build Number**})  
    Major version   -  6  
    Minor version   -  7  
    Family          -  Redhat  
    Root pass hash  -  [SHA512](https://www.virtuallyghetto.com/2018/05/quick-tip-what-hashing-algorithm-is-supported-for-esxi-kickstart-password.html)  
    Architectures   -  x86_64  
    <p float='left' align='left'>
      <img src="/static/images/blog_images/2018-08-16-deploying-esxi-through-foreman/new_esxi_os.png" width="400" />
    </p>
  * Partition Table - Kickstart default  
    Note: We are using Kickstart default for the sake of simplicity. The actual partitioning will be controlled from the kickstart file. It is also possible to create a new ptable for ESXi and use it here.
    <p float='left' align='left'>
      <img src="/static/images/blog_images/2018-08-16-deploying-esxi-through-foreman/new_esxi_os_ptable.png" width="400" />
    </p>
  * Installation Media - Select the dummy media created above
    <p float='left' align='left'>
      <img src="/static/images/blog_images/2018-08-16-deploying-esxi-through-foreman/new_esxi_os_media.png" width="400" />
    </p>
  * Press Submit

**1.3: Create provisioning templates**
  * **1.3.1:** Create the PXELinux template
    * Open https://{foreman-url}/templates/provisioning_templates and click on **Create Template**
    * Name - ESXi-6.7.0-8169922
    * Template contents:

      ```
      DEFAULT ESXi
      NOHALT 1
      LABEL ESXi
      KERNEL ../boot/ESXi-6.7.0-8169922/mboot.c32
      APPEND -c ../boot-ESXi-6.7.0-8169922.cfg
      IPAPPEND 2
      ```
    <p float='left' align='left'>
      <img src="/static/images/blog_images/2018-08-16-deploying-esxi-through-foreman/esxi_pxelinux_template_new.png" width="400" />
    </p>

      Note: The **KERNEL** and **APPEND** lines start with "../". I will explain why in Section 2.4. These values will be used when we actually mount the ISO image.  
    * Template Type - **PXELinux Template**
      <p float='left' align='left'>
        <img src="/static/images/blog_images/2018-08-16-deploying-esxi-through-foreman/esxi_pxelinux_template_new_type.png" width="400" />
      </p>
    * Template Association - Select **"ESXi 6.7 Build 8169922"**
      <p float='left' align='left'>
        <img src="/static/images/blog_images/2018-08-16-deploying-esxi-through-foreman/esxi_pxelinux_template_new_assn.png" width="400" />
      </p>
    * Click Submit

  * **1.3.2:** Create the Kickstart Template
    * Click on **Create Template**
    * Name - ESXi Minimal Kickstart
    * A sample template:  
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

    * Template Type - **Provisioning template**
      <p float='left' align='left'>
        <img src="/static/images/blog_images/2018-08-16-deploying-esxi-through-foreman/esxi_ks_template_new_type.png" width="400" />
      </p>
    * Template Association - Select **"ESXi 6.7 Build 8169922"**
    * Click Submit

**1.4: Set default provisioning templates**  
  Now that the templates are created, we need to set those as default.
  * Navigate to https://{foreman-url}/operatingsystems and click on the newly created ESXi OS **"ESXi 6.7 Build 8169922"**
  * Open the "Templates" tab
  * Select the newly created provisioning templates from the drop down boxes and press Submit.
    <p float='left' align='left'>
      <img src="/static/images/blog_images/2018-08-16-deploying-esxi-through-foreman/os_default_templates.png" width="400" />
    </p>

### 2: ESXi installation in Legacy BIOS mode

---

The ESXi PXELinux mboot.c32 module only supports syslinux bootloader (pxelinux.0) version 3.86. You may replace the newer pxelinux.0 file that comes with the default Foreman installation with pxelinux.0 v3.86 but then you might face issues with newer OSes. So we will use a different approach.

**2.1: Prepare the bootloader**  
We will create a new directory under the tftp root directory (typically `/var/lib/tftpboot`) and place the syslinux v3.86 pxelinux.0 along with the c32 modules there.
  ```sh
  cd /tmp/

  wget https://mirrors.edge.kernel.org/pub/linux/utils/boot/syslinux/3.xx/syslinux-3.86.tar.gz

  tar xvf syslinux-3.86.tar.gz

  mkdir /var/lib/tftpboot/syslinux386

  cp syslinux-3.86/core/pxelinux.0 /var/lib/tftpboot/syslinux386/

  find syslinux-3.86/com32/ -name \*.c32 -exec cp {} /var/lib/tftpboot/syslinux386 \;

  # Create a symlink to the default pxelinux.cfg directory inside new directory
  cd /var/lib/tftpboot/

  ln -s ../pxelinux.cfg syslinux386/
  ```

**2.2: Create the bootloader entry in Foreman**  
Now comes the interesting part. We will create a new PXELoader entry in Foreman for `pxelinux-3.86.0`. Huge thanks to Lukáš Zapletal for [pointing this out](https://community.theforeman.org/t/edit-dhcpd-leases-through-a-foreman-hook-script/9957/2).  
  * **2.2.1:** Edit the file -   `/usr/share/foreman/app/models/concerns/pxe_loader_support.rb`
    <pre><code>
    def all_loaders_map(precision = 'x64')
      {
        "None" => "",
        "PXELinux BIOS" => "pxelinux.0",
        "PXELinux UEFI" => "pxelinux.efi",
        <b>"PXELinux Alt BIOS" => "syslinux386/pxelinux.0",</b> # Add this line
        ...
    </pre></code>

  * **2.2.2:** Restart httpd/apache2 for the changes to be reflected.

**2.3: Mount the ESXi ISO**  
We will mount the ESXi ISO under `/var/lib/tftpboot/boot/ESXi-6.7.0-8169922`. Note that this path corresponds to the **KERNEL** entry in the PXELinux template.

  ```sh
  cd /var/lib/tftpboot/

  mkdir -p boot/ESXi-6.7.0-8169922

  mount ~/Desktop/VMware-VMvisor-Installer-6.7.0-8169922.x86_64.iso boot/ESXi-6.7.0-8169922
  ```
**2.4: Edit boot.cfg**  
Copy the boot.cfg file from the mountpoint to tftproot and edit it to add a prefix to the ISO mountpoint. Make sure to use the same filename as the one specified in the **APPEND** line of the PXELinux template.

  ```sh
  cd /var/lib/tftpboot/

  cp boot/ESXi-6.7.0-8169922/boot.cfg boot-ESXi-6.7.0-8169922.cfg

  sed -e "s#/##g" -e "3s#^#prefix=../boot/ESXi-6.7.0-8169922\n#" -i boot-ESXi-6.7.0-8169922.cfg

  sed -i "/^kernelopt=/c\kernelopt=ks=http://${foreman_server_ip}/unattended/provision" boot-ESXi-6.7.0-8169922.cfg # Replace with actual IP/FQDN of Foreman server
  ```

  Note: 
  * Since the host boots into `syslinux386/pxelinux.0`, the TFTP root dir will be set to `/var/lib/tftpboot/syslinux386`. So all paths need to be relative to this path. This is why all paths need to be prefixed with "../".
  * Instead of mounting the ISO, you can also extract the ISO contents to the directory and edit the boot.cfg directly inside that directory. Remember to change the PXELinux template accordingly. I chose this approach because it is a tad cleaner.  

  Now we are ready to deploy this OS on to a host.

**2.5:** Open https://{foreman-url}/hosts/ and edit the host on which you want to deploy ESXi.  

**2.6:** Under the 'Operating System' tab, select the following values:

  Operating System : ESXi 6.7 Build 8169922  
  Media : ESXi Dummy  
  Partition table: Kickstart default  
  PXE Loader : PXELinux Alt BIOS 

**2.7:** Press 'Resolve' beside Provisioning templates and you should see the ESXi PXELinux and Kickstart templates.
  <p float='left' align='left'>
    <img src="/static/images/blog_images/2018-08-16-deploying-esxi-through-foreman/edit_host_legacy_bios.png" width="400" />
  </p>

**2.8:** Press 'Build' and reboot the host to PXE. If all goes well, you should see ESXi installer load up and perform an automated installation.
  <p float='left' align='center'>
    <img src="/static/images/blog_images/2018-08-16-deploying-esxi-through-foreman/esxi_installer_loading.png" width="400" />
  </p>

Once installation is complete, the host will reboot to PXE and will be presented with the default PXE menu.
<p float='left' align='center'>
  <img src="/static/images/blog_images/2018-08-16-deploying-esxi-through-foreman/localboot.png" width="400" />
</p>
Upon timeout, it will attempt a Localboot and boot to ESXi.

### **3:** ESXi installation in UEFI mode

---

* **3.1: Prepare the bootloader**  
In UEFI mode the bootloader is `mboot.efi` which is just a renamed version of `efi/boot/bootx64.efi` from the ESXi ISO image. The same mboot.efi can be used for booting different ESXi versions but it is recommended to use the latest one.   
Let's create the bootloader.

  Assuming the ESXi ISO is mounted under `/var/lib/tftpboot/boot/ESXi-6.7.0-8169922`:

  ```sh
  cp /var/lib/tftpboot/boot/ESXi-6.7.0-8169922/efi/boot/bootx64.efi /var/lib/tftpboot/mboot.efi
  ```

* **3.2: Create the bootloader entry in Foreman**  
Now we have to create an entry for this bootloader in the Foreman UI just like we did in Legacy BIOS mode.
  * Edit the file:   `/usr/share/foreman/app/models/concerns/pxe_loader_support.rb`
  
    <pre><code>
    def all_loaders_map(precision = 'x64')
      {
        "None" => "",
        "PXELinux BIOS" => "pxelinux.0",
        "PXELinux UEFI" => "pxelinux.efi",
        "PXELinux Alt BIOS" => "syslinux386/pxelinux.0",
        <b>"mboot UEFI" => "mboot.efi",</b> # Add this line
        ...
    </pre></code>

  * Restart httpd/apache2 to register the changes

* **3.3:** Once the host loads mboot.efi, it will look for a boot.cfg file under tftproot/01-{MAC address of host}. Once it is located, the installer loads up and performs the installation. So each time we need to deploy ESXi in UEFI mode we need to create this directory and copy over the boot.cfg file. This can be quite tedious when we are deploying at scale.   

  Here is where Foreman-Hooks comes in handy.
  From the [Foreman-Hooks Github repo](https://github.com/theforeman/foreman_hooks#foreman_hooks):  

  > Foreman Hooks allows you to trigger scripts and commands on the Foreman server at any point in an object's lifecycle in Foreman. This lets you run scripts when a host is created, or finishes provisioning etc.
  
  Once the host is set to build mode, the MAC directory along with the boot.cfg file should be created automatically.  For this we need to hook into the after_build event.

  Note: We will use shell hook scripts. This depends on the package jgrep. Please ensure `whereis jgrep` runs successfully before proceeding. It is [recommended](https://community.theforeman.org/t/esxi-deployment-via-uefi-hook-scripts-issue/11794/13) to use Python though. Example Python scripts are under `/usr/share/foreman/vendor/ruby/2.3.0/gems/foreman_hooks-0.x.xx/examples`. Please modify accordingly.

  ```sh
  cd /usr/share/foreman/config/hooks

  mkdir -p host/managed/after_build

  cd host/managed/after_build

  # Symlink the hook_functions file.
  ln -s /usr/share/foreman/vendor/ruby/2.3.0/gems/foreman_hooks-0.3.14/examples/bash/hook_functions.sh .

  # Now create the script
  cat  <<EOT >> /host/managed/after_build/01-prep-esxi-uefimode.sh
  #!/bin/bash

  # Import the functions
  . $(dirname $0)/hook_functions.sh

  # event name (create, before_destroy etc.)
  # orchestration hooks must obey this to support rollbacks (create/update/destroy)
  event=${HOOK_EVENT}

  # to_s representation of the object, e.g. host's fqdn
  object=${HOOK_OBJECT}

  exec >> /tmp/${event}.log
  exec 2>&1

  system_name=$(hook_data host.name)
  # For Foreman versions before 1.19, it is host.host.<attribute> instead of host.<attribute> due to this open issue: https://github.com/theforeman/foreman_hooks/issues/46
  system_mac=$(hook_data host.mac)
  system_pxe_loader=$(hook_data host.pxe_loader)
  system_operatingsystem_name=$(hook_data host.operatingsystem_name)
  puppet_proxy_name=$(hook_data host.puppet_proxy_name)
  host_token=$(hook_data host.token)

  echo "$(date): received ${event} on ${object}"
  echo "${system_name} ${system_mac} ${system_operatingsystem_name} ${system_pxe_loader}"
  if [[ $system_operatingsystem_name == ESXi* ]] && [[ $system_pxe_loader == "mboot UEFI" ]]; then
      echo "ESXi UEFI mode detected"

      # Create MAC Address directory under tftproot after substituting : with -
      macdir="01-${system_mac//:/-}"
      mkdir -p /var/lib/tftpboot/${macdir}
      cd /var/lib/tftpboot

      # Copy the boot.cfg file from the ISO mountpoint to tftproot and edit it to add a prefix to the ISO mountpoint.
      cp boot/ESXi-6.7.0-8169922/boot.cfg $macdir/
      # The mountpoint can also be parsed from $system_operatingsystem_name. Useful for deploying multiple ESXi builds.
      sed -e "s#/##g" -e "3s#^#prefix=/boot/ESXi-6.7.0-8169922\n#" -i $macdir/boot.cfg
      sed -i "/^kernelopt=/c\kernelopt=ks=http://${puppet_proxy_name}/unattended/provision?token=${host_token}" ${HOSTDIR}/boot.cfg
  fi
  # exit code is important on orchestration tasks
  exit 0
  EOT

  chmod u+x 01-prep-esxi-uefimode.sh

  # Make it accessible to Foreman
  cd /usr/share/foreman/config/hooks
  chown -R foreman:foreman host/

  # Register the hook script in Foreman by restarting Apache
  service apache2 restart
  ```

  **Important Note:** after_build hook scripts are not run on newly created hosts. These are only run when build mode is enabled on an existing host.

* **3.4:** Now we are ready to deploy the host. Edit the host entry in Foreman and set the following:

  Operating System : ESXi 6.7 Build 8169922  
  Media : ESXi Dummy  
  Partition table: Kickstart default  
  PXE Loader : mboot UEFI  
  <p float='left' align='left'>
    <img src="/static/images/blog_images/2018-08-16-deploying-esxi-through-foreman/edit_host_uefi.png" width="400" />
  </p>

* **3.5:** Press 'Resolve' beside Provisioning templates and you should see the ESXi PXELinux and Kickstart templates.

  Note: The PXELinux template is irrelevant as it does not play any role in UEFI mode. So we are keeping it as is.

* **3.6:** Press 'Build', change the host's boot mode to UEFI and reboot the host to PXE. You should see the ESXi installer load up.

  Once the installation is complete and the host reboots, it will load mboot.efi from the DHCP Server again and the installation will restart. However since the host is not in build mode, it will not be able to fetch the kickstart file from Foreman and will throw an error and freeze at the installer screen.   
  To solve this we have to manually change the host PXE Loader to **None** in Foreman.  
  OR we can use Foreman-Hooks to do it automatically!

* **3.7: Using Foreman-Hooks to solve host not able to perform local boot from PXE**

  Once the host informs Foreman that build is completed, we will run a script that checks the host's OS and PXELoader and changes the PXELoader to None. For this we need to hook into the before_provision event.

  ```sh
  cd /usr/share/foreman/config/hooks

  mkdir -p host/managed/before_provision

  cd host/managed/before_provision

  # Symlink the hook_functions file.
  ln -s /usr/share/foreman/vendor/ruby/2.3.0/gems/foreman_hooks-0.3.14/examples/bash/hook_functions.sh .

  # Now create the script
  cat  <<EOT >> 01-esxi-unset-pxeloaders.sh
  #!/bin/bash
  . $(dirname $0)/hook_functions.sh
  event=${HOOK_EVENT}
  object=${HOOK_OBJECT}

  exec >> /tmp/${event}.log
  exec 2>&1

  system_name=$(hook_data host.name)
  system_mac=$(hook_data host.mac)
  system_id=$(hook_data host.id)
  system_pxe_loader=$(hook_data host.pxe_loader)
  system_operatingsystem_name=$(hook_data host.operatingsystem_name)

  echo "$(date): received ${event} on ${object}"
  echo "${system_name} ${system_mac} ${system_operatingsystem_name} ${system_pxe_loader}"

  if [[ $system_operatingsystem_name == ESXi* ]] && [[ $system_pxe_loader == "mboot UEFI" ]]; then
      echo "ESXi in UEFI mode detected. Changing PXE Loader to None"
      hammer -u admin -p foreman host update --id $system_id --pxe-loader 'None'  # Change the credentials
  fi

  exit 0
  EOT

  chmod u+x 01-esxi-unset-pxeloaders.sh

  # Make it accessible to Foreman
  cd /usr/share/foreman/config/hooks
  chown -R foreman:foreman host/

  # Register the hook script in Foreman by restarting Apache
  service apache2 restart
  ```

  Check production.log to verify if the hook script is loaded.  

  Now when a host finishes OS installation and sends a build complete call to Foreman, its PXE Loader will be automatically changed to "None". So when the host boots it will try to load 'grub2/bootx64.efi' from the DHCP server. Since this bootloader does not exist (unless you have modified a default installation), it will boot into the next entry which ideally will be the ESXi boot medium.

With these steps you can have a fully automated ESXi deployment through Foreman in both Legacy BIOS and UEFI modes.
