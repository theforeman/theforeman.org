---
layout: post
title: Foreman Community Newsletter (March 2022)
date: 2022-04-04
author: Melanie Corr
tags:
- foreman
---

You blink and one quarter of a year goes by.
However, you can always stay up to date with what's been happening in the Foreman community in our monthly newsletter!

<!--more-->


## Foreman 3.2 is now generally available

Foreman 3.2 comes with over seventy bug fixes as well as a number of enhancements. If you're ever experiencing issues in Foreman, often an upgrade will be enough for the issue to disappear.

Upgrade today to enjoy the latest fixes and enhancements.

For more information about this release, see the [Foreman 3.2 release announcement](https://community.theforeman.org/t/foreman-3-2-0-ga-has-been-released/27739).

### Migrating Hosts to the new format in Foreman 3.2

The way Foreman handles configuration management reports is changing, they are now stored in more efficient way. If you upgraded to 3.2 and noticed there is a warning when you visit Configuration Reports page, you need to reconfigure your Ansible and Puppet callback to send reports to the new API. The old API and Configuration Reports screen will continue working in 3.2 normally, but it is planned to be removed in 3.3 so we recommend to migrate early.

For more information, see the tutorial: [Migrating reports to the new format in Foreman 3.2](https://community.theforeman.org/t/migrating-reports-to-the-new-format-in-foreman-3-2/25846).

## Katello 4.4 is now generally available

Katello 4.4 comes with enhancements that include performance improvements for repository indexing: now up to six times faster than in previous releases. As well as this, there has been more progress around the host details page, as well as improvements to Inter Server Syncing for disconnected Foreman scenarios. For more details about the headline features, see [Katello 4.4 Headline features](https://docs.theforeman.org/3.2/Release_notes/index-katello.html#katello-headline-features).

For more information about the Katello release, including how to upgrade or install Katello 4.4, see the [release announcement](https://community.theforeman.org/t/katello-4-4-0-is-now-available/27846).

## Merging Foreman and Katello release processes

The release team have had active discussions about merging the Foreman and Katello release processes to simplify the process for everyone. This conversation is ongoing. For more information, see the [Proposal](https://community.theforeman.org/t/proposal-merging-foreman-pipelines-with-pipelines-of-other-plugins/27453/3)

## AlmaLinux added to test platform

Since the sunset of Centos 8, we reviewed which platforms and OSes we would test Foreman against.

[evgeni](https://community.theforeman.org/u/evgeni/) updated the list of operating systems after a few months:

**Tested:** CentOS 8 Stream, Almalinux 8
**Supported:** RHEL, Rocky

For more information, see [evgeni](https://community.theforeman.org/u/evgeni/)'s [full post](https://community.theforeman.org/t/proposal-merging-foreman-pipelines-with-pipelines-of-other-plugins/27453/3).


## Katello Alternative Content Sources Redesign Proposal

[iballou](https://community.theforeman.org/u/iballou/) and [MariSvirik](https://community.theforeman.org/u/MariSvirik/) participated in the most recent Foreman Community demo to talk through their latest thoughts on simplifying how alternative content sources are handled in Katello. Their proposal simplifies the flow greatly but at the cost of removing some customization options. Take a look at their presentation here:

<iframe width="560" height="315" src="https://www.youtube.com/embed/ykQFM7aFczY?start=345" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

If you have any feedback, let them know on the thread: [RFC Katello Alternative Content Sources](https://community.theforeman.org/t/rfc-katello-alternate-content-sources/24612/10).

## New default port for Smart Proxy

The discussion around adding [Katello to a Foreman install](https://community.theforeman.org/t/rfc-adding-katello-to-a-foreman-install/18060) has been ongoing for a number of years now, with all angles needing thorough exploration so that any move in this direction will be positive for both Foreman and Katello users.

As part of work towards this higher goal, [ehelms](https://community.theforeman.org/u/ehelms) started a discussion this month on the topic of requiring a new default port for Smart Proxy. Part of the change entails freeing up the Foreman default for smart-proxy (8443) on Katello installs by moving Candlepin to port 23443 and moving the reverse proxy on a foreman-proxy to 443. The latter still needing a few more releases before we can fully drop.

[ehelms](https://community.theforeman.org/u/ehelms) delves into great detail and is looking for any feedback or considerations. For more information, see [RFC: New default port for Smart Proxy](https://community.theforeman.org/t/rfc-new-default-port-for-smart-proxy/27716).

## Community Demo #108

We had one action-packed community demo this month.

<iframe width="560" height="315" src="https://www.youtube.com/embed/ykQFM7aFczY" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

If you would prefer to read a summary of the demo, you can find one [here](https://community.theforeman.org/t/foreman-community-demo-108/27630/6).

Here are the demo time stamps so you can jump to any section that looks interesting.

### Foreman user-focused demos


* [Katello 4.4 GA Updates](https://youtu.be/ykQFM7aFczY?t=145)
* [Alternate content access - direction change and simplified design](https://youtu.be/ykQFM7aFczY?t=345)
* [Katello new host details: Column sorting, tab hiding & host collections](https://youtu.be/ykQFM7aFczY?t=834)
* [ISS improvements and bug fixes](https://youtu.be/ykQFM7aFczY?t=1105)
* [Katello new host details: Packages](https://youtu.be/ykQFM7aFczY?t=1471)
* [2 Bug fixes in the bookmarks](https://youtu.be/ykQFM7aFczY?t=1670)
* [Import ansible playbooks](https://youtu.be/ykQFM7aFczY?t=1788)
* [New features in host page](https://youtu.be/ykQFM7aFczY?t=1987)
* [DSL autocompletion in templates](https://youtu.be/ykQFM7aFczY?t=2311)


### Foreman developer-focused demos

* [Adding 'Breaking Change' tag to foreman github](https://youtu.be/ykQFM7aFczY?t=3064)
* [GraphQL schema, associations and why we need `record_for`](https://youtu.be/ykQFM7aFczY?t=3200)


## Thank you!

Thank you to everyone who asked and answered questions, opened issues, and made the Foreman community a vibrant place to be over the last month!
