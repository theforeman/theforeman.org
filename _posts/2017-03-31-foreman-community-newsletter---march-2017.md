---
layout: post
title: Foreman Community Newsletter - March 2017
date: 2017-03-31 13:53:21
author: Greg Sutcliffe
tags:
- foreman
- newsletter
- community
excerpt: |
  The usual round of news from our community - 1.15 branching, bugfix releases, 
  survey results and more!
---

How time flies! March is coming to a close, the clocks have changed, winter is
fading, and it's time for yet another Foreman newsletter!

### Foreman 1.15 branched

The next release of Foreman is imminent, containing headline features such as
an entirely new notification system, SSH key management for users, and much
more.

As ever, we rely on you guys to test the release candidates (and *so* many of
you do, thanks!), so please do keep an eye on the mailing list over the next
week or so for the first RC release, and make sure you report those
[bugs][issues] if you do!

### 1.14.2 Bugfix release

Foreman 1.14.2 bugfix release was published on [March 2nd][1_14_2], containing
provisioning, API and Puppet fixes. As always, thanks to the contributors who
helped make this happen!

### Katello 3.3.1 bugfix release

Katello 3.3.1 was released on [March 16th][k3_3_1], containing a huge list of
fixes for upgrade issues, display bugs, custom certificates and much more.
Users who had issues upgrading to 3.3.0 are encouraged to give 3.3.1 a try and
let us know how you get on!

### Community survey results

The community survey got over 200 responses this year - a fantastic result
compared to last year. I've just finished working over the results and writing
it up, and you can read the extensive summary [here][survey_blog]. It's a
pretty interesting read, if you like graphs!

We also did the prize draw in this week's community demo, so check out the
[video](https://youtu.be/QfANwMzxebE) if you want to see the winners :)

#### Upcoming Events

* [Foreman Community Demo - 20th Apr](https://youtube.com/+foreman) - 3pm Thu 20th Apr

Every 3 weeks we get together to take a look at what's been happening in the
Foreman community, and you're always welcome to join us live on YouTube to get
involved, ask questions, and make your views known. The next demo will be Apr
20th, so we'll see you then!

#### Community Demos

* [Community Demo - 9th March](https://youtu.be/jg-pe6G05Mk)

In this demo we saw the new Notifications UI for Foreman 1.15, much love for
Katello (sync updates, container registry discovery, Pulp performance), and a
new tool aimed at helping to diagnose & fix Foreman maintenance issues. Check
it out!

* [Community Demo - 30th March](https://youtu.be/QfANwMzxebE)

This demo covered much of the changes you'll find in 1.15 - new handling of SSH
keys, CSV exports from many pages, and new handling of global default template,
template locking, and role locking. We also did the prize draw for the survey
raffle! Enjoy!

_(All Foreman events are now available via the [Foreman Calendar](/events))_

### Updated plugins

Updated plugins:

- [foreman_ansible](https://github.com/theforeman/foreman_ansible) updated to 1.4.5
- [foreman_azure](https://github.com/theforeman/foreman_azure) updated to 1.3.1
- [foreman_bootdisk](https://github.com/theforeman/foreman_bootdisk) updated to 9.0.0
- [foreman_discovery](https://github.com/theforeman/foreman_discovery) updated to 8.0.1
- [foreman_openscap](https://github.com/theforeman/foreman_openscap) updated to 0.7.0
- [foreman_remote_execution](https://github.com/theforeman/foreman_remote_execution) updated to 1.3.0
- [foreman_salt](https://github.com/theforeman/foreman_salt) updated to 8.0.2
- [foreman_xen](https://github.com/theforeman/foreman-xen) updated to 0.5.1
- [hammer_cli_foreman](https://github.com/theforeman/hammer-cli-foreman) updated to 0.10.0
- [hammer_cli](https://github.com/theforeman/hammer-cli) updated to 0.10.0
- [kafo](https://github.com/theforeman/kafo) updated to 2.0.0

### Acknowledgements

Thanks to everyone who contributes to the Foreman community - patches, plugins,
testing, bug reports, translations, interviews, presentations, meet ups and
everything else. Your efforts are very much appreciated!

[issues]: http://projects.theforeman.org/issues
[1_14_2]: https://groups.google.com/d/topic/foreman-users/lQQ0EgL64VM
[k3_3_1]: https://groups.google.com/d/topic/foreman-users/lJWFPPDLiHA
[survey_blog]: https://theforeman.org/2017/03/2017-foreman-survey-analysis.html
