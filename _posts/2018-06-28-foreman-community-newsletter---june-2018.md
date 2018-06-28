---
layout: post
title: Foreman Community Newsletter - June 2018
date: 2018-06-28 10:17
author:
  name: Greg Sutcliffe
  uri: gwmngilfen
tags:
- foreman
- newsletter
- community
excerpt: |
  Foreman 1.18 RC1,2 & 3, Katello 3.7 RC1, survey data, Redmine, blog integration, and more!
---

### Foreman 1.18 RC1 and RC2 (and test week event) -> RC3 next week

The next major release for Foreman is undergoing final testing, and the first
release candidate [came out][1_18_rc1] on June 12th, with a ton of fixes and
updates. We then held a successful [1.18 test week][test-week] (kindly
organised by [Lukas][lzap]) which aimed to cover a lot of the common scenarios
for RC testing. This was largely successful, and many bugs were logged and
looked at. Thanks to everyone for helping out!

We've just released [1.18 RC2][1_18_rc2] for the next round of testing, so give
it a spin and let us know how you get on - and do [report issues][issues] as
you find them! We couldn't do this without the testing we get from the
community, so thanks very much to you all!

Late-breaking news! I'm told that RC3 will be out early next week, so you may
want to hold off a few days!

### Katello 3.7 RC1

To go with 1.18 RC1/2, there is also an RC1 release of the [next Katello
version][k_3_7_rc1]. Again, lots of bug fixes and new features are in this
release, so please do check it out, and [report issues][k_issues] if you find
any. Thanks!

### New Release Manager

It's no secret that build stability has been an issue for some time in the
nightlies, and that's had a knock-on effect on release schedules, etc.

