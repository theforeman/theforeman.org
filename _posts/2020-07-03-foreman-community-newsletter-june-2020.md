---
layout: post
title: Foreman Community Newsletter (June 2020)
date: 2020-07-06 10:23:25
author: Foreman
tags:
- foreman
---

Foreman 2.1.0 released! Katello 3.15.2 released! Foreman Ansible Modules 1.0.0 released! Update from Red Hat Product Management, and much more!

<!--more-->

### Release Announcements

#### Foreman 2.1.0 released!

This release contains a whopping 300 bug fixes and is the first to support EL8 systems. If you use CentOS 8 or RHEL 8, you can now install Foreman on these systems. If you do encounter anything unexpected with the installations, please let us know. The default web server has been changed from Passenger to Puma, which we hope will lead to better performance. External IPAM support has also been added. Read the [release announcement](https://community.theforeman.org/t/foreman-2-1-0-has-been-released/19515) for further information.

#### Katello 3.15.2 released!  

This release was focused mainly on solving bugs encountered in 3.15.1, read the [changelog](https://github.com/Katello/katello/blob/KATELLO-3.15/CHANGELOG.md).

#### Katello 3.16 RC3 is ready for testing

The release candidate is focused on enabling the migration between Pulp 2 and Pulp 3. Katello 3.16 should be available in the next few weeks. Please read the [changelog](https://github.com/Katello/katello/blob/KATELLO-3.16/CHANGELOG.md) and provide any feedback that you can.

#### Foreman Ansible Modules v1.0.0 released!

If you had the pleasure of attending any of [@evgeni](https://community.theforeman.org/u/evgeni)'s high-octane  [presentations](https://theforeman.org/media.html), then you would probably have been as excited as we all were with the release of [Foreman Ansible Modules v1.0.0](https://theforeman.org/2020/06/foreman-ansible-modules-v100-released.html) this month. Foreman Ansible Modules is a collection of Ansible modules that interact with the Foreman API that you can use to manage a Foreman installation from Ansible. You can manage Compute Resources, deploy new Hosts, create Domains and Subnets, manage Users, and much more. Read more about it in [@evgeni](https://community.theforeman.org/u/evgeni)'s announcement [post](https://theforeman.org/2020/06/foreman-ansible-modules-v100-released.html). If you're interested in learning how modules were renamed inside the Foreman Ansible Collection, you can read about it in [@evgeni](https://community.theforeman.org/u/evgeni)'s blog on [mass-migrating modules inside an Ansible Collection](https://www.die-welt.net/2020/06/mass-migrating-modules-inside-an-ansible-collection/).

If you have used Foreman Ansible Modules to manage your Foreman deployment, we would love to hear about it. Please get in touch and let us know.

### Host Details Page Redesign Survey

As part of the road to making Puppet optional, and as part of the initial phase of moving towards a Patternfly 4 layout for Foreman, the UX/UI working group want to take this opportunity to redesign the Host Details page in the Foreman web UI so that it better serves your requirements. To do this, they need your input. Please complete this [survey](https://docs.google.com/forms/d/e/1FAIpQLSfk_M9ts_NgWVdOmwRPdFpQvgoDYJzaW8WPRUD8uKSezTgXTA/viewform). You can hear [@amirfefer](https://community.theforeman.org/u/amirfefer) talk about this as part of the [community demo](https://www.youtube.com/watch?v=bD7K2_cbGr0&feature=youtu.be&t=199).

### Foreman Next Generation Documentation

Documentation has been proven to lower the barrier of entry for new users as well as a way of supporting existing users as they expand their Foreman deployments. Over the last year, [@lzap](https://community.theforeman.org/u/lzap) has worked with the Red Hat documentation team to migrate and open source Red Hat Satellite guides so they can be used with Foreman. These docs are hosted at [http://docs.theforeman.org/web/](http://docs.theforeman.org/web/). We have seen a number of Foreman community members benefit from access to the Provisioning guide among others. Now almost all of the guides are upstream, [@spetrosi](https://community.theforeman.org/u/spetrosi) has written a [blog](https://theforeman.org/2020/06/not-only-the-code-benefits-from-the-open-source-community.html) describing this effort and looking to open the discussion about next steps. Links to the next-generation docs have been added to the Foreman quickstart guides versions 2.0 and higher. Our new community member of the month [@illumino](https://community.theforeman.org/u/illumino) has provided a lot of valid feedback on the documentation in two Discourse posts[1](https://community.theforeman.org/t/problem-with-foreman-2-1rc2-with-remote-execution-on-centos-8/19084/33),[2](https://community.theforeman.org/t/foreman-documentation-smart-proxy-only-installs-suggestions-on-this-section-3-2-3-of-the-manual/19474), which makes us think it is time to open up this discussion and look how to move towards integrating all of this content in some way where it can serve those who need it most.

### Red Hat Roadmap Update from Red Hat Product Management

This month, the Foreman Community hosted a [YouTube livestream](https://www.youtube.com/watch?v=7QE5cVlX4uM) with Dana Singleterry of the Red Hat Product Management team. Dana, on behalf of his wider Product Managent team, gave an update to the Foreman community on the last few Red Hat Satellite releases, as well as what Red Hat are focussing on in upcoming releases of Satellite, up to Satellite 7.0. After the livestream, the [UnixSysAdmin](https://www.unixsysadmin.com/) blog posted a short recap of the session, which you can read [here](https://www.unixsysadmin.com/red-hat-satellite-7/). We hope to host Dana and his team every six months to allow for questions and insight into the Red Hat roadmap.

### Community Demos

There were two livestreamed demos of new Foreman core and Katello features in June. Thanks to everyone who took demoed new features. Both [Community Demo #79](https://community.theforeman.org/t/foreman-community-demo-79/18813) and [Community Demo #80](https://community.theforeman.org/t/foreman-community-demo-80/19136) have time stamps added throughout for ease of browsing.

### Overview of Single Sign On in Foreman

Community member [@rabajaj](https://community.theforeman.org/u/rabajaj) gave a complete overview of the Single Sign On feature in Foreman at [Stackconf](https://stackconf.eu/) in June. Check out the [full presentation](https://stackconf.eu/talks/securing-infrastructure-with-keycloak/).

### RFC: Redesign Certificate Handling within Foreman Deployments

As part of ongoing efforts to improve design and provide consistency in the area of certificate handling, [@ehelms](https://community.theforeman.org/u/ehelms) returned this month with [an update](https://community.theforeman.org/t/rfc-redesign-certificate-handling-within-foreman-deployments/17933/33) on a proof of concept. Please join the discussion, even just to add your support for [@ehelms](https://community.theforeman.org/u/ehelms)'s efforts in this area.  

### Terminology Updates in Foreman

Over a week ago, [@lzap](https://community.theforeman.org/u/lzap) published an [RFC](https://community.theforeman.org/t/rfc-replacing-blacklist-with-blocklist-in-our-templates/19276) about removing the term blacklist from Foreman templates. A short discussion about this took place on the related [Pull Request](https://github.com/theforeman/community-templates/pull/746). With a wider discussion taking place in the tech, open source, and academic worlds), the community management team wants to take a moment to outline [our thoughts](https://theforeman.org/2020/06/terminology-updates-in-foreman.html) on this in the context of the Foreman community.
