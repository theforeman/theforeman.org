---
layout: post
title: Foreman Community Newsletter - December 2013
date: '2013-12-24T15:28:00.000+02:00'
author: Dominic Cleal
tags:
- plugin
- events
- community
- newsletter
modified_time: '2013-12-24T15:29:09.239+02:00'
blogger_id: tag:blogger.com,1999:blog-6789674575954398874.post-3684389818963932366
blogger_orig_url: http://blog.theforeman.org/2013/12/foreman-community-newsletter-december.html
---

Welcome to the last community newsletter of the year, for December
2013.  
  
<!--more-->

### Foreman 1.3.2 update released

A bug fix release for Foreman core is now available, version 1.3.2.  A
new version of the Hammer CLI is also included, with lots of updates. 
This will likely be the last minor release before Foreman 1.4 is out
early in 2014.  
  
More information in [the
announcement](https://groups.google.com/forum/#!topic/foreman-announce/STNA1qboETU)
and [release
notes](http://theforeman.org/manuals/1.3/index.html#Releasenotesfor1.3.2).  
  

### Debian plugin packages

Plugin packages are now available for Debian and Ubuntu distributions
from our main Debian repositories.  One important caveat is that they
require internet access (to rubygems.org) on the system they're
installed on.  The repository isn't versioned, so plugins are usually
compatible with Foreman 1.3.  
  
Add this to /etc/apt/sources.list.d/ to enable the repo:  
  
<span
style="font-family: &quot;Courier New&quot;,Courier,monospace;">deb
http://deb.theforeman.org/ plugins main</span>  
  
<span style="font-family: inherit;">See the plugin list to find out
which plugins are available as Debian or RPM packages.</span>  

-   [Announcement](https://groups.google.com/d/topic/foreman-users/O-7VVf00HMQ/discussion)
-   [List of
    plugins](http://projects.theforeman.org/projects/foreman/wiki/List_of_Plugins)

  

### Upcoming events

At the start of February, many Foreman developers and users will gather
at the [FOSDEM](https://fosdem.org/2014/) and
[CfgMgmtCamp](http://cfgmgmtcamp.eu/) events in Brussels, Belgium.  
  
Some Foreman-related talks will be at FOSDEM:  

-   Config management: [Foreman integration with Chef and
    others](https://fosdem.org/2014/schedule/event/foreman_integration_chef/),
    Marek Hulán
-   Virtualisation and IaaS: Ohad Levy

At CfgMgmtCamp, we'll hold a dedicated Foreman track with a variety of
talks.  The schedule is being confirmed, and will be available on [the
CfgMgmtCamp website](http://cfgmgmtcamp.eu/Foreman.html).  Don't forget
[to
register](http://www.eventbrite.com/e/cfgmgmtcamp-tickets-8286875267)
(free)!  
  

### Further watching

The last development sprint was completed at the beginning of December,
and the sprint demo shows lots of features that are either available in
nightly or upcoming work.  
  
This includes improvements to Hammer CLI, MCollective command execution,
API enhancements and improved libvirt support.  

-   [Foreman Sprint Demo 17](http://www.youtube.com/watch?v=aCs-QCQopU0)
-   [End of sprint announcement + release
    notes](https://groups.google.com/forum/#!topic/foreman-dev/uRMAFPaJEB8) 

The team regularly holds "deep dive" sessions to explore a new feature
or topic.  Join the [Foreman Google+
community](https://plus.google.com/u/0/communities/106976851375995577697)
to keep up with these events. Here are the recent recordings:  

-   [Roles and permissions
    revamp](http://www.youtube.com/watch?v=2KP_qUVIv2c): Marek talks
    through a design proposal for a rewrite of the role and user group
    system for improved flexibility
-   [Dynflow for Katello
    tasks](http://www.youtube.com/watch?v=cpUz5Ylhkr0): Ivan shows how
    Dynflow can be used to process background tasks in Katello
-   [Remote management with
    MCollective](http://www.youtube.com/watch?v=vMMoBTG9Zfg): Dmitri and
    Sam show their work on the foreman\_mco plugin ([alpha
    announcement](https://groups.google.com/forum/#!topic/foreman-dev/53NM7FMwNtA))
-   [Host group image
    building](http://www.youtube.com/watch?v=YNuQsTAdGds): Greg demos
    building new OpenStack images from host groups
