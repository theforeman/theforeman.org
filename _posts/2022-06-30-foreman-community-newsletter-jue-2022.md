---
layout: post
title: Foreman Community Newsletter (Jue 2022)
date: 2022-06-30
author: Melanie Corr
tags:
- foreman
---

50% through 2022 and through the Foreman 3.4 release. Here are the latest updates from around the Foreman community!

<!--more-->

## Release updates

### Foreman 3.3 GA

This month, Foreman 3.3 became generally available.
Upgrade to enjoy the latest features and bugfixes.
For more information see [Foreman 3.3.0 has been released!](https://community.theforeman.org/t/foreman-3-3-0-ga-has-been-released/28989)

### Foreman 3.4 release update

We are halfway through the development phase for Foreman 3.4.

[@upadhyeammit](https://community.theforeman.org/u/upadhyeammit) gave us the latest update on this in the community demo. You can listen back here:

<iframe width="560" height="315" src="https://www.youtube.com/embed/6DPke5WZ9Ts?start=89" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

### Katello 4.5

The Katello 4.5 release is imminent, expected to become GA during early next week (week starting July 3rd). You can keep up to date with the latest updates by keeping an eye on our [release announcements](https://community.theforeman.org/c/release-announcements/8) on our community forum.

## Debian installations and foreman-maintain

The `foreman-maintain` utility has been around for quite some time but only available to Foreman installations on Enterprise Linux. However, we have some good news. [@upadhyeammit](https://community.theforeman.org/u/upadhyeammit) has been [working away](https://projects.theforeman.org/issues/34194) behind the scenes to put together the different pieces to allow Debian and Ubuntu users to use `foreman-maintain`.

You can watch [@upadhyeammit](https://community.theforeman.org/u/upadhyeammit) talk through his work and the benefits that `foreman-maintain` will bring for Foreman Debian and Ubuntu users in our latest demo:

<iframe width="560" height="315" src="https://www.youtube.com/embed/6DPke5WZ9Ts?start=129" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## Foreman on El7 Deprecation updates

[@ehelms](https://community.theforeman.org/u/ehelms) posted an update regarding the EL7

> At this time we have dropped EL7 from our nightly testing pipelines. We are no longer generating EL7 nightly repositories nor testing installations or upgrade against EL7. We are continuing to work in this area to remove the nightly release repositories on EL7, as well as cleanup packaging to stop building all but client packages on EL7. Forklift has also been updated to drop EL7 as a nightly and development environment option.
> Developers – this means that if you are using an EL7 based development environment, it is now out of date and will not be update-able - Please find time and move to an EL8 based setup. There is no in-place upgrade for development environments.

For more information, see the [Deprecation plans for Foreman on EL7, Debian 10 and Ubuntu 18.04](https://community.theforeman.org/t/deprecation-plans-for-foreman-on-el7-debian-10-and-ubuntu-18-04/25008/20) thread.

## Do you append domain names to host settings?

[@Marek_Hulan](https://community.theforeman.org/u/Marek_Hulan) has put out a call to understand if there are use cases where appending domain names to host settings has been useful for Foreman users. Removing this might help simplify things, especially around Ansible workflows.

If you are using this setting (**Append domain names to the host** from **Settings > General**), please [let us know](https://community.theforeman.org/t/can-we-drop-the-append-domain-names-to-the-host-setting/29150) how and why this helps you.

## Making email optional for Foreman user accounts?

This month [@nofaralfasi](https://community.theforeman.org/u/nofaralfasi) opened a discussion regarding user accounts and different requirements for email depending on whether you're updating or creating a user in Foreman. She has proposed that we make adding a user email address optional in all scenarios.

For more information see [Update users email to be optional](https://community.theforeman.org/t/update-users-email-to-be-optional/29113) and add your thoughts to the discussion, even if just to add a +1 to the suggestion.

## New Foreman developer guide

[@nofaralfasi](https://community.theforeman.org/u/nofaralfasi) also created a new guide to help fellow Foreman developers install and get started with Foreman. She has an open PR with her work. Please test, and [let us know what you think](https://community.theforeman.org/t/adding-a-development-installation-guide-for-foreman/29142).

## Community Demos

We had two demos this month!

#### Demo #111

<iframe width="560" height="315" src="https://www.youtube.com/embed/1c2Rqa6By7I" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>


#### Demo #112

<iframe width="560" height="315" src="https://www.youtube.com/embed/6DPke5WZ9Ts" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## Thank you!

Thank you to everyone who asked and answered questions, opened issues, and made the Foreman community a vibrant place to be over the last month!