To try to address this, [Tomer Brisker][tbrisker] has accepted the role of
Release Manager, and will be actively working to improve the state of the build
pipeline. You can read all about his [new role
here](https://community.theforeman.org/t/releases-and-nightlies-stabilization-effort/10037)

Tomer's long-time experience in the Foreman project, as his attention to
detail, is a welcome addition to this area of the project - I'm sure he'll have
an impact. Thanks Tomer!

### Survey analysis

Earlier in the year we asked you all to fill in our survey, as we do every
year. I've had chance to at least do some descriptive analysis of the raw data,
and do some comparisons to the 2017 data. If you're interested in the results,
check them out
[here](https://theforeman.org/2018/06/2018-foreman-survey-analysis.html)

### Blog & Forum integration

Staying with the blog, we've also enabled comments on the blog again (after a
*long* absence), which now uses our
[forum][https://community.theforeman.org/c/blog] to store the comments. As a
side effect, you can now read the blog on our forum too, if that's more your
style. Scroll to the bottom of this post to check it out!

### Redmine upgrade

In a short while, we'll start the long-delayed upgrade to our bug tracker. This
has blocked for a long time because of the unmaintained plugins we were using,
but there is now [a
plan](https://community.theforeman.org/t/redmine-plugin-spec/10012/7) in place
to move past this. Work is scheduled to start soon, so you may see some
instability in the bug tracker at times - details will be posted to the forum,
of course.

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
  * Salt
  * Compute resources:
    * Azure
    * GCE
    * EC2
    * Rackspace

If these plugins matter to you (or you want to contribute to *another*
plugin!), but don't know where to start, come [talk to me][greg] and I'll help
you get started. You can also join the [dev discussion][plugins].

### RFCs needing attention

I'm going to start highlighting open RFCs that might benefit from more
eyeballs. Here's this month's selection:

  * [M2 MaaS provisioning](https://community.theforeman.org/t/rfc-bare-metal-provisioning-with-m2-in-foreman/10061)
  * [Move GCE to a plugin](https://community.theforeman.org/t/move-gce-to-a-plugin/10038)
  * [Split Hostgroups and Puppet Classes](https://community.theforeman.org/t/split-host-groups-and-puppet-classes-ansible-roles/9949)
  * [Drop the 'stable' link in the DEB repo](https://community.theforeman.org/t/drop-stable-link-in-deb-repos/9960)

### [Upcoming Events](https://community.theforeman.org/c/events/l/calendar)

The Foreman Community has now fully embraced Discourse as the source of its
event data - if you've been using the old `/events/all.ics` in your own
calendar, you'll need to head over to [the forum
calendar](https://community.theforeman.org/calendar) and hit the Subscribe
button (which will give you an ICS link). You can also use the Add To Calendar
button on specific events if you don't wish to import the whole thing.

Future community demos will now be created much further in advance, so you
should be able to keep up with upcoming demos there (currently I've created
topics out to August :P)o

* [Foreman's 9th Birthday @ ATIX](https://community.theforeman.org/t/lets-celebrate-the-9th-anniversary-of-the-foreman-project/10079)

A one-day unconference / hack session in honour of our birthday, hosted by our
good friends at [ATIX](https://www.atix.de) - thanks!

We'd like some more speakers for this, so please [get in touch][greg] if you
want to go along!

* [CFP closing for Open Source Summit EU, Edinburgh, October](https://community.theforeman.org/t/open-source-summit-eu-2018-edinburgh-october/10081)

There's going to be *some* kind of Foreman presence at OSS-EU this year, but
the CFP for presentations closes *this week* (SUnday 1st) - so if you want to
get your entry paid for, get your submissions in right away!

#### [Past Events](https://community.theforeman.org/c/events/l/latest)

* [OpenSourceCamp.de](https://community.theforeman.org/t/open-source-camp-berlin-14-june/8738)

Our first ever Foreman-headlined conference was held earlier this month, and
was great fun - thanks to our partners at NETWAYS and Graylog for helping to
make this event happen. A full day of talks, hacking, and discussion,
thoroughly enjoyed by all (so I am told :P)

* [Community Demo - 31st May](https://community.theforeman.org/t/foreman-community-demo-45/9698)

Containers, backups, and oVirt, oh my! A return to force for the demo, with
great content from all the presenters.

* [Community Demo - 21st June](https://community.theforeman.org/t/foreman-community-demo-46/9732)

A packed demo, covering the Redmine and Survey results mentioned above, as well
as foreman-hooks for content, more Docker support, better state handling for
unattended installs (awesome!) and more. One to watch.

* [UX Dive on the Audits page](https://community.theforeman.org/t/foreman-usability-audits-ui/10093)

Tereza Novotna took us through the proposed wireframes for the old Audits UI,
which has been in need of love for some time. We also had time for a solid
discussion around filtering vs sorting, and tables vs list views.

### Plugin news

Updated plugins:
- [hammer_cli_foreman_remote_execution](https://github.com/theforeman/hammer_cli_foreman_remote_execution) updated to 0.1.0
- [foreman_chef](https://github.com/theforeman/foreman_chef) updated to 0.8.0
- [foreman_tasks](https://github.com/theforeman/foreman_tasks) updated to 0.13.2
- [foreman_remote_execution](https://github.com/theforeman/foreman_remote_execution)to 1.5.3
- [foreman_discovery](https://github.com/theforeman/foreman_discovery) updated to 12.0.1
- [foreman_docker](https://github.com/theforeman/foreman_docker) updated to 4.1.0
- [foreman_openscap](https://github.com/theforeman/foreman_openscap) updated to 0.10.1
- [hammer_cli_katello](https://github.com/Katello/hammer-cli-katello) updated to 0.13.2
- [foreman_memcache](https://github.com/theforeman/foreman_memcache) updated to 0.1.1
- [smart_proxy_monitoring](https://github.com/theforeman/smart_proxy_monitoring) updated to 0.1.2
- [smart_proxy_omaha](https://github.com/theforeman/smart_proxy_omaha) updated to 0.0.4
- [foreman_virt_who_configure](https://github.com/theforeman/foreman_virt_who_configure) updated to 0.2.2

### Acknowledgements

Thanks to everyone who contributes to the Foreman community - patches, plugins,
testing, bug reports, translations, interviews, presentations, meetups and
everything else. Your efforts are very much appreciated!

[1_18_rc1]: https://community.theforeman.org/t/1-18-0-rc1-has-been-released/9987
[1_18_rc2]: https://community.theforeman.org/t/1-18-0-rc2-has-been-released/10147
[k_3_7_rc1]: https://community.theforeman.org/t/katello-3-7-rc1-available-for-testing/10060

[issues]: https://projects.theforeman.org/issues
[k_issues]: https://projects.theforeman.org/projects/katello/issues

[test-week]: https://community.theforeman.org/t/foreman-1-18-test-week/9989

[lzap]: https://community.theforeman.org/u/lzap
[greg]: https://community.theforeman.org/u/gwmngilfen
[tbrisker]: https://community.theforeman.org/u/tbrisker
