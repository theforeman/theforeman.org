---
layout: post
title: Foreman Community Newsletter (February 2019)
date: 2019-02-26 09:30:18
author:
  name: Greg Sutcliffe
  uri: gwmngilfen
tags:
- foreman
- newsletter
- community
excerpt: |
  We're back! 2 months of goodies, including the 1.21 release, my departure as
  community lead, conference roundup, and RFCs that need your input!
---

Welcome back to the Foreman Newsletter! We kinda slipped up in January, sorry
about that, but we're back with 2 months of news, gossip, and releases for you!

### Changes in the community team

At the start of February, I made the difficult decision to step down as
community manager. It's been an honour and a delight to help shape this
community over the last few years, and to just be a part of it before that. You
can read more about my (our?) history in [the dedicated blog post][blog1]

We can't, however, leave the community without a community lead, and so there
has been some other changes to address this. I'm delighted to announce that Ori
Rabin is [taking over as community lead][blog2] and Rahul Bajaj is joining the
team, as well - [read his introduction post][blog3].

I'm certain that along with Tomer, the new community team is ready to take
Foreman on to bigger and better things!

[blog1]: https://theforeman.org/2019/02/stepping-down.html
[blog2]: https://theforeman.org/2019/02/introducing-the-new-community-team.html
[blog3]: https://theforeman.org/2019/02/introducing-myself.html

### 1.21 Released (and RCs for Katello 3.11 too)!

Work on 1.21 has been progressing steadily while we've all been away having fun
at conferences - credit to the release team for their dedication! As of *right
now* Foreman 1.21 is available, so get installing! This release brings the
Organizations and Locations feature to everyone, so please do check the upgrade
notes. You also get a new diff viewer and a *ton* of performance and stability
fixes.

As ever, let us know your experiences. If you find issues, please
do [report them][issues] or [discuss on the forum][forum]. Details can be found
in the [release announcement][1_21].

Alongside the Foreman release, the Katello team have also released the [first
release candidates][k_3_11_rc2] for the accompanying upgrade to Katello. We
need just as much help testing Katello as Foreman itself, so if you're a user
... well, you know the drill - do report [issues][k_issues] or again, head to
the forum.

[1_21]: https://community.theforeman.org/t/foreman-1-21-0-has-been-released/13066
[k_3_11_rc2]: https://community.theforeman.org/t/katello-3-11-rc2-is-now-available/12787

As ever, many thanks to the contributors to these releases - coders, RC testers,
documentation writers, and bug/feature reporters. Foreman wouldn't be what it
is without you!

### Foreman 1.20.2 bug fix release

In addition to the work on 1.21 we do of course maintain the stable version,
and the next release of 1.20 is [now available][1_20_2]. This contains fixes
for 16 issues found in the 1.20.1 release, mostly related to the templating
engine rewrite and packaging. 

[1_20_2]: https://community.theforeman.org/t/foreman-1-20-2-has-been-released/12884

### Notable RFCs

Marek has a proposal for a different way to install and maintain Foreman:

* https://community.theforeman.org/t/rfc-make-foreman-easy-to-deploy-and-maintain/12804

Also, Tomer would like to know if anyone is using our ARM package builds for
Foreman - you can chime in here:

* https://community.theforeman.org/t/dropping-arm-packages/12941

### Conference roundup

As ever, Foreman was present at DevConf.CZ, FOSDEM, and CfgMgmtCamp this year,
and as usual had a hackday in Gent as well. This year was as busy as ever, with
lots of traffic at the booths, lots of hats given out (wow, they were popular
in the Brussels snowstorm...), and a great set of talks in our track at
CfgMgmtCamp. This year was also notable for the increased number of talks about
Foreman (or dependencies like Obal) that we had in other tracks.

The dinner and the hackday were notable successes this year, with both getting
over 30 people attending. It's wonderful to see the community growing
year-on-year - keep it going!

### Community Survey analysis coming soon

Thanks to everyone who filled out this year's community survey - we have now
closed the form. We had 117 replies, which is a little down on last year, but
still more than enough to work with. As usual, I have a dedicated blog post out
for the analysis once I'm done with it.

### [Upcoming Events](https://community.theforeman.org/c/events/l/calendar)

