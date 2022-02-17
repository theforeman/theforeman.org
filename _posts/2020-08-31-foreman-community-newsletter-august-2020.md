---
layout: post
title: Foreman Community Newsletter (August 2020)
date: 2020-08-31 10:49:45
author: Foreman
tags:
- foreman
---

New Infrastructure SIG group, provisioning deep-dive mini survey, roadmap updates, community demos, and much more.

<!--more-->

## Releases

### Foreman 2.1.2 has been released!

This release contains six bug fixes and improvements, most notably a fix for a regression in VMWare compute resource creation via the API and dynflow support in rake tasks. For more information, see [@tbrisker's release announcement](https://community.theforeman.org/t/foreman-2-1-2-has-been-released/20230?u=mcorr).

### Foreman 2.0.2 has been released!

This release contains three bug fixes and improvements, most notably fixing [CVE-2020-14334](https://theforeman.org/security.html#2020-14334) and a dependency issue with `xmlrpc`.

With the 2.2 release process in motion, this will most likely be the final release in the 2.0 line. Users are encouraged to start planning their upgrade process to 2.1 and beyond.

For more information, see [@tbrisker's release announcement](https://community.theforeman.org/t/foreman-2-0-2-has-been-released/20161?u=mcorr).

### Foreman 2.2.0-rc1 Test Week

For the last two weeks, 2.2.0's first release candidate is available for testing. Please install and evaluate the release candidate to help make this release as stable and successful as possible.

For more information, see [@tbrisker's release candidate announcement](https://community.theforeman.org/t/foreman-2-2-0-rc1-is-ready-for-testing/20057?u=mcorr).

Please contribute in whatever way you can to the ongoing **test week** efforts. For more information about how to help with testing, see [@lzap's test week announcement](https://community.theforeman.org/t/foreman-2-2-test-week/20122).

For more information about what is included in this release, see the [release notes](https://theforeman.org/manuals/2.2/index.html#Releasenotesfor2.2).

### Katello 3.16.0 has been released!

Earlier this month, Katello 3.16 was released. As the Katello team worked through the many release candidates, they also announced a [release schedule update](https://community.theforeman.org/t/new-katello-release-schedule-pulp-3-migration-update/19884?u=mcorr).

For more information, see [@iballou's release announcement](https://community.theforeman.org/t/katello-3-16-0-has-been-released/20025?u=mcorr)

## Provisioning Mini Questionnaire

Over the coming months, we want to host a series of deep dives around provisioning. Because Foreman has so many provisioning options, we need your help to know how to prioritize. Please complete the [Provisioning mini-Questionnaire](https://docs.google.com/forms/d/e/1FAIpQLSf6xTYadkva6V9vReyqyCMydf0mbt8xL16t9WQxDyAQGCmSLA/viewform) to let us know what interests you and what you would like to see.

## Red Hat Product Management Community Update

Dana Singleterry of Red Hat Product Management team will present an update of the Red Hat roadmap to the community on September 16. This event will be livestreamed and Dana is happy to take your questions.

If you're interested in attending this event, add it to your [calendar](https://community.theforeman.org/t/red-hat-product-management-community-update-2/20135?u=mcorr). The YouTube livechat and #theforeman libera.chat IRC channel will be monitored for questions. However, this meeting is open to all and if you would like to join the meeting and ask questions yourself, reply to the event and a link will be sent to you!

## Infrastructure Special Interest Group (SIG)

After a [kickoff post](https://community.theforeman.org/t/infrastructure-sig/19954) from [@ehelms](https://community.theforeman.org/u/ehelms/summary), the Foreman Infrastructure SIG had its first meeting. These meetings are open to all and are a great opportunity to contribute to Foreman.

You can watch the first meeting on YouTube or read the [minutes](https://community.theforeman.org/t/infrastructure-sig-meeting-notes-8-18/20121?u=mcorr).

<iframe width="560" height="315" src="https://www.youtube.com/embed/tkTTFVcZuxE" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

If you're interested in joining, learning more, or have any comments or queries, please post to the new [infra SIG](https://community.theforeman.org/c/development/infra/) section of the Foreman community discourse.

## Containerizing Foreman Deep Dive

[@ondrej_prazak](https://community.theforeman.org/u/ondrej_prazak/) and [@ohadlevy](https://community.theforeman.org/u/ohadlevy/) held a deep dive into the advantages and challenges with running Foreman in a container. The discussion continued on the community [Discourse](https://community.theforeman.org/t/containerizing-foreman-deep-dive/19888?u=mcorr). Feel free to join the discussion at any time.


<iframe width="560" height="315" src="https://www.youtube.com/embed/IbrLRpH4Sgs?start=25" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## RFCs in the Community

Here are some of the RFCs that were discussed in the community over the last month. It means a lot to the OP to hear your opinions on these issues, so even if you have no objection or major contributions, a "sounds good to me" can go a long way to helping these discussions progress.

### [Installer Output and Logging Format](https://community.theforeman.org/t/rfc-installer-output-and-logging-format/20053?u=mcorr)

[@ehelms](https://community.theforeman.org/u/ehelms/summary) outlines some ideas for improving the standard progress output of the installer along with enhancements to the log output.

### [Drop oVirt API V3 from Foreman](https://community.theforeman.org/t/suggestion-to-drop-ovirt-api-v3-from-foreman/19915?u=mcorr)

[@shiramax](https://community.theforeman.org/u/shiramax/summary) raised the issue that oVirt REST API V3 has been deprecated and should also be deprecated in Foreman.

### [Host overview on hosts status click](https://community.theforeman.org/t/host-overview-on-hosts-status-click/19948?u=mcorr)

While working on a plugin feature, [@Laviro](https://community.theforeman.org/u/Laviro/summary) found himself clicking back and forth to the host overview page to verified if parameters had been updated. [@Laviro](https://community.theforeman.org/u/Laviro/summary) proposed enhancements to the work flow that might tie in with the host details page redesign efforts.

### [Merging foreman-tasks into the core](https://community.theforeman.org/t/merging-foreman-tasks-into-the-core/20207?u=mcorr)

[@Marek_Hulan](https://community.theforeman.org/u/Marek_Hulan/summary) revived an earlier [discussion](https://community.theforeman.org/t/moving-foreman-tasks-to-the-core-the-plan/6441) about merging Foreman tasks into core and summarized the logic behind merging `foreman-tasks` into core.


## Community Demos

Thanks to everyone who demoed their latest developments during the month of August! There were two community demos, [#82](https://youtu.be/G93PpV0_cho) and [#83](https://youtu.be/LaNxKGrs6Dg), with a nice spread of new Foreman and Katello features. All the demos are timestamped and available for watch.


### Community Demo 82

The following demos took place as part of Community Demo #82

|@ptiwari|  [Katello- Toggle Simple Content Access](https://youtu.be/G93PpV0_cho?t=123)|
|@jjeffers| [Katello - podman/search support](https://youtu.be/G93PpV0_cho?t=275)|
|@cintrix84| [Katello - Notification on CV change](https://youtu.be/G93PpV0_cho?t=611)|
|@lstejskal| [Global registration template](https://youtu.be/G93PpV0_cho?t=744)|
|@dmatoulek| [New error page](https://youtu.be/G93PpV0_cho?t=927)|
|@dmatoulek| [Removed puppetrun button](https://youtu.be/G93PpV0_cho?t=1128)|
|@ofedoren| [Templates DSL docs](https://youtu.be/G93PpV0_cho?t=1252)|

### Community Demo 83

The following demos took place as part of Community Demo #83

|@tbrisker| | [latest releases and community templates archival](https://youtu.be/LaNxKGrs6Dg?t=92)
|@Justin_Sherrill| | [Running katello without pulp2](https://youtu.be/LaNxKGrs6Dg?t=302)|
|@laviro| | [trigger toasts from API middleware](https://youtu.be/LaNxKGrs6Dg?t=453)|
|@sajha| | [Modular package filtering with pulp3](https://youtu.be/LaNxKGrs6Dg?t=622)|
|@Jonathon_Turel| | [HTTP Proxies in Virt-Who-Configure](https://youtu.be/LaNxKGrs6Dg?t=1014)
|@lstejskal| | [Foreman Operations jobs categories](https://youtu.be/LaNxKGrs6Dg?t=1334)|
|@lstejskal| | [Creating hosts with Global Registration](https://youtu.be/LaNxKGrs6Dg?t=1381)|
|@aruzicka| | [Host counts in REX](https://youtu.be/LaNxKGrs6Dg?t=1677)|
|@ezr-ondrej| | [Report data scanners API change](https://youtu.be/LaNxKGrs6Dg?t=2141)|
|@ezr-ondrej| | [Trends and statistics status](https://youtu.be/LaNxKGrs6Dg?t=2500)|
|@mariaaga| | [Interface API showing the REX flag](https://youtu.be/LaNxKGrs6Dg?t=2725)  |
|@mariaaga| | [Recurring logics page additions](https://youtu.be/LaNxKGrs6Dg?t=2767) |
|@cintrix84| | [Updated SCA UI Changes](https://youtu.be/LaNxKGrs6Dg?t=2888)|
