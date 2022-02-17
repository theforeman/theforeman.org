---
layout: post
title: Foreman Community Newsletter (July 2020)
date: 2020-07-31 17:38:38
author: Melanie Corr
tags:
- foreman
---

Celebrating Foreman's 11th Birthday online, updates to Katello's release schedule, community demos, and containerizing Foreman.  


<!--more-->

July was an eventful month in the Foreman Community, and nothing was more eventful than our first online birthday party. Although we could not gather in person, this did not dampen our enthusiasm for Foreman. If you have any feedback about the event or ideas for future events, feel free to leave a comment on this post or start a thread on Discourse.

## 11 Years of Foreman

If a certain global pandemic had not derailed 2020, [ATIX AG](https://atix.de/en/) would have hosted the Foreman Birthday Party in Munich this summer. Despite the change of plan, ATIX's CEO [@hlawatschek](https://community.theforeman.org/u/hlawatschek/summary) kicked off the birthday party with an overview of ATIX and how ATIX uses Foreman. Under normal circumstances, food and cake play an important part of the Foreman Birthday Party. Because this could not happen, ATIX [started a fundraiser](https://www.betterplace.org/en/fundraising-events/35533-foreman-birthday-better-than-a-cake) so that the Foreman community could share food with children in need.

You can watch [@hlawatschek](https://community.theforeman.org/u/hlawatschek/summary)'s introduction here:

<iframe width="560" height="315" src="https://www.youtube.com/embed/scFrpIakVcU" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

### Foreman Community Survey 2020 Results

Next up was [@Gwmngilfen](https://community.theforeman.org/u/Gwmngilfen/) with the results of the Foreman community survey. The main takeaway from the survey is that in a growth model, Foreman has entered a 'maturity' phase. In the survey results, this was indicated by a growth in more Foreman users than developers. Another clear fact from the survey is that large percentage of the community use Foreman for provisioning.

You can watch the Foreman Community Survey results presentation here:

<iframe width="560" height="315" src="https://www.youtube.com/embed/lolwYZUnyKg" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

### Making Puppet Optional

Then, [@tbrisker](https://community.theforeman.org/u/tbrisker/summary) presented a clear and concise overview of the reasons behind the Puppet extraction efforts that are under way in the Foreman community. This has a number of advantages, including the opportunity clean up many unused features on the Foreman web UI and to redesign the Host Details page.

If you weren't able to attend, let [@tbrisker](https://community.theforeman.org/u/tbrisker/summary) guide you through the process:

<iframe width="560" height="315" src="https://www.youtube.com/embed/IvY_ql9OrLk" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

### Contributing to Foreman Without Writing Code

Maximillian, an ATIX AG technical writer, outlined the many ways to contribute to the Foreman community without writing a line of code. One of the attendees of the birthday party commented that Foreman was like a Swiss army knife. With so many sides and so many possibilities, Foreman needs decent documentation. During his talk, Maximillian announced that ATIX AG was joining Red Hat in the commitment to open source their documentation and make it available for Foreman users. This is good news.

You can watch Maximillian's presentation here:  

<iframe width="560" height="315" src="https://www.youtube.com/embed/qfyk30_TkmQ" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

### Katello, Pulp 3, and Me

Last but certainly not least was [@justin_sherrill](https://community.theforeman.org/u/justin_sherrill/summary)'s presentation _Katello and Pulp 3 and Me: How to get there and what it will do for you!_. Katello's move from Pulp 2 to Pulp 3 includes huge performance improvements, to the point where a certain Katello developer lamented that he no longer had time to grab a coffee while he waited for a sync to complete.

If you haven't seen it, check out [@justin_sherrill](https://community.theforeman.org/u/justin_sherrill/summary)'s presentation here:

<iframe width="560" height="315" src="https://www.youtube.com/embed/b6HsSm10DLk" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

### The End of the Day

In a pre-2020 world, at the end of a great party, we would gather together to take a group photo. Within the restrictions of Bluejeans conferencing, which only allowed a grid of nine, we did our best to replicate this. After the formal talks finished, many community members hung around to catch up with one another and discuss just how nice Swedish sweets are.

![Group photo 3](/static/images/group3.png)
![Group photo 1](/static/images/group1.png)
![Group photo 2](/static/images/group2.png)

If you have ideas for another event where we can gather to discuss issues related to Foreman, do let us know.

## Community Demo #81

July had one Foreman Community demo, which was dominated by updates from the Katello team.

Thank you to everyone who presented and commented. The demos have been timestamped both on Discourse and YouTube:

|Speaker|Topic|
| --- |  --- |
|@iballou| [Pulp 3: Incremental Update](https://www.youtube.com/watch?v=opqYWB2FTE4&t=111s)|
|@sajha| [Pulp 3: Capsule - Cert Guard](https://youtu.be/opqYWB2FTE4?t=527)|
|@john_mitsch| [New Katello Content View Page Search](https://youtu.be/opqYWB2FTE4?t=841)|
|@Jonathon_Turel| [ Katello: Improvements around expired Manifests](https://youtu.be/opqYWB2FTE4?t=1011)||
|@Partha_Aji| [Katello: Auto Enable/Disable custom repos](https://youtu.be/opqYWB2FTE4?t=1374) ||
|@Partha_Aji| [Katello: Demo orignal_modulestreams_filter](https://youtu.be/opqYWB2FTE4?t=1643) ||

## New Katello release schedule & Pulp 3 Migration Update

There have been important changes to the Katello roadmap. For more information, see [this Discourse post](https://community.theforeman.org/t/new-katello-release-schedule-pulp-3-migration-update/19884)

## Release Information

While Foreman 2.1.0 was technically released in July, the June newsletter was delayed to include the announcement.

### Foreman 2.2 stabilization week starts next week

The stabilization week for 2.2 version starts on August 3 and branching is scheduled for August 11. All your help is appreciated to ensure everything is stable and we can release a release candidate in timely manner. For more information, see [the announcement on Discourse](https://community.theforeman.org/t/foreman-2-2-stabilization-week-starts-next-week/19868).

### Katello 3.15.3 is available

The Katello team has produced this bug fix release for Katello 3.15. Fixes include correcting Dynflow errors running rake tasks, resetting HTTP Proxy values in repositories after deleting the HTTP Proxy from foreman, and a fix for migration issues during installation when using external DBs.

For more information, see [the release announcement](https://community.theforeman.org/t/katello-3-15-3-released/19602).

### Katello 3.16 RC5 is ready for testing

There are quite a few bug fixes in this release candidate. For more information, see the [release announcement](https://community.theforeman.org/t/katello-3-16-rc5-is-ready-for-testing/19762)

## Upcoming Event: Containerizing Foreman Deep Dive

[@Ondrej_Prazak](https://community.theforeman.org/u/Ondrej_Prazak/summary) and [@ohadlevy](https://community.theforeman.org/u/ohadlevy/summary), who have both spent time looking into containerizing Foreman, will give an overview of their findings.

If you're interested in this [event](https://community.theforeman.org/t/containerizing-foreman-deep-dive/19888), add it to your calendar!
