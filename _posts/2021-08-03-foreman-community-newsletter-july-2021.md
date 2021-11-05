---
layout: post
title: Foreman Community Newsletter (July 2021)
date: 2021-08-03 11:46:44
author: Melanie Corr
tags:
- newsletter
---

Foreman 3.0, the Puppet extraction, managing Python content with generic classes, and much more!

<!--more-->

## Foreman Community Survey 2021

With ten minutes of your time, you could help shape the future of Foreman by completing the [Foreman Community Survey](https://www.surveymonkey.co.uk/r/T526T3G). We don't collect data past what we outline in our [privacy](https://theforeman.org/privacy.html) statement. This means that we rely on you to tell us what you like, what works, and what is missing from Foreman that would make your life better and easier. Important decisions related to Foreman have been made through analysing what you've told us in the past, so please use this opportunity to make your voice heard.

## Foreman 3.0 Branching

This week, the Foreman community is preparing to branch for Foreman 3.0 - the first milestone update for a year. As you're probably aware, the major change in this upcoming release is the extraction of Puppet from Foreman core, as outlined in the roadmap discussion [the road to making Puppet optional](https://community.theforeman.org/t/the-road-to-making-puppet-optional/17983).

Following up on his [Puppet in Foreman 3.0 release post](https://community.theforeman.org/t/puppet-in-3-0-release/24429), [@ezr_ondrej](https://community.theforeman.org/u/ezr-ondrej/summary) came along to the most recent community demo and outlined what exactly this will mean for the community. You can rewatch [@ezr_ondrej](https://community.theforeman.org/u/ezr-ondrej/summary)'s talk, and if you've any further questions, we would love to hear from you on our [community discourse](https://community.theforeman.org/).

<iframe width="560" height="315" src="https://www.youtube.com/embed/J8Z8SVOhTeA?start=1056" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

Keep an eye out for the Foreman 3.0 release candidates that will start appearing in the next few days. Evaluating release candidates is a great way to give back to the community and to ensure that the forthcoming Foreman 3.0 release is as stable as possible.

## Running Foreman under a subfolder?

[@tbrisker](https://community.theforeman.org/u/tbrisker) raised the issue that functionality that allowed users to run Foreman beneath a subfolder, for example `https://example.com/foreman/` rather than `https://foreman.example.com` has been broken for some time. In this [RFC](https://community.theforeman.org/t/rfc-stop-attempting-to-allow-running-foreman-under-a-sub-folder-in-3-0/24526), he proposes that we remove attempts to support this functionality as part of the Foreman 3.0 release.

Do you need to run Foreman under a subfolder? If so, please [reply](https://community.theforeman.org/t/rfc-stop-attempting-to-allow-running-foreman-under-a-sub-folder-in-3-0/24526) and let us know why this matters to you.

## [docs.theforeman.org](https://docs.theforeman.org/)

For a long time now, we have been preparing to make [docs.theforeman.org](https://docs.theforeman.org/) the official Foreman guides. These guides are a combination of both Red Hat and ATIX enterprise customer documentation that has been open sourced so that the wider Foreman community has access to high-quality docs. We do our best to maintain these docs to a high standard, and should have an increasing level of input from some professional writers who will help. You can help by raising PRs against anything you think is missing or wrong. At the moment, we are aiming to make [docs.theforeman.org](https://docs.theforeman.org/) the official home of Foreman documentation for the Foreman 3.0 release. You can find the [source here](https://github.com/theforeman/foreman-documentation).

## Katello 4.1.2 has been released!

This latest release provides four new bug fixes, with the notable addition of `pulp_rpm` version 3.14, which provides a solution for filelists and changelog metadata that were not being parsed properly. For more information, see the [release announcement](https://community.theforeman.org/t/katello-4-1-2-has-been-released/24688).

## UX updates

During the most-recent community demo, [@MariSvirik](https://community.theforeman.org/u/marisvirik/summary) came along once again to give an update into the thinking behind further design changes proposed for the Search bar. You can help shape the future design of the Search bar in Foreman by watching her presentation and providing your thoughts about the design. There will also be a further blog post later this week:

<iframe width="560" height="315" src="https://www.youtube.com/embed/J8Z8SVOhTeA?start=527" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>


### New toast alerts

In our [community demo #97](https://youtu.be/Ly8_DM_01H0?t=1654), [@laviro](https://community.theforeman.org/u/tbrisker) talked about new confirmation modals. These new toast notifications have since been [merged](https://github.com/theforeman/foreman/pull/8629)!

### React-redux folder structure update

As part of previous discussions and during a July [demo](https://youtu.be/Ly8_DM_01H0?t=2095), there has been discussion around the [React-Redux folder structure](https://community.theforeman.org/t/rethinking-react-redux-folder-structure/24183/24). The result of this discussion was to use the slice pattern - you can read more about it [here](https://community.theforeman.org/t/add-react-error-boundary/24456).

### Foreman UX Group Meetings

If you're interested in keeping up to date and discussing the Foreman user experience, there are regular meetings where the current proposals are regularly discussed. [@laviro](https://community.theforeman.org/u/laviro) and the others add these to our community [events calendar](https://community.theforeman.org/c/events/l/calendar). The meetings are open to all and the next meetings take place on [August 9](https://community.theforeman.org/t/ux-interest-group-meeting-09-08-21/24703) and [August 23](https://community.theforeman.org/t/ux-interest-group-meeting-23-08-21/24704).

## Using generic classes to manage Python content with Foreman/Katello

This month [@rverdile](https://community.theforeman.org/u/rverdile/summary) demoed new support in Katello for the Python content type using generic classes. These generic classes open up a lot of potential for adding future content types.

<iframe width="560" height="315" src="https://www.youtube.com/embed/Ly8_DM_01H0?start=388" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

He followed this demo with an enhancement that showed how to [index/upload/remove Python content and content view publish](https://youtu.be/J8Z8SVOhTeA?t=2283).

## Katello Alternative Content Sources?

An alternate content source (ACS) is a filesystem or network path where Pulp will look to first when downloading content during a sync or on-demand content fetch. A repository with a slower connection might need to be the authoritative figure who determines the repository structure, but a faster ACS could be defined so that the actual content downloads (which is potentially much larger in size that the repodata) over a faster connection. With Katello in mind, this could be helpful for speeding up smart proxy synchronizations.

With the introduction of Pulp 3 to Katello [@iballou](https://community.theforeman.org/u/iballou) is looking to feedback on the proposed design for [Katello Alternative Content Sources](https://community.theforeman.org/t/rfc-katello-alternate-content-sources/24612).

## Community Demo Listing Page

Thanks to [@laviro](https://community.theforeman.org/u/laviro) who contributed a nice search bar to our new [demo listings page on theforeman.org](https://theforeman.org/demos/2021.html).

## Thank you

Thank you to everyone who asked and answered questions, opened issues, and made the Foreman community a vibrant place to be over the last month!
