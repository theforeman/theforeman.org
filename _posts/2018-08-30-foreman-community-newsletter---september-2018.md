---
layout: post
title: Foreman Community Newsletter - September 2018
date: 2018-09-30 13:59:04
author:
  name: Greg Sutcliffe
  uri: gwmngilfen
tags:
- foreman
- newsletter
- community
excerpt: |
  1.18.2 and Katello 3.8, a CVE in Remote execution, new stats dashboard, and Hacktoberfest!
---

### Releases

Since 1.19.0 went out [right at the end of August][aug-news], it's a bit quiet
for releases just now. However, [1.18.2][1_18_2] has been released, containing
9 bug fixes for the 1.18 series. Do upgrade if you're still on 1.18!

Also, as mentioned in the previous newsletter, [Katello 3.8.0][k_3_8] was
indeed close to release - in fact, it was made available on Sep 6th! With ~50
improvements, and of course compatibility with Foreman 1.19, you'll want to get
that upgrade in as well.

As ever, many thanks to the contributors to these releases - coders, RC testers,
documentation writers, and bug/feature reporters. Foreman wouldn't be what it
is without you! If you do find issues with, please do [report them!][issues]

### [Critical Security issue in Remote Execution plugin][cve-forum]

If you use the Remote Execution plugin, you'll want to make sure you've seen
[CVE-2018-14643][cve-rex] and the associated [updates on the forum][cve-forum].
This is an **arbitrary code execution** flaw on hosts managed by Foreman, so
please do take this seriously.

Updates are available for the affected packages from Foreman 1.15+, see the
forum post for details.

### [RFCs for comment](https://community.theforeman.org/c/development/rfcs)

As usual, I like to call out some RFCs for wider attention. Here's this month's selection:

