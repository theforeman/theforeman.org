---
layout: post
title: Foreman Community Newsletter - April 2017
date: 2017-04-30 15:50:34
author: Greg Sutcliffe
tags:
- foreman
- newsletter
- community
excerpt: |
  1.15 RC2 is out, 1.14.3 bugfixes, Foreman at Red Hat Summit, and more!
---

Welcome again to another edition of the Foreman Community Newsletter. Step right
this way for all the latest information...!

### Foreman 1.15 RC1 & 2 out for testing

The Foreman 1.15 Release Candidates have been going strong, and [1.15-RC2][rc2] was
out just this week. If you want to get an early look at all the upcoming
features (such as an entirely new notification system, SSH key management for
users, and much more) then jump in and get involved with testing the RCs.

As ever, we rely on you guys to test the release candidates (and *so* many of
you do, thanks!), and again we're seeing that participation bearing fruit.
Please do continue to log the [bugs][issues] you find in the RCs so that we can
ensure the 1.15 release is as smooth as possible.

### 1.14.3 Bugfix release

Foreman 1.14.3 bugfix release was published on [April 4th][1_14_3], containing
eleven fixes for a variety of issues across the API, UI, Installer and so on.
Thanks, as always, to the reporters, developers, and reviewers for the fixes!

### Katello 3.4 RC1 & 2 available

In tandem with the 1.15 Release Candidates for Foreman Core, the Katello 3.4
Release Candidates are also available. See the [release
announcement][k3_4_rc2]. As ever, we value the testing, and if you hit any
issues, please to raise a bug on the [Katello tracker][k_issues].

### Debian 9 (Stretch) support lands in nightly

Thanks to the hard work of the packaging team (mostly @mmoll!) packages for
Debian 9 (Stretch) are now available in nightly, and feedback on how well they
work for people is welcome. If you do test, please be aware that MySQL support
is currently not functional as the `puppetlabs-mysql` module is awaiting a new
release; PostgreSQL and SQLite should both work fine.

#### Upcoming Events

* [Deep Dive - Monitoring with Foreman](https://www.youtube.com/watch?v=-w9f5xEPki0) - 3pm Thu 4th May

Foreman already manages most of the lifecycle of your servers. To really put a
server into production, it's considered good practice to use automated
monitoring to alert you whenever something doesn't behave like it should. In
this deep dive, Timo Goebel and Dirk Goetz will show off the new Foreman and
SmartProxy monitoring plugin's allow an administrator to connect Foreman and
the monitoring solution Icinga 2.

* [Foreman Community Demo - 11th May](https://youtube.com/+foreman) - 3pm Thu 11th May

Every 3 weeks we get together to take a look at what's been happening in the
Foreman community, and you're always welcome to join us live on YouTube to get
involved, ask questions, and make your views known. The next demo will be May
11th, so we'll see you then!

#### Community Demos

* [Community Ask Me Anything - 20th April](https://www.youtube.com/watch?v=0sl4HgMzgio)

For this community 'demo' we decided to turn the tables and ask the community
what it wanted to hear about. We grabbed a panel of devs and had a chat
covering a wide range of topics, so check it out! Do let [me][email] know if
you'd like to see more of this style of content!

_(All Foreman events are now available via the [Foreman Calendar](/events))_

### Updated plugins

Updated plugins:

- [foreman_discovery](https://github.com/theforeman/foreman_discovery) updated to 9.0.0
- [foreman_expire_hosts](https://github.com/theforeman/foreman_expire_hosts) updated to 3.0.0
- [foreman_monitoring](https://github.com/theforeman/foreman_monitoring) updated to 0.1.0
- [foreman_openscap](https://github.com/theforeman/foreman_openscap) updated to 0.7.1
- [foreman_remote_execution](https://github.com/theforeman/foreman_remote_execution) updated to 1.3.0
- [foreman_templates](https://github.com/theforeman/foreman_templates) updated to 5.0.0
- [hammer_cli_foreman](https://github.com/theforeman/hammer-cli-foreman) updated to 0.10.1
- [hammer_cli](https://github.com/theforeman/hammer-cli) updated to 0.10.1
- [kafo](https://github.com/theforeman/kafo) updated to 2.0.1
- [puppetdb_foreman](https://github.com/theforeman/puppetdb_foreman) updated to 3.0.2

### Acknowledgements

Thanks to everyone who contributes to the Foreman community - patches, plugins,
testing, bug reports, translations, interviews, presentations, meet ups and
everything else. Your efforts are very much appreciated!

[rc2]: https://groups.google.com/d/topic/foreman-announce/yLXm6SxZnAU
[1_14_3]: https://groups.google.com/d/topic/foreman-announce/etCgQjfK7MU
[k3_4_rc2]: https://groups.google.com/d/topic/foreman-users/pZ9FXGQUKmI
[issues]: http://projects.theforeman.org/issues
[k_issues]: http://projects.theforeman.org/projects/katello/issues
[email]: mailto:greg.sutcliffe@gmail.com
