---
layout: post
title: Foreman Community Newsletter - September 2014
date: '2014-10-01T11:11:00.000+03:00'
author: Daniel Lobato
tags:
- redhat
- puppet
- foreman
- provisioning
- configuration
- openstack
- community
- newsletter
- API
modified_time: '2014-10-01T13:13:10.376+03:00'
blogger_id: tag:blogger.com,1999:blog-6789674575954398874.post-4950955162759776515
blogger_orig_url: http://blog.theforeman.org/2014/10/foreman-community-newsletter-september.html
---

<!--more-->

### Foreman 1.6.0 released!

After some testing in late August with the release candidate versions,
Foreman 1.6.0 is out! Some of the highlights are:  

-   Smart Proxy plugins support
-   API v2 is now declared stable, will be the default in 1.7.0
-   External user groups for LDAP and Kerberos group support
-   Support for RHEL7 (CentOS and Scientific will be supported when SCL
    1.1 becomes available)
-   Configurable and extensible dashboard
-   Puppet directory environment support

The full list of release notes can be found [in the manual, as
usual.](http://theforeman.org/manuals/1.6/index.html#Releasenotesfor1.6)
There are two CVEs explained in the [security
advisories](http://theforeman.org/security.html) and scheduled to be
fixed in 1.6.1.  

### New plugins

**[foreman\_graphite](http://github.com/theforeman/foreman_graphite)**
adds graphite support for your Foreman infrastructure instances.
Configure where to send your performance metrics through a YAML file.  
  
**[hammer-cli-foreman-ssh](https://github.com/theforeman/hammer-cli-foreman-ssh)**
gives Hammer parallel remote execution for your nodes in Foreman.
Authentication is done through SSH keys and parameters to filter subsets
of hosts are available.  
  
Rundeck support will be moved out of core for 1.7.
**[foreman\_host\_rundeck](http://github.com/theforeman/foreman_host_rundeck)**
will allow users to get a YAML representation of hosts for Rundeck.  
  
[**foreman\_salt**](https://github.com/theforeman/foreman_salt/)
provides node classification in Salt, and an interface for Salt keys,
highstate runs and more. It needs to run with a [**smart proxy
plugin**](https://github.com/theforeman/smart_proxy_salt/) as well.
Setup instructions are [in the
wiki](https://github.com/theforeman/foreman_salt/wiki).  
  
[**foreman\_abrt**](https://github.com/theforeman/foreman_abrt) provides
reports forwarding to ABRT, also needs to run with a [plugin in smart
proxy](https://github.com/theforeman/smart_proxy_abrt).  
  
[**hammer\_cli\_foreman\_bootdisk**](https://github.com/theforeman/hammer_cli_foreman_bootdisk)
gives Hammer a set of commands for
[foreman\_bootdisk](https://github.com/theforeman/foreman_bootdisk) a
plugin to Foreman for ISO/USB booting support.  

### FOSS outreach program and Foreman 

Foreman will be again taking an intern for the December-March cycle of
the FOSS outreach program (formerly OPW). You can find more information
about the program [here.](https://gnome.org/opw/) Here are [the proposed
projects](http://theforeman.org/gnomeopw.html), you are welcome in
\#theforeman in Freenode to ask questions.  

### Featured media 

Mitchell Anicas wrote a great tutorial on how to setup Foreman 1.5 to
manage an installation of Ubuntu 14.04 nodes. It is part of a series on
Puppet and Configuration management. [Check it out in the DigitalOcean
community
site.](https://www.digitalocean.com/community/tutorials/how-to-use-foreman-to-manage-puppet-nodes-on-ubuntu-14-04)  
  
We also discovered recently an article by Anthony Lapenna on Foreman and
Puppet infrastructure setup, the scalable way. [Check it out if you want
ideas for a solid Foreman and Puppet
infrastructure.](http://deviantony.wordpress.com/2014/06/21/setup-a-scalable-puppet-environment-with-foreman-on-ubuntu-12-04/)  
  
[Sprint 29 demo was recently
published](https://www.youtube.com/watch?v=D-gsgp1IDfA), if you want to
follow the latest from the Foreman development team. It covers EFI and
QEMU setup in Foreman, bond and fencing network devices support,
foreman\_host\_rundeck, foreman\_graphite, hammer-cli-foreman-ssh,
changes in the code base to use gem friendly\_id and [puppet server
support.](https://github.com/puppetlabs/puppet-server)
