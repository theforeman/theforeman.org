---
layout: post
title: Foreman Community Newsletter - November 2014
date: '2014-12-02T01:21:00.000+02:00'
author: Martin Bačovský
tags:
- openscap
- live-cd
- foreman
- plugin
- discovery
- networking
modified_time: '2014-12-02T01:21:02.958+02:00'
blogger_id: tag:blogger.com,1999:blog-6789674575954398874.post-8503174913725380951
blogger_orig_url: http://blog.theforeman.org/2014/12/foreman-community-newsletter-november.html
---

<!--more-->

### Foreman 1.7.0-RC2 released

Second release candidate for Foreman 1.7 was released. It fixes a number
of issues found by folks testing RC1 and will likely become the 1.7.0
release within a week.  
  
Much more information about the changes in Foreman 1.7 is available in  
our [release
notes](http://theforeman.org/manuals/1.7/index.html#Releasenotesfor1.7).  

#### 

### Foreman 1.6.3 released

Foreman 1.6.3 has been released to fix a handful of bugs. Check the
[release
notes](http://theforeman.org/manuals/1.6/index.html#Releasenotesfor1.6.3) 
for full list. This will probably be the last update of the 1.6
series.  

### Foreman Discovery Image 2.0 released

New major version of the Discovery Image was released. A minimized
version of CentOS 7.0 is used to PXEBoot unknown bare-metal hosts and
registering them in Foreman via Discovery plugin. The image does support
both Foreman 1.6 and upcoming 1.7.  
  
To download 2.0 series follow the
[link](http://downloads.theforeman.org/discovery/releases/2.0/).For
upgrade instructions see the announcement on the
[list.](https://groups.google.com/forum/#!topic/foreman-users/2yA0SFFZM3Q)  

### Features in progress

A lot of effort was put into design and development of new features. The
following lines are partly links to reports of current status and heads
up of what you can look for in near future and partly invitationto
sharing your ideas, feedback and testing.  

#### Networking

Recently, we've been working on Foreman networking refactoring. If you
want to know more about upcomming changes in networking setup of the
host, how to set primary and provisioning interfaces and what
improvements are prepared for NIC objects on bare metals see the
detailed
[summary](https://groups.google.com/forum/#!topic/foreman-dev/ll3pZXrYeF4)
on the list. Also don't miss the networking unification
[deepdive](https://www.youtube.com/watch?v=xmYmMQONq_0#t=144) that will
guide you through the changes.  

#### Multi-host orchestration

is in early stage of development, which means you can help it a lot to
become awesome. If you are interested in this topic, there is a detailed
design plan and
discussion [here](https://groups.google.com/forum/#!topic/foreman-dev/bCzCjTDY0no)
on the mailing list, covering defining new terms, stories and plans. And
let us know what do you think.  

#### Foreman Live CD

was mentioned in the last newsletter. Since then we have upgraded
Foreman Live CD image to be based on CentOS 7 and are extending Foremen
installer with wizards for easier setup of networking and
authentication. Detailed report should land on the list soon.  

### OpenSCAP plugin

OpenSCAP is a toolkit for security compliance automation build on top of
SCAP standard. OpenSCAP ecosystem includes low-level C library,
command-line scanner, graphical interface (scap-workbench), hardening
guidances (scap-security-guide), Anaconda installer add-on, and
integration with Spacewalk project. Work on integration with Foreman has
just started. See
[announcement](https://groups.google.com/forum/#%21topic/foreman-dev/sYo2fdO5918)
on the list for more.  

### Meeting together

There are a few interesting Foreman related conferences out there  

-   [cfgmgmtcamp.eu](http://cfgmgmtcamp.eu/)  - we even have a dedicated
    track for all Foreman things there 
-   [FOSDEM](https://fosdem.org/2015/) - config management, don't forget
    ti visit visit IaaS and Virtualisation rooms 
-   [devconf CZ](http://devconf.cz/) - meet people form Red Hat and
    Fedora communities in Czech Republic 
-   [T3chfest](https://techfest.uc3m.es/call-for-talks/) - it's mainly
    geared towards university students

Hope to see you there!  

### New media

-   Sprint 31 Demo
-   Salt integration deep dive
-   Networking unification

Both clips are availabe on our [media](http://theforeman.org/media.html)
page.
