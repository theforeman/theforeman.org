---
layout: post
title: Foreman Community Newsletter (August 2021)
date: 2021-09-01 10:00:44
author: Melanie Corr
tags:
- newsletter
---

Release candidates, design proposals, some nice new scripts for task maintenance, and much more!

<!--more-->

If you want to keep the Spice Girls safely in the 90's where they belong, complete the [Foreman Community Survey](https://www.surveymonkey.co.uk/r/T526T3G).

<blockquote class="twitter-tweet" data-partner="tweetdeck"><p lang="en" dir="ltr">Tell us what you think, what you really, really think! 🎶 <a href="https://t.co/Qwj83WWu51">https://t.co/Qwj83WWu51</a> <a href="https://t.co/WYDo4tWvNL">pic.twitter.com/WYDo4tWvNL</a></p>&mdash; Evgeni Golov (@zhenech) <a href="https://twitter.com/zhenech/status/1431261504024813569?ref_src=twsrc%5Etfw">August 27, 2021</a></blockquote>
<script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>



## Debian/Ubuntu users: Upgrade Ansible and Remote Execution plugins on 2.5

If you have installed Foreman 2.5 on Debian/Ubuntu systems, unfortunately, some action is required. Packages were released with the wrong version numbers. For more information about how to fix this, see [[Action Required: Debian/Ubuntu] Upgrade Ansible and Remote Execution plugins on 2.5](https://theforeman.org/2021/08/please-manually-upgrade-ansible-and-remote-execution-plugins-on-25.html).


## Release Candidates

### Foreman 3.0 RC 2

Foreman 3.0 has been branched and a second release candidate is available for testing. There are substantial changes afoot in this release, with the completion of the Puppet extraction from Foreman core. If you use Puppet, take a look at [Puppet in 3.0 release](https://community.theforeman.org/t/puppet-in-3-0-release/24429) so you can better understand what this means and what lies ahead for you.

Help make this release as stable as possible by evaluating the release candidate. For more information, see [@upadhyeammit](https://community.theforeman.org/u/upadhyeammit) [release announcement](https://community.theforeman.org/t/foreman-3-0-0-rc2-is-available-for-testing/25055)



### Katello 4.2 RC1

The first release candidate for Katello 4.2 became available last week. There are a number of  features coming with this release. You can find more information in the [changelog](https://github.com/Katello/katello/blob/KATELLO-4.2/CHANGELOG.md). Many of these features have been [demoed](https://theforeman.org/demos/2021.html#User-focusedDemos-Foreman&Katelloplugin) by the Katello team over the last while.

You can really help to improve the stability of the next release by testing this release candidate and letting us know how it works for you.

For more information about how you can evaluate the release candidate, see the [release announcement](https://community.theforeman.org/t/katello-4-2-0-rc1-is-ready-for-testing/24984?u=mcorr).

## Maintaining Foreman tasks with new interface scripts

In the most recent Foreman Community Demo, [@aruzicka](https://community.theforeman.org/u/aruzicka/summary) introduced a new solution to the old problem of maintaining tasks. Over the years, maintaining tasks in Foreman has been problematic and could lead to dangerous situations at times. Thankfully, [@aruzicka](https://community.theforeman.org/u/aruzicka/summary) has made things a lot easier. He has created an interface script that serves as an interface for rake. These scripts have now been [merged into master](https://github.com/theforeman/foreman-tasks/tree/master/extra) with cleanup and export scripts for Foreman tasks available in nightly builds.

You can hear [@aruzicka](https://community.theforeman.org/u/aruzicka/summary) talk about the history and demonstrate the advantages of using it:

<iframe width="560" height="315" src="https://www.youtube.com/embed/vAU1m-HUsig?start=1285" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## Redesigning Config Management Reports

The Foreman UX Interest group are working hard to redesign the Foreman web UI for config management reports (detail page) so that you have access to everything that's important to you and the best UX possible. We can't do this in isolation. [Take a look at the proposal](https://community.theforeman.org/t/rfc-reports-detail-page/24923).

## Rethinking Foreman's search input

[@marisvirik](https://community.theforeman.org/u/marisvirik/summary) is looking for your input on three proposed options to update the Foreman web UI with an improved search input. [The questionnaire](https://docs.google.com/forms/d/e/1FAIpQLSd_sx4AQquUKTKQnJZIHU00ZAySRnBj7-4pExcuRCcblZ0h7A/viewform) takes just a minute or two to complete. For a more in-depth overview of the options read [@marisvirik](https://community.theforeman.org/u/marisvirik/summary)'s [blog post](https://theforeman.org/2021/08/new_search_design_proposal_-_asking_for_feedback.html).

## Community Interest Groups

If you'd like to take a more active role in some aspect of Foreman, there are two special interest groups that meet regularly: [Infrastructure Special Interest Group](https://community.theforeman.org/c/development/infra/24) and [UX Interest Group](https://community.theforeman.org/tag/ux). Meetings are open to all and newcomers are always welcome.

Upcoming meetings will be added to our [community calendar](https://community.theforeman.org/c/events/13/l/calendar).

You're always welcome to introduce yourself and what you use Foreman for by creating a post in our [community](https://community.theforeman.org/c/community/22).

## Thank You!

Thank you to everyone who asked and answered questions, opened issues, and made the Foreman community a vibrant place to be over the last month!
