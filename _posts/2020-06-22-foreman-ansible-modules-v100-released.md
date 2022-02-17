---
layout: post
title: Foreman Ansible Modules v1.0.0 released
date: 2020-06-22 12:43:21
author: Evgeni Golov
tags:
- foreman
---

You've probably [heard already me talking](https://theforeman.org/media.html) about how you can [automate Foreman using Ansible and our Foreman Ansible Modules](https://theforeman.org/2019/09/automating-foreman-and-katello-with-ansible.html). And if you did, I have great news for you: we just [released **v1.0.0**](https://galaxy.ansible.com/theforeman/foreman) - the first officially stable release!

<!--more-->

Oh you didn't? Well… [Foreman Ansible Modules](https://github.com/theforeman/foreman-ansible-modules/) is a collection of Ansible modules that interact with the Foreman API and that you can use to manage a Foreman installation from Ansible. You can manage Compute Resources, deploy new Hosts, create Domains and Subnets, manage Users and much more. If you're running Katello, you can also manage Content Views, upload Content Artifacts, sync Repositories, create Activation Keys and Lifecycle Environments etc.

If you used the modules in the past, v1.0.0 comes with a few noteworthy changes:
* the `foreman_` and `katello_` prefix was dropped from the module names as the collection is already namespaced
* the following modules were further renamed:
  * `foreman_environment` to `puppet_environment`
  * `foreman_model` to `hardware_model`
  * `foreman_ptable` to `partition_table`
  * `foreman_search_facts` to `resource_info`
  * `katello_manifest` to `subscription_manifest`
  * `katello_sync` to `repository_sync`
  * `katello_upload` to `content_upload` 
* the deprecated `verify_ssl` parameter was dropped, now only `validate_certs` is supported
