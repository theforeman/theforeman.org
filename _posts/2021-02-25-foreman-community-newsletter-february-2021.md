---
layout: post
title: Foreman Community Newsletter (February 2021)
date: 2021-02-25 17:44:01
author: Melanie Corr
tags:
- newsletter
---

Read about Foreman at FOSDEM, getting started with Foreman blog series, the latest release of Foreman Ansible Modules, and more!

<!--more-->

## Foreman 2.4 RC 2 is ready for testing

There have been substantial updates added to this release candidate. Please evaluate to ensure that this release is as stable as possible. For more information on how to contribute, please read the [release announcement](https://community.theforeman.org/t/foreman-2-4-0-rc2-is-ready-for-testing/22528).

## Foreman 2.3.3 has been released!

This release contains eight bug fixes for issues found in earlier versions. For more information, take a look at the [release announcement](https://community.theforeman.org/t/foreman-2-3-3-has-been-released/22566).

## Katello 4.0 RC 2 is ready for testing!

This release candidate contains some substantial changes. It uses Pulp 3 only and has also dropped support for Puppet and OSTree content. Please take a look at the
[release announcement](https://community.theforeman.org/t/katello-4-0-0-rc2-is-ready-for-testing/22570).

## Foreman Ansible Modules v 2.0.0

[Foreman Ansible Modules v2.0.0](https://galaxy.ansible.com/theforeman/foreman) was released!

[@evgeni](https://community.theforeman.org/u/evgeni/summary) will regale us all about the updates in v2.0.0 in the [upcoming community demo](https://community.theforeman.org/t/foreman-community-demo-91/22405?u=mcorr), but if you can't wait, here's a summary of the new features:

*  new modules: `host_info`, `repository_info` and `puppetclasses_import`
*  new roles: `activation_keys`, `lifecycle_environments`, `repositories`, `sync_plans`
*  host module can now look up the correct network id for a network given as part of `interfaces_attributes`

Breaking changes:

    All role variables are now prefixed with `foreman_` to avoid clashes with similarly named variables from roles outside this collection.

If you're super curious, there's also the [full changelog](https://theforeman.github.io/foreman-ansible-modules/v2.0.0/CHANGELOG.html#v2-0-0).

## katello-agent deprecation update

At the last community demo, [@jonathon_turel](https://community.theforeman.org/u/jonathon_turel) gave an important update about the change in the deprecation of the Katello agent. You can watch that update here:

<iframe width="560" height="315" src="https://www.youtube.com/embed/d8itKIGiino?start=379" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

If you have any feedback on these changes, please reply to the [accompanying RFC: REX Pull Provider](https://community.theforeman.org/t/rfc-rex-pull-provider/21593?u=mcorr) post on the [Foreman Community Discourse](https://community.theforeman.org/).

### Host Details - Status Survey

As part of the ongoing effort to redesign the Host Details page, we want to know how important Host Statuses are to you. Please take 3-5 minutes to complete the survey. You can find further details [here](https://community.theforeman.org/t/host-detail-page-redesign-short-survey-is-host-status-important-to-you/22366).

## Foreman @ FOSDEM and DevConf

Foreman had a virtual community booth presence at both virtual FOSDEM and DevConf this year.

### Your management layer should be cattle too

As well as this, [@evgeni](https://community.theforeman.org/u/evgeni/summary) had a great talk entitled **Your management layer should be cattle too**. You can rewatch the talk here:

<iframe width="560" height="315" src="https://video.fosdem.org/2021/D.infra/yourmanagementlayershouldbecattletoo.mp4" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

If this video does not load for you, click [here](https://video.fosdem.org/2021/D.infra/yourmanagementlayershouldbecattletoo.mp4) or refresh the page.

### Application-centric Deployment with Foreman & Katello

[@bernhard_suttner](https://community.theforeman.org/u/bernhard_suttner/) gave a fantastic presentation on **Application-centric Deployment with Foreman & Katello**. You can rewatch the talk here:

<iframe width="560" height="315" src="https://video.fosdem.org/2021/D.infra/applicationcentricdeploymentwithforemankatello.mp4" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

If this video does not load for you, click [here](https://video.fosdem.org/2021/D.infra/applicationcentricdeploymentwithforemankatello.mp4) or refresh the page.

If you have any questions or comments on either of the talks, please reply to this post or open a new discussion on the [Foreman Community Discourse](https://community.theforeman.org/).

## Introduction to Foreman blog series

[@Marek_Hulan](https://community.theforeman.org/u/Marek_Hulan) has been writing a series of blog posts that he hopes makes getting started with Foreman easier.
So far we have the following articles:

* [How to Start with Foreman](https://theforeman.org/2020/12/how-to-start-with-foreman.html)
* [Updating Foreman Inventory with System Facts](https://theforeman.org/2021/01/updating-foreman-inventory-with-system-facts.html)
* [Introduction to the Remote Execution plugin](https://theforeman.org/2021/02/introduction-to-the-remote-execution-plugin.html)

If you are looking for a blog or deep dive on a particular topic, please reply to this post or open a new topic on the [Foreman Community Discourse](https://community.theforeman.org/). We would happy to hear from you!

## Community Demo #90

At the last community demo, we had two first-time demoers! They're very welcome, as are you to sign up and demo something you're working on, or ask for feedback on something in progress but not quite there yet:

[@msinghal](https://community.theforeman.org/u/msinghal) demoed how to **Register Content Host with different OSes** and  **Katello: Content View Filter for APT Repositories**.

There was a drop in network connection during the final demo, both on [@msinghal](https://community.theforeman.org/u/msinghal)'s side and ours, so nothing was actually lost :-)

<iframe width="560" height="315" src="https://www.youtube.com/embed/d8itKIGiino" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

[@laugmanuel](https://community.theforeman.org/u/laugmanuel) demoed a new Foreman plugin called **Foreman Vault** that is an interface between Foreman and HashiCorp Vault where you can store secrets, certificates, and passwords:

<iframe width="560" height="315" src="https://www.youtube.com/embed/d8itKIGiino?start=2262" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

Our full line up is [here](https://community.theforeman.org/t/foreman-community-demo-90/22282?u=mcorr). The YouTube video and event in Foreman Community Discourse has all the time stamps of each of the demos. Any feedback, let us know.

Our next demo takes place on March 4. You can sign up [here](https://community.theforeman.org/t/foreman-community-demo-91/22405?u=mcorr).

## Foreman Community Demo #100

At some point this year, (kudos to anyone who reads this and tells me the date), we will hit upon our 100th Foreman Community Demo. We would like to do something special, something out of the ordinary. If you have any ideas, please drop your idea in the reply comments here or open a thread on the [Foreman Community Discourse](https://community.theforeman.org/).

## UX Interest Group's @theforeman/vendor sub-package deep dive

[@sharvit](https://community.theforeman.org/u/sharvit) explains how Foreman core and plugins import shared packages from Foreman’s vendor, and also why the test environment is different from development and production by its dependencies usage.

<iframe width="560" height="315" src="https://www.youtube.com/embed/VD0UjNt3eSw" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

If you have any feedback, please reply to [@theforeman/vendor - Deep Dive (and a wondering)](https://community.theforeman.org/t/theforeman-vendor-deep-dive-and-a-wondering/22510?u=mcorr) on the Foreman Community Discourse.

## New Video: Foreman - Remote Execution & Ansible

A big thank you to [@ezr-ondrej](https://community.theforeman.org/u/ezr-ondrej) who made a tutorial to help you get set up and using Foreman for Remote Execution and Ansible.

<iframe width="560" height="315" src="https://www.youtube.com/embed/jC0c3kv2ofA" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## New Video: Foreman OpenSCAP

A big thank you to [@upadhyeammit](https://community.theforeman.org/u/upadhyeammit) who made a great video walkthrough of the OpenSCAP workflows in Foreman:

<iframe width="560" height="315" src="https://www.youtube.com/embed/wtDut_vuSDc" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

If you're looking for a particular workflow in video format, please let us know! 

## Community RFCs this month

### REX Pull Provider

As Katello 4.0 comes closer to release, bringing with it major changes, an important discussion about the workflow for a [REX Pull Provider](https://community.theforeman.org/t/rfc-rex-pull-provider/21593) have been ongoing for a few months, with a call for feedback at several stages, including during the previous community demo. [@Justin_Sherrill](https://community.theforeman.org/u/Justin_Sherrill) provided a [recent update](https://community.theforeman.org/t/rfc-rex-pull-provider/21593/28?u=mcorr), with some important discoveries about the implications of some of the options explored. If you have any thoughts on the work flows mentioned, please reply to the discussion, even simply to voice your agreement.

### Menu navigation - Search & go component

[@lstejskal](https://community.theforeman.org/u/lstejskal) raised a UX-related issue about the difficulties in finding specific menus within Foreman and proposed a [search capability](https://community.theforeman.org/t/rfc-menu-navigation-search-go-component/22474) for retrieving menu items.

## Thank You!

Thank you to everyone who asked and answered questions, opened issues, and made the Foreman community a vibrant place to be over the last month!
