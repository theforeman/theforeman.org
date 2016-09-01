---
layout: post
title: Foreman Community Newsletter - August 2016
date: 2016-08-30 21:59:12
author: Greg Sutcliffe
tags:
- foreman
- newsletter
- community
excerpt: |
  Foreman 1.12.2 security fix, Discovery 6.0 released, Webpack support merged, tons
  of plugin updates... it's been a busy month!
---

August is coming to a close, so it's time for your monthly dose of Foreman
roundup. We've got releases, new core technology, YouTube videos and the usual
long list of plugin updates.

### 1.12.2 released

The latest point release of the Foreman 1.12 series is now available. This is
mainly a security release, containing two CVE fixes ([6319][6319] &
[6320][6320]) as well as updating Rails to 4.2.7.1 which contains security
fixes in Rails itself. As usual, more detail can be found in the
[announcement][1_12_2]

[6319]: https://theforeman.org/security.html#2016-6319
[6320]: https://theforeman.org/security.html#2016-6320
[1_12_2]: https://groups.google.com/d/topic/foreman-users/NXI3H30jTfI/discussion

### Foreman Discovery 6.0.0

The popular metal-as-a-service plugin, `foreman_discovery`, has been updated to
6.0.0. This release brings with it a new quick-provision window which is
particularly useful for provisioning within Organisations/Locations, or simply
to speed up the manual provisioning process. It also brings a large changelog
of fixes and improvements - see the [announcement][discovery6] for more details.

[discovery6]: https://groups.google.com/d/topic/foreman-users/GSU-R3m9hdU/discussion

### Development Changes - Webpack now used for JavaScript assets

One major change in the Foreman dev ecosystem is we're now using Webpack and
NPM to build our assets. This allows us to move forward with newer assets that
aren't available as gems, and brings the option of modernising parts of the
codebase in a reasonable way.

End-users won't see much difference immediately, but if you run a development
instance of Foreman, or work on plugins, you'll want to be aware of the changes
(if you aren't already). The [dev setup notes][dev_setup] have been updated
with the new instructions, so be sure to check that out. You can also see the
[dev post][mld_webpack] on the topic, or view the [Webpack Deep
Dive][webpack_dive].

[dev_setup]: https://theforeman.org/contribute.html#Startupforeman
[mld_webpack]: https://groups.google.com/d/topic/foreman-dev/2CHOj1r0XE8/discussion
[webpack_dive]: https://www.youtube.com/watch?v=gNu1pZpOLIA

### New media and blogs

#### [Foreman Deep Dives: Webpack with Tomer Brisker](https://www.youtube.com/watch?v=gNu1pZpOLIA)

Tomer Brisker of the Foreman core team goes into the details of using
Webpack to package NPM assets in the Foreman packages.

#### [Community Demo - 25th August](https://www.youtube.com/watch?v=3t3LHUu4zXk)

In this packed Community Demo, the team showed off new features in the Ansible
support, some quality-of-life Katello improvements, faster loading on the
Dashboard and Statistics pages, and a first taste of the huge effort that's
gone into the UEFI provisioning support feature. Thanks to everyone that took
part!

_(All Foreman events are now available via the [Foreman Calendar](/events))_

### Updated plugins
- [foreman_docker](https://github.com/theforeman/foreman-docker) updated to 3.0.0
- [foreman_chef](https://github.com/theforeman/foreman_chef) updated to 0.4.0
- [foreman_remote_execution](https://github.com/theforeman/foreman_remote_execution) updated to 1.10
- [foreman_setup](https://github.com/theforeman/foreman_setup) updated to 5.0.0
- [foreman_salt](https://github.com/theforeman/foreman_salt) updated to 7.0.0
- [foreman_cockpit](https://github.com/theforeman/foreman_cockpit) updated to 2.0.2
- [foreman_discovery](https://github.com/theforeman/foreman_discovery) updated to 6.0.0
- [foreman_noenv](https://github.com/joshuabaird/foreman_noenv) updated to 0.0.6

- [foreman_host_extra_validator](https://github.com/FILIADATAGmbH/foreman_host_extra_validator) now RPM packaged at 0.0.4

### Acknowledgements

Thanks to everyone who contributes to the Foreman community - patches, plugins,
testing, bug reports, translations, interviews, presentations, and everything
else. Your efforts are very much appreciated!
