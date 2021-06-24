---
layout: post
title: Foreman Community Newsletter - July 2017
date: 2017-07-31 15:43:11
author: Greg Sutcliffe
tags:
- foreman
- newsletter
- community
- birthday
excerpt: |
  Happy birthday to us, happy birthday to us...
---

Happy birthday to us! July is our birthday month, and we're now 8 years old!
Here's what happened this month...

### Birthday parties!

It's our 8th birthday, and we're still going strong - and that's largely down
to our fine community of users and devs. I've said this before, but I've never
worked in a more friendly, knowledgable, and professional community, and it's a
delight to be helping to grow that. So a huge personal thanks from me to you
all - you're all wonderful :)

To celebrate our birthday, we thought we'd again hold some birthday parties.
Folks gathered in Nuremburg, Antwerp, Raleigh, and Brno for talks, chats, food,
and good cheer. You can find some pictures from Nuremburg and Antwerp
[here][pic1], [here][pic2], and [here][pic3], and I'm reliably informed that
all events were great fun - and no doubt we'll do it again next year, so pencil
a July trip in your calendar!

### Foreman 1.15.2 released

1.15.2 was released on July 13th, and is primarily a bugfix release, with 15
fixes including the notable fix_db_cache bug that made Foreman unbootable in
some situations - do upgrade! You can find the details [here][1_15_2] and as
always you can report any future bugs on the [issue tracker][issues]. Thanks as
always to the community for finding, reporting, and fixing these issues!

### Katello 3.4.3 released

Katello 3.4.3 was released on July 14th, bringing with it an update to the the
Pulp backend (to Pulp 2.13.2). It's unusual to change the Pulp backend
mid-release-cycle, but due to the number of issues found in 2.12, the team
decided to go ahead ([details][k_3_4_3]). Please do [log][k_issues] any issues
you find with this, as there will be more minor relases in the 3.4 release
series.

#### Upcoming Events

* [Community Demo - 3rd August](https://www.youtube.com/watch?v=rZY6dE0HVyM)

Time again for the latest roundup of action from the community, covering core,
proxies, plugins, and more.  As always, you're welcome to participate in the
show, either via YouTube Live chat, or via our IRC channel
(libera.chat/#theforeman).

#### Community Demos / Deep Dives

* [Community Demo - 13th July - Birthday Edition!](https://www.youtube.com/watch?v=sL8KylTcqsg)

13th of July is our *actual* birthday, so it's a happy coincidence that the
demo landed on this day. Accordingly, this was a *packed* demo, full of content
for core, plugins, dev tools, and much more. Check it out!

* [Deep Dive - PXE booting in a pure IPv6 environment (with Dmitri Dolguikh)](https://www.youtube.com/watch?v=6KJne_Hyv5k)

Dmitri Dolguikh (better known as 'witlessb' on IRC) has been deep in the guts
of IPv6 provisioning with Foreman for some time now, and he'd like to share the
results of his efforts.

* [Deep Dive - Running the Foreman Stack in Containers (with Eric Helms)](https://www.youtube.com/watch?v=mPjUvNAYp1c)

Running Foreman in a container is a question that comes up from time to time in
the Foreman community. Eric Helms has been experimenting with running the whole
Foreman stack (core, proxies, plugins) inside Kubernetes, and wants to show you
how it looks.

_(All Foreman events are now available via the [Foreman Calendar](/events))_

### New / Updated plugins

New plugin - [Smart Proxy Realm AD provider](https://github.com/martencassel/smart_proxy_realm_ad_plugin)

This plugin adds direct AD realm integreation from the Smart Proxy. Useful if
you directly integrate with Active Directory and dont use FreeIPA. The author
is actively looking for testers on this, so please try it out and log issues on
his GitHub repo

Updated plugins:

- [foreman_remote_execution](https://github.com/theforeman/foreman_remote_execution) updated to 1.3.3
- [hammer_cli_foreman_openscap](https://github.com/theforeman/hammer_cli_foreman_openscap) updated to 0.1.4

### Acknowledgements

Thanks to everyone who contributes to the Foreman community - patches, plugins,
testing, bug reports, translations, interviews, presentations, meetups and
everything else. Your efforts are very much appreciated!

[1_15_2]: https://groups.google.com/d/topic/foreman-users/7V57m010h34/discussion
[k_3_4_3]: https://groups.google.com/d/topic/foreman-users/Fvycvei3cSA/discussion
[issues]: http://projects.theforeman.org/issues
[k_issues]: http://projects.theforeman.org/projects/katello/issues
[email]: mailto:greg.sutcliffe@gmail.com

[pic1]: https://twitter.com/netways/status/890613083399376896
[pic2]: https://twitter.com/netways/status/890523883580915712
[pic3]: https://twitter.com/KrisBuytaert/status/887376588475641856
