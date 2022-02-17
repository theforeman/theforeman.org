---
layout: post
title: Foreman Community Newsletter (April 2021)
date: 2021-04-29 17:48:21
author: Melanie Corr
tags:
- foreman
---

Katello hit a major milestone, automate your way into summer, host details page updates, and much more!

<!--more-->


## At long last, Katello 4.0 has arrived!

This month, the Katello community reached a major milestone with the release of Katello 4.0. This release involved years of work, both on the [Pulp](https://pulpproject.org/) side, with the complete architectural overhaul that [led to the release of Pulp 3](https://opensource.com/article/20/8/manage-repositories-pulp), as well as massive changes on the Katello side, which were demoed at regular intervals over the last year or more. As well as this, a massive thank you is owed to everyone who asked questions and reported issues on the buildup to this major release.

As well as the removal of Pulp 2, here are some of the major highlights of this release:

* Katello repositories are now hosted at [yum.theforeman.org](https://yum.theforeman.org).
* New Content View page user interface updates.
* Content View Version added to Reporting Engine Template.
* Number of Red Hat subscriptions consumed by host added to Entitlements report.
* Added option to select Operating System in Register Content Host.

For more information, check out the [release announcement](https://community.theforeman.org/t/katello-4-0-is-released/23245?u=mcorr).

## Introduction to Katello

On the topic of Katello, [@iballou](https://community.theforeman.org/u/iballou/summary) gave an introductory overview of Katello and its main features and workflows. You can rewatch the event in the following YouTube video, and if you have any questions, please post to our [Community forum](https://community.theforeman.org/).

If you enjoyed this session, and would like similar sessions on other topics related to Foreman workflows, please reply to this post and let us know what interests you!

<iframe width="560" height="315" src="https://www.youtube.com/embed/kWbfU_1zseU" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## Automate your Katello workflows with FAM!

As summer approaches in the northern hemisphere, wouldn't it be nice to work less and acquaint yourself with the outside world? One way of freeing yourself is by automating as many of your tasks as possible. If you're interested in automating your Katello workflows using Foreman Ansible modules, take a look at this blog on the new [rhel_content role](https://theforeman.org/2021/04/configuring-katello-via-ansible-to-synchronize-and-serve-rhel-content.html).

## Host Details Redesign - Content Hosts

Thank you to everyone who has contributed to efforts to gather feedback to help drive the host details redesign page. The next stage in the redesign process involves combining Content host and Hosts in one place. You can take a look at the [slidedeck from Red Hat Summit 2021](https://marvelapp.com/prototype/61fe028/screen/77569592) with example designs. Note that the UI mockups are skinned as Red Hat Satellite, but all of the UX considerations will affect Foreman users first. Also, [@marisvirik](https://community.theforeman.org/u/marisvirik/summary) will join us during the next Community Demo to talk about it. If you have any feedback, please complete the new [survey](https://docs.google.com/forms/d/e/1FAIpQLSc5pi28QYBXg4LZeuXT7ryP-ZFg6qqu2311Y0cfe9JyDIJ-jg/viewform).

## Celebrating Foreman's Birthday

The annual Foreman Birthday Party will take place on July 1st. Please save the date and [@Dirk](https://community.theforeman.org/u/dirk/) and his Netways team will keep you up to date with the agenda and activities! 

## Open Source Automation Days 2021: Call for Papers

[@maximilian](https://community.theforeman.org/u/maximilian) posted [a call for papers for OSAD](https://community.theforeman.org/t/open-source-automation-days-2021-call-for-papers/23312) 2021. Many Foreman community members have taken place in this conference in the past, so if you've something interesting to talk about, get in touch. The focus for OSAD 2021 is:

__The focus of the Open Source Automation Days 2021 will be on Cloud, DevOps/GitOps, Containerization, Security Automation and Artificial Intelligence . Also of interest are exciting user stories about how how companies dealt with the subject of IT automation during the pandemic.__

## Foreman Application Centric Deployment guide is now available!

Application Centric Deployment (ACD) describes a fundamentally different approach to provisioning and configuring hosts in Foreman. Traditionally, Foreman has pursued a host-centric approach. Now, the ACD approach presents a new idea: deploying hosts to run an application that requires a predefined set of services. A [full user guide](https://docs.theforeman.org/nightly/Application_Centric_Deployment/index-foreman-el.html) for ACD is now available on [our docs site](https://docs.theforeman.org). Let us know what you think!

## Use Foreman to serve software packages and errata for Debian.

While this is the April newsletter, I forgot to include this [useful opensource.com article](https://opensource.com/article/21/3/linux-foreman
) written by [@maximilian](https://community.theforeman.org/u/maximilian) on using Foreman to serve Debian content that I've been sharing widely with Debian users in the community.

## Workaround for Puma status monitoring

This month, [@Marek_Hulan](https://community.theforeman.org/u/Marek_Hulan) posted a tutorial about how enable monitoring and controlling of the Puma service in a production environment on an RPM based distribution. Currently it’s not working for various reasons, but with newer versions of Puma, it should, but in the meantime, try this [workaround](https://community.theforeman.org/t/puma-status-monitoring-not-working-at-the-moment/23154).

## Updates to the Foreman Contributor's Guide

There have been a number of updates to the [Foreman contributor page](https://www.theforeman.org/contribute.html) that will hopefully make things easier if you would like to start contributing to the project.

There are many ways to contribute. If you'd like to give back to the community in some way, but cannot contribute code, check out [the other types of contributions](https://www.theforeman.org/contribute.html#Othertypesofcontribution) section.  Contributions, both great and small, are very welcome.

## Upgrading PostgreSQL on your Dev Setup

A few days ago, Fedora 34 was released. Fedora 34 ships with new major version of PostgreSQL (v13) which requires a manual database upgrade and reindex. [@lzap](https://community.theforeman.org/u/lzap/) added [instructions](https://community.theforeman.org/t/upgrading-postgresql-database-on-your-dev-setup-after-os-upgrade/23336) on how to upgrade.

## Upcoming Foreman Infrastructure SIG Meeting

Our monthly Foreman Infrastructure Special Interest Group meeting will take place on Thursday May 6. You can find the event details [here](https://community.theforeman.org/t/foreman-infrastructure-special-interest-group/23379?u=mcorr). New group members are always welcome.

## Thank you!

Thank you to everyone who asked and answered questions, opened issues, and made the Foreman community a vibrant place to be over the last month!
