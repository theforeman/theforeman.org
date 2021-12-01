---
layout: post
title: Foreman Community Newsletter (November 2021)
date: 2021-12-01
author: Melanie Corr
tags:
- foreman
---

In somewhat of a contribution special, take a look at some easy ways you can help the Foreman community today.

<!--more-->

## How can I make easy contributions to Foreman?

People might assume that contributing to an open source project means contributing code.
While PRs are always welcome over on [theforeman's GitHub repo](https://github.com/theforeman/), this is far from true.
There are many ways to contribute to Foreman.
Here are some quick ways you can help Foreman today.

At the moment, we are preparing for the releases of Foreman 3.1 and Katello 4.3.
One way you could make a big contribution to the project is to install the release candidates and try out some of your regular workflows, or explore the new features, and [let us know if everything looks OK](https://community.theforeman.org/).
This contributes to the stability of the future release.

## Evaluate Foreman 3.1 RC 2

As well as many bug fixes, with the Foreman 3.1 release candidate, you can evaluate the following new features:

* Enhancements to the new host details page
* Descriptions for all provisioning templates
* A new purge:puppet rake task
* Cron job added to help manage Audit cleanups
* Provisioning snippets support Puppet 7

For more information about how to install this release candidate, check out the [Foreman 3.1 release candidate announcement](https://community.theforeman.org/t/foreman-3-1-rc2-is-ready-for-testing/26368/).

## Evaluate Katello 4.3 RC 1

As well as bug fixes, with the Katello 4.3 release candidate, you can evaluate the following new features:

* A complete update to the Content View web UI and associated workflows
* Some OSTree content support
* Oracle ULN content support
* Inter Server Sync (ISS) available for connected workflows
* ....And much more.

For information about how to install this release candidate, check out the [Katello 4.3 release candidate announcement](https://community.theforeman.org/t/katello-4-3-rc1-is-now-ready-for-testing/26349) on our Foreman Community Discourse.

## Tell us what you think about proposed changes

Another quick and easy way to help the future of Foreman is to share your opinion on our [Foreman Community Discourse](https://community.theforeman.org/). Here are some hot topics from the last few weeks.

## Centos 8 sunsets soon; what next?

At the moment, we are preparing to change which platform we install Foreman on because Centos 8 becomes EOL at the end of this year.

[ehelms](https://community.theforeman.org/u/ehelms) lays out the options he sees for what to do about building of RPMs and testing of RPMs for future Foreman releases.

He outlines his thoughts on two possible options:

* Option 1: Build against RHEL
* Option 2: Build against CentOS Stream

Please let him know what you think over on his post: [RFC - Enterprise Linux 8 and 9 Support](https://community.theforeman.org/t/rfc-enterprise-linux-8-and-9-support/26282).

## How do you use organization/locations in Foreman?

A few weeks ago, [ezr-ondrej](https://community.theforeman.org/u/ezr-ondrej) posted about how [Foreman's taxonomies are difficult for users and developer's alike](https://community.theforeman.org/t/single-organization-on-resources-to-simplify-taxonomies/25416) and included some initial thoughts about a path forward. As part of this discussion, we want to know how you use Foreman's organizations and locations in your deployment.

You can really help us by replying to the question: [How do you use Foreman's organizations and locations?](https://community.theforeman.org/t/how-do-you-use-foreman-organizations-locations/26236)

## Help us create better tuning presets!

Our one and only [evgeni](https://community.theforeman.org/u/evgeni) wants to build better tuning profiles for Foreman to help you manage memory usage.

To do this, he needs to collect a range of examples from the community. For the most part he is looking for:

* Information about your CPU and memory usage for Foreman processes, as well as details about your deployment.

With this information, we can create realistic tuning profiles to help you manage memory consumption.

To contribute to this discussion, reply to [Metrics for better tuning presets](https://community.theforeman.org/t/metrics-for-better-tuning-presets/26224/).

## What do you think about the new Content View page?

If you have been following our community demos, you might be aware that a lot of time and energy has gone into enhancing and simplifying the Content View workflow in the Foreman web UI.
Now it is time for you to tell us what you think.
Please let us know on [Foreman 3.0 new Content View page feedback](https://community.theforeman.org/t/foreman-3-0-new-content-view-page-feedback/26237) thread on our community discourse.

## New documentation for Katello Debian, SUSE,

Speaking of contributions, a big thank you to [maximilian](https://community.theforeman.org/u/maximilian/summary) and [ATIX AG](https://atix.de/en/) for providing documentation for adding Debian content with Katello.

Check out the latest additions to our [docs.theforeman.org site](https://docs.theforeman.org) Katello docs:

* [Adding Debian repositories](https://docs.theforeman.org/nightly/Content_Management_Guide/index-katello.html#Adding_Custom_DEB_Repositories_content-management)
* [Managing SUSE Content](https://docs.theforeman.org/nightly/Content_Management_Guide/index-katello.html#Managing_SUSE_Content_content-management)
* [Applying Errata to Debian hosts](https://docs.theforeman.org/nightly/Content_Management_Guide/index-katello.html#Applying_Errata_to_a_Host_content-management)

## ForemanCon 2021

Two week ago, we hosted a wide range of talks related to all aspects of the Foreman Project. We looked at both new and improving user workflows, as well as developer-focused sessions. You can rewatch all of our sessions on our YouTube playlist:

<iframe width="560" height="315" src="https://www.youtube.com/embed/videoseries?list=PLLTIBSsvp9qTai07h7OOB52oVBEmgMtJF" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

You can also find a [recap of ForemanCon 2021](https://theforeman.org/2021/11/in-case-you-missed-it-foremancon-2021.html) on our blog.

### Foreman at the Rubin Observatory

One of the highlights of ForemanCon 2021 was our guest speaker Joshua Hoblitt who talked to us about his work at the [Rubin Observatory](https://www.lsst.org/) and how Foreman is used there.

<iframe width="560" height="315" src="https://www.youtube.com/embed/BhGRRo9ZIcU" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## Final Community Demo of 2021

Our final community demo of 2021 takes place on Thurs December 2. We will be dreaming live, and you're welcome to join us and ask questions. Find more information and links at our [Foreman Community Demo 104](https://community.theforeman.org/t/foreman-community-demo-104/26281) post on our community discourse.

## Thank you!

Thank you to everyone who asked and answered questions, opened issues, and made the Foreman community a vibrant place to be over the last month!
