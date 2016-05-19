---
layout: post
title: Foreman Community Newsletter - May 2016
date: 2016-05-17
author: Greg Sutcliffe
tags:
- foreman
- newsletter
excerpt: |
  No core releases this month, but there's still plenty going on in the Foreman
  Community! New plugins, updated plugins, new videos to watch, release
  candidates to try, and more. STOP PRESS - 1.11.2 released today!
---

It's been a busy month (or so) since the last newsletter. Here's a round up of
what's new....

## 1.11.2 released

The latest stable release of Foreman has been updated to 1.11.2 with a heap of
bug fixes and a security fix too. More details on the [mailing list][mlist] and
in the [release notes][rnotes]. Thanks to all who contributed bug reports and
patches!

[mlist]: https://groups.google.com/forum/#!topic/foreman-announce/FvLT5JEwcOk
[rnotes]: http://theforeman.org/manuals/1.11/index.html#Releasenotesfor1.11.2

## Foreman RFC system

We've formalised our method for proposing large-scale changes to Foreman, and
we've chosen to do this using a separate Github repo. Proposing RFCs as PRs
gives us the complete history of the PR, including all the comments that were
made as the RFC evolved from first proposal to eventual acceptance (or not).
For more of the thinking behind implementing this, see the mailing list
[discussion][discussion].

If the general direction of larger parts of Foreman is of interest to you, if
you have an RFC of your own, or you just want to read up on the process itself,
head over to the [rfc repo][rfcs].

We'll be reviewing how well this works for us in a few months, but already we
have a few RFCs which are gathering comments.

[discussion]: https://groups.google.com/d/topic/foreman-dev/P9uRYV5K1Dc/discussion
[rfcs]: https://github.com/theforeman/rfcs

### Foreman Events Page

The Foreman website now has it's own calendar! You can head to
[http://theforeman/events][/events] to see all the upcoming things happening in
& around Foreman. This page also has an ICS link which you can add to your own
calendar system to automatically keep up-to-date with new events.

The events system is powered by a simple YAML file in our [Github
repo][events-yaml] so if you're attending or organising a Foreman event, or
speaking about Foreman somewhere, do send us a patch to add your event!

[events-yaml]: https://github.com/theforeman/theforeman.org/blob/gh-pages/_data/events.yml

### NETWAYS Foreman Training Course donated

The lovely folks at NETWAYS have decided to release their Foreman training
course to the Foreman community! You can find more details on how it happened
[here][foremanblog] and [here][netwaysblog], and the actual training course
[here][trainingcourse]. Thanks NETWAYS!

[foremanblog]: http://theforeman.org/2016/05/new-foreman-training-course.html
[netwaysblog]: https://blog.netways.de/2016/04/29/foreman-training-release
[trainingcourse]: http://netways.github.io/foreman-training/

### Katello 3.0 RC4

The Katello 3.0 release train is rolling on, and we're now up to RC4, with RC5
likely before the final release. As ever, if you have spare time to road-test
our release candidates, then the increased quality of the release is hugely
appreciated by the whole community. You can find out more at the
[RC4 release thread][katello-rc4]. Thanks for your help!

[katello-rc4]: https://groups.google.com/d/topic/foreman-users/AYOBldNctN8/discussion

### New media and blogs

#### [Community demo](https://youtu.be/-bCIcN5i-24) on 28th April 2016

We held another community demo this month, in which we covered the usual
community banter from me, some Remote Execution and Libvirt updates from
Stephen and Lukas, and a lengthy chat with Dirk from NETWAYS regarding the new
Foreman Community training course.

#### [Case Study on Discovery and Custom UIs with MyHeritage](https://youtu.be/bBZzoLM7fDM)

Another Case Study happened this month, and this time we chatted with Imri and
Elad from MyHeritage about the additions they've contributed to Foreman
Discovery, how they modified the UI to make a simple developer portal for
launching VMs, and more. Thanks guys!

#### [Deep Dive on Recent Smart Proxy updates](https://www.youtu.be/Bwv8nU_-L5c)

In another of our dives into the inner workings of Foreman, Dmitri Dolguikh
(witlessb) gave us a look at recent changes to the smart-proxy core, using the
changes to the puppet_proxy module needed for Puppet 4 support as an illustration.

#### [Automating an R&D lab - Julien Pivotto, OSDC](https://www.youtu.be/csxeyyzZPvo)

Julien gave a great talk about how to use Foreman for automating an entire lab
at OSDC - this is definitely worth watching. Thanks Julien!

#### [Satellite 6.2 Beta released](https://access.redhat.com/blogs/1169563/posts/2280311)

For those following the downstream releases as well as upstream ones, Satellite
6.2 Beta is now available for download.

### Upcoming events

#### [Community Demo](http://theforeman.org/events/#foreman-community-demo-19th-may) on 19th May 2016

The next Foreman Community Demo will be on Thursday. As ever, you can watch
live and partcipate via the Q&A app or via IRC, or you can catch up later on
YouTube and ask questions in the mailing list thread.

#### [NETWAYS Foreman Webinar (German)](http://theforeman.org/events/#webinar-foreman-classes-and-parametrization-in-puppet-german) on 20th May

NETWAYS are presenting a 1 hour webinar on Foreman and Puppet basics, in German, on Fri 20th May.

_(All Foreman events are now available via the [Foreman Calendar](/events))_

### New plugins
- [foreman-slack](https://github.com/shlomizadok/foreman_slack) - New plugin for announcing host builds to a Slack channel, see the [release thread](https://groups.google.com/d/topic/foreman-users/Q5pVR6w17B8/discussion) for details.
- [smart_proxy_dhcp_infoblox](https://github.com/sjoeboo/smart_proxy_dhcp_infoblox) release to accompany the DNS Infoblox plugin from last month.

### Updated plugins
- [foreman_bootdisk](https://github.com/theforeman/foreman_bootdisk) updated to 8.0.0
- [foreman-digitalocean](https://github.com/theforeman/foreman-digitalocean) updated to 1.0.0
- [foreman_discovery image](https://groups.google.com/d/topic/foreman-users/ffuW5bwfGds/discussion) updated to 3.1
- [foreman-docker](https://github.com/theforeman/foreman-docker) updated to 2.1.1
- [foreman_hooks](https://github.com/theforeman/foreman_hooks) updated to 0.3.10
- [foreman_remote_execution](https://github.com/theforeman/foreman_remote_execution) updated to 0.3.2
- [foreman-tasks](https://github.com/theforeman/foreman-tasks) updated to 0.7.17
- [foreman_templates](https://github.com/theforeman/foreman_templates) updated to 2.1.0
- [hammer-cli-foreman-discovery](https://github.com/theforeman/hammer-cli-foreman-discovery) updated to 0.0.3
- [puppetdb_foreman](https://github.com/theforeman/puppetdb_foreman) updated to 1.0.3
- [smart_proxy_dns_powerdns](https://github.com/theforeman/smart_proxy_dns_powerdns) updated to 0.2.1
- [smart_proxy_dns_route53](https://github.com/theforeman/smart_proxy_dns_route53) updated to 2.0.0

### Acknowledgements

Thanks to everyone who contributes to the Foreman community - patches, plugins,
testing, bug reports, translations, interviews, presentations, and everything
else. Your efforts are very much appreciated!
