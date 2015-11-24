---
layout: post
title: Booting Discovery over HTTP
date: 2015-11-24 11:14:15
author: Lukas Zapletal
tags:
- foreman
- discovery
---

PXE protocol is slow on high-latency networks. But there is a way out!
To minimize the init RAM disk and to boot the squashed file system over http.
In this article, we will take a look on this approach.

<!--more-->

The idea is simple, init RAM disk which normally contains the standard one
with the discovery ISO file concatenated can be replaced with own one with
some kernel modules built it. Then the squashed file system can be extracted
from the discovery ISO and exposed via HTTP protocol.

On any Linux system with dracut installed, generate new RAM disk with livenet
module. I've used Fedora, you can also use CentOS 7 to get the very same image
as we ship in the official ISO image:

    sudo yum -y install dracut-network

The above command is for Red Hat distributions, for all others make sure
dracut has the network module installed. Now generate the RAM disk:

    export TFTP=/var/lib/tftpboot/boot
    sudo dracut -m "livenet network base" $TFTP/discovery-http.img --force -v -L5 -N

Copy the current kernel as well:

    cp ls /boot/vmlinuz-$(uname -r) $TFTP/discovery-http-vmlinuz

Generate PXELinux configuration:

    cat /var/lib/tftpboot/pxelinux.cfg/default
    ...
    LABEL discovery_http
    MENU LABEL Foreman Discovery via HTTP
    KERNEL boot/discovery-http-vmlinuz
    APPEND initrd=boot/discovery-http.img ip=dhcp root=live:http://SOME_HTTP_SERVER/squashfs.img rd.shell ro acpi=force rd.luks=0 rd.md=0 rd.dm=0 rd.lvm=0 rd.shell rd.debug=1 nomodeset proxy.url=https://FOREMAN_SERVER proxy.type=foreman
    IPAPPEND 2
    ...

You should do this in Foreman UI ("PXELinux global default") instead of
editing directly.

Now, mount the discovery ISO and extract the LiveOS/squashfs.img and put it on
any HTTP server which is visible to discovered nodes. Make sure to modify the
SOME_HTTP_SERVER option above!

Boot. Celebrate.

There is one drawback, each discovered host requests two IP addresses via
DHCP, one without any client id and one with client id set to "fdi". We need a
patch for either dracut or discovery image to be able to set the client id to
one same value, so DHCP servers do not allocate two leases. It's wasting of
resources, but it works.

An alternative approach is to use "nbd" dracut module instead "livenet" and
then to provide something like

    ip=dhcp root=nbd:TFTP_SERVER:discovery:squashfs ro

In this case, you need to serve the squashfs.img file on the TFTP (or any
other) server:

    mkdir /etc/nbd-server/; cat >/etc/nbd-server/config <<EOF
    [generic]
    [discovery]
    exportname = /path/to/squashfs.img
    readonly = true
    multifile = false
    copyonwrite = false
    EOF

    yum -y install nbd
    nbd-server

This mounts the root file system via NBD protocol. This is faster and consumes
less memory on the nodes, but there is no overlay FS so the file system is not
writeable. If you can get this working this way, let us know in the comments
below.
