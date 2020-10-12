---
layout: post
title: What does Netways do with Foreman?
date: 2020-10-12 10:08:27
author: Dirk Götz
tags:
- foreman
---

As outlined in [Adding a vendor list to theforeman.org site](https://community.theforeman.org/t/adding-a-vendor-list-to-theforeman-org-site/20581), over the next few weeks, we will host some guest posts from different companies and consultants who offer professional services based on or extending Foreman for their customers. In this post, we hear from [@dirk](https://community.theforeman.org/u/dirk/summary) from [NETWAYS](https://www.netways.de/) and how they’ve interacted with the Foreman community to date. If you want to contribute to this series, please contact [@mcorr](https://community.theforeman.org/u/mcorr/summary).

<!--more-->

__Melanie asked me this question and to answer it I want to start with a bit of history: NETWAYS was one
of the first Puppet partners, but as a company dedicated to Open Source, we also wanted to provide a
complete Open Source solution to our customers. So I had a look at Foreman as an alternative front-end
for Puppet in the end of 2013. This was when my love for Foreman started to grow and how the company
got involved with the project.__

We soon added Foreman to our consulting portfolio and started our first big project at the beginning of
2014 at the IT company of a German energy supplier including high-availability and load distribution
over multiple Puppet masters. Since we always try to provide full service, Foreman also became a part of
our Puppet support contracts. At the same time our Managed Services department started to integrate
Foreman in their environment and since they were using OpenNebula at the time, they developed the
corresponding Compute Resource. While Managed Services journey with Foreman came to an end when
they moved to Containers and Openstack, Professional Services got more and more involved with the
project.

In 2016, I was given the task of creating [Foreman training](https://netways.github.io/foreman-training/static/#1), and the training was published as Open
Source after the great feedback we got from Greg Sutcliffe and Ohad Levy. Creating the training is our
biggest contribution to the project so far. The training does not only guide through all basic steps but
contains suggestions for plugins we use successfully in multiple customer environments and tips and
tricks in the advanced section. Furthermore, it demonstrates Katello’s capabilities. The training material is
frequently updated and new topics are incorporated based on experience from projects. But this is not the
only way we utilize Foreman for our trainings, in fact we also use Foreman to provision the notebooks for
the attendees of our courses.

Also in 2016, Greg asked me if we would join the effort of creating a series of Foreman birthday parties.
A great tradition began with a party consisting of half a day hands-on and talks ending with beer and
pizza. With the experience from this successful event NETWAYS was asked if we could also organize
Foreman’s very first own conference. In the end it was a shared event, but nevertheless our new
conference series Open Source Camp in Summer 2018 started with Foreman being one of the featured
projects, to return in Winter 2019 for an event solely dedicated to Foreman. When I did not find time to
organize a birthday party in addition to the Open Source Camp in 2018, ATIX jumped in and we
partnered up to give the community an event every year circulating between NETWAYS in Nuremberg
and ATIX in Garching close to Munich.

Another partnership came up in 2019 at the Foreman birthday when I met Monika from iRonin. Through
a mutual customer I already had good experience with iRonin developing custom plugins and features for
Foreman, so I brought Monika together with our sales department to partner up so that we can also offer
custom development as part of a project whenever needed. This is a very valuable addition, as
NETWAYS also contributed to Foreman in form of code in the past with the Open Nebula and
Monitoring integration, but now we do not have full-time development resources for this, as our
development is mainly focused on Icinga.

When we added Ansible to our Professional Services in 2016, AWX was not available so we focused on
Foreman as a graphical front-end for Ansible which allowed us to acquire new customers who liked the
different approach for configuration management. The same happened as the Debian integration for
Katello went live as we are always trying to be distribution independent, so the ratio of vanilla Foreman
to Katello increased from one of ten installations being Katello to nearly half of the installations.
Since we got involved, we have taken an active part in the community by contributing to the project. We
contribute with what we do best so we sponsor some resources for Foreman‘s continuous integration
system, work in the packaging team, help evolve the documentation and are active in the community
forum in addition to reporting issues and helping to track them down. Furthermore, we speak about
Foreman on international conferences giving guidance and insights into projects. This resulted in us being
invited to a project strategy meeting in 2019 to represent not only us but also our customers.

So where are we nowadays, to answer the initial question. NETWAYS provides full service for Foreman
based on the upstream project and incorporating plugins like Katello, OpenSCAP and many more. We
operate from our headquarters in Nuremberg remotely and on-site mainly in Germany, but in rare cases
also world-wide. We can provide kickstart workshops, reviews or help with any other problem. We can
do the complete implementation for you and offer support afterwards. We integrate Puppet and Ansible.
If custom development is needed, we can include it in a project, but the actual work will be done by
iRonin. Our training material is Open Source and frequently updated so you can have a look at it before
attending a training at our training facilities in Nuremberg. We are actively contributing to the Foreman
project in many ways and networking to stay involved.

And just to give you some numbers: Since we started the training, we have had 27 attendees in about 2
official training sessions per year, not counting our own employees, on-site training or workshops during
conferences. In 2019 we had 50 consulting days dedicated to Foreman not counting Ansible or Puppet
consulting in which Foreman might have played a part.
