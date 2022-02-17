---
layout: post
title: CoreOS cluster deployments with Foreman
date: '2015-06-11T17:05:00.004+03:00'
author: Daniel Lobato
tags: 
modified_time: '2015-06-11T17:05:40.896+03:00'
blogger_id: tag:blogger.com,1999:blog-6789674575954398874.post-4810446073191972741
blogger_orig_url: /2015/06/coreos-cluster-deployments-with-foreman.html
guest_post: true
guest_url: http://blog.daniellobato.me/coreos-cluster-deployments-with-foreman
excerpt: |
  As Major Hayden mentioned more than a year ago, deploying CoreOS is a bit of
  a different beast than deploying other operating systems. In this case, we
  are going to use Foreman to do it by PXE booting the image, then applying a
  cloud-config script which will will set the SSH keys, core user password,
  CoreOS version, and register in etcd.
---

As [Major
Hayden](https://major.io/2014/05/13/coreos-vs-project-atomic-a-review/)
mentioned more than a year ago, deploying [CoreOS](http://coreos.com/)
is a bit of a different beast than deploying other operating systems. In
this case, we are going to do it by PXE booting the image, then applying
a cloud-config script which will will set the SSH keys, core user
password, CoreOS version, and register in [etcd](http://etcd.io/). We
are going to pass parameters that will set these options. That way we
can define a host group, with certain parameters, such as the authorized
keys, etcd discovery url, and virtual disk. This will simplify booting
hosts in our deployment so that creating a new CoreOS node in the
cluster will be reduced to three clicks, New Host -&gt; Hostgroup:
CoreOS cluster &gt; Submit. As in my previous tutorial for [unattended
Atomic
deployments](http://blog.daniellobato.me/unattended-deployments-of-fedora-and-rhel-atomic-with-foreman/),
I will assume you have Foreman installed, and a PXE Smart Proxy in the
network (or networks) you want to launch your cluster. If not, please go
to [theforeman.org](http://theforeman.org/) and get a default
installation. In my opinion,
[Libvirt](http://lukas.zapletalovi.com/2012/04/how-to-setup-testing-virtual-network-in.html)
is the easiest way to get this PXE "enabled" network. The PXE templates
are already in
[community-templates](https://github.com/theforeman/community-templates/tree/master/coreos)
, make sure to add the
[snippet](https://github.com/theforeman/community-templates/blob/bbdf5370bd3d67d2270c21c66b9ffee0ed60cfee/snippets/coreos_cloudconfig.erb)
too. You can create them manually by going to Hosts &gt; Provisioning
Templates &gt; New template. However, it is much easier to install the
[foreman\_templates](https://github.com/theforeman/foreman_templates)
plugin, then run:  

    foreman-rake templates:sync

And you'll get all of the templates in the
[community-templates](https://github.com/theforeman/community-templates/tree/master/coreos)
repository. Create a new operating system with the following options, in
this case it will use CoreOS 647.0.0 from the stable channel.  
  
  
[![Screenshot from 2015-06-04
22:46:12](http://blog.daniellobato.me/wp-content/uploads/2015/06/Screenshot-from-2015-06-04-224612.png)](http://blog.daniellobato.me/wp-content/uploads/2015/06/Screenshot-from-2015-06-04-224612.png)  
Time to create the host group. Go to Configure &gt; Host groups &gt; New
host group, and create a group with the following parameters. The
network must be the one you can PXE boot on, and you can add a parameter
*ssh\_authorized\_keys*, value should be your public ssh key, usually
located in *.ssh/id\_rsa.pub.* I did not add it here as I have a global
parameter *ssh\_authorized\_keys* with that value. Get a discovery code
by going to [discovery.etcd.io/new](https://discovery.etcd.io/new) , and
put the value you got in *etcd\_discovery\_url*.  
  
[![Screenshot from 2015-06-04
22:54:28](http://blog.daniellobato.me/wp-content/uploads/2015/06/Screenshot-from-2015-06-04-225428-744x302.png)](http://blog.daniellobato.me/wp-content/uploads/2015/06/Screenshot-from-2015-06-04-225428.png)
[![Screenshot from 2015-06-04
22:54:05](http://blog.daniellobato.me/wp-content/uploads/2015/06/Screenshot-from-2015-06-04-225405.png)](http://blog.daniellobato.me/wp-content/uploads/2015/06/Screenshot-from-2015-06-04-225405.png)
![Screenshot from 2015-06-04
22:54:50](http://blog.daniellobato.me/wp-content/uploads/2015/06/Screenshot-from-2015-06-04-225450.png)  
  
That should be enough for the group. Now create a new host in that
cluster, and as soon as it boots, it will connect to etcd. Remember the
URL we used for discovery? Go to that URL and you should see all hosts
that have registered in the cluster.  
 [![Screenshot from 2015-06-04
23:09:29](http://blog.daniellobato.me/wp-content/uploads/2015/06/Screenshot-from-2015-06-04-230929-744x529.png)](http://blog.daniellobato.me/wp-content/uploads/2015/06/Screenshot-from-2015-06-04-230929.png)  
Enjoy it, and please point out any mistakes on the comments section, or
let me know on [Twitter](https://twitter.com/elobatoss).
