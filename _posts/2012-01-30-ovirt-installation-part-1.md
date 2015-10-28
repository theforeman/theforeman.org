---
layout: post
title: oVirt Installation - part 1
date: '2012-01-30T22:51:00.001+02:00'
author: Ohad Levy
tags:
- foreman
- oVirt
- virtualizaition
modified_time: '2012-01-30T23:05:33.395+02:00'
blogger_id: tag:blogger.com,1999:blog-6789674575954398874.post-7489330083065027477
blogger_orig_url: http://blog.theforeman.org/2012/01/ovirt-installation-part-1.html
---

In this post, we'll see how to install [oVirt](http://ovirt.org/). for
those of you who ask oVirt?! well, taken from its website:

> THE VIRTUAL DATACENTER MANAGEMENT PLATFORM Provision, manage, and
> monitor hosts, hypervisors, virtual machines, storage, and network

So really, oVirt is a management eco system for virtual machines, fairly
similar to v-sphere, but open source and runs on the very popular KVM
hypervisor, oVirt is the open source version, of the
redhat's [RHEV-M](http://www.redhat.com/products/virtualization/).

<!--more-->

My motivation for this series of posts, beside promoting alternative and
cool open source software is the integration between oVirt and Foreman,
so provisioning of vm's would get a whole new meaning when you have a
virtual data center managed by oVirt where you could plug in puppet into
the loop.

I've tested the oVirt management (oVirts core/backend) on Fedora 16,
mostly because RPM's for RHEL clones has not made by the community just
yet :)

It is recommended to use something with a minimum of 2GB of RAM, 4GB
better, as oVirt runs under jboss, however, it is not a problem to run
oVirt on a virtual machine.

So enough about that, its awesome and open source, how do I install it?
:)


You should know be able to access the UI via http://&lt;your
host&gt;:8080 and login using the credentials above.


[![](http://www.linux-kvm.com/sites/default/files/ovirt-firstrelease.png)](http://www.linux-kvm.com/sites/default/files/ovirt-firstrelease.png)



In a follow up post I'll describe how to configure oVirt, and how to
starts creates new VM's.
