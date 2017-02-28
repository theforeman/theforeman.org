---
layout: post
title: Foreman Community Newsletter - February 2017
date: 2017-02-28 12:33:42
author: Greg Sutcliffe
tags:
- foreman
- newsletter
- community
- fosdem
- cfgmgmtcamp
excerpt: |
  A bumper roundup all the release, events, and plugin news since Christmas, as
  well as the conference trip report!
---

Apologies for the lack of a January newsletter - the conferences in Czechia and
Belgium kept us all very busy! Here's the roundup of the last few months in the
Foreman world.

### Foreman 1.14 released

Foreman 1.14.0 (and bugfix 1.14.1) are now available, containing new support
for automatic IPv6 addressing, LDAP and template enhancements, and a new email
delivery configuration UI. For demonstrations of the new highlights in
action, you can see the 30s clips on our [YouTube playlist][1_14_clips].

Thanks to the 90+ contributors to the release itself, as well as the many, many
people who test the release candidates and report back. We couldn't do it
without you!

[1_14_clips]: https://www.youtube.com/playlist?list=PLLTIBSsvp9qQplT12TPMyioyywBP35aKJ

### Katello 3.3 released

Hot off the code forges, Katello 3.3 was released yesterday! Containing updates
to manifest handling, authorized repositories, package applicability, content
view enhancements and Tracer support, it's a big update. See [the release
thread][k3_3] for details - and do watch out for the Puppet 3 -> Puppet 4
upgrade bug (which is scheduled to be fixed in 3.3.1)

[k3_3]: https://groups.google.com/d/msg/foreman-users/u9gKSKMZXZ0/04BU83UqAgAJ

### European Conference Extravaganza

As always in late January & early February, we have 2 weeks of conference
madness. With that behind us now, here's a round up of what happened at them.

#### DevConf.cz 2017

Kicking off with DevConf.cz in Brno, the Foreman team were present in force,
with a booth and brand new full demo based on Intel NUC nodes (many thanks to
Tomas for his work on the demo). This got a lot of attention, and the booth was
consistently busy on both Friday and Saturday.

![Intel NUC nodes](/static/images/blog_images/2017-02-28-foreman-community-newsletter-february-2017/demo-gear.jpg)
![Tomas at work](/static/images/blog_images/2017-02-28-foreman-community-newsletter-february-2017/tomas-work.jpg)

I ran a Foreman Workshop on Friday afternoon, with the intention of getting
users set up with a libvirt-based sandbox environment - complete with working
Puppet, PXE provisioning, and Libvirt integration in Foreman. This went
reasonably well, although the DevConf wifi meant that we were reduced to
passing around QCOW images via USB. Lesson learned for next time! Still, some
people left the room with working installs so I consider it a success.

There were also talks from Ivan on Ansible, Lukas on bare metal image
deployment, and a Pulp talk from Michael Hrivnak. Thanks all!

#### FOSDEM 2017

