---
layout: post
title: Foreman Community Newsletter - October 2016
date: 2016-10-28 15:55:43
author: Greg Sutcliffe
tags:
- foreman
- newsletter
- community
excerpt: |
  Foreman 1.13, Discovery 7.0, EL6 information, meet ups, plugin updates... it's
  all happening in the Foreman community this month. Get your round-up here!
---

### Foreman 1.13 released

Foreman 1.13 was officially released on October 6th, bringing support for IPv6,
UEFI and GRUB2 bootloader support, performance improvements to the DHCP proxy,
multiple Compute resource upgrades, support for structured facts, and much
more. For more information, see the [headline features][features], and the
[announcement][1_13]

The first bugfix release, 1.13.1 is also now available, bringing over 30 fixes
to the 1.13 series, so please do upgrade. You can find more details in the
[announcement][1_13_1].

As ever, please do report any [bugs][bugs] you find - your input is what makes
Foreman's reputation for quality possible. Thanks!

[1_13]: https://groups.google.com/d/topic/foreman-users/huLpB4vaNx8/discussion
[1_13_1]: https://groups.google.com/d/topic/foreman-users/QfqKGplGuTk/discussion
[bugs]: http://projects.theforeman.org/projects/foreman/issues/new

### Foreman 1.12.4 released

Foreman 1.12.4 has also been released, bringing a small number of bug fixes
around searching and the dashboard - see the [announcement][1_12_4] for
details.

This is likely to be the last 1.12.x release, so it's time to start planning
the migration to 1.13.

[1_12_4]: https://groups.google.com/d/topic/foreman-users/It-YDdGepLY/discussion

### EL6 removed in 1.13, unofficial builds available

EL6 was dropped by the core Foreman project for 1.13. However, the Katello team
have produced a set of unofficial EL6 packages which can be obtained from their
repos. If you're on 1.12 (or earlier) and EL6 and would like to use these
packages, see the [announcement][el6].

EL6 users are *strongly* encouraged to consider migrating to EL7, as this is
very likely to be the last release (official or unofficial) with EL6 support.
Discussions about the best strategies for migration are happening on the
[mailing list][userslist] - please do join in the discussion if this is of
interest to you, or you have experience to share!

Note that installation of EL6 hosts from Foreman is still supported - it's the
packages for Foreman itself that will no longer be produced for EL6.

[el6]: https://groups.google.com/d/topic/foreman-users/lec9OBPJEGo/discussion
[userslist]: https://groups.google.com/forum/#!forum/foreman-users

### Katello 3.2 RC3

Katello 3.2 RC3 was released a couple of days ago, bringing further fixes and
EL6 packages to the RC series. You can find out more from the
[announcement][k3_2_rc3] - and as ever, your testing is hugely appreciated. If
you'd like to try it out, [let us know][kbugs] how it goes. Thanks!

[k3_2_rc3]: https://groups.google.com/d/topic/foreman-users/vuP2HkjYkDY/discussion
[kbugs]: http://projects.theforeman.org/projects/katello/issues/new

### Discovery 7.0.0 and Image 3.2.0

A new milestone has been reached in the Discovery project, bringing support for
UEFI, PXE-less booting on Debian/Ubuntu and a sizeable number of bugfixes.
Accompanying it is the Discovery Image 3.2.0 release, with the addition of
`biosdevname` to support Dell NICs and initial support for VLANs. More detail
is available on the [announcement][d7_0].

[d7_0]: https://groups.google.com/d/topic/foreman-users/6dBSfGwCwGk/discussion

### Meet ups

#### New meet ups in California and Washington DC

Ashton Davies (California) and Chris Pisano (Washington DC) are both trying to
start up Foreman meet up groups in their local area. If you'd like to join in,
you can go to the [SoCal][socal] and [DMV][dmv] threads on the mailing list.

If you'd like to start up a meet up of your own and aren't sure how, drop
[me][mail_greg] a line

[socal]: https://groups.google.com/d/topic/foreman-users/R7Y7taHstPo/discussion
[dmv]: https://groups.google.com/d/topic/foreman-users/xpCo6nrsCJo/discussion
[mail_greg]: mailto:greg.sutcliffe@gmail.com

#### Foreman @ PuppetConf 2016 Meet up

A *very* hastily organised meetup was held at PuppetConf on Wed 19th 2016, and
was deemed a big success. There were about 20 people present, with a good mix
of experienced and new users swapping stories and tips. My thanks to Ashton and
Chris for their help in organising it!

![PuppetConf 2016](/static/images/blog_images/2016-10-27-foreman-community-newsletter-october-2016/puppetconf-2016.jpg)

### New media and blogs

