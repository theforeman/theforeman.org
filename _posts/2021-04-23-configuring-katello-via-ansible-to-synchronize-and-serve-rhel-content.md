---
layout: post
title: Configuring Katello via Ansible to synchronize and serve RHEL content
date: 2021-04-23 19:57:24
author: Melanie Corr, William Clark
tags:
- foreman
---

Over the last two years, the Foreman community has enjoyed rapid development in the area of automating Foreman using [Foreman Ansible Modules](https://github.com/theforeman/foreman-ansible-modules). If you're interested in an introduction, check out [@evgeni](https://community.theforeman.org/u/evgeni/summary)'s' recent talk at FOSDEM 2020: [Your management layer should be cattle too!](https://video.fosdem.org/fosdem/2021/D.infra/yourmanagementlayershouldbecattletoo.mp4) as well as well as Jeffrey Van Pelt's great blog about [Foreman Config as Code](https://theforeman.org/2020/10/foreman-config-as-code.html). In the last while, community member [@besmirzanaj](https://community.theforeman.org/u/besmirzanaj/summary) also contributed a tutorial about [Setting up Foreman and managing it with Ansible ](https://community.theforeman.org/t/set-up-foreman-and-manage-it-with-ansible/22717?u=mcorr). Within the Foreman community, the interest and enthusiasm for automating regular Foreman tasks using Ansible is active and growing

<!--more-->


In the most recent community demo, [@wbclark](https://community.theforeman.org/u/wbclark) gave a preview of a forthcoming [content_rhel Ansible role](https://github.com/theforeman/foreman-ansible-modules/tree/develop/roles/content_rhel), which is a reuse of roles from the Foreman collection to automate everyday Katello workflows. Let's take a look at what you can do with this role.

The role automates the following Katello functionality:

* importing a subscription manifest
* enabling the basic rhel7 and rhel8 repositories
* performing the initial synchronization (optional)
* creating a sync plan for regularly scheduled future repository syncs
* creating a basic activation key to register and patch RHEL clients

You can find the full project demo on [wbclark's GitHub](https://github.com/wbclark/content_rhel_demo)

This includes all the steps needed to install, configure, and run the demo against a live Katello or Red Hat Satellite instance.

There are several examples of how to modify the Ansible playbook to suit your deployment's needs, starting from a minimal example, then demonstrating the different ways you could manage downloading and handling the subscription manifest, as well as setting up a sync plan to perform regularly scheduled content synchronization.

## Let us know what you think

Are you using Foreman Ansible Modules? If so, how? What would you like to see next? Have you tried to reuse the roles or extend their functionality to suit your deployment? We'd love to hear how the Foreman Ansible Modules are being put to use in the community!

You can rewatch wclark's demo here:

<iframe width="560" height="315" src="https://www.youtube.com/embed/k0spcDCIYYU" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
