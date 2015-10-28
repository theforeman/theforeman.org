---
layout: post
title: Foreman Community Newsletter - December 2014
date: '2014-12-23T17:50:00.003+02:00'
author: Tomas Strachota
tags:
- katello
- foreman
- plugin
- media
- community
- hammer
- newsletter
modified_time: '2014-12-31T13:34:11.918+02:00'
blogger_id: tag:blogger.com,1999:blog-6789674575954398874.post-2936277795545705845
blogger_orig_url: http://blog.theforeman.org/2014/12/foreman-community-newsletter-december.html
---

<!--more-->

### Foreman 1.7.0 and 1.7.1 released

A new version of the Foreman went out in early December, followed by a
bugfix release.  
Headline features of the releases are:  
-   enhancements to smart class parameters, providing better control
    over default values and merging of values across matchers
-   a new build review page that should help you check for common errors
    when switching a host into build mode
-   support for specifying bonds, VLANs and aliased interfaces on a
    host-importing interfaces them from facts
-   two existing features have been moved into plugins
    ([foreman\_host\_rundeck](https://github.com/theforeman/foreman_host_rundeck),
    [smart\_proxy\_chef](https://github.com/theforeman/smart_proxy_chef))
    and have their separate lifecycle now

Detailed information about the changes in the releases is available in
our [Foreman
1.7.0](http://theforeman.org/manuals/1.7/index.html#Releasenotesfor1.7.0)
and [Foreman
1.7.1](http://theforeman.org/manuals/1.7/index.html#Releasenotesfor1.7.0)
release notes.

  

This release also marks the end of Debian 6 (Squeeze) support, and Ruby
1.8.7 in the Foreman application (not the proxy or installer). 

  

Thanks to all [our
contributors](http://theforeman.org/manuals/1.7/index.html#Contributors)!  
  

### Hammer 0.1.4 released

After a long period of silence new versions of Hammer CLI and Hammer CLI
Foreman were released. They bring new commands for managing external
user groups and LDAP auth sources, YAML and JSON exports and enable for
using names when associating multiple resources at once. There are also
new translations available.  
Read the release notes for further details:
[hammer\_cli](https://github.com/theforeman/hammer-cli/blob/master/doc/release_notes.md#release-notes),
[hammer\_cli\_foreman](https://github.com/theforeman/hammer-cli-foreman/blob/master/doc/release_notes.md#release-notes)  
  
### Katello 2.1 RC1 released

The Katello team announced a release candidate of Katello 2.1. Users may
test out the new features in the next release. Katello 2.1 is a plugin
to Foreman 1.7. Upgrades from previous versions of Katello have not been
tested but an upgrade procedure to 2.1 should be available soon.

For more information, please be sure to visit the project's website
[http://www.katello.org](http://www.katello.org/)

  

### Features in development

**Networking**

Bunch of networking improvements is [approaching
merge](https://github.com/theforeman/foreman/pull/1988). This change
brings more flexibility into specifying primary and provisioning
interfaces. The UI has been simplified and split up into a NICs overview
table and modal windows showing details.  
  

**Multihost deployment**

Work on multihost deployment continue. December was in the name of
defining a data model. The current state is thoroughly described in [a
deepdive on this topic](https://www.youtube.com/watch?v=CFPLGfA6-jU).  
  

**Moving to Rails 4**

We've started with first steps towards moving to Rails 4 this month.
Stay tuned for more information.  
  

### New plugins this month

-   [foreman\_digitalocean](https://github.com/theforeman/foreman-digitalocean) -
    enables provisioning and managing of DigitalOcean droplets in
    Foreman
-   [foreman\_host\_overview](https://github.com/sfu-rcg/foreman_host_overview) -
    extends the properties table for a host to include VNC & RDP links,
    as well as the host's certificate name
-   [foreman\_host\_rundeck](https://github.com/theforeman/foreman_host_rundeck)-
    creates a yaml representation of rundeck on hosts

  

### New media

-   [Multihost deployments data model
    deepdive](https://www.youtube.com/watch?v=CFPLGfA6-jU)
