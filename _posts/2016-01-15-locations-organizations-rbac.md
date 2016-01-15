---
layout: post
title: Locations, Organizations and RBAC
date: 2016-01-15 14:25:45
author: Christopher Pisano - The Advisory Board Company
tags:
- foreman
- multi-tenancy
guest_post: true
excerpt: |
  This will discuss our need to build a multi-tenant Foreman implementation and
  the necessity of Organizations, Locations and RBAC to do so.
---

###Overview

We are a fairly large company consisting of eight offices and three data
centers. Between these eight offices and three data centers we have about six
organizations and about 20 products made available to our members. Each of these
organizations have developers and system administrators that help manage and
maintain their servers. For this reason we needed to build Foreman in a way
where everyone can manage their servers and keep Enterprise Technologies from
being a bottleneck.

###Locations and Organizations

Locations was a no brainer for us. With eight offices and three data centers we
definitely needed a way to classify the location of our hosts and in turn use
that classification to help configure our hosts with certain location specific
data. Enabling Locations in Foreman solved this for us since the location
parameter can be used as part of Hiera. The main caveat here is that each host
has to have the location assigned correctly, but when you are provisioning via
Foreman and have all of your filters configured you will learn pretty quickly
if you have the wrong location selected. For existing hosts that we were
migrating into our new deployment we wrote a custom Fact that sets the host
location based on the subnet. We simply then changed the setting in Foreman to
look at the custom Fact for setting the location.

Example Locations:
![Foreman
Locations](/static/images/blog_images/2015-12-22-example_locations.png)

Organizations was something that we knew was necessary but were not really sure
the best way to implement them. At first we thought that we would have enough
control by having each product be an organization. This quickly broke down as we
learned that each product team has shared human resources at some level. In turn
we were going to be forced to grant users permissions to multiple organizations
which is something we wanted to avoid. Ultimately we decided to take a different
approach than we had originally planned and set each organization to the most
over-arching group that we could. This solved our issue with granting users
permissions to multiple organizations but now we were faced with the challenge
of setting granular permissions per product.

Example Organizations:
![Foreman
Organizations](/static/images/blog_images/2015-12-22-example_organizations.png)

####Enter Host Groups

Host groups can be a challenge, and if implemented incorrectly you are left with
an inefficient nested structure that spirals out of control and leaves you with
thousands of groups. We know. . . we did this. . . we have this. . . we are
getting rid of this. Host groups are almost a necessary evil in the sense that
they add complexity to your implementation however you need them for your
implementation to be useful. We iterated over our host group structure for weeks
before we settled on one that suited all of our needs. We ultimately ended up
with what you see below.

Example Host Group for Products:
![Foreman Host
Groups](/static/images/blog_images/2015-12-22-example_hostgroups.png)

Example Host Group for Enterprise Wide Tools:
![Foreman Host
Groups](/static/images/blog_images/2015-12-22-example_hostgroups_2.png)

This structure allows us to grant users permissions to their oganizaton and then
the subsequent host group. For teams that oversee all products in an organization
(it is rare but some do exist) their permissions stop at the organization with
no additional filters for host groups.

###Role Based Access Control (RBAC)

We have two main roles for each product; a user role and an admin role. There
are a few groups that are full administrators and a couple groups that have
specialty roles such as our architects and Strategic Planning teams.

The admin role for a product allows users to build, configure, destroy and power
cycle their hosts; basically they are the equivalent of a full administrator but
for a small subset of the environment. The only restriction we put in place is
that they are unable to power cycle or destroy hosts in the production environment.

The user role for a product is mostly the equivelant of the default viewer role.
These users are still restricted to their own product but they cannot build,
create, destroy, power cycle or edit hosts. They can view and search hosts, facts
and reports. These users can also view trend data as well as create trends.These
roles are primarily for non technical members of teams that still need to search and
find information on their hosts.
