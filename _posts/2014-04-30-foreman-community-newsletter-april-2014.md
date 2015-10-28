---
layout: post
title: Foreman Community Newsletter - April 2014
date: '2014-05-01T00:54:00.000+03:00'
author: Dominic Cleal
tags:
- ubuntu
- plugin
- discovery
- community
- newsletter
modified_time: '2014-06-15T08:47:28.942+03:00'
blogger_id: tag:blogger.com,1999:blog-6789674575954398874.post-8814707785129550858
blogger_orig_url: http://blog.theforeman.org/2014/05/foreman-community-newsletter-april-2014.html
---

<!--more-->

### Foreman 1.5, here we come!

We're excited to be just a week or two out from releasing Foreman 1.5.0,
with the usual raft of new features.  
  
The highlights in this release are:  

-   config groups for managing sets of Puppet classes assigned to a host
    or host group (think "profiles"), [watch
    demo](http://www.youtube.com/watch?v=XliDyFFi-SI&feature=share&t=43m4s)
-   end-to-end host provisioning integration with FreeIPA, so hosts are
    joined to the realm automatically, [watch
    demo](http://www.youtube.com/watch?v=XliDyFFi-SI&feature=share&t=35m42s)
-   fine-grained role and filter system for authorizing access to users
    and groups
-   a trio of compute resources (oVirt, VMware, libvirt) get image
    provisioning support
-   new installer support for a range of plugins and all compute
    resources

The full set of release notes are in the Foreman 1.5 manual:  

-   [Foreman 1.5 release
    notes](http://theforeman.org/manuals/1.5/index.html#Releasenotesfor1.5)

The latest release at the time of writing is 1.5.0-RC2, which is
available in the repositories, or keep an eye on the foreman-announce
mailing list for the final release.  

[Foreman 1.5.0-RC2 announcement and
notes](https://groups.google.com/forum/#!topic/foreman-announce/Np0Iuf1P23I) 

[foreman-announce mailing
list](https://groups.google.com/forum/#!forum/foreman-announce)

-   foreman-announce+subscribe@googlegroups.com to subscribe

  

### Ubuntu 14.04 packages

With the release this month of Ubuntu 14.04 (Trusty Tahr), new packages
for this LTS version have been prepared and are available for Foreman
1.5 in the usual repositories.  
  
If you test them out and have feedback, please e-mail the foreman-users
list, drop into IRC or file bug reports.  
  
There is a known issue with the installer in RC2, so please take note of
the workaround in [the
announcement](https://groups.google.com/forum/#!topic/foreman-announce/Np0Iuf1P23I)
or wait until 1.5.0 final.  
  

### Discovery Image 0.5

Recently the Discovery images based on oVirt Node have had some major
enhancements, including support for a new CentOS 6 based image (in
addition to the Fedora based one).  There are improvements particularly
around network interface handling, and a big rework of the build
automation for the images.  
  
Read more of Lukas' announcement below, or get copies of the Discovery
Image 0.5 from our website.  

-   [Discovery Image 0.5 RC
    announcement](https://groups.google.com/forum/#!topic/foreman-announce/QrVGyakL3k8)
-   [Download 0.5
    images](http://yum.theforeman.org/discovery/releases/0.5/)

  

### Updates from the plugin community

The first plugins to add new compute resources are coming into being,
ready to accompany Foreman 1.5 which provides this feature.  
  
Docker and containers are the hot topics of the year, so Amos Benari's
new foreman\_docker plugin will be of interest to anybody looking to
deploy containers from their usual Foreman interface.  It's available as
a gem and RPM for Foreman 1.5 or above.  

-   [foreman\_docker](https://github.com/theforeman/foreman-docker#readme)
-   [Demo
    video](http://www.youtube.com/watch?v=XliDyFFi-SI&feature=share&t=48m59s)

<span
style="font-family: Helvetica, sans-serif; font-size: 10.5pt;">XenServer
support has been requested a few times and the initial work to add it to
Foreman was done by ooVoo.  It's now been bundled up into a foreman\_xen
project to help incubate and improve the support, as the code is still
in its early stages.  Testers and contributors interested in this are
very much encouraged to join in.</span>

-   <span
    style="color: windowtext; font-family: Helvetica, sans-serif; font-size: 10.5pt;"><span
    id="OBJ_PREFIX_DWT2149_com_zimbra_url" class="Object"
    style="color: #336699; cursor: pointer;">[foreman\_xen](https://github.com/theforeman/foreman-xen/)</span></span>

### Futher watching

#### Sprint 22 demo

The last few weeks included major work on Discovery, CLI id/name
enhancements, work on the OpenStack/Foreman installer, FreeIPA realm
integration, config groups and compute resource plugins (Docker).  

-   [Watch sprint 22 demo](https://www.youtube.com/watch?v=XliDyFFi-SI)

#### More talks

Other talks that have taken place recently:  

-   [CLI deep dive - unified name
    searches](https://www.youtube.com/watch?v=cLc27ANEZ_Q) - Tomas
    delves into the details showing how the Hammer CLI will support both
    names and IDs better. 
-   [Foreman and Chef
    integration](https://www.youtube.com/watch?v=mtR0mCeisbs) - from
    ChefConf 2014, explaining the foreman\_chef plugin and handler
    integration available
