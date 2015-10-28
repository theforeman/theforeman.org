---
layout: post
title: Foreman Community Newsletter - September 2013
date: '2013-09-22T06:36:00.000+03:00'
author: Dominic Cleal
tags:
- plugin
- community
- newsletter
modified_time: '2013-09-22T06:36:49.029+03:00'
blogger_id: tag:blogger.com,1999:blog-6789674575954398874.post-2110216780103561064
blogger_orig_url: http://blog.theforeman.org/2013/09/foreman-community-newsletter-september.html
---

This is the first edition of what I hope will continue as a monthly
overview of events in and around the Foreman project, news from our
plugin community and must-read articles or tips.  Comments and
suggestions are most welcome.  
  
<!--more-->

### Foreman 1.3 release candidates out!

The first release candidates (RC) are out for the Foreman 1.3 release,
only a few days behind the target quarterly schedule agreed at the
roadmap meeting earlier this year.  
  
Headline features include a new CLI (Hammer), new foreman-installer and
many compute resource enhancements (EC2 VPC, association, GCE
support).  
  
Read [the RC
announcement](https://groups.google.com/forum/#!topic/foreman-announce/KPVhd3Dyy9w)
or the [1.3 release
notes](http://theforeman.org/manuals/1.3/index.html#Releasenotesfor1.3)
for more information, and file feedback in Redmine.  
  

### Plugin community news

There are some exciting new plugins being created to extend Foreman's
capabilities.  We feature three this month:  
  

#### Clustered Foreman with foreman\_memcache

For users running Foreman in a cluster configuration, foreman\_memcache
gives your instances a shared session and cache store.  It's seen an
update to add a configuration file now and is now available in the
plugins yum repo.  
  
More information on the
[foreman\_memcache](https://github.com/theforeman/foreman_memcache)
project page.  
  

#### Build ISOs with foreman\_bootdisk

This plugin wraps up Foreman's g/iPXE support into a user-friendly
button to download ISO and USB images with fully static networking, so
you only need DNS and connectivity to Foreman to boot new hosts.  We'd
like to expand support to host group images in the future.  
  
More information on the
[foreman\_bootdisk](https://github.com/theforeman/foreman_bootdisk)
project page.  
  

#### Tidying PuppetDB with puppetdb\_foreman

PuppetDB stores exported data and catalogs from all of the hosts in your
infrastructure, but when you delete a host in Foreman, that data lingers
until it expires.  Daniel Lobato's plugin contacts PuppetDB when a host
is deleted and triggers the tidyup immediately, the equivalent of <span
style="font-family: &quot;Courier New&quot;,Courier,monospace;">puppet
node deactivate</span>.  
  
More information on the
[puppetdb\_foreman](https://github.com/cernops/puppetdb_foreman/)
project page.  
  

#### Getting plugins

All of the featured plugins above, and more, are available as RPMs in
our repo at
[yum.theforeman.org/plugins](http://yum.theforeman.org/plugins).  
  
The full known list and installation instructions are on the [plugins
wiki](http://projects.theforeman.org/projects/foreman/wiki/Plugins).  
  

### Recent talks

-   [+Marek Hulán](http://plus.google.com/117359032853303823886) shows
    the new kafo project built for the Foreman installer: [Kafo deep
    dive](http://www.youtube.com/watch?v=frSpqL9p3xk)
-   [+Greg Sutcliffe](http://plus.google.com/110970604608301856139)
    explains the work to remove the core Puppet dependency: [Removing
    Puppet from core](http://www.youtube.com/watch?v=CWR7rmp9O6A)
