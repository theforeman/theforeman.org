---
layout: post
title: Unattended deployments of Fedora and RHEL Atomic with Foreman
date: '2015-06-11T17:01:00.004+03:00'
author: Daniel Lobato
tags: 
modified_time: '2015-06-11T17:01:51.974+03:00'
blogger_id: tag:blogger.com,1999:blog-6789674575954398874.post-339523326737578400
blogger_orig_url: http://blog.theforeman.org/2015/06/unattended-deployments-of-fedora-and.html
---

This blog post is an authorized repost of [Unattended deployments of
Fedora and RHEL Atomic with
Foreman](http://blog.daniellobato.me/unattended-deployments-of-fedora-and-rhel-atomic-with-foreman/)  

<!--more-->
  
[Project Atomic](http://www.projectatomic.io/) is a new initiative to
have a family of well-known, enterprise-tested operating systems ready
for massive container deployments. Atomic operating systems focus on:  

-   Minimal size
-   Immutable
-   Easy to update and rollback
-   Container cluster and runtime provided (currently via Docker
    and Kubernetes)

It comes with a set of tools. *ostree, fleet, kubectl* to manage your OS
updates, network configurations and cluster health. As I manage my
virtual machines using [Foreman](http://theforeman.org/), and I used to
spend some time developing the Docker plugin, the project piqued my
interest, as it helps me work with containers more efficiently. For this
deployment, I will assume you have a Foreman host with a Smart Proxy
with at least TFTP. I will be using domains in the examples, but you
could use IPs instead. I think it could be possible to skip the TFTP
part for PXE too, but I have not got that far yet. You need a subnet in
which you can PXE boot hosts, an example of such a subnet on Libvirt can
be found on [Dominic Cleal's
blog.](http://m0dlx.com/blog/Automatic_DNS_updates_from_libvirt_guests.html)
Step one, download [Fedora 22 Atomic
iso](https://dl.fedoraproject.org/pub/alt/stage/22_Beta_RC3/Cloud_Atomic/x86_64/iso/Fedora-Cloud_Atomic-x86_64-22_Beta.iso)
or [RHEL 7 (installer) Atomic
iso](https://access.redhat.com/downloads/content/271/ver=/rhel---7/7.1.1/x86_64/product-downloads)
in your Foreman host. For the Fedora case, it'll be possible to fetch
the content straight from the repo through *ostreeupdate* , however for
the moment we will need the image to get
[vmlinux](https://en.wikipedia.org/wiki/Vmlinux),
[initrd](https://en.wikipedia.org/wiki/Initrd), and a few other files.  

    # wget https://dl.fedoraproject.org/pub/alt/stage/current/Cloud_Atomic/x86_64/iso/Fedora-Cloud_Atomic-x86_64-22.iso -O fedora-atomic.iso

Mount these images in a public directory so that they can be reached
from the virtual machine. To keep any existent vmlinux available for
non-atomic hosts, we will copy and rename it to vmlinuz\_atomic from the
mounted iso. By default /var/www/html/pub/atomic would work:  

    # mkdir /var/www/html/pub/atomic
    # mount -o loop fedora-atomic.iso /var/www/html/pub/atomic/
    # cp /var/www/html/pub/atomic/isolinux/vmlinuz /var/lib/tftpboot/vmlinuz_atomic

We will need now an installation medium in Foreman pointing to this
location. Go to Host &gt; Installation media and create a mirror:  
  
[![Screenshot from 2015-05-29
16:41:28](http://blog.daniellobato.me/wp-content/uploads/2015/05/Screenshot-from-2015-05-29-164128-744x383.png)](http://blog.daniellobato.me/wp-content/uploads/2015/05/Screenshot-from-2015-05-29-164128.png)
   
Create the operating system. We will go back to this operating system to
associate it with the appropriate partition table and templates
afterwards. For the moment, just make sure you choose the right major
version 7 for RHEL, 22 in the case of Fedora, as these are the only
Atomic ones. Go to Hosts &gt; Operating systems and click on New
operating system.  
  
[![](http://blog.daniellobato.me/wp-content/uploads/2015/05/Screenshot-from-2015-05-29-165417-744x595.png)](http://blog.daniellobato.me/wp-content/uploads/2015/05/Screenshot-from-2015-05-29-165417.png)
Create a new partition table in Foreman to provide an initial */boot*
and */* in the Atomic virtual machine. Go to Hosts &gt; Partition
tables, and click on New partition table.  

    zerombr
    clearpart --all --initlabel
    part /boot --size=300 --fstype="ext4"
    part pv.01 --grow
    volgroup atomicos pv.01
    logvol / --size=3000 --fstype="xfs" --name=root --vgname=atomicos

<span style="color: black;">Head to */config\_templates* (or Hosts &gt;
Provisioning templates) and create a new PXE template. Choose a name,
then go click on the type tab and select PXELinux. Associate the
template with the operating system you created previously, and use this
as the content: </span>  

    DEFAULT pxeboot
    TIMEOUT 20
    PROMPT 0
    LABEL pxeboot
    kernel vmlinuz_atomic
    append initrd=<%= @host.medium.path %>isolinux/initrd.img repo=<%= @host.medium.path %> ks=<%= foreman_url('provision')%> ks.device=bootif network ks.sendmac
    IPAPPEND 2

Stay on provisioning templates, and create the kickstart. To do so,
click on New Template, choose a type 'provision', associate it with the
operating system you created previously, and add this code in the
editor:  

    lang <%= @host.params['lang'] || 'en_US.UTF-8' %>
    keyboard <%= @host.params['keyboard'] || 'us' %>
    timezone --utc <%= @host.params['time-zone'] || 'UTC' %>

    # Partition table should create /boot and a volume atomicos
    <% if @dynamic -%>
    %include /tmp/diskpart.cfg
    <% else -%>
    <%= @host.diskLayout %>
    <% end -%>


    bootloader --timeout=3
    <% if @host.operatingsystem.name =~ /.*Fedora.*/ -%>
    ostreesetup --nogpg --osname=fedora-atomic --remote=fedora-atomic --url=<%= @host.medium.path %>/content/repo/ --ref=fedora-atomic/f<%= @host.os.major %>/<%= @host.architecture %>/docker-host
    <% else -%>
    ostreesetup --nogpg --osname=rhel-atomic-host --remote=rhel-atomic-host --url=file:///install/ostree --ref=rhel-atomic-host/<%= @host.os.major %>/<%= @host.architecture %>/standard
    <% end -%>
    services --disabled cloud-init,cloud-config,cloud-final,cloud-init-local
    rootpw --iscrypted <%= root_pass %>

    reboot

    %post
    (
    # Report success back to Foreman
    curl -s -o /dev/null --insecure <%= foreman_url %>
    ) 2>&1 | tee /mnt/sysimage/root/install.post.log

    exit 0

    %end

This template will pull the content from the *--ref* you specify, and
the URL would be *$FOREMANSERVER/pub/atomic/content/repo/*. If you visit
this URL, you should be able to find the *docker-host* file at the end
of the hierarchy, specifically
*heads/fedora-atomic/f22/x86\_64/docker-host*. If you cannot find
docker-host there because you're using this tutorial for Fedora 23 and
it has changed, I would recommend you to peruse your */pub/atomic*
folder and find the correct URL. Currently this is the structure for
RHEL 7 and Fedora 22. It's time to associate these templates with the
operating system, and deploy the host. Go back to Hosts &gt; Operating
systems, and click on your Atomic operating system to associate the
templates:  
  
[![Screenshot from 2015-05-29
17:22:42](http://blog.daniellobato.me/wp-content/uploads/2015/05/Screenshot-from-2015-05-29-172242.png)](http://blog.daniellobato.me/wp-content/uploads/2015/05/Screenshot-from-2015-05-29-172242.png)
[![Screenshot from 2015-05-29
17:22:51](http://blog.daniellobato.me/wp-content/uploads/2015/05/Screenshot-from-2015-05-29-172251.png)](http://blog.daniellobato.me/wp-content/uploads/2015/05/Screenshot-from-2015-05-29-172251.png)
[![Screenshot from 2015-05-29
17:23:00](http://blog.daniellobato.me/wp-content/uploads/2015/05/Screenshot-from-2015-05-29-172300.png)](http://blog.daniellobato.me/wp-content/uploads/2015/05/Screenshot-from-2015-05-29-172300.png)  
We're all set. Time to deploy the host. I'm doing this in Libvirt as
it's where my PXE network is configured. Go to Hosts &gt; New host and
choose a name for your Atomic host. The Puppet options are irrelevant,
as Puppet is not able to modify the Atomic ostree for the moment. Select
the right domain and subnet, to ensure you're booting in a PXE-enabled
network. Something I found is that Anaconda tends to get stuck when I
have tried to provision Atomic systems with less than 1GB of RAM, so I
would recommend to assign that amount of RAM to your Atomic host at
least. The operating systems tab should look similar to this. Remember
this is network-based provisioning.  
  
[![Screenshot from 2015-05-29
17:35:52](http://blog.daniellobato.me/wp-content/uploads/2015/05/Screenshot-from-2015-05-29-173552-744x672.png)](http://blog.daniellobato.me/wp-content/uploads/2015/05/Screenshot-from-2015-05-29-173552.png)  
If everything went well, your system will PXE boot and start Anaconda
right away. If you have VNC access to the machine, it will look similar
to this:  
  
[![Screenshot from 2015-05-29
17:39:32](http://blog.daniellobato.me/wp-content/uploads/2015/05/Screenshot-from-2015-05-29-173932.png)](http://blog.daniellobato.me/wp-content/uploads/2015/05/Screenshot-from-2015-05-29-173932.png)
[![Screenshot from 2015-05-29
17:40:33](http://blog.daniellobato.me/wp-content/uploads/2015/05/Screenshot-from-2015-05-29-174033-744x555.png)](http://blog.daniellobato.me/wp-content/uploads/2015/05/Screenshot-from-2015-05-29-174033.png)  
After Anaconda finishes the installation, you should be able to SSH into
that machine using the root password you provided in Foreman.  
  
[![Screenshot from 2015-05-29
17:43:20](http://blog.daniellobato.me/wp-content/uploads/2015/05/Screenshot-from-2015-05-29-174320.png)](http://blog.daniellobato.me/wp-content/uploads/2015/05/Screenshot-from-2015-05-29-174320.png)  
  
We're done! I suggest you use this host as a Kubernetes master, minion,
or as a Docker host. For now, I will investigate how to pass the proper
parameters through Foreman to provide Atomic/Kubernetes cluster
provisioning.
