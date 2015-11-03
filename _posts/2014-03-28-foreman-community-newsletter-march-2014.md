---
layout: post
title: Foreman Community Newsletter - March 2014
date: '2014-03-28T17:47:00.000+03:00'
author: Dominic Cleal
tags:
- events
- rdo
- discovery
- openstack
- community
- chef
- newsletter
modified_time: '2014-03-28T17:47:05.743+03:00'
blogger_id: tag:blogger.com,1999:blog-6789674575954398874.post-8093115082349561572
blogger_orig_url: http://blog.theforeman.org/2014/03/foreman-community-newsletter-march-2014.html
---

Welcome to the March 2014 community newsletter.  Feedback always
appreciated, if there's a topic you'd like to see more (or less!) of in
these editions.  
  
<!--more-->

### Call for testing: Foreman 1.5 authorization system

Our Foreman 1.5 development cycle is coming to a close in a couple of
weeks, so the aim until the end of April is to finish off the last major
features and harden it for release.  
  
To that end, we're putting out a call for testing, focused on the major
improvements to the user authorization system in Foreman 1.5.  In
particular, we're interested in environments that rely on user filters,
user groups and want fine-grained access controls.  
  
More information about what's changed, how to test it over the next two
or three weeks and report bugs is available on our call for testing
page:  

-   [Call for testing: authorization system for Foreman
    1.5](http://projects.theforeman.org/projects/foreman/wiki/Auth_testing_for_Foreman_15)

  

### Foreman 1.4.2 released

Last week, we released an update to Foreman 1.4 to fix two security
issues and a number of bugs.  This includes updates to support Puppet
3.5 and Facter 2.0, both of which are being released by Puppet Labs
imminently.  

-   [Release notes for Foreman
    1.4.2](http://theforeman.org/manuals/1.4/index.html#Releasenotesfor1.4.2)
-   [Foreman 1.4.2
    announcement](https://groups.google.com/forum/#!msg/foreman-announce/WxOExE8Z2Ig/vmkM6fWXp4UJ)

  

### Foreman snapshot plugin

Greg Sutcliffe has announced the first (alpha) release of a new plugin
called foreman\_snapshot, designed to make images or snapshots on
compute resources from host groups.  The idea is to use host groups as a
form of template, creating an image with most of the configuration
already applied, and then boot new hosts quickly from this predefined
image.  
  
So far it's implemented for libvirt and OpenStack compute resources,
with [more to
come](http://projects.theforeman.org/projects/snaphost/issues).  Note
that it is currently API-only and requires Foreman 1.5/nightly.  

-   [foreman\_snapshot
    project](https://github.com/theforeman/foreman_snapshot)
-   [Deep dive: building images from host
    groups](https://www.youtube.com/watch?v=YNuQsTAdGds)
-   [Sprint demo
    17](http://www.youtube.com/watch?v=aCs-QCQopU0&feature=share&t=24m44s)
-   [Sprint demo 21: added libvirt
    support](http://www.youtube.com/watch?v=w5asB2vhwyM&feature=share&t=7m34s)

  

### Further watching: Sprint 21

[Sprint
21](https://groups.google.com/d/msg/foreman-dev/GnqKhZNN8Vo/VkZ6xNgKfGMJ)
included the new authorization system and other large features such as
CLI enhancements that will make up the Foreman 1.5 release.  The demo of
the work from this sprint is now available and includes
foreman\_snapshot's libvirt support, Hammer CLI enhancements, LDAP group
support, a live CD of Foreman and more work on the configuration groups
UI.  Watch the video here:  

-   [Foreman Sprint Demo
    21](https://www.youtube.com/watch?v=w5asB2vhwyM) (see description
    for full agenda)

  

### OpenStack Foreman Installer

[RDO](http://openstack.redhat.com/) [has offered
Foreman](http://openstack.redhat.com/Deploying_RDO_using_Foreman) as an
installation method for OpenStack for the last couple of releases, but a
team of developers are working on a major update for the installation
and setup process of Foreman itself (called "OFI" for "OpenStack Foreman
Installer" or "Staypuft").  
  
This is based on [a new plugin](https://github.com/theforeman/staypuft)
to Foreman and coupled with the [Discovery
plugin](https://github.com/theforeman/foreman_discovery) to quickly
provision physical hosts.  See these two videos for two aspects of the
combined installer, and follow the foreman-dev mailing list for
updates:  

-   [Staypuft OpenStack Foreman Installer
    Plugin](https://www.youtube.com/watch?v=xQa0OI0Nz60) (UI)
-   [Staypuft OpenStack Foreman installer DynFlow
    Orchestration](https://www.youtube.com/watch?v=EO1fgMDbETk)

As a further part of this work, a new live CD is being developed that
contains Foreman pre-installed with Discovery ready for provisioning. 
Follow the [foreman-live project
here](https://github.com/theforeman/foreman-live) and [watch the demo
here](http://www.youtube.com/watch?v=w5asB2vhwyM&feature=share&t=38m12s).  
  

### GNOME OPW and events

The Foreman project is proud to be part of this summer's GNOME Outreach
Program For Women, helping women get involved in open source
projects.   
  
While the Foreman application period is just wrapping up (by 31st
March), we've seen a number of new faces get involved in the project
over the past couple of weeks and are very happy to have received
patches to some of our projects.  

-   [GNOME Outreach Program for Women](https://gnome.org/opw/)
-   [Foreman GNOME OPW project
    list](http://theforeman.org/gnomeopw.html)

Next month, there's a talk on Foreman and Chef integration at \#ChefConf
2014 (San Francisco), on Thursday 17th April.  Tickets for the
conference are still available!  

-   [\#ChefConf 2014](http://chefconf.opscode.com/chefconf/)
-   [Foreman and Chef integration
    talk](http://chefconf2014.busyconf.com/schedule#activity_5310c9dfc26563548c000093)