#### [Deep Dive on Host Facets, with Shimon Shtein](https://youtu.be/KBGrGaN4HoQ)

If you're working on plugins, you want to watch this. Shimon gave an excellent
introduction to Host Facets, the idea behind them, how to use them, and a good
discussion on what they're good at (and *not* good at!). Check it out.

#### [Community Demo - 13th October](https://youtu.be/Rao1O1mc8AU)

Once again we had a busy demo, with many updates from the Katello project
around packages and content views. We also had some Hammer updates and a look
at the new charting libraries being brought into core.

Of particular note was Justin's coverage of the recent set of Katello RFCs
which aim to start bring Katello in line with other Foreman plugins. If this is
of interest to you, you can jump directly to that part of the video [here][yt_rfcs].

[yt_rfcs]: https://youtu.be/Rao1O1mc8AU?t=1092

#### [Foreman High-Availability blog series - Martin Dobrev](https://blog.dobrev.eu/blog/categories/foreman/)

Martin (mdobrev in IRC) has done an in-depth series of posts on his experiences
of setting up Foreman in a highly-available way. This is a great resource if
you're looking into HA yourself, so take a look!

#### [Katello 3.2 / Puppet 4 integration](https://theforeman.org/2016/10/puppet4-integration.html)

You've probably seen this already (since it's on the same blog as this
newsletter!) but it's worth highlighting again. Zach has done a great job of
writing up the Puppet 4 changes in Katello 3.2.

### Upcoming events

#### [Deep Dive on React, JS, and UI, with Ohad Levy & Gail Steiger](https://youtu.be/qtOJ7Irybas)

In this episode of the Deep Dive series, Ohad and Gail will be talking about
the recent JavaScript changes in Foreman. We will have a very basic
introduction to ReactJS [1] and how it is currently used in Foreman, as well as
a wider discussion about the Foreman UI and where it could be heading.

Come to this deep dive if you are interested in:

* UX improvement in Foreman
* JavaScript / client side future of Foreman
* want to understand what React is

#### [Community Demo - 3rd November](https://www.youtube.com/watch?v=J1ejZaDFR8o)

The next community demo will be on 3rd November, and as ever you're warmly
welcomed to join us live for an hour of discussion on the latest work done in
the Foreman community. See you then!

#### [CfgMgmtCamp Berlin - 15th November](http://cfgmgmtcamp.eu/berlin-2016)

If you love Config Management Camp in Ghent, but just can't wait until
February, then you'll want to check out the one day event being organised in
Berlin. Registration is still open, so book in, and the [schedule][cfg-berlin] looks great!

[cfg-berlin]: http://cfgmgmtcamp.eu/berlin-2016/

#### DevConf.cz / FOSDEM / CfgMgmtCamp Ghent - February 2017

The big Foreman conference season approaches again! For brevity, I'll just link
to the mailing list posts about these - but do note the CFPs are open and we
want your submissions! 

* [DevConf.cz](https://devconf.cz/#cfp)
* [FOSDEM/CfgMgmt](https://groups.google.com/d/topic/foreman-users/n-XztMSKab8/discussion)

_(All Foreman events are now available via the [Foreman Calendar](/events))_

### Updated plugins

New plugins this month:

- [Nagios/Icinga Foreman Check Plugin](https://groups.google.com/d/topic/foreman-users/0BUptaQYyDs/discussion)
- [CoreOS Updates via Omaha](https://github.com/theforeman/foreman_omaha)

Updated plugins:

- [foreman_ansible](https://github.com/theforeman/foreman_ansible) updated to 1.2.1
- [foreman_azure](https://github.com/theforeman/foreman_azure) updated to 1.0.2
- [foreman_column_view](https://github.com/GregSutcliffe/foreman_column_view) updated to 0.3.0
- [foreman_digitalocean](https://github.com/theforeman/foreman-digitalocean) updated to 1.1
- [foreman_expire_hosts](https://github.com/theforeman/foreman_expire_hosts) updated to 2.1.1
- [foreman_openscap](https://github.com/OpenSCAP/foreman_openscap) updated to 0.6.3
- [foreman_templates](https://github.com/theforeman/foreman_templates) updated to 3.1.0
- [puppetdb_foreman](https://github.com/theforeman/puppetdb_foreman) updated to 1.0.4

- [smart_proxy_salt](https://github.com/theforeman/smart_proxy_salt) updated to 2.1.7
- [smart_proxy_ansible](https://github.com/theforeman/smart_proxy_ansible) now packaged

### Acknowledgements

Thanks to everyone who contributes to the Foreman community - patches, plugins,
testing, bug reports, translations, interviews, presentations, meet ups and
everything else. Your efforts are very much appreciated!
