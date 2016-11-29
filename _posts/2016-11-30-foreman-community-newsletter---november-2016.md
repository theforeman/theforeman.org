---
layout: post
title: Foreman Community Newsletter - November 2016
date: 2016-11-28 14:42:23
author: Greg Sutcliffe
tags:
- foreman
- newsletter
- community
excerpt: |
  Foreman 1.13.2, Katello 3.2, plugin updates, YouTube content, many community events...
  catch up on the latest news in the Foreman world.
---

### Foreman 1.13.2 bugfix release

Foreman 1.13.2 was released just a few days ago, containing a raft of fixes for
host creation, fact importing and more. As always, you can read the full
details in the [announcement][1_13_2]

[1_13_2]: https://groups.google.com/d/topic/foreman-users/zHEWuhyvCZU/discussion

### Katello 3.2 release

Katello 3.2 was released on the 15th Nov, bringing official Puppet 4 support to
Katello, file-type repo content views, searchable OSTree repos and much more.
Many many thanks to all those who tested the RCs and provided feedback! There's
much more to discover in the [announcement][k3_2].

[k3_2]: https://groups.google.com/d/topic/foreman-users/OuKFBnCf6xw/discussion

### 1.14 freeze imminent, reminder about EL6 end-of-life

With 1.14 approaching, it's time for a reminder that the Foreman packages
(core, proxy, plugins, etc) will not be packaged for EL6.

EL6 was dropped by the core Foreman project for 1.13, but the Katello team
produced a set of unofficial EL6 packages which can be obtained from their
repos. If you're on 1.12 & EL6 and would like to use these packages to upgrade
to 1.13, see the [announcement][el6].

However, even these unofficial packages will only be maintained for the 1.13
series - they're intended to give EL6 users some time to work out their
upgrade, rather than as a long-term solution. EL6 users are *strongly*
encouraged to consider migrating to EL7, as this is very likely to be the last
release (official or unofficial) with EL6 support.  Discussions about the best
strategies for migration are happening on the [mailing list][userslist] -
please do join in the discussion if this is of interest to you, or you have
experience to share!

Note that installation of EL6 hosts from Foreman is still supported - it's the
packages for Foreman itself that will no longer be produced for EL6.

[el6]: https://groups.google.com/d/topic/foreman-users/lec9OBPJEGo/discussion
[userslist]: https://groups.google.com/forum/#!forum/foreman-users

### katello.org merged into theforeman.org

Katello is currently persuing a number of efforts to reduce the way in which
it's different to many other Foreman plugins, and having it's own website was
deemed to be one of these.

The effort to migrate the site was considerable, but is now complete, and
Katello can be found on the [Foreman plugins page](/plugins) page. As always,
further contributions are welcome via the
[GitHub repository](https://github.com/theforeman/theforeman.org) for the
website. Well done!

### New media and blogs

#### [#vBrownBag Webinar - Zero to full Foreman in one hour](https://www.youtube.com/watch?v=Ckvmnog3o-w)

I gave a one-hour introduction to Foreman for the folks over at
[#vBrownBag](http://vbrownbag.com) - we started with some basic slides, and
then proceeded with a live demo in which I went from an empty subnet to a fully
Foreman-managed network. That's Puppet (& CA), TFTP, DNS, DHCP, and libvirt
control, in ~45mins. Worth watching if you're new to Foreman (or need to demo
it to someone else).

#### [Deep Dive on React, JS, and UI, with Ohad Levy & Gail Steiger](https://youtu.be/qtOJ7Irybas)

In this episode of the Deep Dive series, Ohad and Gail talk about the recent
JavaScript changes in Foreman. There's a very basic introduction to
[ReactJS][reactjs] and how it is currently used in Foreman, as well as a wider
discussion about the Foreman UI and where it could be heading.

[reactjs]: https://facebook.github.io/react/

#### Community Demos

* [Community Demo - 3rd November](https://www.youtube.com/watch?v=J1ejZaDFR8o)
* [Community Demo - 24th November](https://www.youtube.com/watch?v=M0-3x8AUfFQ)

The latest instalments of the community demo series showcase all that's
happening in the Foreman community. In recent episodes, we covered updates to
Katello, Compute Resources (including better Azure support), Foreman-tracer for
debugging, permissions updates, templates and much much more. Check them out!

### Upcoming events

#### DevConf.cz / FOSDEM / CfgMgmtCamp Ghent - February 2017

The CFPs for DevConf, FOSDEM, and CfgMgmtCamp are now closed, and the responses
look great - thanks to all who submitted talks! The schedules will be published
in due course, once the talks are selected and the speakers confirmed, but you
already know it'll be great. Start booking your travel!

We're also happy to confirm that the Foreman hack day will happen again this
year, on the 8th of February. I'll be looking to gather opinion on what format
people want shortly, so keep an eye on the [mailinglist][userslist] for that!

* [DevConf.cz](https://devconf.cz)
* [FOSDEM](https://fosdem.org)
* [CfgMgmtCamp](http://cfgmgmtcamp.eu)

_(All Foreman events are now available via the [Foreman Calendar](/events))_

### Updated plugins

Updated plugins:

- [foreman_azure](https://github.com/theforeman/foreman_azure) updated to 1.2.0
- [foreman_noenv](https://github.com/joshuabaird/foreman_noenv) updated to 0.0.7
- [foreman_salt](https://github.com/theforeman/foreman_salt) updated to 8.0.0
- [foreman_xen](https://github.com/theforeman/foreman_salt) updated to 0.4.0

### Acknowledgements

Thanks to everyone who contributes to the Foreman community - patches, plugins,
testing, bug reports, translations, interviews, presentations, meet ups and
everything else. Your efforts are very much appreciated!