All Foreman events are available via [the forum
calendar](https://community.theforeman.org/calendar) - hit the Subscribe button
(which will give you an ICS link). You can also use the "Add To Calendar" button
on specific events if you don't wish to import the whole thing.

* [Community Demo #58](https://community.theforeman.org/t/foreman-community-demo-58)

All the usual goodness from the community, rounded up and presented for your viewing pleasure.

* [Deep Dive on Katello and Ansible Modules, 28th Feb](https://community.theforeman.org/t/deep-dive-katello-meets-ansible-an-introduction-to-forklift-and-foreman-ansible-modules/13009)

Wim gave a great talk at CfgMgmtCamp about this, and he's agreed to repeat it
for us on our channel! Here's his abstract:

Management of Katello can be challenging: there are just so many components
to take care of! Configuration is often changed manually (via the webui or
using hammer), and I wanted to investigate if its possible to apply a
‘regular config management’ workflow to Katello. Using cloud-init, forklift
and foreman-ansible-modules, we’re able to quickly spawn up a fully
customized Katello instance (and schedule regular executions of the
playbooks using AWX)

* [March Ruby Pune Meetup, 2nd Mar, Pune](https://community.theforeman.org/t/march-ruby-pune-meetup/12977)

Pune Ruby Meetup consists of a group of enthusiastic and creative Rubyists.
Rahul and Aditi from the Foreman community will both be there so this is a good
chance to do some contributing, especially if you're new to it!

* [Foreman Meetup, 23rd Mar, Pune](https://community.theforeman.org/t/foreman-meetup-time-for-your-first-open-source-contribution/13012)

Newcomer to Foreman, wanting some getting started help? Maybe looking for some
tips to get the best out of your existing install? Or perhaps wanting to start
contributing? This is the place :)

#### [Past Events](https://community.theforeman.org/c/events/l/latest)

* [First steps in provisioning with Foreman & Katello](https://community.theforeman.org/t/live-debugging-with-gwmngilfen-and-mason/12921)

New Foreman user @mason and myself grabbed some time to look at Foreman &
Katello from the perspective of a new user. We covered getting provisioning
working (and the *long* list of things you have to check if it's not working),
applying Puppet classes, and architectural design such as the intentions behind
the Foreman Proxy, where the responsibilities of Puppet and Foreman align, and
more. It's long, but well worth a watch!

* [Community Demo #55](https://community.theforeman.org/t/foreman-community-demo-55)

Updates on settings being dropped in 1.21, raw script output in REX, and an
*awesome* new diff viewer for config reports!

* [Community Demo #56](https://community.theforeman.org/t/foreman-community-demo-56)

Lukas introduces us to the new Foreman Proxy v2 "capabilities" API, which is
going to be really powerful in the future!

* [Community Demo #57](https://community.theforeman.org/t/foreman-community-demo-57)

Myself and Tomer repeat the "State of the Community" talk from CfgMgmgtCamp,
where we discuss the year to date, and the plans for the future. I also give my
closing thoughts on 4 years as the Community Lead.

### Plugin news

Updated plugins:
- [foreman_ansible](https://github.com/theforeman/foreman_ansible) updated to 2.3.1
- [foreman_discovery](https://github.com/theforeman/foreman_discovery) updated to 14.0.1
- [foreman_maintain](https://github.com/theforeman/foreman_maintain) updated to 0.3.1
- [foreman_openscap](https://github.com/theforeman/foreman_openscap) updated to 0.11.4
- [foreman_ovirt_provisioning_plugin](https://github.com/theforeman/ovirt_provision_plugin) updated to 2.0.3
- [foreman_remote_execution](https://github.com/theforeman/foreman_remote_execution) updated to 1.7.0
- [foreman_scc_manager](https://github.com/ATIX-AG/foreman_scc_manager) updated to 1.6.0
- [foreman_tasks](https://github.com/theforeman/foreman-tasks) updated to 0.15.0
- [foreman_virt_who_configure](https://github.com/theforeman/virt_who_configure) updated to 0.3.2
- [foreman_wreckingball](https://github.com/dm-drogeriemarkt/foreman_wreckingball) updated to 3.2.0
- [foreman-xen](https://github.com/theforeman/foreman-xen) updated to 0.7.1
- [hammer_cli_foreman](https://github.com/theforeman/hammer-cli-foreman-ansible) updated to 0.1.2
- [hammer_cli_foreman](https://github.com/theforeman/hammer-cli-foreman) updated to 0.16.0
- [hammer_cli](https://github.com/theforeman/hammer-cli) updated to 0.16.0
- [hammer_cli_katello](https://github.com/Katello/hammer-cli-katello) updated to 0.18
- [katello-host-tools](https://github.com/Katello/katello-host-tools) updated to 3.4.2

### Acknowledgements

Thanks to everyone who contributes to the Foreman community - patches, plugins,
testing, bug reports, translations, interviews, presentations, meetups and
everything else. Your efforts are very much appreciated!

[issues]: https://projects.theforeman.org/
[k_issues]: http://projects.theforeman.org/projects/katello/
