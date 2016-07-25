---
layout: post
title: Foreman Community Newsletter - July 2016
date: 2016-07-27
author: Greg Sutcliffe
tags:
- foreman
- newsletter
excerpt: |
  Our 7th birthday! Also, Foreman 1.12 released, 1.11.4, Katello 3.1 in RC,
  Red Hat Summit roundup, plugin releases, ... a busy month!
---

Time again for the Foreman Newsletter! It's been a busy month, and all the
details are coming right up.

### Foreman's 7th Birthday!

On July 13th, Foreman turned 7 years old! Parties have been happening in some
of our communities (see the [birthday events][birthday] page) and there's still
a few to come.

[birthday]: https://theforeman.org/2016/06/foremans-7th-birthday-events.html

Here's a few pictures from some of the events:

![Belgium Birthday](/static/images/blog_images/2016-07-26-foreman-community-newsletter-july-2016/belgium-birthday.jpg)
![Nuremburg Birthday](/static/images/blog_images/2016-07-26-foreman-community-newsletter-july-2016/nuremburg-birthday.jpg)
![Tel Aviv Birthday](/static/images/blog_images/2016-07-26-foreman-community-newsletter-july-2016/telaviv-birthday.jpg)
![Ohad's Present](/static/images/blog_images/2016-07-26-foreman-community-newsletter-july-2016/balloons.jpg)

7 years is quite a milestone - and we're still growing! [Citation needed :P -
I'll get to that]. We'd like to thank everyone who's participated in the
project over the years. Whether it's coding, testing, documenting, translating,
reporting bugs... you're all amazing, and Foreman wouldn't be where it is today
without the community that has developed around it. Thank you all!

### 1.12 released

The latest release of Foreman, 1.12.0, was released on 11th July, bringing with
it the anticipated Puppet 4 support, and support for Ubuntu 16.04 (Xenial) in
the package repos. That was followed by 1.12.1 on July 25th, fixed a lot of
bugs as well as a couple of security issues ([4995][4995] & [5390][5390]). As
ever, you can find out more about [1.12.0][12dot0] and [1.12.1][12dot1] on the
announcements.

[12dot0]: https://groups.google.com/forum/#!msg/foreman-announce/62FQvVQNZl8/B5SRjFKYBAAJ
[12dot1]: https://groups.google.com/forum/#!topic/foreman-announce/XCVIT8lDJxI/discussion

If you're upgrading from Puppet 3 to Puppet 4 as part of your 1.12 upgrade, you
may want to take a look at the [migration page][p3to4] we've put together to
document the upgrade steps. This has been confirmed working by a few people,
but as with all complex upgrades, do take care.

[p3to4]: http://projects.theforeman.org/projects/foreman/wiki/Upgrading_from_Puppet_3_to_4

### 1.11.4 bugfix release

The final release in our 1.11 series, 1.11.4 was released on July 25th. This
brings 3 CVE fixes ([4475][4475], [4995][4995] & [5390][5390]) as well as
numerous bug fixes. It's also likely to be the last release in the 1.11 series,
so start planning your 1.12 upgrade. You can learn more from the
[announcement][11dot4].

[11dot4]: https://groups.google.com/forum/#!topic/foreman-announce/MmkL11GYUdM

[4475]: https://theforeman.org/security.html#2016-4475
[4995]: https://theforeman.org/security.html#2016-4995
[5390]: https://theforeman.org/security.html#2016-5390

### Katello 3.0.2 released and 3.1 in RC phase

The latest release in the Katello 3.0 line was released on July 6th, bringing
bugfixes as well as resolutions for some significant upgrade issues. More
details are available in the [announcement][30dot2]

[30dot2]: https://groups.google.com/d/topic/foreman-users/8frDaBJObQ4/discussion

Katello 3.1 is also in the Release Candidate phase, and as ever, your testing
is greatly valued. If you'd like to help with testing, you can get involved
[here][31rc1]. Thanks to all our awesome testers!

[31rc1]: https://groups.google.com/d/topic/foreman-users/ARgW31tXj7w/discussion

### Foreman Ansible 1.0, now with support for roles

Ansible is a big topic in the community right now, so it's great news that
[@dlobatog][dlobatog] has released Foreman Ansible 1.0 with support for Ansible
roles! He's looking for feedback on this, so do get involved - as ever, you can
learn more in the [announcement][fa10].

[fa10]: https://groups.google.com/d/topic/foreman-users/LfBMs7Oqg5c/discussion
[dlobatog]: https://twitter.com/dLobatog

### New media and blogs

#### [Community Demo - 7th July](https://www.youtube.com/watch?v=g0oUlG_-ZPY)

On this edition of the community demo, we looked at the 7th birthday events,
heard about our community booth at Red Hat Summit, and took a look at IPv6,
Ansible, Azure, and more!

#### [Case Study: Foreman in Consulting, Government, AWS - with Matt Darcy](https://youtu.be/L4jwAJWD3VM)

In this case study, we spoke with Matt Darcy (ikonia on IRC) who talked to us
about doing consulting work with Foreman, getting Foreman implemented in
governments, and extensive use of the AWS features we have.

#### [Community Demo - 28th July](https://plus.google.com/events/ce6k42hdrovujq7qdhm6tbmjra8)

On this demo, we rounded up the news from the birthday parties, took a look at
log filtering in Dynflow, and saw the *huge* list of changes in Discovery 6.0

_(All Foreman events are now available via the [Foreman Calendar](/events))_

### Updated plugins
- [foreman_ansible](https://github.com/theforeman/foreman_ansible) updated to 1.0
- [foreman_default_hostgroup](https://github.com/theforeman/foreman_default_hostgroup) updated to 4.0.0
- [foreman_expire_hosts](https://github.com/theforeman/foreman_expire_hosts) updated to 2.0.2
- [foreman_setup](https://github.com/theforeman/foreman_setup) updated to 4.0.0
- [smart_proxy_chef](https://github.com/theforeman/smart_proxy_chef) updated to 0.1.8

### Acknowledgements

Thanks to everyone who contributes to the Foreman community - patches, plugins,
testing, bug reports, translations, interviews, presentations, and everything
else. Your efforts are very much appreciated!
