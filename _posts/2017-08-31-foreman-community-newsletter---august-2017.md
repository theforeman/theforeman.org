---
layout: post
title: Foreman Community Newsletter - August 2017
date: 2017-08-30 12:29:15
author: Greg Sutcliffe
tags:
- foreman
- newsletter
- community
excerpt: |
  Foreman 1.16, Katello 3.4.5, plugin maintainer policy, and a bunch of new videos. Enjoy!
---

Another month, another newsletter. Time is a crazy thing :)

### Foreman 1.16 branched

After a longer-than-normal wait, the Foreman 1.16 branching has now happened,
and RCs will be forthcoming shortly. As always, we appreciate your help testing
these once they are available.

For those interested, Daniel has written up the details on while the RCs were
delayed in an excellent post to the dev list - you can read all about it
[here][1_16_reasons]

### Foreman 1.15.3 released

1.15.3 was released on Aug 10th, containing fixes for over 25 issues. That's a
ton of goodness, so you'll want to get upgrading! As always, the details are
available on the [announce list][1_15_3] and as always you can report any
future bugs on the [issue tracker][issues]. Thanks as always to the community
for finding, reporting, and fixing these issues!

### Katello 3.4.4 & 3.4.5 released

The Katello team released [3.4.4][k3_4_4] on Aug 2nd, and [3.4.5][k3_4_5] on
Aug 30th, containing a large number of bug fixes for both small UI issues, user
issues found while using 3.4.3 and developer found issues that was felt to
bring more stability to users. Please do [log][k_issues] any issues - as always
your contributions are valuable!

### New Plugin policy

We recently took some time to discuss our policy for "official" plugins - that
is, plugins which are hosted under the "theforeman" organisation on GitHub. You
can read the prior discussion [here][plugins_devlist] and the resulting policy
[here][plugins_website].

One main outcome of this discussion was to ask plugin authors to add a second
maintainer to the Rubygem, so that the community can help continue maintaining
the plugin should original authors move on. If your plugin has only one author,
please consider doing this yourself.

#### Upcoming Events

* Community Demo - 14th September  (URL to be announced)

Time again for the latest roundup of action from the community, covering core,
proxies, plugins, and more.  As always, you're welcome to participate in the
show, either via YouTube Live chat, or via our IRC channel
(libera.chat/#theforeman).

#### Community Demos / Deep Dives

* [Community Demo - 24th August](https://www.youtube.com/watch?v=aOqA8-wpPKQ)

In this demo we covered some minor changes on the code, and then spent a
significant amount of time on discussing proposals for a new template auditing
feature from Shim. Your thoughts on this are very welcome in the comments or on
the mailing list!

* [UX Demo - provisioning wizards - 30th August](https://www.youtube.com/watch?v=ZvcAbIuwXsQ)

After we went over through most pages of Foreman and its plugins, we would like
to concentrate on more complex changes that requires a design or a discussion
involving all interested parties. We'd like to incrementally discuss progress
from both current design and implementation perspective as well as generic
usability questions that pop up. This time we'll focus on various provisioning
flows, look at first draft and discuss further steps. Demos will be recorded
and streamed live so anyone from community can participate.

_(All Foreman events are now available via the [Foreman Calendar](/events))_

### New / Updated plugins

#### New plugins:

ATIX.de have released a new plugin aimed at managing snapshots of machines on
VMware vSphere. This was actually released in July, but the RPM packaging is
now done, so you can find it in our plugin repo. For more details, see the
[announcement][f_snapshot] on the dev mailing list.

In addition, the exisitng
[foreman_monitoring](https://github.com/theforeman/foreman_monitoring) plugin
has now been added to the DEB repos as well as the RPM repos - Debian users,
rejoice!

#### Updated plugins:

- [smart_proxy_dns_infoblox](https://github.com/theforeman/smart_proxy_dns_infoblox) updated to 0.0.6
- [smart_proxy_omaha](https://github.com/theforeman/smart_proxy_omaha) updated to 0.0.2
- [smart_proxy_openscap](https://github.com/openscap/smart_proxy_openscap) updated to 0.6.5
- [hammer_cli](https://github.com/theforeman/hammer_cli) updated to 0.11.0
- [hammer_cli_foreman](https://github.com/theforeman/hammer_cli_foreman) updated to 0.11.0
- [hammer_cli_foreman_remote_execution](https://github.com/theforeman/hammer_cli_foreman_remote_execution) updated to 0.0.6

### Acknowledgements

Thanks to everyone who contributes to the Foreman community - patches, plugins,
testing, bug reports, translations, interviews, presentations, meetups and
everything else. Your efforts are very much appreciated!

[issues]: http://projects.theforeman.org/issues
[k_issues]: http://projects.theforeman.org/projects/katello/issues

[1_16_reasons]: https://groups.google.com/d/msg/foreman-dev/q1AyI9MtpJU/WOuUt1fcAAAJ
[1_15_3]: https://groups.google.com/d/msg/foreman-users/rTMouWbj8ko/P1-UxBg-CgAJ
[k3_4_4]: https://groups.google.com/d/msg/foreman-users/Gmo72QQW86A/vxP5uo6EAQAJ
[k3_4_5]: https://groups.google.com/d/topic/foreman-users/eoZ2-CbAjS8/discussion
[plugins_devlist]: https://groups.google.com/d/topic/foreman-dev/jQ4dlc3DC_I/discussion
[plugins_website]: https://theforeman.org/plugins/#3.1Makingyourpluginofficial
[f_snapshot]: https://groups.google.com/d/msg/foreman-dev/8MVyiNgKjog/oObmGsDIBQAJ
