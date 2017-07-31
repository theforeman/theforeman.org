---
layout: post
title: Adding new subnet for provisioning
date: 2017-07-18 18:42:21
author: Lukáš Zapletal
tags:
- foreman
- provisioning
---

Foreman's Puppet-based installer is currently only capable of configuring one
provisioning subnet. The rest needs to be added manually, which is fortunately
super easy. This blog post walks through the whole process.

<!--more-->

My testing environment is clean installation of Foreman 1.15 (with Katello
3.4) in a libvirt VM. On the hypervisor, I created new isolated virtual
network without DHCP v4 or v6 services and I plugged in a virtual NIC into
this network. It appeared in the system as ens4 device, which I configured for
static IP:

    nmcli con add type ethernet con-name isolated ifname ens4 ip4 192.168.99.1/24

The next step is to enable DHCP on this C-class network 192.168.99.0/24, which
can be done easily. In the `/etc/dhcp/dhcpd.conf` file, I added new
declaration just below the puppet-deployed one:


    #################################
    # isolated.lan
    #################################
    subnet 192.168.99.0 netmask 255.255.255.0 {
      pool
      {
        range 192.168.99.5 192.168.99.49;
      }

      option subnet-mask 255.255.255.0;
      option routers 192.168.99.1;
    }

As I don't expect many hosts to have leases, I am setting the range to just 44
IP addresses leaving me the rest for IP allocation done by Foreman. Next step
is to restart the dhcpd service.

In the Formean UI I am clicking on the relevant Infrastructure - Smart-Proxy
dropdown selecting Import subnets. This is just easier way of doing
Infrastructure - Subnet - Create, it pre-populates some basic info.

Everything on that form should be pretty clear, I am choosing IP range of
192.168.99.50 - 192.168.99.250 and on the Domain tab I associate the subnet
with my existing domain which was deployed by the installer. On the Smart
Proxies tab I am choosing the correct proxy hostname for DHCP, TFTP and
Discovery.

Warning: At this point, you can only select Reverse DNS if you have a reverse
zone configured for this particular subnet. I won't go into details, but that
would include creating declarations in `/etc/zones.conf` and zone files in
`/var/named/dynamic`. Use the zones deployed by installer as a template and
remember to restart BIND when you are done.

Foreman ships only PXELinux (pxelinux.0) and Grub2 (grub2/grubx64.efi) by
default, if you want to PXE boot other architectures or use Grub1 for legacy
systems, install foreman-bootloaders-redhat-tftpboot package.

And that's pretty much it! I am creating new host, selecting the domain, the
subnet, IP reservation is populated and entry is submitted. Before I try to
discover host, I will make sure that Discovery Smart Proxy feature is
installed on any Smart Proxy accessible from my new Subnet (that would be
typically the very same host).

Oh, I almost forgot! I don't want the foreman-installer to overwrite my
customized dhcpd.conf file anymore, therefore I will tell it not to do so:

    # foreman-installer -v -n --scenario katello \
        --foreman-proxy-dns=true --foreman-proxy-dns-managed=false \
        --foreman-proxy-dhcp=true --foreman-proxy-dhcp-managed=false

Be sure to review the puppet output first and then run without dry-run option
(-n) to commit the changes.

Unfortunately it is not possible to disable TFTP puppet management, but that
will not collide with foreman-bootloaders in any way.