I view FOSDEM as the warm up for CfgMgmtCamp (which we'll get to in a moment)
and again I spent the whole time on the booth (apart from my own talks). As
with previous years we shared with the awesome oVirt team, and the booth was
consistent packed for the whole 2 days. Again, the demo was a bit hit (and
thanks to Sean O'Keeffe for supplying a monitor for it!). The booth looked a
bit like this:

![Foreman Booth](/static/images/blog_images/2017-02-28-foreman-community-newsletter-february-2017/foreman-booth.jpg)

This year, for the first time, I felt like the split in "people who know / use
Foreman" and "people who have never seen Foreman" was very close to 50/50. In
previous years, the "new users" group was much larger, so this is a welcome
feeling. Whether that's due to the project growing in size & reach, or due to
the same people coming to FOSDEM every year, is unclear :)

There were several talks on Foreman - I previewed a plugin I'm (slowly) working
on for showing Puppet catalog diffs in the UI, and Ondrej Prazak did a well
received talk on OpenSCAP in the Security track, as well as some
less-Foreman-specific talks in the Community Track. You can catch the
videos/slides here:

* Puppet Catalog Diffs (Greg Sutcliffe) - [MP4](https://video.fosdem.org/2017/UA2.220/puppet_catalog_diffs.mp4)
* OpenSCAP and Foreman (Ondrej Prazak) - (not recorded - [slides](https://fosdem.org/2017/schedule/event/openscap_foreman/))
* Closing Loops (Greg Sutcliffe) - on discussions in open source communities - [MP4](https://video.fosdem.org/2017/UD2.119/community_closing_loops.mp4)
* How to Get Your Issues Fixed (Tomer Brisker) - (not recorded - [slides](https://fosdem.org/2017/schedule/event/community_getting_your_issues_fixed/))

#### CfgMgmtCamp 2017

The main event! As usual we had own own track in Gent, and again the quality of
the talks was superb. Sadly, I couldn't get the talks recorded (something I'd
to see next year, for sure) - but I do plan to ask the presenters to do their
talks for our YouTube channel, so hopefully you'll get to see them soon. If you
have any you'd like to see sooner rather than later, check out the
[schedule](http://cfgmgmtcamp.eu/schedule/#foreman) and let me know which you
want to see.

![Foreman Track](/static/images/blog_images/2017-02-28-foreman-community-newsletter-february-2017/foreman-track.jpg)

We also had the booth here too, and again it was busy whenever I was there
(although I mostly was running our track). Swag ran out almost immediately,
surpassing even my high expectations of what we could shift. More t-shirts next
year I guess :)

Finally, we had the usual Foreman Community dinner in Gent this year, and we
packed out Du Progres restaurant with 25 or so people for a great night of chat
and post-conference relaxing. Thanks to all who came - see you again next year!

![Foreman Dinner](/static/images/blog_images/2017-02-28-foreman-community-newsletter-february-2017/foreman-dinner.jpg)

#### Foreman Construction Day 2017

After the success of last year, we ran another hackday after the main
conference. This year saw similar numbers (~25 people), but this year we added
in some presentations as a "main track" on how to get into some of the newer
areas of the codebase (e.g. React in the UI), along with two breakout rooms where I saw hacking on new
OS support, image deployment, custom plugins, Ansible integration, and more.
Dirk Goetz kindly also lead a new-user training session, which I hope we can do
again.

Thanks to all who came and made it a successful event! 

#### Upcoming Events

* [Foreman Deep Dives: Flux + Redux overview](https://www.youtube.com/watch?v=Q2XkAepFaYI) - 3pm Wed 1st March

In this Deep Dive Matan Werbner will be joining us for another session on UI
technologies. Redux is an opinionated state container library, that is built on
the foundations of functional programming. It allows our UI to be predictable,
maintainable and highly testable. If you are interested in making your code
more readable and maintainable, and to have an opinionated, well defined, data
flow, join us! This talk requires no previous knowledge of redux, react, or
anything except basic JS chops (ES6). We will go over the motivation, and the
concepts behind flux, and later dive in to real-world implementation using
Redux in our foreman app! 

#### Community Demos

* [Community Demo - 19th January](https://youtu.be/GiU2O8MCe8s)
* [Community Demo - 16th February](https://youtu.be/Zz0Bgt87wPE)

The community demo series showcases all that's happening in the Foreman
community. In recent demos we've looked at new UI features for 1.15
(notifications), changes in Katello and it's UI, many plugin updates (e.g.
Ansible, Templates, Docker, OpenSCAP, and the new Omaha plugin), API changes,
and dev tools such as Forklift. Check them out!

_(All Foreman events are now available via the [Foreman Calendar](/events))_

### Updated plugins

Updated plugins:

- [foreman_ansible](https://github.com/theforeman/foreman_ansible) updated to 1.4.4
- [foreman_chef](https://github.com/theforeman/foreman_chef) updated to 0.5.0
- [foreman_discovery](https://github.com/theforeman/foreman_discovery) updated to 8.0.0
- [foreman_expire_hosts](https://github.com/theforeman/foreman_expire_hosts) updated to 2.2.0
- [foreman_hooks](https://github.com/theforeman/foreman_hooks) updated to 0.3.13
- [foreman_memcache](https://github.com/theforeman/foreman_memcache) updated to 0.0.6
- [foreman_openscap](https://github.com/theforeman/foreman_openscap) updated to 0.6.4
- [foreman_templates](https://github.com/theforeman/foreman_templates) updated to 4.0.1
- [foreman_xen](https://github.com/theforeman/foreman_xen) updated to 0.4.1
- [puppetdb_foreman](https://github.com/theforeman/puppetdb_foreman) updated to 2.0
- [smart_proxy_dns_route53](https://github.com/theforeman/smart_proxy_dns_route53) updated to 3.0.1

### Acknowledgements

Thanks to everyone who contributes to the Foreman community - patches, plugins,
testing, bug reports, translations, interviews, presentations, meet ups and
everything else. Your efforts are very much appreciated!
