---
layout: post
title: Foreman Community Newsletter - October 2013
date: '2013-10-22T11:53:00.001+03:00'
author: Dominic Cleal
tags:
- katello
- community
- chef
- newsletter
modified_time: '2013-10-22T11:53:05.041+03:00'
blogger_id: tag:blogger.com,1999:blog-6789674575954398874.post-873929383129529196
blogger_orig_url: http://blog.theforeman.org/2013/10/foreman-community-newsletter-october.html
---

Welcome to the October 2013 issue of the Foreman newsletter.  
  
<!--more-->

### Foreman 1.3.0 and 1.2.3 released

With the help of everybody who tested the 1.3 release candidates last
month, Foreman 1.3.0 was released in mid-October with a whole set of new
features.  Special thanks go to the [53
contributors](http://theforeman.org/manuals/1.3/index.html#Contributors)
who created this release, across all of our projects.  
  
The new kafo-based Foreman installer features, along with Amazon EC2 VPC
support, a preview of the Hammer command line tools and experimental
Google Compute Engine support.  
  
Lots more information, including upgrade notes is available in the
[Foreman 1.3 release
notes](http://theforeman.org/manuals/1.3/index.html#Releasenotesfor1.3)
in the manual.  
  

#### Foreman 1.2.3 security release

A security fix release was made for Foreman 1.2.3, which fixes an
authenticated SQL injection.  All 1.2 users are urged to update as soon
as possible.  Read [the
announcement](https://groups.google.com/forum/#!topic/foreman-announce/GKMNXM66Z84)
for more info.  
  

### Chef support in the making

A team of developers (Romain Vrignaud and Marek Hulán) are working on
adding support for the [Chef](http://www.opscode.com/chef/)configuration
management tool to Foreman.  Their first steps are to import facts and
reports, before working out how to provide full management capabilities
equivalent to Foreman's support for Puppet.  
  
Chart their progress and join in via:  

-   [Chef
    reporting](http://projects.theforeman.org/projects/foreman/wiki/Chef-reporting)
    wiki page
-   [chef-handler-foreman](https://github.com/theforeman/chef-handler-foreman)
    GitHub project

Discussions have also started about integration with Salt.  Do get in
contact via the [foreman-dev mailing
list](http://groups.google.com/group/foreman-dev?pli=1) or IRC channels
if you can help out with either.  
  

### Katello project moves into Foreman

The [Katello project](http://www.katello.org/) (for content and
subscription management) has announced that the project will become a
Foreman plugin in the future, with efforts now going into modifying the
existing codebase to run inside Foreman.  
  
We'd like to welcome the Katello team into the Foreman community - this
will be an exciting project to watch in the coming months.  
  

### Further reading/watching

\[Czech\] Lukáš Zapletal published his first article on Foreman
provisioning with libvirt, KVM and virtual networks:  

-   [Foreman – hromadná instalace a konfigurace serverů (1.
    díl)](http://fedora.cz/foreman-hromadna-instalace-a-konfigurace-serveru-1-dil/)

A recording of the latest additions to Foreman, available already in
nightly packages, has been posted.  It features an enhanced UI, Hammer
CSV support, a Chef support demo and more:  

-   [Foreman Sprint Demo 15](http://www.youtube.com/watch?v=6B4F563l-E0)

<!-- -->
