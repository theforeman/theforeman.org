---
layout: post
title: ATIX in the Foreman Community
date: 2020-10-20 08:33:28
author: Maximilian Kolb
tags:
- foreman
---

As outlined in [Adding a vendor list to theforeman.org site](https://community.theforeman.org/t/adding-a-vendor-list-to-theforeman-org-site/20581), over the next few weeks, we will host some guest posts from different companies and consultants who offer professional services based on or extending Foreman for their customers. In this post, we hear from [@maximilian](https://community.theforeman.org/u/maximilian/summary) from [ATIX](https://atix.de/) and how they’ve interacted with the Foreman community to date. If you want to contribute to this series, please contact [@mcorr](https://community.theforeman.org/u/mcorr/summary).

<!--more-->


From its inception, [ATIX](https://atix.de/) was conceived as a Linux and open source company. In this context, we provide our customers with consulting, support, and training for various open source technologies including Foreman, Ansible, Salt, Puppet, Apache Kafka, Kubernetes and other technologies to automate and run a Linux based data center. Since 2016, we also provide [orcharhino](https://orcharhino.com/), our own downstream product based on Foreman and Katello. To this end, ATIX has its very own engineering team and various consulting teams fully dedicated to orcharhino and the larger Foreman ecosystem.

By relying on these (and other) open source projects, Foreman and orcharhino both benefit from a large and active community of developers, testers, and users. All of our features, bug fixes, and insights gained while working on orcharhino are also made available to the upstream open source projects, [Foreman](https://theforeman.org/), [Katello](https://theforeman.org/plugins/katello/), and [Pulp](https://pulpproject.org/).

Our goal is to make orcharhino as vendor neutral as possible, so we can pass on the full palette of compute resource providers, operating systems, configuration management systems, and content types provided by Foreman and Katello to our orcharhino customers. In keeping with this mission, we seek to actively build upon and extend Foreman's support for any vendors that might currently enjoy a smaller feature set compared to others. To date, we have developed several Foreman plugins and made major contributions to Foreman's Debian, Ubuntu, and SLES support. As such, ATIX is delighted to be an integral part of the Foreman open source ecosystem.

Let's take a closer look at some of the areas where ATIX has been focusing its proudest contributions on:

* Adding [Debian and Ubuntu](https://github.com/pulp/pulp_deb) content management (including Errata) to Katello
* Creating the [Foreman SCC Manager plugin](https://github.com/ATIX-AG/foreman_scc_manager) to support SLES
* Contributing to the [Foreman FOG Proxmox plugin](https://github.com/theforeman/foreman_fog_proxmox)

ATIX is actively working on adding support for Debian and Ubuntu (APT) content management including errata support to Katello. As such, ATIX is the current maintainer and main developer of the [Pulp Debian plugin](https://github.com/pulp/pulp_deb) for Pulp 3. The [pulp_deb plugin](https://github.com/pulp/pulp_deb) allows you to manage APT repositories within Pulp. It helps you manage DEB content by synchronizing remote repositories, by providing an interface to upload your own content, and by publishing content to repositories. In a forthcoming article on [opensource.com](https://opensource.com/), you can read a general introduction to [pulp_deb](https://github.com/pulp/pulp_deb) and for a description of an example workflow.

ATIX also open sourced its Debian Errata Parser Service, consisting of an [errata server](https://github.com/ATIX-AG/errata_server) and an [errata parser](https://github.com/ATIX-AG/errata_parser). Our enterprise customers receive errata information for CentOS, Debian, and Ubuntu directly from ATIX. Community users may host this themselves in order to fetch, parse, and provide errata information for Debian and Ubuntu hosts in Foreman. This allows for a practical errata and patch management for Debian and Ubuntu within Foreman.

Regarding SLES, ATIX maintains and primarily develops the [Foreman SCC Manager plugin](https://github.com/ATIX-AG/foreman_scc_manager), which connects your SUSE SCC account to a Foreman instance. It's an open source plugin to automatically synchronize SUSE Customer Center products and repositories into Katello. This plugin adds a 'SUSE Subscriptions' page to your content menu where you can add your SUSE SCC account details to Foreman. It conveniently lists all selected products and repositories to Foreman, which can be synced manually or regularly with a sync plan.

ATIX also maintains and primarily develops another Foreman plugin called [Foreman Snapshot Management](https://github.com/ATIX-AG/foreman_snapshot_management) to manage snapshots of hosts from within Foreman. It works with both VMware vSphere and Proxmox as compute resource providers. Its features includes listing available snapshots, creating and deleting snapshots of a virtual machine, and reverting the virtual machine to an earlier snapshot.

Next to extending the Foreman Snapshot Management plugin to not only support VMware vSphere, but also Proxmox, we also contribute to the [Foreman FOG Proxmox plugin](https://github.com/theforeman/foreman_fog_proxmox). This plugin helps you attach a Proxmox compute resource provider to Foreman.

As we love automation, ATIX is one of the main contributors to the [Foreman Ansible modules](https://github.com/theforeman/foreman-ansible-modules) too. The contributions span from writing documentation and adding tests, to fixing bugs and implementing new modules.

The orcharhino documentation, while not being open source itself, is openly available on the internet at [docs.orcharhino.com](https://docs.orcharhino.com/). Foreman users may choose this as an extension to the official [Foreman documentation](https://theforeman.org/manuals/nightly/index.html) and [Red Hat Satellite documentation](https://access.redhat.com/documentation/en-us/red_hat_satellite/). There are also plans to put larger parts of the orcharhino documentation upstream which are currently a work in progress. Watch the talk held on the Foreman Birthday Party on [YouTube](https://www.youtube.com/watch?v=qfyk30_TkmQ) about ATIX's plans to open source its documentation for more insights.

Overall, ATIX developers are present on all kinds of channels surrounding Foreman: Redmine, IRC, Foreman Community Forum, Pulp Issue Tracker, as well as mailing lists. ATIX is glad to be part of the vibrant Foreman community from reporting bugs to developing features and bug fixes as well as providing enterprise support - now and in the future.

Talking about the future: we at ATIX also hope to invite you -post COVID19- to another Foreman Birthday Party and celebrate our achievements in person again as we [already did](https://atix.de/recap-the-foreman-birthday-party-atix/).
