---
layout: post
title: Foreman Ansible Modules v1.3.0 released
date: 2020-09-22 13:19:36
author: Evgeni Golov
tags:
- foreman
---

Since the release of [Foreman Ansible Modules v1.0.0](/2020/06/foreman-ansible-modules-v100-released.html), we've been pretty busy and managed to release v1.1.0, v1.2.0 and today v1.3.0!

<!--more-->

But we totally failed to report what has changed to a broader audience. Sorry!

Well, it's actually not *that* bad, as one of the changes we implemented was a [changelog](https://github.com/theforeman/foreman-ansible-modules/blob/develop/CHANGELOG.rst), which is also part of the collection that is uploaded to Galaxy and is rendered as part of the [online documentation](https://theforeman.org/plugins/foreman-ansible-modules/).

And of course, there was the [Community Demo #84](https://youtu.be/8349tS5WAzU?t=2217) where you could hear me talking about this. Yet, having something nicely written and easy to read is always nice, right?

Well, let's see what we did since v1.0.0…

Probably the most interesting change in v1.3.0 is the ability to supply the connection details (URL and credentials) as environment variables. This will allow users to inject this information from external sources without adjusting playbooks!

Coming close, the 2nd most interesting change is the addition of the `status_info` module that will allow users to briefly verify if the server is up and running without executing any actions.

Going further back to v1.2.0, there are again two very interesting changes that are targeted at users who deploy virtual machines using Foreman. The `host` module now supports passing `compute_attributes`, which can be used to override defaults of a compute resource (like RAM or CPU) or to instruct the compute resource to actually boot the system after creation. This is especially important for VMware users because with VMware provisioning, Foreman does not automatically boot the created VM and this resulted in bad deployments using Ansible.

The second change is also in the `host` module: if you pass `parameters` when creating a host, those are now created at the same time as the host and not in a separate API call afterwards, which means they are available immediately when the host is freshly deployed.

And last but not least, in v1.1.0 we introduced a new module for managing HTTP Proxies inside Foreman: `http_proxy`.

Obviously, that's not the full changelog, as you can read that one online ;-)

As usual, grab the fresh release from [Ansible Galaxy](https://galaxy.ansible.com/theforeman/foreman) or as RPM (`ansible-collection-theforeman-foreman`) in the `client` repository on [yum.theforeman.org](https://yum.theforeman.org)!
