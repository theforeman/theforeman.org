---
layout: post
title: Foreman Community Newsletter - October 2017
date: 2017-10-31 23:59:00
author: Greg Sutcliffe
tags:
- foreman
- newsletter
- community
excerpt: |
  Foreman 1.16 RC2, Katello 3.5 RC, survey results, new chat options, and the usual round-up
---

So this is a little late, but it's worth the wait, promise!

### Foreman 1.16 RC2 is out

Foreman 1.16 RC2 is finally out! Thanks for your patience with this, the
release hit so many errors on it's path to release, it's a wonder we didn't set
the whole data centre on fire or something... Still, here it is, with over 40
bug fixes since last release. As a reminder, the headline features in 1.16:

Changes in this release include:
- Netgroups support for LDAP
- VMWare SCSI controllers with per-disk configuration
- Puppet 5 support
- Many UI changes such as Patternfly pagination
- An interface to Webpack for plugins

Full details about the RC2 release can be found [here][1_16_rc2].

As ever, we'll be glad to get comments and issues reported to [issue
tracker][issues] to make the release of 1.16 faster and better. We anticipate
that there *may* be one more RC before 1.16 is out, so look out for  that too.

### Foreman 1.15.6 released

After 1.15.5 was skipped due to tagging issues, 1.15.6 is next and (likely)
final release in the 1.15 series. Released Oct 11th, it covers 19 issues that were
fixed and all the details appear on the [announce list][1_15_6]. As always bugs
can be reported on [issue tracker][issues] and we appreciate getting reports
and of course fixes!

### Katello 3.5 RC1

Release Oct 19th, the first RC for Katello 35 is now out, see the
[post][k_3_5_rc1] for details. As always, we'd love your feedback, so do report
any issues you find to the [Katello bug tracker][k_issues]!

### Foreman on Matrix.org

If IRC is a little too "plain" for you, or you just want a persistent
connection so you don't miss replies, you can now join the Foreman chat
channels from Matrix.org. The same two rooms exist there
(#theforeman:matrix.org and #theforeman-dev:matrix.org) and they are bridged to
libera.chat, so you can freely use IRC or Matrix to chat with us. I've personally
moved over to Matrix, and I'm loving it.

Either way, hope to see you in one of the channels sometime soon!

### Vertical Navigation Survey

Thanks to all who replied to the vertical navigation survey last month. There
was a lot of great feedback, much of which has already been incorporated. In
the end, 100% of the 30+ responses were a "Yes" vote, so I'm happy to say that
the vertical navigation is merged to develop, and will be the new UI from 1.17
onwards!

For those who haven't seen it yet, you can see screenshots on the (now-merged)
[pr](https://github.com/theforeman/foreman/pull/4794). Big thanks to Amir who
did the coding and Rox who worked on the design!

### New Sponsors?

You may have seen the [furore][rackspace_twitter] caused by Rackspace a few
weeks ago, and the subsequent [retraction][rackspace_back]. We do rely heavily
on Rackspace at the moment, so you can imagine this rattled us. The second
message means there's no immediate panic, but if you want to help us spread our
load, then [get_in_touch][email]!

### Upcoming Events

* Community Demo - 16th November  (URL to be announced)

Time again for the latest round-up of action from the community, covering core,
proxies, plugins, and more.  As always, you're welcome to participate in the
show, either via YouTube Live chat, or via our IRC channel
(libera.chat/#theforeman).

#### Community Demos / Deep Dives

* [Community Demo - 5th Oct](https://www.youtube.com/watch?v=Oty8LWnilr8)

With most of the team away on vacations and so forth, we took a look at some
small updates before having a round table discussion on a few topics such as
containers for Foreman, hooking into the Notifications framework, revamping the
website, and so on.

* [Community Demo - 26th Oct](https://www.youtube.com/watch?v=VpdRVZvx0jo)

On this demo we covered the awesome new Deb support added to Katello by the
guys at Atix, and some UI updates, and took a look at some of the
infrastructure challenges we're facing at the moment.

_(All Foreman events are now available via the [Foreman Calendar](/events))_

### Plugin news

#### Updated plugins:

- [foreman_ansible](https://github.com/theforeman/foreman_ansible) updated to 1.4.6
- [foreman_discovery](https://github.com/theforeman/foreman_discovery) updated to 10.0.0
- [foreman_maintain](https://github.com/theforeman/foreman_maintain) updated to 0.0.11
- [foreman_monitoring](https://github.com/theforeman/foreman_monitoring) updated to 0.1.1
- [foreman_openscap](https://github.com/theforeman/foreman_openscap) updated to 0.8.3
- [foreman_tasks](https://github.com/theforeman/foreman_tasks) updated to 0.10.4
- [hammer_cli_foreman_tasks](https://github.com/theforeman/hammer_cli_foreman_tasks) updated to 0.0.12
- [smart_proxy_monitoring](https://github.com/theforeman/smart_proxy_monitoring) updated to 0.1.1
- [smart_proxy_openscap](https://github.com/openscap/smart_proxy_openscap) updated to 0.6.8
- [smart_proxy_omaha](https://github.com/theforeman/smart_proxy_omaha) updated to 0.0.3

### Acknowledgements

Thanks to everyone who contributes to the Foreman community - patches, plugins,
testing, bug reports, translations, interviews, presentations, meetups and
everything else. Your efforts are very much appreciated!

[issues]: http://projects.theforeman.org/issues
[k_issues]: http://projects.theforeman.org/projects/katello/issues

[1_16_rc2]: https://groups.google.com/d/msg/foreman-announce/cI0SUU5Ypec/MUPVWRQkBgAJ
[1_15_6]: https://groups.google.com/d/msg/foreman-announce/YyiBA_swqys/Mrjo_62FAwAJ
[k_3_5_rc1]: https://groups.google.com/d/msg/foreman-users/Caf8BhRcb0Y/lJU-HoaTAgAJ

[rackspace_twitter]: https://twitter.com/ericholscher/status/920396452307668992
[rackspace_back]: https://twitter.com/ericholscher/status/921109823671869440

[email]: mailto:greg.sutcliffe@gmail.com
