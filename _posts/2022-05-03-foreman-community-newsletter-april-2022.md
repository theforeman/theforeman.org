---
layout: post
title: Foreman Community Newsletter April 2022
date: 2022-05-03
author: Melanie Corr
tags:
- Newsletter
---

EL7 deprecation and upgrade information, Foreman 3.3 release candidate updates, getting started with Foreman in 2022, and more!
<!--more-->

## EL7 Deprecation Update

Back in August 2021 [ekohl](https://community.theforeman.org/u/ekohl) published an initial discussion about [Deprecation plans for Foreman on EL7, Debian 10 and Ubuntu 18.04](https://community.theforeman.org/t/deprecation-plans-for-foreman-on-el7-debian-10-and-ubuntu-18-04/25008). Naturally, this is cause for concern for many community members and we hope to make the transition from EL 7 to EL 8 as smooth as possible.

Since the release of Katello 4.0, installations of Foreman/Katello on RHEL 8 have been fully supported. If you are planning a fresh installation of Foreman, it's best to start on EL8.

Regarding upgrading from EL7 to EL8 in-place to quote [evgeni](https://community.theforeman.org/u/evgeni):


>1. backup and restore is tested and supported. if it doesn’t work for you it’s a bug we have to fix.
>2. the migration using leapp...upgrades your system in-place. No data movement whatsoever.

At FOSDEM 2022, [evgeni](https://community.theforeman.org/u/evgeni) in his talk [Migrating Foreman/Katello from EL7 to EL8 using LEAPP/ELevate](https://fosdem.org/2022/schedule/event/foreman_katello_leapp_elevate/) outlined the in-place upgrade path using LEAPP or ELevate. A written tutorial for this procedure is currently in draft PR and will be published on our blog soon. Work is also in progress to add this procedure to the official documentation in the coming days also.

Foreman's release manager [upadhyeammit](https://community.theforeman.org/u/upadhyeammit) has been maintaining [a checklist](https://community.theforeman.org/t/the-el7-deprecation-checklist/28041) that tracks everything that needs to be in place before the deprecation notice is issued.

At the time of writing this post, the EL7 deprecation notice is now targeted for the release of **Foreman 3.4**.

Please take the time to make preparations to move to EL8 as soon as possible. If you can, test out your scenario in advance and report any issues you might have on our [community forum](https://community.theforeman.org/). We are here to help.

## Foreman 3.3 RC1 News

We are now in Foreman 3.3 stabilization week. This means that no major changes will be merged as we prepare for the first release candidates for Foreman 3.3. With any luck, the first release candidate for Foreman 3.3 will arrive on May 12th.

If you're interested, you can read more about the branching process on [Foreman 3.3 branching process](https://community.theforeman.org/t/foreman-3-3-branching-process/28252)

### Contribute to Foreman 3.3

Installing the Foreman 3.3 release candidate and working through your regular workflow and reporting back with successes/issues is a great way to contribute back to the Foreman community. Everyone who helps verify their scenarios on the release candidate contributes to the stability of the release. For more information about the release candidate, keep an eye on our [release announcements](https://community.theforeman.org/c/release-announcements/8) section.

## Foreman for beginners in 2022

[Benjamin Arntzen](https://www.raptorswithhats.com/author/gnomethrower/), who goes by [gnomethrower](https://twitter.com/gnomethrower/) on Twitter, published a blog about getting started with Foreman in 2022. Ben installs Foreman on Debian 11 as part of his walk through. You can find his full post [here](https://www.raptorswithhats.com/2022-04-24-the-foreman-2022/).

If you're just getting started, Foreman can seem like a beast. It's understandable that making the distinction between Foreman and Foreman with Katello can be confusing for beginners. For the sake of anyone new having stumbled upon our newsletter, let's pause for a moment and outline some resources we have put together over the last while for those getting started with Foreman.

[marek_hulan](https://community.theforeman.org/u/marek_hulan/summary) published three blog posts that walk users through the most common Foreman setup that we see in the community:

1. [How to Start with Foreman](https://theforeman.org/2020/12/how-to-start-with-foreman.html)
2. [Updating Foreman Inventory with System Facts ](https://theforeman.org/2021/01/updating-foreman-inventory-with-system-facts.html)
3. [Introduction to the Remote Execution plugin](https://theforeman.org/2021/02/introduction-to-the-remote-execution-plugin.html)

For those of you curious about content management with Foreman and Katello, [iballou](https://community.theforeman.org/u/iballou/) created this great introduction to the main Katello workflows:

<iframe width="560" height="315" src="https://www.youtube.com/embed/kWbfU_1zseU" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

A nice complement to this might be to look at how Foreman's provisioning and content management workflows all fit together. [lzap](https://community.theforeman.org/u/lzap/) created some resources to demonstrate how Foreman and Katello can help you mitigate any environmental instability that you might have with the introduction of Centos Stream.

<iframe width="560" height="315" src="https://www.youtube.com/embed/XsCi9Jy2lGs" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

We also published a written version of this workflow on opensource.com [Manage CentOS Stream with Foreman
](https://opensource.com/article/21/9/centos-stream-foreman)

## Foreman Community Demo 109

Last week, we hosted another Foreman Community Demo that showed the latest features, bugfixes, and updates from around the community. You can rewatch below and if you have any questions relating to any of the demos, please let us know!

<iframe width="560" height="315" src="https://www.youtube.com/embed/C7a5TA3IZE0" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## Thank you!

Thank you to everyone who asked and answered questions, opened issues, and made the Foreman community a vibrant place to be over the last month!
