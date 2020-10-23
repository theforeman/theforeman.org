---
layout: post
title: Foreman Ansible Modules v1.4.0 released
date: 2020-10-23 12:18:47
author: Evgeni Golov
tags:
- foreman
- ansible
---

Okay, you know the [drill](/2020/09/foreman-ansible-modules-v130-released.html), we have released [Foreman Ansible Modules v1.4.0](https://galaxy.ansible.com/theforeman/foreman) and here is the best-of from that release!

<!--more-->

The biggest non-functional change in 1.4.0 is the vendoring of the `apypie` library. The library is responsible for the communication with the Foreman API and not Ansible-specific as such. In the past it was shipped as a standalone library and users had to install it from RPM or PyPI to be able to use the collection. This turned out to be a burden, especially for users running on enterprise distributions, so we decided to vendor the library inside the collection. The library development still happens separately on [GitHub](https://github.com/Apipie/apypie). Users now only have to install the `requests` library, which is easily available on any distribution.

No new release without a new module, right? Well, this time you get two!

[`job_invocation`](https://theforeman.github.io/foreman-ansible-modules/v1.4.0/plugins/job_invocation_module.html) allows you to run and schedule Remote Execution jobs from Ansible. You can even use Ansible to schedule an Ansible run that schedules an Ansible run…

[`smart_proxy`](https://theforeman.github.io/foreman-ansible-modules/v1.4.0/plugins/smart_proxy_module.html) allows you to manage Smart Proxies, including setting the download policy and assigning lifecycle environments on Katello installations.

The `redhat_manifest` module now supports creating [Simple Content Access](https://access.redhat.com/articles/simple-content-access) manifests ([#820](https://github.com/theforeman/foreman-ansible-modules/issues/820)).

All modules now detect if you passed any parameters that aren't supported by your version of Foreman (or plugins), and warn you instead of failing with a cryptic error message ([#975](https://github.com/theforeman/foreman-ansible-modules/issues/975)).

Modules that refer to another entity (like the `dns_proxy` parameter of the `domain` module) now support unassigning these by passing an empty string for that parameter ([#969](https://github.com/theforeman/foreman-ansible-modules/issues/969)).

See the full [1.4.0 changelog](https://theforeman.github.io/foreman-ansible-modules/v1.4.0/CHANGELOG.html) for the rest of the changes.

And may I leak something to you? 1.5.0 will contain something super new! A *role* for even easier manifest management!

So grab 1.4.0 while it's hot and use the waiting time until 1.5.0 for some heavy testing of the new 1.4.0 features ;)
