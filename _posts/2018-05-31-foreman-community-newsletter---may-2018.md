---
layout: post
title: Foreman Community Newsletter - May 2018
date: 2018-05-31 09:55
author: Greg Sutcliffe
tags:
- foreman
- newsletter
- community
excerpt: |
  Foreman 1.17.1, Katello 3.5.2, GDPR, Summit, and all the usual goodies.
---

### Foreman Privacy Policy created

Prompted by the incoming EU GDPR legislation, the Foreman project has finally
written down its [privacy policy](/privacy.html), and you can find it in the
footer on any of the website pages.

Happily, we haven't really had to change any of our practices - we were already
pretty good at respecting our community! The only notable change is that we
*have* enabled the IP anonymization in Google Analytics, which really should
have been done earlier. The rest is all aggregate statistics and public data
(such as forum posts, bug reports, and git commits).

If you do have any concerns, you are welcome to reach out to [me][greg] to
discuss them. We'll be keeping the policy updated in the future, and
significant changes will be notified in the [Announcements
list](https://community.theforeman.org/c/release-announcements) and here.

### Foreman at OpenSourceCamp.de

In just 2 weeks, Foreman will be taking part in the
[OpenSourceCamp.de](https://opensourcecamp.de) event. We're teaming up with
Graylog to bring you a day of infrastructure management talks, and it's right
after [OSDC](https://osdc.de) so you can get two conferences for your travel
budget! We've got a great speaker line-up for you, and a booth where you can
come chat with us in the breaks. See you there!

### Foreman 1.17.1 released

Just 2 days ago Ondřej released 1.17.1 containing a bunch of important fixes
for issues found in the 1.17 release. Packages are out, so get your upgrade hat
on!

You can find details on the bugs fixed in the [release announcement][1_17_1],
and thank you to everyone that reported the issues and worked on the fixes. As
always bugs can be reported on [issue tracker][issues] - thanks!

### Katello 3.5.2 is out

The next release in the Katello 3.5 stream was released earlier this month,
containing 20 fixes in Katello alone, and more in subpackages. This is suitable
for Foreman 1.16, and you can check the [announcement][k_3_5_2] for more
details. As ever, many thanks to those who contributed to the release, and
further reports of [bugs][k_issues] is always appreciated.

### Plugin Maintainers wanted!

Many of our plugins suffer compatibility issues and/or changes in the projects
they integrate with over time - when Foreman changes, or (for example) Salt
released a new version, plugins can be affected. Sadly, several plugins hit by
this have not been maintained, and are now facing being retired from the plugin
repository.

If you're interesting in helping contribute to the community by helping to fix
a plugin you rely on, please get in touch! Currently we'd *love* some help
with:

  * ABRT
  * Chef
  * Azure
  * Salt

If these plugins matter to you (or you want to contribute to *another*
plugin!), but don't know where to start, come [talk to me][greg] and I'll help
you get started. You can also join the [dev discussion][plugins]

### RFCs needing attention

I'm going to start highlighting open RFCs that might benefit from more
eyeballs. Here's this month's selection:

  * [Network Management](https://community.theforeman.org/t/foreman-and-network-subnet-management/9787)
  * [Webpack for plugins](https://community.theforeman.org/t/webpacking-plugins-lets-do-it-right/9558)
  * [Changing templates menu](https://community.theforeman.org/t/ux-rfc-move-templates-to-the-top-menu-or-provision-menu/9745)
  * [Denormalizing the fact tables](https://community.theforeman.org/t/rfc-denormalize-fact-tables/9611)

### [Upcoming Events](https://community.theforeman.org/c/events/l/calendar)

The Foreman Community has now fully embraced Discourse as the source of its
event data - if you've been using the old `/events/all.ics` in your own
calendar, you'll need to head over to [the forum
calendar](https://community.theforeman.org/calendar) and hit the Subscribe
button (which will give you an ICS link). You can also use the Add To Calendar
on specific events if you don't wish to import the whole thing.

Future community demos will now be created much further in advance, so you
should be able to keep up with upcoming demos there (currently I've created
topics out to August :P)

#### [Past Events](https://community.theforeman.org/c/events/l/latest)

* [Community Demo - 17th May](https://community.theforeman.org/t/foreman-community-demo-44/9559)

This was largely an event roundup from Red Hat Summit & RossConf, and a
discussion of potential future work on community stuff from me.

* [Deep Dive on Foreman-Maintain](https://community.theforeman.org/t/foreman-maintain-deep-dive/9678)

John Mitsch gave us a look at how to start developing on foreman-maintain.

### Plugin news

Updated plugins:
- [foreman_expire_hosts](https://github.com/theforeman/foreman_expire_hosts) updated to 5.1.0
- [foreman_xen](https://github.com/theforeman/foreman_xen) updated to 0.6.1
- [foreman_remote_execution](https://github.com/theforeman/foreman_remote_execution)to 1.5.2
- [foreman_salt](https://github.com/theforeman/foreman_salt) updated to 10.0.0
- [foreman_bootdisk](https://github.com/theforeman/foreman_bootdisk) updated to 12.0.0
- [foreman_snapshot_management](https://github.com/ATIX-AG/foreman_snapshot_management) updated to 1.5.0
- [foreman_column_view](https://github.com/theforeman/foreman_column_view) updated to 0.4.0
- [foreman_templates](https://github.com/theforeman/foreman_templates) updated to 6.0.1
- [foreman_ansible](https://github.com/theforeman/foreman_ansible) updated to 2.1.2
- [foreman_virt_who_configure](https://github.com/theforeman/foreman_virt_who_configure) updated to 0.2.1
- [foreman_default_hostgroup](https://github.com/theforeman/foreman_default_hostgroup) updated to 5.0.0
- [smart_proxy_ansible](https://github.com/theforeman/smart_proxy_ansible) updated to 2.0.3
- [smart_proxy_salt](https://github.com/theforeman/smart_proxy_salt) updated to 2.1.9
- [hammer_cli](https://github.com/theforeman/hammer-cli) updated to 0.13.0
- [hammer_cli_csv](https://github.com/theforeman/hammer_cli_csv) updated to 2.3.1

Added:
- [smart_proxy_dhcp_device42](https://github.com/theforeman/smart_proxy_dhcp_device42) now has DEBs

Removed:
- foreman_snapshot (unmaintained)
- foreman_param_lookup (unmaintained)
- foreman_reserve (unmaintained)

### Acknowledgements

Thanks to everyone who contributes to the Foreman community - patches, plugins,
testing, bug reports, translations, interviews, presentations, meetups and
everything else. Your efforts are very much appreciated!

[1_17_1]: https://community.theforeman.org/t/foreman-1-17-1-released/9806
[k_3_5_2]: https://community.theforeman.org/t/katello-3-5-2-a-k-a-schwarzbier-is-here/9650

[issues]: https://projects.theforeman.org/issues
[k_issues]: https://projects.theforeman.org/projects/katello/issues

[plugins]: https://community.theforeman.org/t/removing-unmaintained-incompatible-plugins-from-nightly-repos/9814
[ha-proxy]: https://community.theforeman.org/t/user-survey-supporting-ha-smart-proxies/8832

[greg]: https://community.theforeman.org/u/gwmngilfen
