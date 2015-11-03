---
layout: post
title: Re-provision a host without PXEboot
date: '2012-01-29T20:58:00.000+02:00'
author: Ohad Levy
tags:
- foreman
modified_time: '2015-03-02T10:42:38.361+02:00'
blogger_id: tag:blogger.com,1999:blog-6789674575954398874.post-4976536779190314981
blogger_orig_url: http://blog.theforeman.org/2012/01/re-provision-host-without-pxeboot.html
---

So, yet another feature not many people know about Foreman.

it is really easy to reprovision (reinstall, or even to a whole new os)
an existing system without PXE.

<!--more-->

Foreman supports the following provisioning templates:

-   provision - kickstart, preseed, jumpstart, yast..
-   PXELinux - templates for syslinux / pxelinux
-   gPXE - templates for {g,i}PXE
-   finish - for OS's that requies a second stage script
    (debian, solaris)
-   PXEGrub - templates for GRUB PXE
-   script - custom entry for what ever you might want to do with
    foreman templates

All of these templates are available usually at:
foreman/unattended/&lt;name&gt;



the default script template that comes with foreman does the following :



gets the kernel/initrd and reconfigure grub, so upon next reboot, you
can provision your host.



for example, put your host in build mode, and on your host simply
execute

once ready simply:

 curl http://foreman/unattended/script | sh
reboot


This generates something like

{% gist ohadlevy/1700094 %}

