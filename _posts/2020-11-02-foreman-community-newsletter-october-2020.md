---
layout: post
title: Foreman Community Newsletter (October 2020)
date: 2020-11-02 11:24:52
author: Foreman
tags:
- foreman
---

Thanks to everyone who asked and answered questions, opened issues, and made the Foreman Community a hive of activity over the last month. Here is a summary of some of the major events, contributions, and requests for feedback over the last month. Special thanks to [@gryan](https://community.theforeman.org/u/gryan), [@evgeni](https://community.theforeman.org/u/evgeni), [@maximilian](https://community.theforeman.org/u/maximilian), [@dirk](https://community.theforeman.org/u/dirk/), and [@thulium-drake](https://community.theforeman.org/u/thulium-drake) for their contributions and blogs this month!

<!--more-->


## Upcoming Event: ForemanCon

Under normal circumstances, contributors to the Foreman project would have had a number of opportunities to meet in person this year. To make up for the lost in-person opportunities, on November 10 & 11, we are hosting two days of open sessions that are focused on contributors to the Foreman project. Some sessions might also be of interest to Foreman users, especially experienced users. All are welcome!

* [ForemanCon Day 1 Full Schedule](https://community.theforeman.org/t/foremancon-1/21109?u=mcorr)
* [ForemanCon Day 2 Full Schedule](https://community.theforeman.org/t/foremancon-2/21110?u=mcorr)

## Foreman 2.2.0 has been released!

This release contains over 140 bug fixes as well as new features. Among the [headline features](https://theforeman.org/manuals/2.2/index.html#Releasenotesfor2.2), there is an early version of the new host details page. We are hoping that the host detail redesign will help improve your experience managing hosts in Foreman. To do this, we need your feedback on these iterations, so please feel free to let us know your thoughts and [join the discussion](https://community.theforeman.org/t/host-details-page-redesign-survey/19399).

For more information, see the full [release announcement](https://community.theforeman.org/t/foreman-2-2-0-has-been-released/21067).

If you'd rather listen rather than read, [@tbrisker](https://community.theforeman.org/u/tbrisker) gives a succinct overview of the release at the last community demo:

<iframe width="560" height="315" src="https://www.youtube.com/embed/1eDmt-JN4ZQ?start=79" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## Katello 3.17 RC2 is now ready for testing

The Katello team are making a lot of progress with 3.17. This release candidate contains a significant number of [bug fixes](https://github.com/Katello/katello/blob/KATELLO-3.17/CHANGELOG.md#bug-fixes). Help test this release candidate to make Katello 3.17 as stable as possible.

For more information about how to help, check out the [release announcement](https://community.theforeman.org/t/katello-3-17-rc2-has-been-relased/21071?u=mcorr)


## Boltello - Using Puppet Bolt to manage Foreman

[@gryan](https://community.theforeman.org/u/gryan) gave us all a pleasant surprise this month by sharing his personal project Boltello, which uses Puppet Bolt to create a completely Hiera-driven, enterprise-like installation of open source Puppet, with all the preconfigurions of, for example, the Foreman web UI and ENC, Katello packaging management, Hiera, r10k and Foreman REX integration. If you're a Puppet user, [check it out](https://community.theforeman.org/t/boltello-requesting-feedback/20782?u=mcorr
) and let us know what you think.


## How to write a new Foreman Ansible module in 20 lines of code

If it wasn't enough that [@evgeni](https://community.theforeman.org/u/evgeni) created another Foreman Ansible module, he has also used the creation of this module to show *how* he wrote the Ansible module, so you can too! You can read all about it in this [blog](https://theforeman.org/2020/10/how-to-write-a-new-foreman-ansible-module-in-20-lines-of-code.html)


## Foreman Ansible modules - Foreman config as code

There was great excitement when community member [@thulium-drake](https://community.theforeman.org/u/thulium-drake) showed us how he has been using the Foreman Ansible collection to apply infrastructure as code principles to Foreman. You can [read more about it](https://theforeman.org/2020/10/foreman-config-as-code.html) and let us know what you think!  

## Feedback wanted! The Installation Paths we support as a project

[@ehelms](https://community.theforeman.org/u/ehelms) is requesting feedback to help narrow the set of supported paths to enable developers to focus on making those paths more robust, and build new features while working to support the most popular methods that users use today. Please read [@ehelm's post](https://community.theforeman.org/t/feedback-wanted-the-installation-paths-we-support-as-a-project/21038?u=mcorr) and let us know which paths matter to you.

## Optimized Reports Storage

[@lzap](https://community.theforeman.org/u/lzap) adds further thoughts to the [optimized reports storage](https://community.theforeman.org/t/rfc-optimized-reports-storage/15573/21?u=mcorr). You can watch [@lzap](https://community.theforeman.org/u/lzap) discuss this on the Foreman Community Demo. Please let us know your thoughts:

<iframe width="560" height="315" src="https://www.youtube.com/embed/1eDmt-JN4ZQ?start=2178" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## UX Progress Tracker and Foreman UX Meetups

[@Laviro](https://community.theforeman.org/u/laviro/summary) has added a [UX roadmap wiki](https://community.theforeman.org/t/ux-roadmap-for-foreman-2-4/21124?u=mcorr) to track efforts to improve Foreman UX. This will be updated as tasks progress, so if you're interested, keep an eye.

There are fortnightly meetings for anyone interested in Foreman UX. Here are the meetings scheduled for November:

* [UX Interest Group Meeting November 16th](https://community.theforeman.org/t/ux-interest-group-meeting/21126?u=mcorr)
* [UX Interest Group Meeting November 30th](https://community.theforeman.org/t/ux-interest-group-meeting-2/21127?u=mcorr)

## Foreman Infrastructure SIG

If you're interested, you can watch/listen to Foreman's October meeting of the Infrastructure SIG. We're always happy to welcome new faces, so please feel free to come along to the next meeting.

<iframe width="560" height="315" src="https://www.youtube.com/embed/PP_jnxAcRxE" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

Next meeting is scheduled for [November 17](https://community.theforeman.org/t/foreman-infrastructure-sig-meeting-nov-17/21129?u=mcorr). Add this to your calendar if you're interested!


## Professional Services working with the Foreman Community

As a follow up to last month's request, we had two guest blog posts, from [Netways](https://www.netways.de/en/) and [ATIX](https://atix.de/en/) outlining their involvement in the Foreman community. While Foreman is and will always be free and open source, and Foreman community members do all they can to answer questions and support one another, sometimes there are community members who do not have the basic Linux admin skillset to work independently with Foreman. If that is the case, there are many options available. Over the next month, some information about professional services will be added to the website. In the meantime, please checkout these guest blogs:

* [What does Netways do with Foreman?](https://theforeman.org/2020/10/what-does-netways-do-with-foreman.html)

* [ATIX in the Foreman Community](https://theforeman.org/2020/10/atix-in-the-foreman-community.html)

## Foreman Community Demo #85 & #86

Thank you to everyone who demoed their latest work and participated in the livestreams! You can rewatch the demoes in full or use the timestamps to watch specific demos:

* [Full lineup of Foreman Community Demo #85](https://community.theforeman.org/t/foreman-community-demo-85/20586?u=mcorr)

* [Full lineup of Foreman Community Demo #86](https://community.theforeman.org/t/foreman-community-demo-86/20803?u=mcorr)
