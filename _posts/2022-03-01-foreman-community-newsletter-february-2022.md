---
layout: post
title: Foreman Community Newsletter (February 2022)
date: 2022-03-01
author: Melanie Corr
tags:
- newsletter
---

LEAPP into Foreman on RHEL 8 and all the latest news from around the community.  

<!--more-->

Here's what has been happening over the last few weeks!

## An interview with Ohad Levy, founder of Foreman

Ohad, who founded Foreman 13 years ago, talked to Rich Bowen of the Red Hat Open Source Program Office, about founding the Foreman community, growing it, and ultimately entrusting it to others. Watch this short, insightful interview that makes many good points about how to grow a community.

<iframe width="560" height="315" src="https://www.youtube.com/embed/wCcwjDVPMJE" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## Release candidates

Evaluating release candidates is a quick and helpful way of contributing to the stability and success of Foreman.

If you could install the release candidate, run through your regular workflows, and let us know how it goes, this would hugely contribute to the success of the upcoming release.

### Foreman 3.2.0 RC1 is available for testing!

For more information, see the [release announcement](https://community.theforeman.org/t/foreman-3-2-0-rc1-is-available-for-testing/27371).

### Katello 4.4 RC1 is available for testing!

For more information see, the [Katello 4.4 release announcement](https://community.theforeman.org/t/katello-4-4-rc1-is-now-ready-for-testing/27492)

## Foreman @ FOSDEM

### LEAPP/ELevate into RHEL 8!

During FOSDEM 2022, [@evgeni](https://community.theforeman.org/u/evgeni/) appeared relatively early in the day. We all know what happens to those who appear early - they have the pleasure of experiencing everything that can go wrong. Due to technical difficulties, it wasn't possible for viewers to ask questions. When the Q&A livestream started after [@evgeni](https://community.theforeman.org/u/evgeni/)'s talk, the stream was not broadcast to the Infra room. OK, we thought, the show must go on. We'll continue our discussion and answer as many questions as we can imagine so that folks can watch the recording later. I asked [@evgeni](https://community.theforeman.org/u/evgeni/) questions. He diligently answered every one. We thought we did the recording justice. We imagined all the happy Foreman users, revelling in their new-found knowledge about upgrading Foreman to EL8 systems. Later, we learned that if the stream does not broadcast to the room, all is lost. If nothing else, we made our sacrifice to the demo gods.

You can rewatch [@evgeni](https://community.theforeman.org/)'s talk [here](https://videos.fosdem.org/2022/D.infra/foreman_katello_leapp_elevate.webm).

You can ask any question that you like [here](https://community.theforeman.org/t/migrating-foreman-katello-from-el7-to-el8-using-leapp-elevate/27189) or start a new thread on our forum.


### Synology Foreman community project

At the Foreman booth at FOSDEM, I had the pleasure of speaking with [@bittner](https://community.theforeman.org/u/bittner/) about his work in progress project [Synology Foreman](https://github.com/painless-software/synology-foreman). [@bittner](https://community.theforeman.org/u/bittner/) hopes to build out a minimalist configuration management setup of Foreman, based on the Foreman docker image. He has since introduced his project, its history and challenges [in the community](https://community.theforeman.org/t/the-foreman-for-your-home-poc/27457). If you've thought about this area, or gone through a similar workflow, or are interested in this, please let him know!

## Foreman web UI navigation cards survey

We have been talking a lot about workflow simplifications and UX/UI improvements for the last year or so.

<blockquote class="twitter-tweet" data-partner="tweetdeck"><p lang="en" dir="ltr">Finally had a chance to try <a href="https://twitter.com/ForemanProject?ref_src=twsrc%5Etfw">@ForemanProject</a> 3.1 and <a href="https://twitter.com/Katello_Project?ref_src=twsrc%5Etfw">@Katello_Project</a> 4.3 - totally amazing how fast content operations proceed in comparison with the predecessor versions. Also, the new CV UI/UX is way more intuitive. <a href="https://twitter.com/hashtag/linux?src=hash&amp;ref_src=twsrc%5Etfw">#linux</a> <a href="https://t.co/nsuiKo7HQ6">pic.twitter.com/nsuiKo7HQ6</a></p>&mdash; Christian Stankowic (@stankowic_devel) <a href="https://twitter.com/stankowic_devel/status/1492130399476236288?ref_src=twsrc%5Etfw">February 11, 2022</a></blockquote>
<script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>

We want every user to see and feel the benefits of the continued UX/UI improvement efforts with each upgrade.

A very quick way you can help the Foreman community without ever writing a line of code is by telling us what matters to you.

This time, we're asking about Foreman navigation card sorting activity.

Please complete the following [survey](https://35iy8gp0.optimalworkshop.com/optimalsort/foremannavigation). This will help us determine what is important to you.

## Migrating Reports for Foreman 3.2

The way Foreman handles configuration management reports is changing, they are now stored in more efficient way. If you upgraded to 3.2 and noticed there is a warning when you visit Configuration Reports page, you need to reconfigure your Ansible and Puppet callback to send reports to the new API. The old API and Configuration Reports screen will continue working in 3.2 normally, but it is planned to be removed in 3.3 so we recommend to migrate early. [Read lzap's post](https://community.theforeman.org/t/migrating-reports-to-the-new-format-in-foreman-3-2/25846) and reply with any questions or concerns that you might have.

[@ron_lavi](https://community.theforeman.org/u/ron_lavi) also discusses this on the latest Foreman community demo.

<iframe width="560" height="315" src="https://www.youtube.com/embed/mFfz6p_7P4Y?start=185" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## Browser compatibility in Foreman 3.3

After [@ron_lavi](https://community.theforeman.org/u/ron_lavi) opened the discussion about the challenges of maintaining browser compatibility, he also joined the community demo to further speak about it. Now that a few weeks have passed, it is now official that Foreman 3.3 and higher will support the latest versions of **Safari, Firefox**, and **Edge, Chrome / Chromium** browsers.

## Community RFCs

### Extending Host Registration

[@MSinghal](https://community.theforeman.org/u/MSinghal) has posted a number of suggestion to make host registration even better. Please let her know what you think about [her ideas](https://community.theforeman.org/t/rfc-host-registration-extension/27386).

### Change how BMC operations are mapped

[@lzap](https://community.theforeman.org/u/lzap) has started a discussion about power operations in Foreman provisioning. Foreman’s BMC operations are weirdly mapped and it is pretty confusing what is a safe operation out of our: Stop, Reset, Poweroff, Reboot. Can you tell just from those words? You can’t, unless you know.

Read more and [let him know what you think](https://community.theforeman.org/t/rfc-change-how-bmc-operations-are-mapped/27241).

## Community Demos

There were two community demos this month.

### Demo 106

Here are some quick links to the lineup:

* [Registration and host_init_config templates previews](https://youtu.be/It4vn5_stCQ?t=358)
* [Katello - Change Host Content Source](https://youtu.be/It4vn5_stCQ?t=449)
* [watch Ron talk here](https://youtu.be/It4vn5_stCQ?t=726)
* [Puppet tab demo](https://youtu.be/It4vn5_stCQ?t=912)
* [New host details tabs now support better links](https://youtu.be/It4vn5_stCQ?t=1172)
* [speed up of content indexing](https://youtu.be/It4vn5_stCQ?t=1314)
* [New Docker "on demand" download policy](https://youtu.be/It4vn5_stCQ?t=1591)
* [Inter Server Sync UI update](https://youtu.be/It4vn5_stCQ?t=1744)|[33951](https://projects.theforeman.org/issues/33951)|Katello 4.4
* [CV UI - Bulk Deletion of Content View Versions](https://youtu.be/It4vn5_stCQ?t=2189)


<iframe width="560" height="315" src="https://www.youtube.com/embed/It4vn5_stCQ" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## Demo 107

Here are some quick links to the lineup:

* [new Reports plugin  & Reports tab on host page](https://youtu.be/mFfz6p_7P4Y?t=186)
* [new reports dashboard widgets](https://youtu.be/mFfz6p_7P4Y?t=372)
* [Import/Export repositories](https://youtu.be/mFfz6p_7P4Y?t=456)
* [Module Stream Host Details](https://youtu.be/mFfz6p_7P4Y?t=867)
* [Packages - Install Packages modal](https://youtu.be/mFfz6p_7P4Y?t=867)

<iframe width="560" height="315" src="https://www.youtube.com/embed/mFfz6p_7P4Y" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>


## Thank you!

Thank you to everyone who asked and answered questions, opened issues, and made the Foreman community a vibrant place to be over the last month!
