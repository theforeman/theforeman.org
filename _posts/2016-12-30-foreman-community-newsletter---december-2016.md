---
layout: post
title: Foreman Community Newsletter - December 2016
date: 2016-12-28 12:42:23
author: Ondřej Pražák
tags:
- foreman
- newsletter
- community
excerpt: |
  Foreman 1.14, Katello 3.3, plugin updates, YouTube content, new releases...
  in the very last Foreman blog post of 2016.
---

### Foreman 1.14-RC1 branched

Foreman 1.14-RC1 was branched on the 14th Dec. As always, a new version is
packed with exciting features and important bugfixes. Some of the most notable changes are:

* Organization/location assignment to LDAP users on creation
* Smart Proxy's MS DHCP provider now uses a native API
* IPv6 address assignment or generation for hosts on compute resources

You can read about the details in the [announcement][1_14]. Try 1.14-RC1 and let us know what you think!

[1_14]: https://groups.google.com/forum/#!topic/foreman-announce/Y2yImbWecw0/discussion

### Katello 3.2.1 released

Katello 3.2.1 was released on 15th Dec. The most notable improvements are preformance enhancemnts for a capsule sync,
fix for capsule install issues for Puppet 4 users and using newer Pulp version that takes care of removing sync issues
for EPEL on EL7. More details can be found in the [announcement][k3_2_1]

[k3_2_1]: https://groups.google.com/forum/#!topic/foreman-users/m_ZfV9RsIgU

#### Community Demos

* [Community Demo - 15th December](https://www.youtube.com/watch?v=CY1U_54Cbbs)

The latest instalment of the community demo series showcases all that's
happening in the Foreman community. In the last demo we covered UI background tasks, ignoring facts on import and
new Ansible options. Second part of demo recording contains a panel discussion of Foreman team members. You can hear
the highlights of 2016 and recap of the last 12 months with Foreman,
what we strived for and what we aim to do in the coming year.

### Upcoming events

We will be at [DevConf][devconf], [FOSDEM][fosdem], and [CfgMgmtCamp][cfgmgmc]. There will be a [Foreman Construction Day][fcd] on 8th Feb in Ghent, Belgium. Do not forget to [register][fcd_register] if you are interested.

_(All Foreman events are now available via the [Foreman Calendar](/events))_

[fcd]: https://groups.google.com/forum/#!topic/foreman-users/QYIHyJ1kSBc/discussion
[fcd_register]: https://foreman-construction-day-2017.eventbrite.com/
[devconf]: https://devconf.cz
[fosdem]: https://fosdem.org
[cfgmgmc]: http://cfgmgmtcamp.eu

### Updated plugins

Updated plugins:

- [foreman_ansible](https://github.com/theforeman/foreman_ansible) updated to 1.3.0
- [foreman_bootdisk](https://github.com/theforeman/foreman_bootdisk) updated to 8.1.0
- [foreman_discovery](https://github.com/theforeman/foreman_discovery) updated to 7.0.1
- [foreman_remote_execution](https://github.com/theforeman/foreman_remote_execution) updated to 1.2.2

### Acknowledgements

Thanks to everyone who contributes to the Foreman community - patches, plugins,
testing, bug reports, translations, interviews, presentations, meet ups and
everything else. Your efforts are very much appreciated!
