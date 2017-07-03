---
layout: post
title: Foreman Community Newsletter - June 2017
date: 2017-06-30 11:50:34
author: Greg Sutcliffe
tags:
- foreman
- newsletter
- community
excerpt: |
  It's our birthday, and we'll release new versions if we want to!
---

After a brief hiatus in May (sorry about that!) it's time to catch up with the
last 2 months of community news!

### Foreman 1.15 released

You probably already know this .... but Foreman 1.15 was released on [May
15th][1_15_0], and 1.15.1 came a month later on [June 16th][1_15_1]. This
release brings features like an entirely new notification system, SSH key
management for users, and much more. We especially want more feedback on the
notification system, as that's a very new thing we've added - what else should
(or shouldn't) it do? 

As always, many thanks to all the people that contributed to the release
candidate testing leading up to the 1.15.0 release - we couldn't do this
without you! If you find any issues with Foreman, you can always log them [here][issues].

### Katello 3.4 released

Accompanying the 1.15 release, Katello 3.4 is [now out][k_3_4], and there have
been two patches as well - you can pick up the [3.4.2 release here][k_3_4_2].
This release brings a whole ton of stability improvements and bug fixes - see
the [changelog][k_changelog] for details.

Thanks as always to the Katello testers for their help with these releases,
your efforts are much appreciated. Further issues with Katello can be logged [here][k_issues]

### It's our birthday!

Another year passes, and July rolls around again. Foreman will be 8 years old
this year! That's actually pretty terrifying from my point of view... but also
pretty cool! Like last year, we're organising some birthday events to
celebrate! So far there are 3 confirmed events:

* A Foreman talk at the Raleigh Puppet User Group, 10th July (Zach Huntington Meath)
* Foreman talks at the Belgium Puppet Users group, 18th July (Fabian Arrotin and 1 speaker TBC)
* A half-day conference at NETWAYS, Nuremberg, 27th July (Ewould Kohl van Wijngaarden, Michael Moll, Evgeni Golov, and Timo Goebel)

You can find all the events, and links to register, on our [events
page](/events). We're also trying to set up a few more - if you can help, [get
in touch!][email].

#### Upcoming Events

* [Deep Dive - PXE booting in a pure IPv6 environment (with Dmitri Dolguikh)](https://www.youtube.com/watch?v=6KJne_Hyv5k) - 2pm Thu 6th July

Dmitri Dolguikh (better known as 'witlessb' on IRC) has been deep in the guts
of IPv6 provisioning with Foreman for some time now, and he'd like to share the
results of his efforts.

* [Deep Dive - Running the Foreman Stack in Containers (with Eric Helms)](https://www.youtube.com/watch?v=mPjUvNAYp1c) - 2pm Mon 10th July

Running Foreman in a container is a question that comes up from time to time in
the Foreman community. Eric Helms has been experimenting with running the whole
Foreman stack (core, proxies, plugins) inside Kubernetes, and wants to show you
how it looks.

#### Community Demos / Deep Dives

* [Community Demo - 11th May](https://www.youtube.com/watch?v=Yj4LytgUUc4)

In this demo we had a round up of the happenings at Red Hat Summit, a lot of
Hammer content, and some other small updates.

* [Community Demo - 22nd June](https://www.youtube.com/watch?v=uUFsHWF292M)

This was a packed demo, featuring two(!) brand new plugins, new developer
tooling, core and Katello updates, and more!

* [Deep Dive - Foreman Performance Analysis with Shimon Stein](https://www.youtube.com/watch?v=bFQvj8CyvXI)

In this Deep Dive, Shimon took us through the basics of doing performance
analysis on your Foreman instance, including installation of the tooling,
request breakdowns, debugging API and UI requests, time graphs and more.

* [Deep Dive - Vertical Navigation Proposal with Rox & Serena](https://www.youtube.com/watch?v=hQwJ11GYfjY)

Our resident designer Rox and UX strategist Serena took us through why
horizontal navigations are going out of fashion, how changing to a vertical navigation
helped in other projects, and how it *might* look if we did this in Foreman.
After that, we had a panel discussion about the UI, what other options might be
on the table, and how we can move forward on this.

_(All Foreman events are now available via the [Foreman Calendar](/events))_

### Updated plugins

Updated plugins:

- [foreman_cockpit](https://github.com/theforeman/foreman_cockpit) updated to 2.0.3
- [foreman_docker](https://github.com/theforeman/foreman-docker) updated to 3.2.1
- [foreman_discovery](https://github.com/theforeman/foreman_discovery) updated to 9.1.1
- [foreman_hooks](https://github.com/theforeman/foreman_hooks) updated to 0.3.14
- [foreman_openscap](https://github.com/theforeman/foreman_openscap) updated to 0.8.0
- [foreman_remote_execution](https://github.com/theforeman/foreman_remote_execution) updated to 1.3.1
- [foreman_templates](https://github.com/theforeman/foreman_templates) updated to 5.0.1
- [foreman_xen](https://github.com/theforeman/foreman_xen) updated to 0.5.2
- [hammer_cli_foreman](https://github.com/theforeman/hammer-cli-foreman) updated to 0.10.2
- [hammer_cli](https://github.com/theforeman/hammer-cli) updated to 0.10.2
- [kafo](https://github.com/theforeman/kafo) updated to 2.0.2

### Acknowledgements

Thanks to everyone who contributes to the Foreman community - patches, plugins,
testing, bug reports, translations, interviews, presentations, meetups and
everything else. Your efforts are very much appreciated!

[1_15_0]: https://groups.google.com/d/topic/foreman-users/7V57m010h34/discussion
[1_15_1]: https://groups.google.com/d/topic/foreman-users/_ctf-pe5MKo/discussion
[k_3_4]: https://groups.google.com/d/topic/foreman-users/s7x94K67LUs/discussion
[k_3_4_2]: https://groups.google.com/d/topic/foreman-users/Fvycvei3cSA/discussion
[k_changelog]: https://github.com/Katello/katello/blob/KATELLO-3.4/CHANGELOG.md
[issues]: http://projects.theforeman.org/issues
[k_issues]: http://projects.theforeman.org/projects/katello/issues
[email]: mailto:greg.sutcliffe@gmail.com
