---
layout: post
title: Foreman Community Newsletter - March 2016
author: Martin Bacovsky
tags:
- foreman
- newsletter
excerpt: |
  Foreman 1.10.2 and 1.11 RC2 released. Read on for details of new plugin releases and new recordings to watch!
---

### Foreman 1.10.2 bugfix release is out
Foreman 1.10.2 was [announced](https://groups.google.com/forum/#!topic/foreman-users/ibuDpgjqL8A) on 24th of February containing over 30 bug fixes across the whole application. Check the full [release notes](http://theforeman.org/manuals/1.10/index.html#Releasenotesfor1.10.2)

### Foreman 1.11 is close to the release, second release candidate (RC2) is ready
On 11th of March the second release candidate for Foreman 1.11 was released, with
plenty of bug fixes for issues in RC1. In particular fixes for
non-admin users, smart proxy SSL authentication and configuration status
errors are included in 1.11.0-RC2. See the [announcement](https://groups.google.com/forum/#!topic/foreman-users/8R9LbzGikug)

Some notable changes in 1.11 release are

 - User interface changed to PatternFly design
 - Improved layout of host/host group parameter overrides
 - Ruby on Rails upgraded from version 3.2 to 4.1, under the covers
 - Smart proxy DHCP module refactored to support plugins with new DHCP providers (none yet)
 - New pages showing smart proxy status information in the Foreman UI

For more details see [release notes](http://theforeman.org/manuals/1.11/index.html#Releasenotesfor1.11)

### New and updated plugins since last December's newsletter
 - [foreman-ansible](https://github.com/theforeman/foreman_ansible) updated to 0.3, see [announcement](https://groups.google.com/forum/#!topic/foreman-users/P4pTrrpO7CI/discussion)
 - [foreman-discovery](https://github.com/theforeman/foreman_discovery) updated to 5.0 with subsequent updates to 5.0.1 and 5.0.2, see [announcement](https://groups.google.com/forum/#!topic/foreman-users/h1ZCKsA9Q0o)
 - [foreman_remote_execution](https://github.com/theforeman/foreman_remote_execution) updated to 0.3.0
 - [foreman-openscap](https://github.com/theforeman/foreman_openscap) updated to 0.5.3
 - [foreman_chef](https://github.com/theforeman/foreman_chef) had four new releases recently (0.2.1, 0.2.2, 0.3.0, 0.3.1)
 - [foreman_salt](https://github.com/theforeman/foreman_salt) updated to 5.0.0
 - [hammer-cli](https://github.com/theforeman/hammer-cli) updated to 0.6.0, see [release notes](https://github.com/theforeman/hammer-cli/blob/master/doc/release_notes.md#060-2016-02-25)
 - [hammer-cli-foreman](https://github.com/theforeman/hammer-cli-foreman) updated to 0.6.0, see [release notes](https://github.com/theforeman/hammer-cli-foreman/blob/master/doc/release_notes.md)
 - [apipie-bindings](https://github.com/Apipie/apipie-bindings) updated to 0.0.16, see [release notes](https://github.com/Apipie/apipie-bindings/releases/tag/0.0.16)
 - [hammer-cli-foreman-tasks](https://github.com/theforeman/hammer-cli-foreman-tasks) updated to 0.0.10
 - [hammer_cli_foreman_remote_execution](https://github.com/theforeman/hammer_cli_foreman_remote_execution) updated to 0.0.5
 - [hammer-cli-foreman-salt](https://github.com/theforeman/hammer_cli_foreman_salt) updated to 0.0.5

### New media and blogs

There were three Community demos since the last newsletter.

[Community demo](https://www.youtube.com/watch?v=KuBW_-mUlpo) on 10th March 2016 with following highlights:

 - [Community updates (gwmngilfen)](https://youtu.be/KuBW_-mUlpo)
 - [New features in Discovery 5.0 (lzap)](https://youtu.be/KuBW_-mUlpo?t=11m2s)
 - [New features in Discovery Image 3.1 (lzap)](https://youtu.be/KuBW_-mUlpo?t=22m35s)
 - [Capsule content CLI (tstrachota)](https://youtu.be/KuBW_-mUlpo?t=27m1s)
 - [Compute profile attributes in CLI (tstrachota)](https://youtu.be/KuBW_-mUlpo?t=30m50s)
 - [Host unification updates (jsherrill)](https://youtu.be/KuBW_-mUlpo?t=36m30s)
 - [Foreman 1.11 RC1 highlights](https://youtu.be/KuBW_-mUlpo?t=42m25s)

[Community demo](https://www.youtube.com/watch?v=WfvKAFIPyJg) - 18th February 2016 with following highlights:

 - [Community updates (gwmngilfen)](https://youtu.be/WfvKAFIPyJg?t=0)
 - [Lazy sync (daviddavis)](https://youtu.be/WfvKAFIPyJg?t=250)
 - [Rex: Adv. Job Control (aruzicka)](https://youtu.be/WfvKAFIPyJg?t=675)
 - [Rex: Dev API (inecas)](https://youtu.be/WfvKAFIPyJg?t=955)
 - [Client Side Pagination (shimstein)](https://youtu.be/WfvKAFIPyJg?t=1680)
 - [Atomic Provisioning (dlobatog)](https://youtu.be/WfvKAFIPyJg?t=1860)
 - [Ansible Inventory (dlobatog)](https://youtu.be/WfvKAFIPyJg?t=2160)

[Community demo](https://www.youtube.com/watch?v=AsY3U6qRInk) - 21st January 2016 with following highlights:

 - [Community updates (gwmngilfen)](https://youtu.be/AsY3U6qRInk?t=15)
 - [Nested parameters (orabin)](https://youtu.be/AsY3U6qRInk?t=175)
 - [Remote execution templates (inecas)](https://youtu.be/AsY3U6qRInk?t=298)
 - [Remote execution usability (mhulan)](https://youtu.be/AsY3U6qRInk?t=630)
 - [Tests & Patternfly (dlobatog)](https://youtu.be/AsY3U6qRInk?t=1008)
 - [Proxy Status page (tbrisker)](https://youtu.be/AsY3U6qRInk?t=1360)
 - [Proxy Logs UI (lzap)](https://youtu.be/AsY3U6qRInk?t=1778)
 - [Proxy Pulp Disk Usage (oprazak)](https://youtu.be/AsY3U6qRInk?t=2222)
 - [Proxy Pulp Sync Status (tstrachota)](https://youtu.be/AsY3U6qRInk?t=2352)
 - [Installer Scenario Migrations (mbacovsk)](https://youtu.be/AsY3U6qRInk?t=2660)
 - [Host Facets API (jsherrill)](https://youtu.be/AsY3U6qRInk?t=2950)

In February we ran the Foreman Community Survey to get feedback on how we're doing and what needs to be addressed. Dive into the [analysis](http://theforeman.org/2016/03/2016-forman-survey-analysis.html) Greg prepared.

### Reports from past events

February was rich in conferences and Greg brought us nice reports from some of them. Thanks, Greg!

 - [FOSDEM](https://groups.google.com/forum/#!topic/foreman-users/AbbzdHBixzk)
 - [CfgMgmtCamp 2016](https://groups.google.com/forum/#!topic/foreman-users/P4pTrrpO7CI)
 - [DevConf 2016, Brno](https://groups.google.com/forum/#!topic/foreman-users/VC4Qd3oD9Zk)
 - [1st Foreman Construction Day](https://groups.google.com/forum/#!topic/foreman-users/imwzvCGz0vM)  
