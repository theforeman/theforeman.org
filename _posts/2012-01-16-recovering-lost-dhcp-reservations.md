---
layout: post
title: Recovering Lost DHCP reservations
date: '2012-01-16T16:06:00.001+02:00'
author: Ohad Levy
tags:
- foreman
- cli
modified_time: '2015-01-13T14:38:48.308+02:00'
blogger_id: tag:blogger.com,1999:blog-6789674575954398874.post-8262621859582876813
blogger_orig_url: http://blog.theforeman.org/2012/01/recovering-lost-dhcp-reservations.html
---

Someone asked me today on IRC how to recover his dhcp reservations, as
he was using foreman to create those, and his dhcp server died.

Since we are slow on delivering
[ \#944](http://theforeman.org/issues/944), here is a short snippet that
would get the job done.

<!--more-->

This script validates all DHCP records, if one is missing, it would
recreate it.

{% gist ohadlevy/1620981 %}

if you are using 0.5 or newer, simply change the shebang line to be
something like:
 \#!/usr/bin/env /usr/share/foreman/script/rails runner -e production

**What about conflicting records? **

In the case of a conflict, its possible to do remove the conflicting
reservations and simply recreate the correct one.. however, you should
be sure you can remove the old ones before..

dhcp\_record.conflicts(&:destroy)
dhcp\_record.create