* [Replacing Foreman-hooks with something built in to core](https://community.theforeman.org/t/rfc-simple-callback-system-for-users/11242/4)
* [Adding a 'Managed' flag to the NIC overview](https://community.theforeman.org/t/rfc-add-managed-into-interface-overview/11230/3)
* [Using Puma as the default Smart-proxy web server](https://community.theforeman.org/t/rfc-add-puma-as-the-default-smart-proxy-server/10975/36)

In addition, I'll again mention the large set of RFCs regarding our approach to
making Foreman able to run in a (set of) container(s) - lots of good discussion
is happening here, but more voices are welcome. Start with the
[overview](https://community.theforeman.org/t/containerizing-the-foreman-ecosystem/10948)
and then dive into the details RFCs from there.

### [New Community stats dashboard][stats]

One of my long-term to-do items as community lead has been to create a metrics
dashboard that we can use to track various things that matter to us as a
community. That's been on the back burner for a while, but I've now had time to
get started on it. You can find the current version [here][stats].

The current version is somewhat alpha, and only covers:

* Total Open / Total Closed / Net Open bug (all projects or for one project)
* Open bugs by project / category / triage status
* Community demographics (age of Redmine account for people who created/commented on a bug in the last 6 months)

Already this helps us to see the state of the community, track it's evolution,
and hopefully focus on certain bug categories. I have more charts and
interactive tools in development - if you know the "R" language and would like
to help, I'm reachable [here][me] :)

### Hacktoberfest (via DigitalOcean and GitHub)

If you're looking for that extra incentive to get you contributing, it seems
that DigitalOcean & GitHub are again running a Hacktoberfest Event. You can get
the full details [over there](https://hacktoberfest.digitalocean.com/) but
essentially, 5 separate (and not spammy) PRs to *any* GitHub repos will count. So,
that means our repos too :). It appears they have 50,000 t-shirts to give away
to those who manage 5 PRs during the month of October. Get contributing!

### [Upcoming Events](https://community.theforeman.org/c/events/l/calendar)

All Foreman events are available via [the forum
calendar](https://community.theforeman.org/calendar) - hit the Subscribe button
(which will give you an ICS link). You can also use the Add To Calendar button
on specific events if you don't wish to import the whole thing.

Future community demos will now be created much further in advance, so you
should be able to keep up with upcoming demos there.

* [Community Demo #51](https://community.theforeman.org/t/foreman-community-demo-51)

All the usual goodness from the community, rounded up and presented for your viewing pleasure.

#### [Past Events](https://community.theforeman.org/c/events/l/latest)

* [Community Demo #50](https://community.theforeman.org/t/foreman-community-demo-50)

Hammer, Ansible variables, content changes, and a quick overview of the new
stats dashboard. Click the link to see the full agenda!

* [Open Source Automation Day](https://community.theforeman.org/t/open-source-automation-day/10318)

On October 16, 2018 the Open Source Automation Day of ATIX AG will take place
in the Mercedes-Benz Tower in Munich.

At one of Munich's largest open source conferences we offer you an appealing
program with lectures, live demos, talks and discussions. We focus on a mix of
business and technical topics. The focus here is on possibilities for the
simple and automatic operation of data centres. A special focus is on the
latest technologies.

* [Foreman TechDay - after OSAD](https://community.theforeman.org/t/foreman-techday-after-osad-event/10979)

We at ATIX think, that it’s a good time to hold a Foreman TechDay the day after
the OSAD conference in Munich. The Foreman TechDay is targeted at software
developers who already have knowledge of software development in Foreman or
similar solutions like Ansible module development. Feel free to add suggestions
for topics!

* [Open Source Summit, Europe](https://community.theforeman.org/t/open-source-summit-eu-2018-edinburgh-october/10081)

I'll be at OSS-EU on Oct 22-24th - I have two talks there in the community
track (which aren't really about Foreman, but about community work in general),
and I'll spend a lot of my time hanging out at the Red Hat stand. Come find me
if you want to chat! :)

### Plugin news

New Plugins:

* [Foreman M2](https://github.com/ianballou/foreman_m2)

Integration of the M2 (Malleable Metal as a Service) with Foreman. Check out the
[forum post](https://community.theforeman.org/t/rfc-bare-metal-provisioning-with-m2-in-foreman/10061)
for more details.

Updated plugins:
- [foreman_ansible](https://github.com/theforeman/foreman_ansible) updated to 2.2.9
- [foreman_chef](https://github.com/theforeman/foreman_chef) updated to 0.8.1
- [foreman_openscap](https://github.com/theforeman/foreman_openscap) updated to 0.10.3
- [foreman_remote_execution](https://github.com/theforeman/foreman_remote_execution) updated to 1.6.3
- [foreman_userdata](https://github.com/theforeman/foreman_userdata)to 0.1.0
- [hammer_cli_foreman_tasks](https://github.com/theforeman/hammer_cli_foreman_tasks) updated to 0.0.13
- [hammer_cli_foreman_templates](https://github.com/theforeman/hammer_cli_foreman_templates) updated to 0.1.2
- [hammer_cli_katello](https://github.com/Katello/hammer-cli-katello) updated to 0.14.1

### Acknowledgements

Thanks to everyone who contributes to the Foreman community - patches, plugins,
testing, bug reports, translations, interviews, presentations, meetups and
everything else. Your efforts are very much appreciated!

[1_18_2]: https://community.theforeman.org/t/foreman-1-18-2-has-been-released/11033/2
[k_3_8]: https://community.theforeman.org/t/katello-3-8-0-released/11014/2
[cve-rex]: https://access.redhat.com/security/cve/cve-2018-14643
[cve-forum]: https://community.theforeman.org/t/critical-security-issue-in-foreman-remote-execution-and-foreman-ansible/11184
[issues]: https://projects.theforeman.org/
[stats]: https://stats.theforeman.org
[me]: https://community.theforeman.org/u/gwmngilfen
[aug-news]: https://theforeman.org/2018/08/foreman-community-newsletter-august-2018.html
