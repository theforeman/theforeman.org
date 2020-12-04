---
layout: post
title: Foreman Ansible Modules v1.5.0 released
date: 2020-12-04 11:19:58
author: Evgeni Golov
tags:
- foreman
- ansible
---

You thought the [1.4.0 release](/2020/10/foreman-ansible-modules-v140-released.html) was great? Then I bet you'll *really* enjoy [Foreman Ansible Modules v1.5.0](https://galaxy.ansible.com/theforeman/foreman) that was just released!

<!--more-->

Probably the most-awaited feature in 1.5.0 is the addition of Ansible roles. While individual modules are great for implementing individual tasks, roles allow to implement full-blown workflows that can be reused by you.

In 1.5.0 we ship two roles:

* `manifest` -- automate downloading a subscription manifest from the Red Hat Portal and uploading it to Katello
* `content_view_version_cleanup` -- clean up unused content view versions

And I think it's no secret, that [there are more roles planned in future](https://github.com/theforeman/foreman-ansible-modules/pulls?q=is%3Apr+is%3Aopen+label%3Arole).

Oh, and you recognize "clean up content view versions" from [`cvmanager`](https://github.com/RedHatSatellite/katello-cvmanager)? You're right! But `cvmanager` is not maintained anymore and we urge all users to migrate to Ansible! We have prepared [documentation how to migrate from `cvmanager` to Foreman Ansible Modules](https://theforeman.github.io/foreman-ansible-modules/v1.5.0/cvmanager.html) for you!

There were no new plugins/modules in this release, but the inventory plugin gained support for the Reports API that is available in Foreman since 1.24 and that allows to generate the inventory much quicker! The same inventory plugin also gained a feature to compose the inventory hostname, in the case the hostname in Foreman is not what you want to use in Ansible. The `hosts` module can now manage all interfaces of a host, not only the primary one as before.

See the full [1.5.0 changelog](https://theforeman.github.io/foreman-ansible-modules/v1.5.0/CHANGELOG.html) for the rest of the changes.
