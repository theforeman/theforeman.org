---
layout: post
title: Foreman Community Newsletter - June 2016
date: 2016-06-21
author: Greg Sutcliffe
tags:
- foreman
- newsletter
excerpt: |
  Foreman 1.12 RC2 (with Puppet 4 support!), 1.11.3, Katello 3.0, more plugins,
  Red Hat Summit, birthday celebrations... so much to catch up on!
---

Welcome back to the Foreman Newsletter - we hope you've had a good month! It's
certainly been busy in the Foreman community, so let's get started...

### 1.12 RC1 and RC2 released

The next stable release of Foreman (1.12) has entered release candidate stage,
and we're already up to RC2! As ever, we greatly value your testing. This
release comes with the long-awaited Puppet 4 support, and packaging for the
latest Ubuntu 16.04 (Xenial) OS. These are both new elements, and your feedback
and bug reports (if any!) are welcome.

As ever, you can check out the details on the [mailing list post][mlist] and
in the [hedline features][notes]. Thanks to all who contributed bug reports and
patches!

[mlist]: https://groups.google.com/d/topic/foreman-users/NpLJGUqHMJc/discussion
[notes]: https://theforeman.org/manuals/1.12/#Headlinefeatures

### 1.11.3 bugfix released

The next release in the current stable release series (1.11.3) is out now, and
contains a fix for [CVE-2016-4451](/security.html#2016-4451), as well as many
other fixes. See [the announcement][mlist2] for more details.

[mlist2]: https://groups.google.com/d/topic/foreman-users/3tR68n5DShw/discussion

### Foreman's 7th Birthday - celebrations planned!

On July 13th, Foreman will be 7 years old! Since this coincides rather nicely
with the 1.12 release (and the Puppet 4 support) I'm currently organising a
series of events around our various geographical centres to mark the occasion.
So far, I have events planned (but not 100% confirmed) for East-coast US, UK,
Germany, and Israel. There'll be meetups, install days, talks and swag to be
had! Watch [Twitter](https://twitter.com/ForemanProject) or the
[events page](/events) to know whats confirmed!

If you want to be involved in organising this effort, please contact
[me](mailto:community@emeraldreverie.org) and I'll work something out with you
- thanks!

### Katello 3.0 (Saison) and 3.0.1 bugfix released

The latest version of the Katello plugin hit its milestone 3.0 release this
month, after an extended RC phase - thanks again to all who contributed to the
testing of the various RCs! The list of changes is large, so I'll just direct
you to the [release announcement][k30] for the details. Unfortunately, one bug
did creep though, so this was followed up with a swift [3.0.1 release][k301]
which deals with the issue. Please do keep reporting any further issues.

As the announcement states, this is a huge change to Katello, and upgrades
require some planning - users are encouraged to read through the steps and take
appropriate backups before upgrading. Do get in touch on IRC or the mailing
lists if you have any questions!

[k30]:  https://groups.google.com/d/topic/foreman-users/KlmzfqIcrRQ/discussion
[k301]: https://groups.google.com/d/topic/foreman-users/vcjo8CW6p9I/discussion

### SSL comes to theforeman.org (and yum. & deb. too)

Thanks to the hard work of the infra team, our website and packaging repos now
have LetsEncrypt SSL certificates in place. This has the main benefit of
allowing secure downloads of our packaging GPG keys for verification of the
packages themselves.

The quickstart guides have been [updated][gpg] to reflect the updated URL scheme.

[gpg]: https://theforeman.org/manuals/1.11/quickstart_guide.html#QuickstartGuide

### New media and blogs

#### [Community Demo](https://youtu.be/C_BebxMpW5c) on 19th May 2016

On this episode of the Foreman Community Demo, we cast a wide net to pull in
updates from [Pulp](http://pulpproject.org) (the project that handles content
for Katello), from Katello, from our CLI testers, and some Infoblox DNS/DHCP
providers for the Smart Proxy.  There's also a quick look at the 1.11.2
release, and a teaser for the upcoming Puppet 4 support!

#### [Community Demo](https://youtu.be/Z2xKULg5MCA) on 9th June 2016

On this episode of the Foreman Community Demo, we had a look at upcoming tools
for flexible data exports, a new admin plugin for Hammer, some email styling
help, new collections for Settings, and a new lock-in feature for Discovery.
Oh, and 1.12.0 RC1 :)

#### [Foreman Deep Dives: SQL Debugging for Beginners](https://www.youtu.be/kbslq-4EuyY)

Chris Duryee (beav on IRC) joined us for this Deep Dive, in which he gave us an
in-depth look into SQL debugging. If you've ever wanted to know why certain
pages are slow to load, this is one to watch!

#### [Case Study on Infoblox and Infra Integration with Matt Nicholson](https://youtu.be/p4-i4y4co0E)

For this case study, we talked with Matt Nicholson
([@sjoeboo](https://twitter.com/sjoeboo)), author of the
smart-proxy-{dhcp,dns}-infoblox plugins) about his use of Foreman at Harvard
University Medical School, how he went about implementing the
[Infoblox](http://www.infoblox.com) plugins, and wider thoughts on extending
Foreman in general.

#### [Satellite 6.2 Beta 2 released](https://access.redhat.com/blogs/1169563/posts/2377441)

For those following the downstream releases as well as upstream ones, Satellite
6.2 Beta 2 is now available for download.

### Upcoming events

#### [Foreman San Francisco Meetup](https://plus.google.com/b/102496134326414788199/events/cngcahgf6f460tnchip0bjb9rh4)

Tues 28th June - Local meetup for folks in the San Francisco area, along with
those visiting for DevNation or Red Hat Summit. Come along and have a chat with
other Foreman users and some of the devs!

#### [Community Demo](https://plus.google.com/events/cupjll3uo0h26aqk89pa4bga5p0) on 7th July 2016

The next Foreman Community Demo will be on Thursday 7th July. As ever, you can
watch live and participate via the Q&A app or via IRC, or you can catch up later
on YouTube and ask questions in the mailing list thread.

_(All Foreman events are now available via the [Foreman Calendar](/events))_

### New plugins
- [foreman_azure](https://github.com/theforeman/foreman_azure) - New plugin adding Azure as a Compute Resource - see the [release thread](https://groups.google.com/d/topic/foreman-users/M4Yn-so6lhs/discussion) for details.

### Updated plugins
- [foreman_bootdisk](https://github.com/theforeman/foreman_bootdisk) updated to 8.0.1
- [foreman_salt](https://github.com/theforeman/foreman_salt) updated to 5.0.1
- [foreman_setup](https://github.com/theforeman/foreman_setup) updated to 3.1.1
- [hammer-cli & foreman](https://github.com/theforeman/hammer-cli) updated to 0.7.0
- [foreman_expire_hosts](https://github.com/theforeman/foreman_expire_hosts) updated to 2.0.1
- [foreman_openscap & proxy](https://github.com/theforeman/foreman_openscap/commits/master) updated to 0.5.4

### Acknowledgements

Thanks to everyone who contributes to the Foreman community - patches, plugins,
testing, bug reports, translations, interviews, presentations, and everything
else. Your efforts are very much appreciated!
