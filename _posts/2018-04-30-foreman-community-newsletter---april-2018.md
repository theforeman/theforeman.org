---
layout: post
title: Foreman Community Newsletter - April 2018
date: 2018-04-30 20:09:00
author: Ori Rabin
tags:
- foreman
- newsletter
- community
excerpt: |
  Foreman 1.17, Katello 3.6 and lots of updated plugins!
---


### Foreman 1.17 released

Two weeks ago Foreman 1.17 was released! This version finally includes
the new vertical navigation bar, as seen in community demos and deep dives.
This will be the last version supporting API v1 that has been deprecated
since 1.9.
See the [announcement][1.17] for the full list of bugs and features.
Thank you to everyone that helped test and contributed to the release candidates.
As always bugs can be reported on [issue tracker][issues] and we appreciate getting reports
and of course fixes!


### Katello 3.6 is out

Katello 3.6 was released! This version works with Foreman 1.17 and
brings an impressive list of bug and features including great performance
improvements around content views. See the [announcement][k_3_6] For more details.
Reporting of [bugs][k_issues] will be appreciated.

### Community lead

Greg, our community lead, is back!
Feel free to continue contacting Ori but now you can also
reach out to Greg again.
Welcome back Greg!

### Feedback wanted - Highly Available Proxies

Sean O'Keeffe wants your input! We've been having a lot of discussion on the
right way to implement high availability for the proxies, and we'd like to hear
from more voices. If you're curious about the current plans, and want to offer
your thoughts, then head over to the [forum thread][ha-proxy] for more details.
Thanks!

### Upcoming Events

* Community Demo - 17th May (URL to be announced)

Time again for the latest round-up of action from the community, covering core,
proxies, plugins, and more.  As always, you're welcome to participate in the
show, either via YouTube Live chat, or via our IRC channel
(libera.chat/#theforeman).

* UX review - Breadcrumb Bar - 2nd May (https://www.youtube.com/watch?v=L6vrs1rtjAo)
Breadcrumbs display a users location within an application hierarchy.
They act as a resource to help users navigate more efficiently and provide additional context.
The Breadcrumb Switcher provides a shortcut for users to quickly navigate to parallel pages,
rather than navigating back to the previous page and making a new selection.
In this demo, we will show the new BreadcrumbBar and an example of how to migrate
from the old two-pane.


#### Community Demos / Deep Dives

* [Community Demo - 26th March](https://www.youtube.com/watch?v=BCq_YfpYPS8)
This was a demo showing improvements and additions all over - UI, hammer,
audits and more. There is also a preview of the breadcrumbs bar that will
be demoed in the next UX deep dive.

* [UX review - Red Hat Subscriptions page - 4th Apr](https://www.youtube.com/watch?v=635AqkBIsTU)
The Red Hat Subscriptions page is being moved to react and changes will be made to allow
a user to manage the number of subscription entitlements from within Katello rather
than going to the Red Hat Portal. This is the first step towards making the consumption
of Red Hat subscriptions within Katello more user friendly and seamless. 
This demo shows the progress made thus far as well as mockups on where we are going.

* [Deep Dive - Foreman Datacenter Plugin - 11th Apr](https://www.youtube.com/watch?v=HVmJ6UYPaz0)
In this deep dive Michal presented the foreman_datacenter plugin which
lets you document your physical servers across multiple datacenters.

_(All Foreman events are now available via the [Foreman Calendar](/events))_


### Plugin news

#### Updated plugins:

- [foreman-ansible](https://github.com/theforeman/foreman_ansible) updated to 2.0.4
- [foreman_openscap](https://github.com/theforeman/foreman_openscap) updated to 0.9.2
- [foreman_remote_execution](https://github.com/theforeman/foreman_remote_execution)to 1.5.0
- [foreman_setup](https://github.com/theforeman/foreman_setup) updated to 6.0.0
- [foreman_memcache](https://github.com/theforeman/foreman_memcache) updated to 0.1.0
- [foreman_snapshot_management](https://github.com/ATIX-AG/foreman_snapshot_management) updated to 1.4.0
- [foreman-tasks](https://github.com/theforeman/foreman-tasks) updated to 0.13.0
- [foreman_templates](https://github.com/theforeman/foreman_templates) updated to 6.0.0
- [foreman_virt_who_configure](https://github.com/theforeman/foreman_virt_who_configure) updated to 0.2.0
- [hammer_cli_katello](https://github.com/theforeman/hammer-cli-katello) updated to 0.12.1
- [hammer_cli_foreman_openscap](https://github.com/theforeman/hammer_cli_foreman_openscap) updated to 0.1.6
- [smart_proxy_dhcp_infoblox](https://github.com/theforeman/smart_proxy_dhcp_infoblox) updated to 0.0.13
- [smart_proxy_dhcp_device42](https://github.com/theforeman/smart_proxy_dhcp_device42) updated to 1.0.7
- [smart_proxy_dynflow updated](https://github.com/theforeman/smart_proxy_dynflow) updated to 0.2.0
- [smart_proxy_openscap](https://github.com/theforeman/smart_proxy_openscap) updated to 0.6.10
- [smart_proxy_remote_execution_ssh](https://github.com/theforeman/smart_proxy_remote_execution_ssh) updated to 0.2.0

### Acknowledgements

Thanks to everyone who contributes to the Foreman community - patches, plugins,
testing, bug reports, translations, interviews, presentations, meetups and
everything else. Your efforts are very much appreciated!

[1.17]: https://community.theforeman.org/t/foreman-1-17-0-released/8824
[k_3_6]: https://community.theforeman.org/t/katello-3-6-rc2-now-available/8638

[issues]: http://projects.theforeman.org/issues
[k_issues]: http://projects.theforeman.org/projects/katello/issues

[ha-proxy]: https://community.theforeman.org/t/user-survey-supporting-ha-smart-proxies/8832
