---
layout: post
title: Foreman Community Newsletter (May 2019)
date: 2019-05-20 09:30:18
author:
 name: Rahul Bajaj
 uri: rabajaj_
tags:
- foreman
- newsletter
- community
excerpt: |
 We're back! 2 months of goodies, including the 1.22 release, my new beginning as
 community lead, conference roundup, and community survey results!
---

Welcome back to the Foreman Newsletter! We kinda slipped up in May, sorry
about that, but we're back with 2 months of news, gossip, and releases for you!

### Joining the community team

At the start of March, I made a decision to join th Foreman community team.
I have been running the community demos on youtube as you might have already
heard and recently I have been working with the community to get the foreman
documentation more structured and readable. I would speak more about it in the
upcoming demos and blog about it to keep you updated on its progress. Too
much about my work, lets see what we missed in the recent 2 months.

### 1.22.0 - RC1 is ready for testing! (and RCs for Katello 3.12 too)!

Work on 1.22 has been rolling on throughout the last couple of months, and it's
time once again to ask you all to do some testing with us! 1.22 RC1 was
released [a week ago][1_22_rc1]. This brings a type support in Parameters,
various compute resource libraries update, fixing the broken Google Compute
Resource, Graphql API and Smart Proxy Exposed Capabilities and Settings. Read the
[release notes][release_notes] to know more about the new features and *ton* of fixes done in this
release.
We've just released [1.22.0 RC2][1_22_rc2] for round of testing, so give
it a spin and let us know how you get on - and do [report issues][issues] as
you find them! We also had a test week kindly organized by Lukas[lzap] in the
simillar fashion as done in the previous release. We couldn't do this without
the testing we get from the community, so thanks very much to you all!

[1_22_rc1]: https://community.theforeman.org/t/foreman-1-22-0-rc1-is-ready-for-testing/13766
[issues]: https://projects.theforeman.org/projects/foreman/issues
[release_notes]: https://theforeman.org/manuals/1.22/index.html#Releasenotesfor1.22

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
little down on last year, but still more than enough data to work with. As promised, Greg has
written us a [blog](https://theforeman.org/2019/05/2019-foreman-survey-analysis.html) on the
data recieved from the community survey :)

To get an complete overview of the survey you can watch the survey analysis explained by
Greg at the [Foreman Community Demo](https://youtu.be/2a2sjVFyqTQ?t=1482).

Few of the key points from the survey were:

1) New contributors to the Foreman community have almost doubled since the last year, thats a great news!
2) Forum has been a the most common mode of discussion in the community.
3) A drop is seen in the use of Debian as a Operating System used for Foreman installation
whereas we see a hike in the Centos user base.
4) We asked a question to the community wherein we displayed four different login screens and asked
for which one looked the best and as you can see the Foreman login page is change to the one which
was the favored by the community :)

### [Upcoming Events](https://community.theforeman.org/c/events/l/calendar)

All Foreman events are available via [the forum
calendar](https://community.theforeman.org/calendar) - hit the Subscribe button
(which will give you an ICS link). You can also use the "Add To Calendar" button
on specific events if you don't wish to import the whole thing.

* [Forman Birthday Event](https://community.theforeman.org/t/foreman-birthday-party/13731)

Since 10 years Foreman gives system administrators the power to easily automate repetitive tasks, quickly deploy applications, and proactively manage servers. It’s time to provision your travel luggage and configure your calendars to alert you on July 25, 2019! Save the date for the 10th Foreman Birthday Party organized by NETWAYS, ATIX and the Foreman Project! Find more information/updates on the event in this
[blog](https://www.netways.de/blog/2019/05/22/10th-foreman-birthday-event/?utm_content=buffer4787f&utm_medium=social&utm_source=twitter.com&utm_campaign=buffer).

* [OpenExpo Europe](https://community.theforeman.org/t/openexpo-europe/13467)

Tomer will be giving a talk about “Hybrid cloud management with Foreman” at the conference.
He will be talking about some of the main features of Foreman, and how you can leverage it to simplify and unify your datacenter management. All the best Tomer :)

* [Puppet Contributor Summit](https://community.theforeman.org/t/puppet-contributor-summit/13985)

The puppet contributor summit is on its way this year in the month of June. It majorly
focusses on the discussions  around the present and the future of Puppet projects. Btw, if
you plan on attending the conference, then dont forget to use the discount code `theForeman50` to get 50% off :slight_smile:

#### [Past Events](https://community.theforeman.org/c/events/l/latest)

* [Foreman Meetup: Time for your first Open Source Contribution](https://community.theforeman.org/t/foreman-meetup-time-for-your-first-open-source-contribution/13012)

This meetup was focused towards new-commers to join the community. It was mostly around the
Foreman documentation followed by a discussion around how we can make it better as a community. We did have @lzap, at the meetup as he was in Pune at the same time, to speak about the importance and history of open source! s

* [Foreman templates UI](https://community.theforeman.org/t/foreman-templates-ui-deep-dive/13116)

@Ondrej_Prazak was kind enough to educate the community about the long awaited deep
drive about foreman templates and the new UI for the plugin. He described in brief about
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
- [foreman_ansible](https://github.com/theforeman/foreman_ansible) updated to 3.0.2
- [foreman_discovery](https://github.com/theforeman/foreman_discovery) updated to 15.0
- [foreman_maintain](https://github.com/theforeman/foreman_maintain) updated to 0.4.2
- [foreman_openscap](https://github.com/theforeman/foreman_openscap) updated to 1.0.1
- [foreman_remote_execution](https://github.com/theforeman/foreman_remote_execution) updated to 1.8.0
- [foreman_scc_manager](https://github.com/ATIX-AG/foreman_scc_manager) updated to 1.6.2
- [foreman_tasks](https://github.com/theforeman/foreman-tasks) updated to 0.15.5
- [foreman_virt_who_configure](https://github.com/theforeman/foreman_virt_who_configure) updated to 0.4.1
- [foreman_wreckingball](https://github.com/dm-drogeriemarkt/foreman_wreckingball) updated to 3.4.0
- [hammer_cli_foreman](https://github.com/theforeman/hammer-cli-foreman-ansible) updated to 0.3.0
- [hammer_cli_foreman](https://github.com/theforeman/hammer-cli-foreman) updated to 0.18.0
- [hammer_cli](https://github.com/theforeman/hammer-cli) updated to 0.18.0
- [hammer_cli_katello](https://github.com/Katello/hammer-cli-katello) updated to 0.19
- [katello-host-tools](https://github.com/Katello/katello-host-tools) updated to 3.5.0

### Acknowledgements

Thanks to everyone who contributes to the Foreman community - patches, plugins,
testing, bug reports, translations, interviews, presentations, meetups and
everything else. Your efforts are very much appreciated!


