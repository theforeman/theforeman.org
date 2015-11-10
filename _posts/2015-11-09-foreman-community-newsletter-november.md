---
layout: post
title: Foreman Community Newsletter - November 2015
date: '2015-11-09T15:28:00.001+03:00'
author: Shimon Shtein
tags:
- foreman
- community
- cockpit
- salt
- smart_proxy
- discovery
- digitalocean
- xen
- ansible
- chef
- demo
- newsletter
- puppet
modified_time: '2015-11-09T15:28:00.001+03:00'
excerpt: |
  Foreman 1.9.3 was released, Foreman 1.10.0-RC2 is out for testing, new plugins and events.
---

### Foreman 1.10.0-RC2 available for testing

The latest Release Candidate for Foreman 1.10 has been released. Feedback is very, very useful at this stage, so please do test and report bugs! Here are some of the upcoming highlights:

#### Headline features

* A new button to rebuild DNS, DHCP and TFTP configs has been added to the UI and API, which will help in cases where records have been lost due to server rebuilds or other issues.
* More detailed host statuses are available, with an extensible mechanism for plugins to be able to add to the green/yellow/red status shown on the host list and dashboard.
* Lots of host and host group cloning enhancements and fixes are present in this release, so virtual machine details, Puppet class associations and more are copied correctly, among other improvements.
* Creating hosts with host groups, but changing and unsetting certain inherited attributes has become easier with new "inherit" buttons. Similarly, passwords already saved can be removed now.
* The smart proxy DNS module has been overhauled, and is now extensible. New PowerDNS and Route 53 plugins are available already!
* Parameter management has seen a few improvements, particularly in the Puppet class edit form.  The host and host group parameters tabs have improved tooltips and layout fixes to improve readability.

More details in the [announcement](https://groups.google.com/forum/#!topic/foreman-users/lMV2QzaHOuI)

### Foreman 1.9.3 released

Latest release in the 1.9 series is [now available](https://groups.google.com/d/msg/foreman-announce/4jKfFum2RrE/8yjimfEICgAJ) with fixes for some new bugs and regressions.

### New and updated plugins this month

* [foreman_cockpit](https://github.com/theforeman/foreman_cockpit) - first release [announcement](https://groups.google.com/forum/#!topic/foreman-users/QEAQjGs1exQ), [screenshot](https://camo.githubusercontent.com/dd327f958993d60ecefbe4e1fc26bc45ad63cf9c/687474703a2f2f692e696d6775722e636f6d2f527a64735239622e676966)
* [foreman_salt](https://github.com/theforeman/foreman_salt) and [smart_proxy_salt](https://github.com/theforeman/smart_proxy_salt) - versions 4.0.1 and  2.1.6 respectively. Compatible with Foreman 1.10. [announcement](https://groups.google.com/forum/#!topic/foreman-users/36_Z5oLXBUA)
* [foreman_discovery](https://github.com/theforeman/foreman_discovery) - version 4.1 (PXE-less discovery via kexec mechanism) [announcement](https://groups.google.com/forum/#!topic/foreman-users/ae29UUEyURc), [screenshot](/static/images/blog_images/2015-11-09-foreman-community-newsletter-november/discovery.gif)
* [foreman_digitalocean](https://github.com/theforeman/foreman-digitalocean) - version 0.2.1
* [foreman-xen](https://github.com/theforeman/foreman-xen) - version 0.1.5 and 0.2.1 (ongoing code cleanups and fixes, added support for XenServer pools (only 0.2.x for Foreman 1.10+))
* [foreman_chef](https://github.com/theforeman/foreman_chef) - version 0.2.0
* [Ansible integration](https://groups.google.com/forum/#!topic/foreman-dev/cjj2g3bS8ho) - still a work-in-progress

### Upcoming events

* Foreman / oVirt Meetup, London, 20th Nov, 7pm (Clapham Junction) [more details](https://plus.google.com/b/102496134326414788199/events/c7semeinn29f6diq571rnipb7i4)
* Talk about Foreman by Lukáš Zapletal, Karviná University, 12th Nov [more details](https://plus.google.com/+Luk%C3%A1%C5%A1Zapletal/posts/DEH4ZFJdLgN)
* Talk: "Monitoring infrastructure changes with Foreman" by Lukáš Zapletal, Pilsen University, 19th Nov [more details](https://plus.google.com/+Luk%C3%A1%C5%A1Zapletal/posts/fHbGSfgpopS)

### Catching up:

#### Latest community demo:
[Main YouTube Link](https://www.youtube.com/watch?v=yTVgnIcWBYg)

* [foreman_cockpit (dlobatog)](https://youtu.be/yTVgnIcWBYg?t=30)
* [Host Unification update (jsherill)](https://youtu.be/yTVgnIcWBYg?t=480)
* [Parameters & Table Rendering (tbrisker)](https://youtu.be/yTVgnIcWBYg?t=693)
* [Facts for Discovered Hosts (agoldboi)](https://youtu.be/yTVgnIcWBYg?t=965)
* [remote_execution updates (mhulan)](https://youtu.be/yTVgnIcWBYg?t=1090)
* [Community Roadmap update / open questions (gwmngilfen)](https://youtu.be/yTVgnIcWBYg?t=1321)

#### Foreman Meetup in Brno, Wed 14th Oct

#### Foreman LinuxDays 2015 recap
[The recording is available (in Czech)](https://www.youtube.com/watch?v=qfJxitjTEn0)

[Slides are published at our Intro page](http://theforeman.org/introduction.html)
You can download in ODT format from SlideShare if you want to modify.

[Awesome talk about Katello and Puppet (in Czech)](https://www.youtube.com/watch?v=dKKPP0Ufah0&feature=youtu.be)

[more details here](https://groups.google.com/forum/#!topic/foreman-dev/M2gg9UAFm_A)
