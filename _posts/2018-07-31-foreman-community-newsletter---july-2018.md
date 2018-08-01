---
layout: post
title: Foreman Community Newsletter - July 2018
date: 2018-07-31 15:17
author:
  name: Greg Sutcliffe
  uri: gwmngilfen
tags:
- foreman
- newsletter
- community
excerpt: |
  Foreman 1.18.0 & 1.19 RC1, Katello 3.7 & 3.8 RC1, birthdays, YouTube, even some stats!
---

### Foreman 1.18.0 released

The next stable release of Foreman (1.18.0) was [released on July
19th][1_18_0], with many [new features][18_features] and [bug fixes][18_fixes].
Everyone is encouraged to schedule their upgrades, especially if you're still
on the (now unmaintained) 1.16 series.

As ever, many thanks to the contributors to this release - coders, RC testers,
documentation writers, and bug/feature reporters. Foreman wouldn't be what it
is without you! If you do find issues with, please do [report them!][issues]

### Katello 3.7 released

Hard on the heels of the 1.18 release of Foreman core, the Katello team brought
you [version 3.7][k_3_7] on Jul 27th, with *far* too many
[features][k_features] and [bug fixes][k_bugs] to list. If you're upgrading a
Katello install, do be sure to read the [upgrade notes][k_upgrade].

Huge thanks to all the contributors to this release - as with core, we couldn't
put out these releases without you! Further issues with Katello should be
[reported][k_issues], as always.

### 1.19 RC1, Katello 3.8 RC1, and test week event

Since we're trying to make up time for the slow releases over the last year or
so, the next releases of Foreman and Katello are already being prepared.
Release candidates for [1.19][1_19_rc1] and [3.8][k_3_8_rc1] are already
available, and as always we'd like you help to test them!

To give a little structure to this, we've again organised a [test week
event][test_week] during which we'd like to see as many of our end-user
scenarios tested as possible. If any of these fit your workflow, and you're
willing to give the RC a spin, please do! Be sure to [let us know how it
went][test_scenarios] and of course [report any bugs][issues] that you find.
Thanks!

### Foreman's 9th Birthday

July is our birthday month, this year we are 9! Everyone who's a part of this
lovely community deserves a $beverage-of-choice, we wouldn't be here today
without you.

To celebrate, we teamed up with our friends at [Atix](https://atix.de) for a
9th birthday party hackday. You can read all about the good times [over on
their blog](https://www.atix.de/recap-the-foreman-birthday-party-atix)

### 6 months of Discourse

The start of this month also marked a full 6 months since our migration to
Discourse. It's had a noticeable effect on both the user and dev communities,
and in a good way. To mark the occasion, I wrote a short blog post analysing
some of the data Discourse generates, looking at trends in community growth and
amount of discussion. [Check it
out](https://theforeman.org/2018/07/discourse-6-months-on-impact-assesment.html)

### Redmine upgrade

The Redmine instance completed its upgrade path last week, we are now fully up
to date. Thanks to everyone for their patience during the chaos that caused.

### RFCs needing attention

Here's this month's selection of open discussion areas:

  * [Foreman Client Repository](https://community.theforeman.org/t/introduce-a-foreman-client-repository/10235)
  * [Drop -c from TFTP wget calls](https://community.theforeman.org/t/rfc-drop-c-flag-from-wget-on-tftp-proxy/10010)
  * [Smart Proxy Capabilities](https://community.theforeman.org/t/exposing-capabilities-in-the-smart-proxy/9860/5)
  * [Pulp 3 Migration](https://community.theforeman.org/t/pulp-3-migration/10474/17)

### [Upcoming Events](https://community.theforeman.org/c/events/l/calendar)

The Foreman Community has now fully embraced Discourse as the source of its
event data - if you've been using the old `/events/all.ics` in your own
calendar, you'll need to head over to [the forum
calendar](https://community.theforeman.org/calendar) and hit the Subscribe
button (which will give you an ICS link). You can also use the Add To Calendar
button on specific events if you don't wish to import the whole thing.

Future community demos will now be created much further in advance, so you
should be able to keep up with upcoming demos there.

* [Community Demo #48](https://community.theforeman.org/t/foreman-community-demo-48/9826)

All the usual goodness from the community, rounded up and presented for your viewing pleasure.

* [DevConf India 2018](https://community.theforeman.org/t/devconf-india-2018/10309)

Foreman Project will have a huge appearance at DevConf India ’18.  We have two
talks lined up on the very first day of the conference, as well as a booth at
the conference, so drop by and say hello! We’ll have very exciting goodies and
t-shirts at the Foreman booth, make sure you grab them before they are gone
:slight_smile:

#### [Past Events](https://community.theforeman.org/c/events/l/latest)

* [Community Demo #47](https://community.theforeman.org/t/foreman-community-demo-47)

Subscriptions, Jenkins, live images, and an *awesome* new reporting engine from Marek. Do watch!

### Plugin news

New plugins:
- [hammer_cli_foreman_ansible](https://github.com/theforeman/hammer_cli_foreman_ansible)

Dropped plugins (unmaintained, no longer working):
- ABRT
- Azure

Updated plugins:
- [hammer_cli_katello](https://github.com/Katello/hammer-cli-katello) updated to 0.13.4
- [hammer_cli_foreman](https://github.com/theforeman/hammer_cli_foreman) updated to 0.13.1
- [foreman_discovery](https://github.com/theforeman/foreman_discovery) updated to 12.0.2
- [foreman_salt](https://github.com/theforeman/foreman_salt) updated to 10.1.0
- [foreman_templates](https://github.com/theforeman/foreman_templates)to 6.0.3
- [foreman_remote_execution](https://github.com/theforeman/foreman_remote_execution) updated to 1.5.4
- [foreman_openscap](https://github.com/theforeman/foreman_openscap) updated to 0.10.2
- [foreman_ansible](https://github.com/theforeman/foreman_ansible) updated to 2.2.5
- [foreman_maintain](https://github.com/theforeman/foreman_maintain) updated to 0.2.5
- [smart_proxy_ansible](https://github.com/theforeman/smart_proxy_ansible) updated to 2.0.3

### Acknowledgements

Thanks to everyone who contributes to the Foreman community - patches, plugins,
testing, bug reports, translations, interviews, presentations, meetups and
everything else. Your efforts are very much appreciated!


[test_week]: https://community.theforeman.org/t/foreman-1-19-test-week-event/10534
[test_scenarios]: https://community.theforeman.org/t/foreman-1-19-test-week/10533

[1_18_0]: https://community.theforeman.org/t/1-18-0-has-been-released/10462
[18_features]: https://theforeman.org/manuals/1.18/index.html#Headlinefeatures
[18_fixes]: https://theforeman.org/manuals/1.18/index.html#BugFixes
[1_19_rc1]: https://community.theforeman.org/t/foreman-1-19-0-rc1-has-been-released/10531
[issues]: https://projects.theforeman.org/issues

[k_3_7]: https://community.theforeman.org/t/katello-3-7-0-released/10564
[k_3_8_rc1]: https://community.theforeman.org/t/katello-3-8-rc1-available-for-testing/10536
[k_features]: https://theforeman.org/plugins/katello/3.7/release_notes/release_notes.html
[k_bugs]: https://github.com/Katello/katello/blob/KATELLO-3.7/CHANGELOG.md#bug-fixes
[k_upgrade]: https://theforeman.org/plugins/katello/3.7/installation/index.html
[k_issues]: https://projects.theforeman.org/projects/katello/issues
