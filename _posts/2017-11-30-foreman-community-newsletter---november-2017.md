---
layout: post
title: Foreman Community Newsletter - November 2017
date: 2017-11-30 12:59:00
author: Ori Rabin
tags:
- foreman
- newsletter
- community
excerpt: |
  Migrating from mailing lists, Foreman 1.16, Katello 3.5 RC, and the usual round-up
---

Important news for mailing list users! Also releases, demos, and all
that goodness!

### Migrating from Google Groups

Last month Greg made a proposal to migrate away from the Google Groups
mailing list to a dedicated Foreman community forum. You can read more
about his reasoning [here][discourse_users], or watch the
[AMA](https://www.youtube.com/watch?v=IdV6US_d4-U).

The debate is not closed yet, so please do join in, either on the list
thread above, or on the [migration poll][migration_poll] if you have views
on this. At this time, the likely outcome is that we *will* move to
Discourse in the near future, so watch out for more announcements about
that in the coming weeks.

### Foreman 1.16 released

Foreman 1.16 was released today! This version took longer than usual
but it was worth the wait. There are a lot of improvements including
adding puppet 5 support, VMware changes, role locking for plugin and more.
Go check out the full list on the [announce list][1_16]. As always bugs
can be reported on [issue tracker][issues] and we appreciate getting reports
and of course fixes!

### Katello 3.5 RC2

Katello 3.5 released RC2 on Nov 9th, see the [post][k_3_5_rc2] for details.
The final version will be released very soon so watch out for announcements!
As always, we'd love your feedback, so do report
any issues you find to the [Katello bug tracker][k_issues]!

### Community lead

Greg, our community lead, will be taking time off for the next 5 months.
He's still around on irc and the mailing lists but not as active as usual.
Until the beginning of May please feel free to contact Ori Rabin,
orabin on irc.

### New Sponsors

Fastly, our new sponsor has provided us with a new CDN for the website.

Also, new jenkins slaves from NETWAYS, thanks for that!

### Upcoming Events

* Community Demo - 7th December  (https://www.youtube.com/watch?v=g8XnAKfG9xY)

Time again for the latest round-up of action from the community, covering core,
proxies, plugins, and more.  As always, you're welcome to participate in the
show, either via YouTube Live chat, or via our IRC channel
(libera.chat/#theforeman).

* UX review - breadcrumbs and item switcher - 5th December (https://www.youtube.com/watch?v=4fX_kjPlzVw)
The change to vertical navigation made two-pane a little less comfortable because
the space to edit became smaller. Additionally, some users reported confusion
around navigation context as well as inconsistencies in regards to two-pane navigation. 
This review will focus on the addition of breadcrumbs that would improve navigation
compared to two pane. We'd be glad to get feedback on this proposed change.

#### Community Demos / Deep Dives

* [Community Demo - 16th Nov](https://www.youtube.com/watch?v=QHzNIFjMpTM)

We had a busy demo with changes all around - the installer, smart proxies, UI.
This included two introduction to new proposals - [Foreman telemetry proposal]
and Discourse.

* [Discourse - ask me anything](https://www.youtube.com/watch?v=IdV6US_d4-U)

On this video, our community lead, Greg, hosted an Ask Me Anything about Discourse,
why we need it, what the feature set is, how to get started with it, and of course
a full discussion of concerns.

_(All Foreman events are now available via the [Foreman Calendar](/events))_

### Plugin news

#### Updated plugins:

- [dynflow](https://github.com/Dynflow/dynflow) updated to 0.8.32
- [smart_proxy_discovery_image](https://github.com/theforeman/smart_proxy_discovery_image) updated to 1.0.9

### Acknowledgements

Thanks to everyone who contributes to the Foreman community - patches, plugins,
testing, bug reports, translations, interviews, presentations, meetups and
everything else. Your efforts are very much appreciated!

[issues]: http://projects.theforeman.org/issues
[k_issues]: http://projects.theforeman.org/projects/katello/issues

[k_3_5_rc2]: https://groups.google.com/forum/#!topic/foreman-users/Uv4GUKrUTKshttps://groups.google.com/forum/#!topic/foreman-announce/RW3n6y9klR8
[1_16]: https://groups.google.com/forum/#!topic/foreman-announce/RW3n6y9klR8
[Foreman telemetry proposal]: https://www.youtube.com/watch?v=gCLSI9-4QpE&feature=youtu.be
[discourse_users]: https://groups.google.com/d/topic/foreman-users/XXSETIlScX4/discussion
[migration_poll]: https://community.theforeman.org/t/poll-which-lists-should-migrate-to-discourse/7598
