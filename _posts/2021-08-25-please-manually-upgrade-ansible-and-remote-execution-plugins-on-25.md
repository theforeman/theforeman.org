---
layout: post
title: [Action Required: Debian/Ubuntu] Upgrade Ansible and Remote Execution plugins on 2.5
date: 2021-08-25  8:51:03
author: Evgeni Golov
tags:
- foreman
- katello
---

Due to a mistake, we accidentally published wrongly versioned packages for the Ansible and Remote Execution plugins in the Debian repository for Foreman 2.5.

<!--more-->

If you're running Foreman 2.5 on Debian or Ubuntu, you might have noticed that the Ansible and Remote Execution plugins have "weird" version numbers (`9999-plugin+scratchbuild…`).
This version scheme is used for test builds, and these usually should not end up in the "real" repository, but mistakes happen.

Don't worry, the *contents* of the packages are fine.

* `ruby-foreman-ansible_9999-plugin+scratchbuild+20210716145329` translates to 6.3.1-1
* `ruby-foreman-remote-execution_9999-plugin+scratchbuild+20210810144503` translates to 4.5.4-1

The only problem is that these version numbers are higher than the actual versions of the packages, and thus `apt` won't consider a newer, properly versioned, build as an actual update.

We have removed the affected package versions from the repository, and published newer versions of the plugins. You will have to manually upgrade to these versions, which can be done with the following `apt` commands:

```console
# apt install ruby-foreman-ansible=6.3.3-1
# apt install ruby-foreman-remote-execution=4.5.5-1
```

Again, sorry for the inconvenience!
