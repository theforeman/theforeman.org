---
layout: post
title: Addressing CVEs with Foreman and Katello - DROWN, GHOST
date: 2016-03-02
author: Daniel Lobato Garcia - @dlobatog
tags:
- cve
- security
- katello
- foreman
- errata
- rhel
- content
- openssl
- glibc
excerpt: |
  Published CVEs represent an attack vector for your infrastructure. Recently,
  CVE-2015-0235 revealed a security bug in GLIBC, a key dependency for many packages
  in Linux (including Foreman!), and CVE-2016-0800 revealed another serious vulnerability
  on openssl. Learn how to easily patch your hosts with Foreman and Katello.
---

### Overview

Published CVEs represent an attack vector for your infrastructure. Recently,
CVE-2015-0235 revealed a security bug in GLIBC, a key dependency for many packages
in Linux (including Foreman!). Just so you can easily understand how key this package
is, here's a visualization made by [Rui Vieira](https://twitter.com/ruimvieira) from
Newcastle University that displays a graph of package dependencies in Ubuntu. Glibc
is the dot at the center of the graph.

![dependency graph](/static/images/blog_images/2016-03-02-addressing-cves-with-katello/dependencies_graph.jpg)

Just a few weeks after GHOST was released, CVE-2016-0800, nicknamed DROWN, revealed a
bug on all implementations on the SSLv2 protocol based on a vulnerability recently
discovered by a group of security researchers.

### CVE background

If you want to learn more about these CVEs, Red Hat Product Security summarized it well
in these articles:

* [GHOST - glibc](https://access.redhat.com/security/vulnerabilities/ghost).
* [DROWN - openssl](https://access.redhat.com/security/vulnerabilities/drown).

### What to do

With Foreman and [Katello](http://katello.org), you don't need to guess if your
Red Hat hosts are vulnerable to a CVE. Foreman should sync the packages from the
Red Hat CDN, alongside with errata, so you can automatically apply them to your hosts.

If you haven't configured Foreman to do this, I would recommend creating a Sync Plan
that syncs packages/errata every night. Errata contains not only security updates,
but also bug fixes, and enhancement updates that can be safely applied to your hosts.

![sync plan](/static/images/blog_images/2016-03-02-addressing-cves-with-katello/sync_plan.png)

This ensures that Foreman has the latest errata available and can provide an accurate
picture regarding which hosts need which errata. Foreman uses the errata metadata
in the repositories to generate the Katello Host Advisory, a scheduled report of
which errata a host needs.

Alternatively, you can subscribe to receive notifications of security advisories via
email. Click on your name on the top-right corner -> My account, and configure it
in your email preferences.

![notification](/static/images/blog_images/2016-03-02-addressing-cves-with-katello/host_and_errata_notifications.png)

Firstly, visit the Content -> Errata page on Foreman. This shows which errata have
been downloaded. In the search box, we can search via the CVE identifier (CVE-2015-7547)
 OR via the Red Hat Security Advisory (RHSA) identifier (RHSA-2016:0176).

![all errata](/static/images/blog_images/2016-03-02-addressing-cves-with-katello/all_errata.png)
![cve search](/static/images/blog_images/2016-03-02-addressing-cves-with-katello/cve_search.png)

Foreman has the information to know whether the errata is possible to install to your
hosts right now. Let's see this.

![glibc errata](/static/images/blog_images/2016-03-02-addressing-cves-with-katello/selected_cve_errata.png)
![ssl errata](/static/images/blog_images/2016-03-02-addressing-cves-with-katello/selected_ssl_errata.png)

We can select both CVE errata, and click on apply to our hosts.

![apply errata](/static/images/blog_images/2016-03-02-addressing-cves-with-katello/apply_errata.png)

If you prefer to check the errata on a host by host basis, you can check the content hosts page (Hosts > Content hosts)
and check out all the installable errata for a host. The procedure to install it is as easy as it gets.
Select all errata you want to install, and click on 'Apply selected'.

![content host errata](/static/images/blog_images/2016-03-02-addressing-cves-with-katello/content_hosts_errata.png)

After this, you should be able to see how Foreman is installing the packages live on your host.

![install progress](/static/images/blog_images/2016-03-02-addressing-cves-with-katello/install_progress.png)

That's all for today, keep your hosts safe and sound with Foreman and Katello errata!
