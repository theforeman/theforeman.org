---
layout: post
title: Foreman Community Newsletter - October 2018
date: 2018-10-31 14:10:15
author:
  name: Greg Sutcliffe
  uri: gwmngilfen
tags:
- foreman
- newsletter
- community
excerpt: |
  Conferences! Calls for papers! 1.20 RC1 & 2! So much to catch up on...
---

### Releases

Work on 1.20 has been rolling on throughout the last couple of months, and it's
time once again to ask you all to do some testing with us! 1.20 RC1 was
released [a week ago][1_20_rc1] and RC2 is out [today][1_20_RC2]! This brings a
new reporting template engine, many UI improvements, under-the-hood upgrades
such as moving to Rails 5.2, and even FIPS compliance.

As ever, we'd love you help in checking that the next release of Foreman is in
the best condition it possibly can be, so if you have a little free time,
please do spin up RC2 and let us know your experiences. Both sandbox tests and
production upgrades would be really useful feedback. If you find issues, please
do [report them][issues] or [discuss on the forum][forum]

Alongside the Foreman RC, the Katello team have also released the [first
RC][k_3_9_rc1] for the accompanying upgrade to Katello. We need just as much
help testing Katello as Foreman itself, so if you're a user ... well, you know
the drill :)

Many thanks to the contributors to these releases - coders, RC testers,
documentation writers, and bug/feature reporters. Foreman wouldn't be what it
is without you!

### Calls for presentations

Our yearly conference season approaches! As ever, we're planning to have a
presence at FOSDEM, Config Management Camp, and DevConf.cz. If you'd like to
present about Foreman, we'd love to support you! Sadly the CFP for DevConf has
already clsoed, but you can find links to the other two CFPs (and the DevConf
website) below:

* [FOSDEM](https://lists.fosdem.org/pipermail/fosdem/2018q4/002744.html) - closes 20th Nov
* [CfgMgmtCamp](https://cfp.cfgmgmtcamp.be) - closes 1st Dec
* [DevConf.cz](https://devconf.info/cz) - website only

See you there!

### [RFCs for comment](https://community.theforeman.org/c/development/rfcs)

As usual, I like to call out some RFCs for wider attention. Here's this month's selection:

* [Handling Plugins in Containers](https://community.theforeman.org/t/containers-plugins/10952)
* [Replacing Foreman-Hooks with a core callback](https://community.theforeman.org/t/rfc-simple-callback-system-for-users/11242)
* [Run Foreman with Puma & Apache Proxy for production](ihttps://community.theforeman.org/t/rfc-run-foreman-with-puma-and-an-apache-proxy-in-production/11445/21)

### Conference reports 

#### OSAD / Foreman Technical day

While I didn't get to attend in person, I believe that the recent events hosted
by ATIX were very successful, and that good times were had by all. Covering
topics like Puppet 6 support, use of Puma as a Passenger replacement, plugin
tests, and more, it seems like it was very productive as well. My thanks to the
ATIX team (again!) for the support they give us.

You can read all the details on [their blog](https://www.atix.de/osad-techday-foreman-developer-day-at-atix/#English)

#### Open Source Summit Europe

Meanwhile, I was in Edinburgh for Open Source Summit, which was *huge*. I got
to speak to quite a few people about Foreman, and still more about community
work in general (especially on the subject of how popular Discourse has
become).

Sadly my talks were not recorded, but I might give them again as videos for our
YouTube channel :)

### [Upcoming Events](https://community.theforeman.org/c/events/l/calendar)

All Foreman events are available via [the forum
calendar](https://community.theforeman.org/calendar) - hit the Subscribe button
(which will give you an ICS link). You can also use the Add To Calendar button
on specific events if you don't wish to import the whole thing.

Future community demos will now be created much further in advance, so you
should be able to keep up with upcoming demos there.

* [libera.chat #live (2nd-3rd Nov, Bristol)](https://community.theforeman.org/t/freenode-live-conference/11537)

Rahul Bajaj will be presenting a talk on Foreman at libera.chat #live, so if
you're in the area, go support him!

* [Open Source Camp on Puppet (8th Nov, Nuremberg)](https://community.theforeman.org/t/open-source-camp-on-puppet/11191)

After the success of the Foreman & Graylog event earlier in the year, NETWAYS
are hosting one on Puppet next month. If you're able to go, get involved!

* [Community Demo #53](https://community.theforeman.org/t/foreman-community-demo-53/11252)

All the usual goodness from the community, rounded up and presented for your
viewing pleasure.

#### [Past Events](https://community.theforeman.org/c/events/l/latest)

* [Community Demo #52](https://community.theforeman.org/t/foreman-community-demo-52/11251)

A jam-packed demo with updates from all parts of the project - M2 SAN booting,
search improvements, UI changes, hammer updates, it's all here!

### Plugin news

Updated plugins:
- [foreman_bootdisk](https://github.com/theforeman/foreman_bootdisk) updated to 13.0.0
- [foreman_hooks](https://github.com/theforeman/foreman_hooks) updated to 0.3.15
- [foreman_m2](https://github.com/ianballou/foreman_m2) updated to 0.0.4
- [foreman_maintain](https://github.com/theforeman/foreman_maintain) updated to 0.2.12
- [foreman_openscap](https://github.com/theforeman/foreman_openscap) updated to 0.11.0
- [foreman_remote_execution](https://github.com/theforeman/foreman_remote_execution) updated to 1.6.4
- [foreman_snapshot_management](https://github.com/theforeman/foreman_snapshot_management) updated to 1.5.1
- [hammer_cli_foreman](https://github.com/theforeman/hammer_cli_foreman) updated to 0.15.0
- [hammer_cli_foreman_templates](https://github.com/theforeman/hammer_cli_foreman_templates) updated to 0.1.2
- [hammer_cli](https://github.com/theforeman/hammer_cli) updated to 0.15.0
- [smart_proxy_openscap](https://github.com/theforeman/smart_proxy_openscap) updated to 0.7.0

### Acknowledgements

Thanks to everyone who contributes to the Foreman community - patches, plugins,
testing, bug reports, translations, interviews, presentations, meetups and
everything else. Your efforts are very much appreciated!

[1_20_rc1]: https://community.theforeman.org/t/foreman-1-20-0-rc1-has-been-released/11589
[1_20_rc2]: https://community.theforeman.org/t/foreman-1-20-0-rc2-has-been-released/11668
[k_3_9_rc1]: https://community.theforeman.org/t/katello-3-9-0-rc1-is-ready-for-testing/11602
[issues]: https://projects.theforeman.org
[forum]: https://community.theforeman.org
