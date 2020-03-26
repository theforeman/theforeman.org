---
layout: post
title: Foreman Community Newsletter - September 2015
date: '2015-09-15T13:01:00.000+03:00'
author: Tomas Strachota
tags:
- katello
- remote_execution
- docker
- openscap
- foreman
- dhcp
- deep-dive
- discovery
- chef
- demo
- newsletter
modified_time: '2015-10-06T13:43:53.260+03:00'
blogger_id: tag:blogger.com,1999:blog-6789674575954398874.post-1715269517448905299
blogger_orig_url: /2015/09/foreman-community-newsletter-september.html
excerpt: |
  Foreman 1.9 released, another update to the 1.8 series, Katello 2.3, and the 
  usual round up of plugins and other news.
---

### Foreman 1.9 and 1.9.1 released

Foreman 1.9.0 was published on August 18th followed by a bugfix 1.9.1
release on September 11th.  

New features in this version include:  
-   A few small web UI enahncements such as new search-enabled dropdown
    menus throughout the application and full screen editor for
    parameters
-   Template editing forms have now capability to preview edits on the
    rendered template.
-   Foreman's logging has become more granular so it's now easier to
    enable debugging of specific subsystems.
-   Two new email notifications for listing recent audit activities and
    for notifying when a host has built.
-   Libvirt has gained a new capability for using cloud-init when
    image provisioning.

  
The full list of the changes is available in release notes for both
Foreman 1.9 and Foreman 1.9.1:  
<http://theforeman.org/manuals/1.9/index.html#Releasenotesfor1.9>  
<http://theforeman.org/manuals/1.9/index.html#Releasenotesfor1.9.1>  
  

### Foreman 1.8 bugfix release

Foreman 1.8.3 has been released on August 19th with half a dozen bug
fixes.  All components have been updated.  
  
Full release notes are on the website here:  
<http://theforeman.org/manuals/1.8/index.html#Releasenotesfor1.8.3>  
  
This will probably be the last 1.8 series release due to the release of
1.9.0, unless there is a severe security issue or a significant number
of regressions get fixed.  
  
### Katello releases

Katello project released two new versions this month. General
availability of Katello 2.3 (Berliner Weisse) has been announced on
August 21st. Visit the release notes page to see the full list of
changes:  
<http://www.katello.org/docs/2.3/release_notes/release_notes.html>  
  
There was also a bugfix release of Katello 2.2.4 that includes several
patches:  
<http://www.katello.org/docs/2.2/release_notes/release_notes.html>  
  
### Remote execution plugin released

The Foreman Remote Execution Team has released a first version of the
plugin that allows batch execution of scripts on multiple hosts. A
functionality demo of the first version is linked in the Media
section.  
  
### Plugin releases this month

-   [foreman\_chef](https://github.com/theforeman/foreman_chef/) 0.1.7
-   [foreman\_dhcp\_browser](https://github.com/theforeman/foreman_dhcp_browser/)
    0.0.7
-   [foreman\_discovery](https://github.com/theforeman/foreman_discovery/)
    4.0.0
-   [foreman-docker](https://github.com/theforeman/foreman-docker/)
    1.4.1
-   [foreman\_noenv](https://github.com/joshuabaird/foreman_noenv/)
    0.0.4
-   [foreman\_openscap](https://github.com/theforeman/foreman_openscap/)
    0.4.3
-   [foreman\_remote\_execution](https://github.com/theforeman/foreman_remote_execution/)
    0.0.6
-   [foreman\_setup](https://github.com/theforeman/foreman_setup/) 3.0.2
-   [foreman\_tasks](https://github.com/theforeman/foreman-tasks/) 0.7.3
-   [staypuft](https://github.com/theforeman/staypuft/) 0.5.26

  

### New media

-   [Foreman community demo](http://www.youtube.com/watch?v=r0Gd_gw3AGk)
    (held on Thursday, August 27th)
-   [Foreman remote execution plugin
    deep-dive](https://www.youtube.com/watch?v=6-hb_czvJAA)
-   [Foreman deployments plugin pre-release
    demo](https://www.youtube.com/watch?v=U5qtriQfu6A)
