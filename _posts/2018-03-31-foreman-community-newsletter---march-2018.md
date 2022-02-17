---
layout: post
title: Foreman Community Newsletter - March 2018
date: 2018-03-31 11:03:00
author: Ori Rabin
tags:
- foreman
- newsletter
- community
excerpt: |
  1.17 RC2, Katello 3.6 RC2!
---


### Foreman 1.17 RC2 out

The Foreman 1.17 second Release Candidate is now available with several bug fixes
that were reported in RC1, here is the [announcement][1.17-rc2].
Thank you to everyone that reported and fixed bugs and features.
We'd be glad to continue getting feedback and hear about
the [bugs][issues] you find.


### Katello 3.6 RC2 out

In sync with the Foreman Release Candidate, Katello 3.6 RC2 is out!
See the [announcement][k_3_6_rc2] For more details.
Reporting of [bugs][k_issues] will be appreciated.


### Upcoming Events

* Community Demo - 19th April (URL to be announced)

Time again for the latest round-up of action from the community, covering core,
proxies, plugins, and more.  As always, you're welcome to participate in the
show, either via YouTube Live chat, or via our IRC channel
(libera.chat/#theforeman).


#### Community Demos / Deep Dives

* [Deep Dive - Foreman-Probing - 7th March](https://www.youtube.com/watch?v=-PYhFH7YraU)
In this deep dive we met a new plugin, foreman-probing.
This plugin allows scanning networks and creating Hosts in Foreman for
the detected machines. Adam described the plugin's features, inner
working and possible usage for brownfield deployments.

* [Community Demo - 8th March](https://www.youtube.com/watch?v=ujTwePoc4jw)
This time we showed custom notification, audits improvements, template
importing from the api, multiple queues support in Dynflow and more.


* [Deep Dive - Telemetry in Foreman - 21st March](https://www.youtube.com/watch?v=QoJ-r8YfWEI)
Rails internal telemetry was recently added into Foreman Core, in this demo
Lukáš Zapletal showed how to integrate Foreman with Prometheus,
what configurations can be done and plans for the future.


* [Community Demo - 29th March](https://www.youtube.com/watch?v=ILMU7Db7nos)
This demo showed an intro to Foreman Telemetry, toast notifications,
Ansible reports, auditing and exceptions from oVirt.

_(All Foreman events are now available via the [Foreman Calendar](/events))_

### Blog posts

##### Foreman 1.17 fact filtering
A new setting in 1.17 makes fact and NIC filtering a lot easier.
This [post][blog] explains what's new and provides a workaround
for earlier versions as well.


### Plugin news

#### Updated plugins:

- [Dynflow](https://github.com/Dynflow/dynflow) updated to 1.0.0
- [foreman_dhcp_browser](https://github.com/theforeman/foreman_dhcp_browser) updated to 0.0.8
- [foreman_maintain](https://github.com/theforeman/foreman_maintain) updated to 0.1.5
- [foreman_monitoring](https://github.com/theforeman/foreman_monitoring) updates to 1.0.1
- [foreman_remote_execution](https://github.com/theforeman/foreman_remote_execution)to 1.4.6
- [foreman-tasks](https://github.com/theforeman/foreman-tasks) updated to 0.12.1
- [hammer_cli_foreman](https://github.com/theforeman/hammer-cli-foreman) updated to 0.12.1
- [smart_proxy_ansible](https://github.com/theforeman/smart_proxy_ansible) updated to 2.0.2

### Acknowledgements

Thanks to everyone who contributes to the Foreman community - patches, plugins,
testing, bug reports, translations, interviews, presentations, meetups and
everything else. Your efforts are very much appreciated!

[1.17-rc2]: https://community.theforeman.org/t/foreman-1-17-0-rc2-now-available/8635
[k_3_6_rc2]: https://community.theforeman.org/t/katello-3-6-rc2-now-available/8638
[blog]: https://www.theforeman.org/2018/03/foreman-117-fact-filtering.html

[issues]: http://projects.theforeman.org/issues
[k_issues]: http://projects.theforeman.org/projects/katello/issues

