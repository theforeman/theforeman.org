---
layout: post
title: Foreman Community Newsletter (January 2022)
date: 2022-02-01 12:32:51
author: Melanie Corr
tags:
- foreman
---

OSTree content is back! Debian Bullseye support updates! Foreman & Katello release details and future schedule, as well highlights from around the community at the start of 2022.

<!--more-->

## Katello 4.3 is here!

After much anticipation, Katello 4.3 landed last week. This is an important release for many reasons:

* At the time of the release and migration to Pulp 3, [there was no Pulp OSTree content](https://theforeman.org/2020/05/bye-bye-pulp2.html) and many were sorry to see it go. Good news is that from Katello 4.3, you can now upload, sync and publish OSTree content using Katello!
* Support for Inter-server sync has been added. This feature allows you to sync content from one Katello Instance to another. You can watch a [demo](https://youtu.be/uk9PvytPhsA?t=3200) here.
* There have been scores of enhancements to the Content View workflow web UI enhancements.

The Foreman of Animal Crossing, [Tom Nook](https://community.theforeman.org/u/cintrix84), talked us through the headlines of Katello 4.3 at the community demo. You can rewatch here:

<iframe width="560" height="315" src="https://www.youtube.com/embed/uk9PvytPhsA?start=308" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

For more information, see the [release announcement](https://community.theforeman.org/t/katello-4-3-ga-is-available/27077?u=mcorr
) and the [changelog](https://github.com/Katello/katello/blob/KATELLO-4.3/CHANGELOG.md).

## Foreman 3.1.1 has been released

As well as [21 bug fixes](https://projects.theforeman.org/projects/foreman/issues?utf8=%E2%9C%93&set_filter=1&sort=priority%3Adesc%2Cid%3Adesc&f%5B%5D=status_id&op%5Bstatus_id%5D=c&f%5B%5D=cf_12&op%5Bcf_12%5D=%3D&v%5Bcf_12%5D%5B%5D=1524&f%5B%5D=tracker_id&op%5Btracker_id%5D=%3D&v%5Btracker_id%5D%5B%5D=1&f%5B%5D=&c%5B%5D=tracker&c%5B%5D=status&c%5B%5D=priority&c%5B%5D=subject&c%5B%5D=author&c%5B%5D=assigned_to&c%5B%5D=updated_on&c%5B%5D=category&c%5B%5D=fixed_version&group_by=), a few [new features](https://projects.theforeman.org/projects/foreman/issues?utf8=%E2%9C%93&set_filter=1&sort=priority%3Adesc%2Cid%3Adesc&f%5B%5D=status_id&op%5Bstatus_id%5D=c&f%5B%5D=cf_12&op%5Bcf_12%5D=%3D&v%5Bcf_12%5D%5B%5D=1524&f%5B%5D=tracker_id&op%5Btracker_id%5D=%3D&v%5Btracker_id%5D%5B%5D=2&f%5B%5D=&c%5B%5D=tracker&c%5B%5D=status&c%5B%5D=priority&c%5B%5D=subject&c%5B%5D=author&c%5B%5D=assigned_to&c%5B%5D=updated_on&c%5B%5D=category&c%5B%5D=fixed_version&group_by=) have been added, including the [Template helpers `truthy?` and `falsy?`](https://youtu.be/uk9PvytPhsA?t=542) demoed by [@lstejskal](https://community.theforeman.org/u/lstejskal/summary)! Update today and let us know what you think.

For update information, see the [release announcement](https://community.theforeman.org/t/foreman-3-1-1-has-been-released/27073?u=mcorr).


## Foreman 3.2 stabilization & preliminary dates

Yesterday, [@upadhyeammit](https://community.theforeman.org/u/upadhyeammit/summary) announced [Foreman 3.2 stabilization week](https://community.theforeman.org/t/foreman-3-2-stabilization-week-starting-today-31st-january/27123).

Branching for Foreman 3.2 is targeted for February 10th but is subject to change. Foreman 3.2 GA is currently planned for March 15.

For more information about the Foreman 3.2 release plan, see [Foreman 3.2 schedule and planning](https://community.theforeman.org/t/foreman-3-2-schedule-and-planning/26205).

Another great way to keep up to date is to attend our community demos. Our demos showcase some key changes in Foreman as well as new features. Because the demos showcase items merged to master in the next week, your feedback could shape the future of Foreman.

To ensure that you never miss a community demo, subscribe to our [Foreman YouTube Channel](https://www.youtube.com/c/Foreman/)!

A great way to help with the stability of Foreman releases is to take time to install the release candidates as they emerge. We announce them as they become available in our [release announcements](https://community.theforeman.org/c/release-announcements/8) section of our Foreman community discourse. If you do nothing but progress through your usual workflows and report anything amiss, you have helped the community a lot.


## Debian 11 (Bullseye) support

Back in November, you might remember that the Foreman of Twitter, [Evgeni](https://community.theforeman.org/u/evgeni/summary), reported the following:

<blockquote class="twitter-tweet"><p lang="en" dir="ltr">Uh, there is no Puppet Server for Debian 11 (Bullseye)?<br><br>There are no packages on <a href="https://t.co/srbBJbDnLz">https://t.co/srbBJbDnLz</a> and it&#39;s not listed as supported on <a href="https://t.co/E9IpP80yYm">https://t.co/E9IpP80yYm</a><br><br>Sad <a href="https://twitter.com/ForemanProject?ref_src=twsrc%5Etfw">@ForemanProject</a> looks at <a href="https://twitter.com/puppetize?ref_src=twsrc%5Etfw">@puppetize</a> for halp!</p>&mdash; Evgeni Golov (@zhenech) <a href="https://twitter.com/zhenech/status/1463566277704888326?ref_src=twsrc%5Etfw">November 24, 2021</a></blockquote> <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>

Happily, this is now resolved to the great relief of many:

<blockquote class="twitter-tweet"><p lang="en" dir="ltr">🥁 Puppetserver 7.16 has been released, with Debian 11 support!<br><br>Thanks <a href="https://twitter.com/puppetize?ref_src=twsrc%5Etfw">@puppetize</a>, <a href="https://twitter.com/ForemanProject?ref_src=twsrc%5Etfw">@ForemanProject</a> is happy again!</p>&mdash; Evgeni Golov (@zhenech) <a href="https://twitter.com/zhenech/status/1484540153007947786?ref_src=twsrc%5Etfw">January 21, 2022</a></blockquote> <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>

Debian Bullseye support is set to return for Foreman 3.2. For more information, see [Running Foreman on Debian 11 Bullseye](https://theforeman.org/2021/12/running-foreman-on-debian-11-bullseye.html) from December.

## Foreman @ FOSDEM 2022

[Evgeni](https://community.theforeman.org/u/evgeni/summary) will be presenting a talk in the Infra room at FOSDEM this coming Saturday.

With the Foreman Project dropping support for EL7 in Foreman 3.3 (~Summer 2022), it's finally time to tackle that migration to EL8 you have been putting off for a while now. In this session we will present various ways how you can migrate your installation from EL7 to EL8, with the main focus on the in-place upgrade using LEAPP/ELevate.

The Foreman Project is planning to drop support for EL7-based deployments in Foreman 3.3, mostly due to the fact that EL7 is considered "feature complete" and there are no further updates (besides security fixes) planned for it. Contrary to Debian or Fedora, EL-based distributions aren't designed to be upgraded in-place without special tooling. This tooling exists in form of the LEAPP project for RHEL and the ELevate fork by AlmaLinux for AlmaLinux, CentOS, Rocky Linux, and Oracle Linux. We have developed a plugin for LEAPP that helps with the Foreman-specific parts of the migration, which we would like to present to you. As usual, there were a few challenges during the development, which will hopefully entertain you and maybe even help if you need to write own LEAPP plugins. And last but not least, we will also discuss other approaches you can take for the migration, if you do not want to upgrade in-place.


You can find all the scheduling information on the [FOSDEM Infra page for the talk](https://fosdem.org/2022/schedule/event/foreman_katello_leapp_elevate/).


## Foreman Discovery Image 4

[@lzap](https://community.theforeman.org/u/lzap) announced the [release](https://community.theforeman.org/t/announcing-foreman-discovery-image-4-0/26817?u=mcorr) of the first Foreman Discovery Image based on Centos Stream 8!

This new discovery images contains many large changes. [@lzap](https://community.theforeman.org/u/lzap) talked about this in depth during the Foreman Community Demo. You can rewatch here:

<iframe width="560" height="315" src="https://www.youtube.com/embed/uk9PvytPhsA?start=1591" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

He outlined many issues relating to the image

## First community demo of 2022

Our first demo of the year stretched to over an hour of content, with a wide variety of updates from recently merged work on Foreman and Katello.

Demo 105 featured the following additions to Foreman and Katello:

* [Template helpers `truthy?` and `falsy?`](https://youtu.be/uk9PvytPhsA?t=542)
* [Modularized Documentation](https://youtu.be/uk9PvytPhsA?t=843)
* [FDI EL8 build 4.0](https://youtu.be/uk9PvytPhsA?t=1591)
* [New report format update](https://youtu.be/uk9PvytPhsA?t=1850)
* [New reports UX design](https://youtu.be/uk9PvytPhsA?t=2149)
* [Katello: New Repo Mirroring policy](https://youtu.be/uk9PvytPhsA?t=2571)
* [On Demand Repository Cleaning](https://youtu.be/uk9PvytPhsA?t=2903)
* [New Inter-Server Sync UI](https://youtu.be/uk9PvytPhsA?t=3200)
* [Installable Errata overview card](https://youtu.be/uk9PvytPhsA?t=3691)
* [New CV UI Version Details page - Actions & Generic Content](https://youtu.be/uk9PvytPhsA?t=3864)
* [Breaking changes with Patternfly 4 implementation](https://youtu.be/uk9PvytPhsA?t=715)


You can now also find a [written summary](https://community.theforeman.org/t/foreman-community-demo-105/26733/7?u=mcorr) of each of the talks a few days after the demo, depending on [@mcorr](https://community.theforeman.org/u/mcorr/summary)'s typing speed.

You can also grab some popcorn and rewatch the whole thing on YouTube also:

<iframe width="560" height="315" src="https://www.youtube.com/embed/uk9PvytPhsA" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

As a result of the demo, lzap started a discussion about flexibility around the pane size of the widgets on the host details page. For more details see the RFC: [Implement three sizes of panes widgets](https://community.theforeman.org/t/rfc-implement-three-sizes-of-panes-widgets/26851)

A [discussion](https://community.theforeman.org/t/puppet-tab-in-host-details-page-proposal/26464/28) also followed about the design of the Puppet tab in the new host details page.

These are some examples of how engaging with the demos can make a difference to the parts of Foreman that matter to you.

## Enhancements to docs.theforeman.org

After many late nights, [@lzap](https://community.theforeman.org/u/lzap)'s voyage into site navigation and layouts bore fruit. Our next generation documentation has a new look, feel, and better navigation. Check out [docs.theforeman.org]https://docs.theforeman.org) to see it in action. You can read all about it [here](https://community.theforeman.org/t/documentation-site-navigation-is-live/26858?u=mcorr) and let us know what you think.

## RFC: Rearchitecting how PXE files are deployed

Canonical made a breaking change in Ubuntu Focal (20.04) and later. It is no longer possible to use cloud-init with debian-installer. Installation processes must boot the LiveCD. Furthermore, the boot files that are needed for the LiveCD are not published via HTTP(S) protocol directly. Users are now required to download the whole LiveCD ISO (1.2GB), mount it and extract it into the TFTP/HTTP directories.

Because of the implications of this for Foreman Debian provisioning, [@lzap](https://community.theforeman.org/u/lzap) outlines a number of proposals for how PXE files would have to change to avoid circumstances like this in future.

For more information, see [RFC: Rearchitecting how PXE files are deployed](https://community.theforeman.org/t/rfc-rearchitecting-how-pxe-files-are-deployed/27021) and join the discussion.

## Officially support only the recent versions of Firefox, Safari, Edge, Chrome, & Chromium

If you love browser compatibility issues, drop a comment on this blog!

[@Ron_Lavi](https://community.theforeman.org/u/Ron_Lavi) posted with the suggestion that Foreman supports only the recent versions of Firefox and Google Chrome / Chromium browsers.

For more information, read [Ron's post](https://community.theforeman.org/t/officially-support-only-the-recent-versions-of-firefox-safari-edge-chrome-chromium-browsers/27139) and let us know if there's something we haven't considered.

There have been many more requests for feedback and comments on proposals over the last month. Click [here](https://community.theforeman.org/c/development/rfcs/18)

## Thank you!

Thank you to everyone who asked and answered questions, opened issues, and made the Foreman community a vibrant place to be over the last month!
