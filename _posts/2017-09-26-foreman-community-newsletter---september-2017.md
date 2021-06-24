---
layout: post
title: Foreman Community Newsletter - September 2017
date: 2017-09-26 15:37:20
author: Ori Rabin
tags:
- foreman
- newsletter
- community
excerpt: |
  Foreman 1.16, updated plugins, important survey and a bunch of new videos. Enjoy!
---

A little earlier this month, another Foreman newsletter is here!

### Foreman 1.16 RC1 is out

Foreman 1.16 is now available for testing with the release of RC1 yesterday.

Changes in this release include:
- Netgroups support for LDAP 
- VMWare SCSI controllers with per-disk configuration 
- Puppet 5 support 
- Many UI changes such as Patternfly pagination 
- An interface to Webpack for plugins

Full details about the release can be found [here][1_16_rc1].

We know you've been waiting for this one and we'll be glad to get comments 
and issues reported to [issue tracker][issues] to make the release of 1.16
faster and better.

### Foreman 1.15.4 released

1.15.4 was released on Sep 18th. 19 issues were fixed and all the details
appear on the [announce list][1_15_4]. As always bugs can be reported
on [issue tracker][issues] and we appreciate getting reports and of course fixes!

### Vertical Navigation Survey

A big UI change proposed for our navigation bar. Full details in our latest community demo.

Test it yourself with our [Vertical navigation demo](https://vertnav.demo.theforeman.org)
login details: admin / vertnav.

#### Vertical Navigation Survey

After testing out the vertical navigation or looking at the various screenshots
on the [pr](https://github.com/theforeman/foreman/pull/4794) you can fill out
our [survey](https://goo.gl/forms/ERJhphis7Gd85EwJ3).

It's open until
the end of the week so hurry up to get your opinion in!

### New Sponsor

Scaleway is now our newest sponsor!
Thank you for providing ARM servers for building our arm packages!

### Upcoming Events

* Community Demo - 5th October  (URL to be announced)

Time again for the latest roundup of action from the community, covering core,
proxies, plugins, and more.  As always, you're welcome to participate in the
show, either via YouTube Live chat, or via our IRC channel
(libera.chat/#theforeman).

* [Foreman Usability - review of content hosts - 27th September](https://www.youtube.com/watch?v=-hFAfn_yJW8)

Next in our series of UX reviews, we're looking at Katello's content hosts.
With the upcoming work on the unification of hosts and content hosts it will be important
to consider the UI/UX of both and how that combines into a unified host experience.
 
#### Community Demos / Deep Dives

* [Community Demo - 14th September](https://www.youtube.com/watch?v=nZBnQo57Xdc)

In this demo we covered a variety of small updates across the codebase, and
then dived into a hands-on look at the proposals for the new UI (vertical navigation).

_(All Foreman events are now available via the [Foreman Calendar](/events))_

### New / Updated plugins

#### New plugins:

The existing [foreman_userdata](https://github.com/theforeman/foreman_userdata) plugin
has now been added to the RPM repos.

#### Updated plugins:

- [foreman_maintain](https://github.com/theforeman/foreman_maintain) updated to 0.0.9
- [foreman_omaha](https://github.com/theforeman/foreman_omaha) updated to 0.0.3
- [foreman_openscap](https://github.com/theforeman/foreman_openscap) updated to 0.8.1
- [foreman_snapshot_management](https://github.com/ATIX-AG/foreman_snapshot_management) updated to 1.1.0
- [hammer_cli_foreman_openscap](https://github.com/theforeman/hammer_cli_foreman_openscap) updated to 0.1.5
- [hammer_cli_foreman_admin](https://github.com/theforeman/hammer-cli-foreman-admin) updated to 0.0.7
- [puppetdb_foreman](https://github.com/theforeman/puppetdb_foreman) updated to 3.1.2
- [smart_proxy_openscap](https://github.com/openscap/smart_proxy_openscap) updated to 0.6.7
- [smart_proxy_dhcp_infoblox](https://github.com/theforeman/smart_proxy_dhcp_infoblox) updated to 0.0.7

### Acknowledgements

Thanks to everyone who contributes to the Foreman community - patches, plugins,
testing, bug reports, translations, interviews, presentations, meetups and
everything else. Your efforts are very much appreciated!

[issues]: http://projects.theforeman.org/issues
[k_issues]: http://projects.theforeman.org/projects/katello/issues

[1_16_rc1]: https://groups.google.com/forum/#!topic/foreman-announce/6weA8svh_Ls
[1_15_4]: https://groups.google.com/forum/#!topic/foreman-announce/kSAoyk1OP3c
