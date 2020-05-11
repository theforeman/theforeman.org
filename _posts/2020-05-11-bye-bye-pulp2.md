---
layout: post
title: Katello - Saying goodbye to Pulp 2
date: 2020-05-11 14:19:53
author: Justin Sherrill
tags:
- katello
- pulp
---

<!--more-->

Hello All!

With the release of Katello 3.15 we have introduced Pulp 3 as a backend service to manage content.  Over the next couple of releases we will phase in Pulp 3 and phase out Pulp 2:

* 3.15:  Introduction of Pulp 3, File and Docker content can use Pulp 3
* 3.16:  Yum and Debian content can use Pulp 3
* 4.0:   Pulp 2 is no longer part of Katello, upgrading will remove it

With 3.15 you can start [migrating content over to Pulp 3](https://theforeman.org/plugins/katello/3.15/upgrade/index.html#pulp3-migration), or you can wait until 3.16 is available.  You will need to go through the migration process before upgrading to Katello 4.0.

Benefits
========

Some improvements Pulp 3 provides over Pulp 2 are:

* A Simplified Architecture should lead to more content types being available over time
* Standardization on Postgresql across all Katello components (No more MongoDB!)
* Simpler deployment model using reverse proxies in Apache
* Faster Content View Publishes and Promotions in some situations
* Uses Python 3

Deprecations and Removals
=========================

As part of the Pulp 2 removal, the following features have already been deprecated and will be removed as part of Katello 4.0


katello-agent
-------------

Since katello-agent depends on qpid and Pulp 2 to actually perform the actions, katello-agent will no longer be available for performing package or errata actions on hosts.  Some alternatives are:

* Foreman Remote Execution (Using SSH)
* Foreman Ansible
* Salt

Puppet content management
-------------------------

Pulp 3 does not support puppet content and the existing Content View puppet workflow has not been popular.  Thus it will be removed as part of Katello 4.0.  Some alternatives are:

* https://puppet.com/docs/pe/2017.3/control_repo.html
* https://puppet.com/docs/pe/2017.3/r10k_deploy_env.html


Ostree Content Management
-------------------------

This was used for syncing Fedora Atomic and Red Hat Atomic Ostree repositories.  These projects are now End of Life.


Do you have other ideas for alternatives to these deprecated features?  Feel free to open discussions on discourse to further the discussion or reach out to me and I would be happy to add them here.

Justin Sherrill
