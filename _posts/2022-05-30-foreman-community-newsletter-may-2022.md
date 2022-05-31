---
layout: post
title: Foreman Community Newsletter (May 2022)
date: 2022-05-30
author: Melanie Corr
tags:
- newsletter
---

A news round up from around the Foreman community this last month!

<!--more-->

## Foreman 3.3 RC 2

The second release candidate for Foreman 3.3 has been released and is available for testing. If you use Foreman and would like to contribute to the project, installing and testing the release candidates is a great way to help out. Evaluating the release candidates is also a great way to familiarize yourself with changes in the upcoming release.

For more information about evaluating the 3.3 release candidate, see [Foreman 3.3.0 RC2 is ready for testing!](https://community.theforeman.org/t/foreman-3-3-0-rc2-is-ready-for-testing/28794?u=mcorr)

## Ruby 2.5 deprecation in Foreman 3.3

Ruby 2.5 will be deprecated as part of the release of Foreman 3.3 and removed with the release of Foreman 3.4.

[evgeni](https://community.theforeman.org/u/evgeni) has outlined the reasons behind the Ruby 2.5 deprecation and set out the timeline for this. For more information, check out [Deprecation of Ruby 2.5](https://community.theforeman.org/t/deprecation-of-ruby-2-5/28817).

## Foreman 3.2.1

The first update to Foreman 3.2 was also released.
This release contains a number of bug fixes.

Update your Foreman 3.2 instance to enjoy all the latest fixes.

For more information, check out [the release announcement](https://community.theforeman.org/t/foreman-3-2-1-has-been-released/28769).

## 3.1.3 - final update to the 3.1 series

With the release of Foreman 3.3 in the offing, the 3.1.3 update will be the final update to 3.1. After 3.3 is released, the 3.1 version will no longer be supported. Consider updating to 3.2 today to ensure that you remain on an up-to-date Foreman version.

For more information, see [Foreman 3.1.3 has been released!](https://community.theforeman.org/t/foreman-3-1-3-has-been-released/28710).

## Katello 4.5 update

As part of our community demo, [cintrix84](https://community.theforeman.org/u/cintrix84) updated us on the timeline and what we can expect as part of Katello 4.5:

<iframe width="560" height="315" src="https://www.youtube.com/embed/yHmpHowebwY?start=235" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## Upgrade Foreman to EL 8

[evgeni](https://community.theforeman.org/u/evgeni) has been doing everything he can to highlight the importance of upgrading your Foreman instance from EL 7 to EL 8 as soon as possible.

On Foreman 3.2 and the upcoming release Foreman 3.3, you can perform this in-place. However, if you don't upgrade to EL8 while using these versions of Foreman, you'll have a much bigger job to do redeploying everything yourself.

[evgeni](https://community.theforeman.org/u/evgeni) came and demoed the upgrade process as part of the most recent community demo.

<iframe width="560" height="315" src="https://www.youtube.com/embed/yHmpHowebwY?start=319" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

Documentation on this process is in progress and if you have any issues, please post to the community so that we can understand the issue and look for a solution.

## Remote Execution Pull Provider now available on nightly!

From a user perspective, little will change with the remote execution workflow. However, behind the scenes, there have been some major changes that are now available on nightly and will hopefully make it in on time for the Foreman 3.3 release also.

In an effort to improve the way remote execution is handled, remote execution will take place via Pull MQTT rather than SSH.

For a comprehensive overview of what you can look forward to, let [aruzicka](https://community.theforeman.org/u/aruzicka) walk you through the changes:

<iframe width="560" height="315" src="https://www.youtube.com/embed/yHmpHowebwY?start=1587" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## Katello Alternative Content Sources

[iballou](https://community.theforeman.org/u/iballou) has mentioned progress on Alternative Content Sources for Katello a few times over the past few months. You can watch him discussing this and providing a walkthrough of creating an alternative content source in the Foreman web UI and also with the Hammer CLI:


<iframe width="560" height="315" src="https://www.youtube.com/embed/yHmpHowebwY" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## Save the date for OSAD 2022

[maximilian](https://community.theforeman.org/u/maximilian) added Open Source Automation Days (OSAD) dates to the Foreman calendar. Throughout the years, many Foreman community members have presented their work at OSAD. While the call for papers ends on May 31, save the date to enjoy the main conference either online or in Munich on **October, 4th and 5th plus Workshops on October 6th 2022**

For more information, see [Open Source Automation Days](https://community.theforeman.org/t/open-source-automation-days-2022/28462) Foreman calendar entry.

## Foreman/Katello Performance Tuning Guide

Getting the most out of very large Foreman deployments might require some tuning. [maximilian](https://community.theforeman.org/u/maximilian) has open sourced the Red Hat Satellite Performance Tuning source to create a guide that is useful for Foreman and Katello users. We need your contributions to make this guide useful and helpful to other community members so they can get the most out of their larger Foreman deployments. For more information, watch [maximilian](https://community.theforeman.org/u/maximilian)'s presentation at the latest community demo:

<iframe width="560" height="315" src="https://www.youtube.com/embed/yHmpHowebwY?start=4084" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>


## Thank you!

Thank you to everyone who asked and answered questions, opened issues, and made the Foreman community a vibrant place to be over the last month!
