---
layout: post
title: Foreman Community Newsletter - October 2014
date: '2014-10-31T11:43:00.000+02:00'
author: Lukáš Zapletal
tags:
- abrt
- live-cd
- ruby
- foreman
- plugin
- cloudstack
- media
- fosdem
- discovery
- newsletter
modified_time: '2014-10-31T11:44:05.426+02:00'
blogger_id: tag:blogger.com,1999:blog-6789674575954398874.post-8495064910683161971
blogger_orig_url: http://blog.theforeman.org/2014/10/foreman-community-newsletter-october.html
---

<!--more-->

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: bold; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Important
security updates</span>

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Foreman
1.6.1, 1.6.2 and 1.5.4 have been released to fix an important security
issues affecting the core and the smart proxy (foreman-proxy) identified
as CVE-2014-3590, CVE-2014-3653 and CVE-2014-3691. For more
security-related information visit our </span>[<span
style="background-color: transparent; color: #1155cc; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: underline; vertical-align: baseline; white-space: pre-wrap;">Security
Page</span>](http://theforeman.org/security.html)<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">.</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">  
</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">  
</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: bold; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Katello
2.0 released</span>

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">The
Katello team announced the official release of Katello 2.0 on October 6.
This release had been a long time coming and brings with it many new
features including a change to Katello architecture and deployment as a
Foreman plugin. Katello was designed to bring distributed content
management alongside the configuration and provisioning management that
Foreman provides. More information can be found in the </span>[<span
style="background-color: transparent; color: #1155cc; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: underline; vertical-align: baseline; white-space: pre-wrap;">Release
Notes</span>](http://www.katello.org/docs/release_notes/release_notes_20.html)<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">.</span>

**  
**  

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: bold; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Foreman
Live CD</span>

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">People
responsible for the foreman-staypuft plugin which aims for OpenStack
installations using Foreman developed nice Live CD/appliance which
allows users to run Foreman from memory (what we call “stateless” mode).
We have taken this work and published it in </span>[<span
style="background-color: transparent; color: #1155cc; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: underline; vertical-align: baseline; white-space: pre-wrap;">foreman-live</span>](https://github.com/theforeman/foreman-live)<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">
git repository, integrated build process in our Jenkins and started with
</span>[<span
style="background-color: transparent; color: #1155cc; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: underline; vertical-align: baseline; white-space: pre-wrap;">nightly
builds</span>](http://downloads.theforeman.org/livecd/nightly/)<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">
of the live cd. It is currently in alpha stage and expect rough edges,
but In the upcoming months we will work on improving the Live CD.</span>

**  
**  

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: bold; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">New
Foreman discovery image</span>

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">We
redesigned how we build foreman discovery image and we are going to
release new version 2.0 which will be smaller, faster, more debugging
options and with the same features as 0.6 release. It will work with
Foreman 1.6 and 1.7. To check the image out, see our </span>[<span
style="background-color: transparent; color: #1155cc; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: underline; vertical-align: baseline; white-space: pre-wrap;">pre1
build</span>](https://groups.google.com/forum/#!topic/foreman-dev/Iwol9Xnuld0)<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">
which was announced this month.</span>

**  
**  

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: bold; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">FOSDEM
2015 is approaching</span>

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">The
FOSDEM and ConfigManagementCamp 2015 </span>[<span
style="background-color: transparent; color: #1155cc; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: underline; vertical-align: baseline; white-space: pre-wrap;">Call
for Proposals</span>](http://cfgmgmtcamp.eu/)<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">
is open until December 1 and we welcome all proposals related to
Foreman. As usual, FOSDEM will take place at ULB Campus Solbosch on
Saturday 31 January and Sunday 1 February 2015 followed by
ConfigManagementCamp on Moday 2 and Tuesday 3 at Gent, Belgium.</span>

**  
**  

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: bold; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Dropping
Ruby 1.8.7 support for core</span>

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Foreman
supports Ruby 1.8.7 from the day one, but since we expect Ruby 2.2
during Christmas and we plan to upgrade to Rails 4.0, it’s the time to
drop support of Ruby 1.8.7 for Foreman core (not Smart Proxy, hammer or
the Installer). We started with turning off unit and integration tests
against Ruby 1.8.7 and removing various related workarounds across our
code base. Also we have started to run our tests against Ruby
2.1.</span>

**  
**  

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: bold; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">New
plugins this month</span>

-   [<span
    style="background-color: transparent; color: #1155cc; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: underline; vertical-align: baseline; white-space: pre-wrap;">foreman-cloudstack</span>](https://github.com/citrix/foreman-cloudstack)<span
    style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">
    adds CloudStack compute resource</span>

-   [<span
    style="background-color: transparent; color: #1155cc; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: underline; vertical-align: baseline; white-space: pre-wrap;">foreman-abrt</span>](https://github.com/theforeman/foreman_abrt)<span
    style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">
    integrates Automated Bug Reporting Tool from Fedora and Red Hat
    compatible hosts</span>

-   [<span
    style="background-color: transparent; color: #1155cc; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: underline; vertical-align: baseline; white-space: pre-wrap;">foreman-custom-banner</span>](https://github.com/jcmcken/foreman_custom_banner)<span
    style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">
    adds user-defined colored top banner</span>

-   [<span
    style="background-color: transparent; color: #1155cc; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: underline; vertical-align: baseline; white-space: pre-wrap;">foreman-graphite</span>](https://github.com/theforeman/foreman_graphite)<span
    style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">
    sends performance metrics to Graphite.</span>

-   [<span
    style="background-color: transparent; color: #1155cc; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: underline; vertical-align: baseline; white-space: pre-wrap;">foreman-hammer-ssh</span>](https://github.com/theforeman/hammer-cli-foreman-ssh)<span
    style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">
    hammer SSH plugin, execute SSH commands across multiple foreman
    managed hosts. </span>

**  
**  

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: bold; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Featured
media</span>

-   <span
    style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Sprint
    29 demo</span>

-   <span
    style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Sprint
    30 demo</span>

-   <span
    style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">ABRT
    plugin deep dive</span>

**  
**  

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">All
the clips are published on our </span>[<span
style="background-color: transparent; color: #1155cc; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: underline; vertical-align: baseline; white-space: pre-wrap;">media
pages</span>](http://theforeman.org/media.html)<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">.</span>

**  
**  

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: bold; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">What
to expect in November</span>

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Next
month, Foreman core team will be working on various features like
mentioned Live CD, better Docker integration, adding http(s) proxy
support to foreman-proxy, UEFI support, improving discovery,
foreman-tasks plugin availability, katello and bastion split and bug
fixing.</span>

  

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Of
course, we will be delivering the most anticipated artifact Foreman
1.7.0 beginning December. Expect bunch of Release Candidates during
November. More info in our </span>[<span
style="background-color: transparent; color: #1155cc; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: underline; vertical-align: baseline; white-space: pre-wrap;">schedule
wiki
page</span>](http://projects.theforeman.org/projects/foreman/wiki/Foreman_17_Schedule)<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">.</span>
