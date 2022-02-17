---
layout: post
title: Foreman Community Newsletter (September 2020)
date: 2020-09-29 10:27:14
author: Foreman
tags:
- foreman
---

This month, there were two Foreman releases, a Foreman Ansible modules release, a Red Hat Product Management update to the community, new and ongoing RFE discussions, as well as some new resources for Debian users, and more!

<!--more-->

Thanks to everyone who contributed to the Foreman project this month, whether it was a PR, a review, an issue, a question, or discussion point. If you have any questions, comments, or feedback on anything in this newsletter, please feel free to leave a comment here or start a thread on the [Foreman Community Discourse](https://community.theforeman.org/).

## Foreman 2.1.3 is Released!

This release is a security release, containing fixes for two known CVEs and fixes for the SELinux policy.

For more information, check out the [release announcement](https://community.theforeman.org/t/foreman-2-1-3-has-been-released/20669?u=mcorr).

## Foreman 2.0.3 is Released!

This release is also a security release and contains a fix for an important security issue affecting users who have external authentication enabled.

With the 2.2 release nearby, this will be the final release in the 2.0 line. Start planning your upgrade process to 2.1 and beyond!

For more information, check out the [release announcement](https://community.theforeman.org/t/foreman-2-0-3-has-been-released/20582?u=mcorr).

## Katello 3.17 RC 1 is Available For Testing

You can read the announcment [here](https://community.theforeman.org/t/katello-3-17-rc1-is-ready-for-testing/20362). The second release candidate should be coming shortly!

## Foreman Ansible Modules v1.3.0 Released!

You can read [@evgeni](https://community.theforeman.org/u/evgeni)'s post on the [Foreman blog](https://theforeman.org/2020/09/foreman-ansible-modules-v130-released.html) about this release.

You can also watch [@evgeni](https://community.theforeman.org/u/evgeni)'s update on what's new and what is to come with Foreman Ansible modules as part of Community Demo #84:

<iframe width="560" height="315" src="https://www.youtube.com/embed/8349tS5WAzU?start=2217" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>


## Red Hat Product Management Update to the Community

Dana Singleterry of the Red Hat Product Management team gave a Red Hat roadmap update. As we mentioned last month, there were significant updates to the [Katello roadmap](https://community.theforeman.org/t/new-katello-release-schedule-pulp-3-migration-update/19884?u=mcorr), which then factored into the Red Hat Satellite roadmap. If you have yet to catch up with the latest Red Hat roadmap changes, you can watch here.  A nice summary was posted in the [UnixSysadmin blog](https://www.unixsysadmin.com/red-hat-satellite-7/), if you prefer to read!

<iframe width="560" height="315" src="https://www.youtube.com/embed/XPceeY0KcHo" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## Subscription Manager for Debian and Ubuntu for Foreman users

For a long time, community members who manage Debian systems have dropped by the Foreman Community Discourse and looked for consumable repositories with a packaged subscription manager for Debian and Ubuntu systems. This week, community member [@maximilian](https://community.theforeman.org/u/maximilian/summary) announced that [ATIX](https://atix.de) has made consumable repositories with a packaged subscription manager for Debian 10 and Ubuntu 20.04 along with general usage instructions available for the Foreman community. For more information, see [Maximilian's announcement](https://community.theforeman.org/t/subscription-manager-for-debian-ubuntu-on-apt-atix-de/20667?u=mcorr). You can find documentation and next steps at [https://apt.atix.de/](https://apt.atix.de/).

## OpenSCAP Tutorial for Debian Users

Community member [@rm-td](https://community.theforeman.org/u/rm-td/summary) contributed a tutorial for Debian users who want to use OpenSCAP functionality in Foreman. If you're interested, check out the [Workaround to use OpenSCAP for Debian and Manage Policies from Console](https://community.theforeman.org/t/workaround-to-use-openscap-for-debian-and-manage-policies-from-console/20344?u=mcorr) post.

## Professional Service lists & Guest Blogs from Vendors

Foreman is a complex tool. This month, there was a discussion about having an efficient way to point community members who want to use Foreman but do not have the time or knowledge to set up everything themselves. Adding a page to the website for **Professional Services** is progress. In the meantime, there is an [open call](https://community.theforeman.org/t/adding-a-vendor-list-to-theforeman-org-site/20581?u=mcorr) for companies and consultants who offer professional services based on or extending Foreman for their customers to author a guest blog post. First up is [iRonin](https://www.ironin.it/foreman-development-services.html?utm_source=mailing&utm_medium=email&utm_campaign=foreman&utm_term=october) who have written about [their involvement with the Foreman community](https://theforeman.org/2020/09/ironin-in-the-foreman-community.html). [iRonin](https://www.ironin.it/foreman-development-services.html?utm_source=mailing&utm_medium=email&utm_campaign=foreman&utm_term=october) has also written recently about [a Foreman development case study](https://www.ironin.it/blog/foreman-development-services-fmcg-case-study.html?utm_source=mailing&utm_medium=email&utm_campaign=casestudy&utm_content=foreman) on their site. For more iRonin and Foreman content, there's also an index of [Foreman articles](https://www.ironin.it/blog/foreman-articles.html) that goes into further detail about what they've been working on.

## RFC: Simple & automatic host registration Workflow

The discussion around a workflow for simple and automatic host registration restarted this month with [@ekohl](https://community.theforeman.org/u/ekohl) outlining the main [workflows](https://community.theforeman.org/t/rfc-simple-automatic-host-registration-wf/19588/33?u=mcorr), which lead to further comments and discussion points.

## RFC: Optimized reports storage

[@lzap](https://community.theforeman.org/u/lzap) created a proposal and opened a discussion about his idea to [change the reports model](https://community.theforeman.org/t/rfc-optimized-reports-storage/15573?u=mcorr) to increase the speed of importing reports by up to 25 times.

## RFC: Common Fact Model

This month [@lzap](https://community.theforeman.org/u/lzap) renewed the appeal for community members to provide feedback on [facts they use in Foreman](https://community.theforeman.org/t/rfc-common-fact-model/18900?u=mcorr) to improve how these are handled. You can hear [@lzap](https://community.theforeman.org/u/lzap) talking about this at Community Demo #84:

<iframe width="560" height="315" src="https://www.youtube.com/embed/8349tS5WAzU?start=1676" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## Community Demo #84

This month, there was one Foreman community demo. All demos have been timestamped and if you've still to watch back. Foreman community demo #85 is [scheduled](https://community.theforeman.org/t/foreman-community-demo-85/20586?u=mcorr) for October 8th. Add this to your calendar!

|Speaker|Time|Topic|
| --- | --- | --- |
|@partha|7 min|[Katello: Pulp 3: Export yum repositories](https://youtu.be/8349tS5WAzU?t=108) |
|@jeremylenz|3 min|[Katello: Toggle Simple Content Access from Organization details](https://youtu.be/8349tS5WAzU?t=743)
|@jjeffers|5 min|[Katello: Pulp 3: Verify checksum for repositories](https://youtu.be/8349tS5WAzU?t=979)|
|@sajha|3 min|[Katello: Pulp 3: Configure download concurrency](https://youtu.be/8349tS5WAzU?t=1157)|
|@lzap|5 min|[Discovery and unused IP](https://youtu.be/8349tS5WAzU?t=1371)|
|@lzap|10 min|[Common Fact Model proposal](https://youtu.be/8349tS5WAzU?t=1675)|
|@evgeni|5-10 min|[Foreman Ansible Modules - what's new and what's to come](https://youtu.be/8349tS5WAzU?t=2217)|
|@dmatoulek|2 min|[Fixed form of host creation for MAC address](https://youtu.be/8349tS5WAzU?t=2945)|
|@dmatoulek|2 min|[Allowed method "IDs" from Activerecord for Reports](https://youtu.be/8349tS5WAzU?t=3078)
