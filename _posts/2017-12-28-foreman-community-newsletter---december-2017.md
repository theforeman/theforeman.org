---
layout: post
title: Foreman Community Newsletter - December 2017
date: 2017-12-28 15:10:00
author: Ori Rabin
tags:
- foreman
- newsletter
- community
excerpt: |
  Migrating from mailing lists, Katello 3.5, and the usual round-up
---

Happy holidays!

### Migrating from Google Groups

Our mailing lists are moving to Discourse on 1st Jan!
See the [announcement][discourse_announcement] for more details.

For those who missed it, the past month there were discussions and
demos showing Discourse. After a migration poll last month the move to
Discourse got a lot of support.
The results were discussed [here](https://youtu.be/g8XnAKfG9xY?t=99). 

### Katello 3.5 released

On the 7th of Dec Katello 3.5 was released, see the [post][k_3_5] for details.
The release fixed 28 bugs found in RC2 so thank you to all that tested,
commented and fixed! As always, we'd love your feedback, so do report
any issues you find to the [Katello bug tracker][k_issues]!

### Upcoming Events

* Community Demo - 4th Jan  (https://www.youtube.com/watch?v=BVTiwSEMcyw)

Time again for the latest round-up of action from the community, covering core,
proxies, plugins, and more.  As always, you're welcome to participate in the
show, either via YouTube Live chat, or via our IRC channel
(libera.chat/#theforeman).

#### Upcoming Conferences

* [DevConf.cz](https://devconf.cz/): Look out for the Foreman booth at DevConf in Brno 26-28 Jan
* [FOSDEM](https://fosdem.org/2018/): Come see us at our joint stand with oVirt
on level 1 of building K in Brussels 3-4 Feb
* [Config Management Camp](http://cfgmgmtcamp.eu/): Join us at the Foreman room and booth
in Gent 5-7 Feb. The 7th of Feb is an extra day for everything Foreman related - meet the
developers, joint developing/debugging sessions and more.

#### Community Demos / Deep Dives

* [Community Demo - 7th Dec](https://www.youtube.com/watch?v=g8XnAKfG9xY)

This demo was a little shorter than usual but we had important updates.
Watch for Discourse updates, fact importing improvements and significant
performance improvements in Content View publishing


* [UX review - breadcrumbs and item switcher](https://www.youtube.com/watch?v=4fX_kjPlzVw)
The change to vertical navigation made two-pane a little less comfortable because
the space to edit became smaller. Additionally, some users reported confusion
around navigation context as well as inconsistencies in regards to two-pane navigation. 
This review focused on the addition of breadcrumbs to improve navigation
compared to two pane. We'd be glad to get feedback on this proposed change.


_(All Foreman events are now available via the [Foreman Calendar](/events))_

### Plugin news

#### Updated plugins:

- [foreman_bootdisk](https://github.com/theforeman/foreman_bootdisk) updated to 10.0.1
- [foreman_chef](https://github.com/theforeman/foreman_chef) updated to 0.6.0
- [foreman-docker](https://github.com/theforeman/foreman-docker) updated to 4.0.0
- [foreman_expire_hosts](https://github.com/theforeman/foreman_expire_hosts) updated to 4.0.0
- [foreman_maintain](https://github.com/theforeman/foreman_maintain) updated to 0.1.1
- [foreman_salt](https://github.com/theforeman/foreman_salt) updated to 9.0.0
- [foreman_setup](https://github.com/theforeman/foreman_setup) to 6.0.0 
- [foreman_snapshot_management](https://github.com/ATIX-AG/foreman_snapshot_management) updated to 1.3.0
- [foreman-tasks](https://github.com/theforeman/foreman-tasks) updated to 0.11.0
- [foreman_virt_who_configure](https://github.com/theforeman/foreman_virt_who_configure) updated to 0.1.9

### Acknowledgements

Thanks to everyone who contributes to the Foreman community - patches, plugins,
testing, bug reports, translations, interviews, presentations, meetups and
everything else. Your efforts are very much appreciated!

[issues]: http://projects.theforeman.org/issues
[k_issues]: http://projects.theforeman.org/projects/katello/issues

[k_3_5]: https://groups.google.com/forum/#!topic/foreman-users/I9GI2eMmTfk
[discourse_announcement]: https://groups.google.com/forum/#!topic/foreman-announce/OR5JocmW12I
