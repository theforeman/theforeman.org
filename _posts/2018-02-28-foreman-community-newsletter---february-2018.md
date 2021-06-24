---
layout: post
title: Foreman Community Newsletter - February 2018
date: 2018-02-28 12:43:00
author: Ori Rabin
tags:
- foreman
- newsletter
- community
excerpt: |
  1.17 RC1, Katello 3.5.1 & 3.6 RC1 and Lots of Deep dives!
---

Thank you to everyone that came to see us and especially those that gave
talks in FOSDEM and Config Management Camp!

### Foreman 1.17 RC1 out

The Foreman first Release Candidate for 1.17 was released two weeks ago.
This version finally has the vertical navigation you've seen in
the last few demos. See the [announcement][1.17-rc1] for installation details.

As ever, we'd be glad to get feedback and appreciate all the help with
testing and fixes! Please do continue to log the [bugs][issues] you
find in order to make this release better.

### Katello 3.5.1 released

Katello 3.5.1 is here! This version works with Foreman 1.16 and provides
features and bug fixes all around - installer, content views, API and more.
More details in the [announcement][k_3_5_1]. Please do [log][k_issues] any issues
you find with this.


### Katello 3.6 RC1 out

Katello 3.6 is available for testing! This version will work with Foreman 1.17.
This brings in a lot of features and bug fixes which can be seen in the
[change log][k_3_6_rc1]. Reporting of [bugs][k_issues] will be appreciated.

### Community survey 2018

The survey is still open. We have some nice responses and we want more!
Let's beat last years responses and help us shape the direction of the
project.

http://goo.gl/RNY8MY

### Upcoming Events

* Community Demo - 8th March (URL to be announced)

Time again for the latest round-up of action from the community, covering core,
proxies, plugins, and more.  As always, you're welcome to participate in the
show, either via YouTube Live chat, or via our IRC channel
(libera.chat/#theforeman).

* [Deep Dive - Foreman-Probing - 7th March](https://www.youtube.com/watch?v=-PYhFH7YraU)
In this deep dive we'll meet a new plugin, foreman-probing.
This plugin allows scanning networks and creating Hosts in Foreman for
the detected machines. Adam will describe the plugin's features, inner
working and possible usage for brownfield deployments.

* [Deep Dive - Telemetry in Foreman - 14th March](https://www.youtube.com/watch?v=QoJ-r8YfWEI)
Rails internal telemetry was recently added into Foreman Core, in this demo
Lukáš Zapletal is going to configure and show how to integrate Foreman with Prometheus.
The next part will cover all currently exported metrics, how to read them and utilize
for finding bottlenecks. In the last part, he is going to show how to add your own
telemetry data into core or plugins.

#### Community Demos / Deep Dives

* [UX review - Red Hat Repositories page - 12th Feb](https://www.youtube.com/watch?v=9o1X_Th5Tus)
This demo provided an in-depth look at the new Red Hat Repositories page.
A page that has been rewritten using React. It adds search and filtering capabilities
and brings that page inline with patternfly best practices.

* [Community Demo - 15th Feb](https://www.youtube.com/watch?v=romjVfktj6E)
This time we shared experiences from the latest conferences, 
showed our ansible integration updates, hammer improvements, 
changes and new features in remote execution, reports and searchable fields in the API.

_(All Foreman events are now available via the [Foreman Calendar](/events))_

### Blog posts

##### Running Foreman with PostgreSQL 9.6 from Software Collections
When deploying Foreman on CentOS 7, by default you get PostgreSQL 9.2
which is officially EOL upstream.
This [post][blog] shows how to deploy Foreman with PostgreSQL 9.6 from SoftwareCollections.org.


### Plugin news

#### Updated plugins:

- [foreman-ansible](https://github.com/theforeman/foreman_ansible) updated to 2.0.1
- [foreman_digitalocean](https://github.com/theforeman/foreman-digitalocean) updated to 1.3.0
- [foreman_remote_execution](https://github.com/theforeman/foreman_remote_execution) updated to 1.4.5
- [foreman-tasks](https://github.com/theforeman/foreman-tasks) updated to 0.11.1
- [hammer_cli](https://github.com/theforeman/hammer-cli) updated to 0.12.0
- [hammer_cli_foreman](https://github.com/theforeman/hammer-cli-foreman) updated to 0.12.0
- [hammer_cli_katello](https://github.com/Katello/hammer-cli-katello) updated to 0.12.0
- [smart_proxy_dhcp_infoblox](https://github.com/theforeman/smart_proxy_dhcp_infoblox) updated to 0.0.12

### Acknowledgements

Thanks to everyone who contributes to the Foreman community - patches, plugins,
testing, bug reports, translations, interviews, presentations, meetups and
everything else. Your efforts are very much appreciated!

[1.17-rc1]: https://community.theforeman.org/t/1-17-0-rc1-available/8341
[k_3_5_1]: https://community.theforeman.org/t/katello-3-5-1-a-k-a-schwarzbier-is-here/8392
[k_3_6_rc1]: https://community.theforeman.org/t/katello-3-6-0-rc1-available-for-testing/8389
[blog]: https://theforeman.org/2018/02/running-foreman-with-postgresql-96-from-software-collections.html

[issues]: http://projects.theforeman.org/issues
[k_issues]: http://projects.theforeman.org/projects/katello/issues

[hack_day]: https://www.eventbrite.com/e/foreman-construction-day-registration-41696943681
