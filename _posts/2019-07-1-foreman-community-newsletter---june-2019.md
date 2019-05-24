---
layout: post
title: Foreman Community Newsletter (June 2019)
date: 2019-07-1 13:10:18
author:
 name: Rahul Bajaj
 uri: rabajaj_
tags:
- foreman
- newsletter
- community
excerpt: |
 We're back! 3 months of goodies, including the 1.22 release, my new beginning as
 community lead, conference roundup, and community survey results!
---

Welcome back to the Foreman Newsletter! We kinda slipped up in May, sorry
about that, but we're back with 3 months of news, gossip, and releases for you!

### Joining the community team

At the start of March, I made a decision to join the Foreman community team.
I have been running the community demos on youtube as you might have already
heard and recently I have been working with the community to get the foreman
documentation more structured and readable. I will speak more about about the documentation efforts in the upcoming demos and blog to keep you updated on the progress. The most exciting of these tasks is the "Did you know?" series of tweets that I will start from next week, so if you havn't yet followed @ForemanProject on twitter, you might want to do that now! Enough about my work, lets see what we missed in the recent 3 months.

### 1.22.0 is out! (and Katello 3.12 is out too)!

Work on [1.22][1_22] has been rolling on throughout the last couple of months, and it's
finally out now! This release brings type support in Parameters,
various compute resource libraries update, fixing the broken Google Compute
Resource, Graphql API and Smart Proxy Exposed Capabilities and Settings. Read the
[release notes][release_notes] to know more about the new features and *ton* of fixes done in this release.

We had a test week kindly organized by [Lukas][lzap] in the
simillar fashion as done in the previous release. We couldn't do this without
the testing we get from the community, so thanks very much to you all!

[1_22]: https://community.theforeman.org/t/foreman-1-22-0-rc2-has-been-released/14064
[release_notes]: https://theforeman.org/manuals/1.22/index.html#Releasenotesfor1.22
[lzap]: https://github.com/lzap

As ever, many thanks to the contributors to these releases - coders, RC testers,
documentation writers, and bug/feature reporters. Foreman wouldn't be what it
is without you!

### Conference roundup

As ever, Foreman was present at Red Hat Summit this year,
and as usual the Foreman/Pulp booth looked incredibly busy every time the expo
area open. The talks by Tomer and Ewoud were well received. As Tomer
mentioned in the community demo, a lot of questions were asked around Ansible
integration, working of foreman with Ansible Tower, Remote execution and also
acknowledged the improvements to content view publishing, better UX for repos
and audit. Sounds like good news to us! All the work that we have been putting
in is being noticed :)

Not to forget, we had the very awesome yellow Foreman hats distributed at the Foreman
booth. Thanks to Tomer and Ori for handling the design and shipment of the goodies.

### Community Survey analysis is now out

Thanks to everyone who filled out this year's community survey - we have now
the analysis of the report that was prepared by Greg. We had 116 replies, which is a
little down from last year, but still more than enough data to work with. As promised, Greg has written us a blog, which you can read [here][gregs_blog].

[gregs_blog]: https://theforeman.org/2015/02/foreman-community-survey-results.html

### [Foreman Birthday Party](https://community.theforeman.org/t/foreman-birthday-party/13731)

