---
layout: post
title: Sunsetting rsync.theforeman.org
date: 2024-05-10  7:59:32
author: Evgeni Golov
tags:
- foreman
---

We're plannig to shutdown `rsync.theforeman.org` on 2024-06-03, if you're using it to mirror our repositories, please switch to HTTP(S) based mirroring.

<!--more-->

Today we run an `rsyncd` on our webserver to offer a set of shares:
* `yum` - our RPM packages (same content as `yum.theforeman.org`)
* `deb` - our Debian packages (same content as `deb.theforeman.org`)
* `archivedeb` - our old Debian packages (same content as `archivedeb.theforeman.org`)
* `downloads` - misc downloads, especially release tarballs (same content as `downloads.theforeman.org`)
* `debug-incoming` - write-only share for `foreman-debug` uploads

Our CDN provider ([Fastly](https://fastly.com)) doesn't support rsync, so whenever someone tries to download things via rsync, it hits our webserver directly, instead of being served from a CDN (which is both quicker and cheaper).

Additionally, we're currently [planing the move (and split) of our webserver](https://github.com/theforeman/foreman-infra/issues/1724#issuecomment-1988313625), which would make offering rsync more complicated.

With all that, we decided to discontinue the service altogether on 2024-06-03.

If you need to mirror our repositories, Katello and Pulp can do that for you via HTTP(S), and so can  [`debmirror`](https://packages.debian.org/search?keywords=debmirror) and [`dnf reposync`](https://dnf-plugins-core.readthedocs.io/en/latest/reposync.html).
