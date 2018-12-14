---
layout: post
title: Rediscovering hosts locally via Grub2
date: 2019-01-15 12:25:27
author: lzap
tags:
- foreman
- discovery
---

When a host is managed via Foreman, it's possible to download discovery image
to it and create a Grub2 boot entry to quickly enter discovery mode again. This
ad-hoc workflow requires the old managed host entry to be deleted prior
provisioning discovered host, otherwise either "Name already taken" error can
be shown or old and unused host entries will stack in the Foreman DB forever
depending on the Foreman version in use.

<!--more-->

The first thing is to expose discovery Linux kernel and init RAM disk via
Apache httpd server:

    server# ln -s /var/lib/tftpboot/boot/fdi-image/vmlinuz0 /var/www/html/pub/discovery-vmlinuz
    server# ln -s /var/lib/tftpboot/boot/fdi-image/initrd0.img /var/www/html/pub/discovery-initrd.img

On the managed node, create new Grub2 entry which will automatically download
the files if they are missing or updated and create new menu entry "Rediscover
host".

    cat >/etc/grub.d/90_discovery <<EODS
    wget -qNP /boot/ http://FOREMAN_URL/pub/discovery-vmlinuz
    wget -qNP /boot/ http://FOREMAN_URL/pub/discovery-initrd.img
    cat <<'EOM'
    menuentry "Rediscover host" {
      search --file --no-floppy --set=discovery_root /discovery-vmlinuz
      linux (\$discovery_root)/discovery-vmlinuz rootflags=loop root=live:/fdi.iso rootfstype=auto ro rd.live.image acpi=force rd.luks=0 rd.md=0 rd.dm=0 rd.lvm=0 rd.bootif=0 rd.neednet=0 nomodeset proxy.url=https://FOREMAN_URL proxy.type=foreman
      initrd (\$discovery_root)/discovery-initrd.img
    }
    EOM
    EODS

Finally, rebuild Grub2 configuration.

    chmod +x /etc/grub.d/90_discovery
    grub2-mkconfig -o /boot/grub2/grub.cfg

Now it's possible to reboot the host and pick "Rediscover host" menu item to
enter discovery mode. Note that discovery enters interactive mode in this case.
It should be possible to automate this workflow to some degree via unattended
mode since things like MAC address of primary interface is known and file
`90_discovery` is a simple shell script.

This could be turned into Remote Execution template as well. I am going to file
a PR to our community templates repo with a proposal, this is going to be my
very first Remote Execution template PR. Wish me luck!