It's Foreman's 10th birthday soon! On 15th July, 2009, [Ohad Levy](https://github.com/ohadlevy) created an empty Rails project and then named it as the Foreman project. Since then Foreman gives system administrators the power to easily automate tasks and manage the lifecycle of thier servers effectively. To know all the great stories about this project and where it is leading, attend the Foreman Birthday Party on July 25th, 2019. Save the date for the  Foreman’s 10th Birthday Party organized by NETWAYS, ATIX, and the Foreman Project!

### [More Upcoming Events](https://community.theforeman.org/c/events/l/calendar)

All Foreman events are available via [the forum
calendar](https://community.theforeman.org/calendar) - hit the Subscribe button
(which will give you an ICS link). You can also use the "Add To Calendar" button
on specific events if you don't wish to import the whole thing.

* [Community Demo #64](https://community.theforeman.org/t/foreman-community-demo-64)

Every few weeks we host a Community Demo to showcase new & interesting developments from the Foreman community. We encourage participation from any member of the community (although you do need a Google account), so if you’ve been working on something cool, please do come show it off.

#### [Past Events](https://community.theforeman.org/c/events/l/latest)

* [OpenExpo Europe](https://community.theforeman.org/t/openexpo-europe/13467)

Tomer gave a talk about “Hybrid cloud management with Foreman” at the conference.
He spoke about some of the main features of Foreman, and how you can leverage it to simplify and unify your datacenter management.

* [Foreman Meetup: Time for your first Open Source Contribution](https://community.theforeman.org/t/foreman-meetup-time-for-your-first-open-source-contribution/13012)

This meetup was focused towards new-commers to join the community. It was mostly around the
Foreman documentation followed by a discussion around how we can make it better as a community. We did have @lzap, at the meetup as he was in Pune at the same time, to speak about the importance and history of open source!

* [Foreman templates UI](https://community.theforeman.org/t/foreman-templates-ui-deep-dive/13116)

@Ondrej_Prazak was kind enough to educate the community about the long awaited deep
dive about foreman templates and the new UI for the plugin. He described in brief about
the plugin after which he also mentioned the plan to support the current workflows with the new UI. Feel free to checkout his [pull request](https://github.com/theforeman/foreman_templates/pull/109) and leave your thought/comments on it.

* [Redesigning the javascript stack](https://community.theforeman.org/t/deep-dive-rfc-redesigning-the-javascript-stack/13629)

@sharvit had spoken about the various issues that one faces with the current Javascipt
stack. His deep drive basically explains the need of having to restructure the Javascript
stack altogether. Good part about his deep drive was that he not only pointed out the issues
with the old Javascript stack but also provided a solutions for the same. One can read his
thoughts on the [forum](https://community.theforeman.org/t/redesigning-the-javascript-stack/13470)

* [Community Demo #58](https://community.theforeman.org/t/foreman-community-demo-58)

Hosting the community demo for the first time, I could not be more overwhelmed to have about
seven talks for the demo. The demo illustates few of the highlighted features of foreman 1.22.0 like global parameters with types and GraphQL console.

* [Community Demo #59](https://community.theforeman.org/t/foreman-community-demo-59)

Finally! we have the result of the Foreman community survey. @Gwmngilfen demostated his skill in terms of graphs and bars to display results of the survey.

* [Community Demo #60](https://community.theforeman.org/t/foreman-community-demo-60)

@kgaikwad was kind enough to educate us with the working of GCE provisioning while we had @lzap to talk about the unattended action issues that were bugging him. Few more detailed updates by @Gwmngilfen about the community survey. I guess it is time to use the data from the demo and make some decisions about them! If you have any comments or concerns about the
survey please reach out to me!

* [Community Demo #61](https://community.theforeman.org/t/foreman-community-demo-61)

Woah! finally we have Foreman appearance at Red Hat summit again. Tomer spoke about the
presence of Foreman project at the community booth at the summit. Also, @Ondrej_Prazak, one of our most consistant speakers at the community demo, spoke about the Openscap deployment by Ansible. Till then it Openscap deployment was only possible though puppet but now we know, we can do it through Ansible too!


### Plugin news

Updated plugins:
- [foreman_ansible](https://github.com/theforeman/foreman_ansible) updated to 3.0.3
- [foreman_discovery](https://github.com/theforeman/foreman_discovery) updated to 15.0.0
- [foreman_maintain](https://github.com/theforeman/foreman_maintain) updated to 0.4.3
- [foreman_openscap](https://github.com/theforeman/foreman_openscap) updated to 1.0.3
- [foreman_remote_execution](https://github.com/theforeman/foreman_remote_execution) updated to 1.8.1
- [foreman_scc_manager](https://github.com/ATIX-AG/foreman_scc_manager) updated to 1.6.2
- [foreman_tasks](https://github.com/theforeman/foreman-tasks) updated to 0.15.6
- [foreman_virt_who_configure](https://github.com/theforeman/foreman_virt_who_configure) updated to 0.4.1
- [foreman_wreckingball](https://github.com/dm-drogeriemarkt/foreman_wreckingball) updated to 3.4.0
- [hammer_cli_foreman](https://github.com/theforeman/hammer-cli-foreman-ansible) updated to 0.3.0
- [hammer_cli_foreman](https://github.com/theforeman/hammer-cli-foreman) updated to 0.17.0
- [hammer_cli](https://github.com/theforeman/hammer-cli) updated to 0.17.1
- [hammer_cli_katello](https://github.com/Katello/hammer-cli-katello) updated to 0.18
- [katello-host-tools](https://github.com/Katello/katello-host-tools) updated to 3.5.1

### Acknowledgements

Thanks to everyone who contributes to the Foreman community - patches, plugins,
testing, bug reports, translations, interviews, presentations, meetups and
everything else. Your efforts are very much appreciated!


