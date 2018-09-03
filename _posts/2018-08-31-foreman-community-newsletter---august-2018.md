---
layout: post
title: Foreman Community Newsletter - August 2018
date: 2018-08-31 15:17
author:
  name: Greg Sutcliffe
  uri: gwmngilfen
tags:
- foreman
- newsletter
- community
excerpt: |
  New releases! Oh, so many releases....
---

### Releases for everyone!

We've had a lot of releases this month, so I'll group them all together. We've released:

* [Foreman 1.19.0][1_19_0] was released on the very last day of August,
  featuring support for Ubuntu Bionic, syslog logging, reporting failed builds,
  and more ### Foreman 1.18.0 released
* [1.17.3 and 1.17.4][1_17_4] bug fix releases. If you are still on 1.17, be
  sure to upgrade to 1.17.4 before upgrading to 1.18!
* [Katello 3.8 RC 2 & 3][k_3_8] - do give the RC a try and let us know how you find it :)

With the release of 1.19.0, this marks 1.17.X as now unmaintained - 1.17.4 will
be the last release in the 1.17 series. Please do upgrade as soon as you can.

As ever, many thanks to the contributors to these releases - coders, RC testers,
documentation writers, and bug/feature reporters. Foreman wouldn't be what it
is without you! If you do find issues with, please do [report them!][issues]

Big thanks also to Ondrej, Ewoud, and Tomer for their effort in bringing these
releases out at this rate, there's been a *lot* of work behind the scenes.

### New RFCs for container work

In the [survey
analysis](https://www.theforeman.org/2018/06/2018-foreman-survey-analysis.html)
I posted earlier this year, I called attention to the idea of supporting
Foreman being run in a container, and that more would come on this later. That
time is now :)

Eric has spent a lot of time working through the implications of this, and has
now posted a set of RFCs to the Development board for review. There's a *lot*
to read here, so it's broken down into multiple posts. You can get the
top-level over on [this forum
post](https://community.theforeman.org/t/containerizing-the-foreman-ecosystem/10948)
and then dive into details from there.

I'd recommend for *anyone* with an interest in the future direction of Foreman
to read over these, and give their thoughts on any part of it which interests
you. Thanks!

### Foreman at FrOSCon

Thanks to the awesome work of Matthias, Bernhard, and the rest of the ATIX
team, Foreman had a community presence at FrOSCon in Bonn this year. Whilst I
didn't get to go myself, I heard that it was a great event, lots of traffic to
the booth, and good discussions with other collaborators.

You can read all about it on [the ATIX blog
post](https://www.atix.de/atix-froscon13/#English)! Thanks as always to you all
for your support!

### Redmine upgrade (continued)

Whilst the Redmine *upgrade* was completed last month, Ewoud and I have
continued to improve it. This month we cleaned up the project hierarchy, moving
plugins to their own top-level project, and keeping just "core" projects
grouped under Foreman. The main reason for this is so that we can re-enable
Version sharing without cluttering the bug tracker.

A consequence of this affect the *roles* that users have on each project. If
you had Developer or Manager roles on a project, then you should refer to [this
post](https://community.theforeman.org/t/action-needed-redmine-permissions-cleanup/10826)
for instructions on what to check.

### [Upcoming Events](https://community.theforeman.org/c/events/l/calendar)

The Foreman Community has now fully embraced Discourse as the source of its
event data - if you've been using the old `/events/all.ics` in your own
calendar, you'll need to head over to [the forum
calendar](https://community.theforeman.org/calendar) and hit the Subscribe
button (which will give you an ICS link). You can also use the Add To Calendar
button on specific events if you don't wish to import the whole thing.

Future community demos will now be created much further in advance, so you
should be able to keep up with upcoming demos there.

* [Community Demo #50](https://community.theforeman.org/t/foreman-community-demo-50/10227)

All the usual goodness from the community, rounded up and presented for your viewing pleasure.

#### [Past Events](https://community.theforeman.org/c/events/l/latest)

* [Community Demo #48](https://community.theforeman.org/t/foreman-community-demo-48/9826)

A short demo, with Docker, dev changes, an analysis of the impact Discourse has
had, and some chat about how to improve our docs.

* [Community Demo #49](https://community.theforeman.org/t/foreman-community-demo-49/10109)

A busy and Katello-centric demo containing lots of new content changes. Also
seeding and Bash completion in Hammer!

### Plugin news

Updated plugins:
- [foreman_ansible](https://github.com/theforeman/foreman_ansible) updated to 2.2.6
- [foreman_discovery](https://github.com/theforeman/foreman_discovery) updated to 13.0.1
- [foreman_host_extra_validator](https://github.com/theforeman/foreman_host_extra_validator) updated to 0.1.0
- [foreman_remote_execution](https://github.com/theforeman/foreman_remote_execution) updated to 1.6.1
- [foreman_scc_manager](https://github.com/ATIX-AG/foreman_scc_manager)to 1.4.0
- [foreman_tasks](https://github.com/theforeman/foreman_tasks) updated to 0.14.0
- [hammer_cli_foreman](https://github.com/theforeman/hammer_cli_foreman) updated to 0.14.0
- [hammer_cli](https://github.com/theforeman/hammer_cli) updated to 0.14.0
- [katello_host_tools](https://github.com/Katello/katello-host-tools) updated to 3.3.5
- [smart_proxy_omaha](https://github.com/theforeman/smart_proxy_omaha) updated to 0.0.5

### Acknowledgements

Thanks to everyone who contributes to the Foreman community - patches, plugins,
testing, bug reports, translations, interviews, presentations, meetups and
everything else. Your efforts are very much appreciated!

[1_19_0]: https://community.theforeman.org/t/foreman-1-19-0-has-been-released/10945
[1_17_4]: https://community.theforeman.org/t/foreman-1-17-4-has-been-released/10939
[k_3_8]:  https://community.theforeman.org/t/katello-3-8-rc3-available-for-testing/10874/2
