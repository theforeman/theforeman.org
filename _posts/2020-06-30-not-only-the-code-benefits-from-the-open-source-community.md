---
layout: post
title: Not Only The Code Benefits From The Open Source Community
date: 2020-06-30  9:08:11
author: Sergei Petrosian

tags:
- foreman
- katello
- documentation
---

The upstream versions of the Foreman and Katello projects become, among other downstream projects, the Atix's Orcarhino and the Red Hat Satellite of tomorrow. The discussions and contributions that take place in the vibrant upstream community shape the code base. The code base begins upstream and moves downstream. Until now, the Satellite documentation did not follow the same journey. In this blog, I will outline what has been happening with Satellite documentation over the last year and how this benefits both the Foreman community and Red Hat Satellite users.

<!--more-->

While a team of Red Hat technical writers work on Satellite documentation full time, Foreman and Katello documentation is written by the engineering team and community members who suggest updates and corrections. Because of this, there has been a huge disparity between the types of documentation that is produced upstream and downstream.

For example, Foreman documentation focuses on features and all possible functions of those features. This documentation is closer in spirit to man pages that describe all things that you can do with a single command. While thorough and accurate, the documentation does not focus on a particular user scenario so might prove hard to use to accomplish certain tasks. For example, in the Foreman manual, section [4.1.2 Roles and Permissions](https://theforeman.org/manuals/2.0/index.html#4.1.2RolesandPermissions) provides an overview of users and roles in Foreman but does not delve into the issue of why this information is relevant or walk the user through doing it. A similar chapter that is written for the Satellite guide by a technical writer, [5. Managing Users and Roles](http://docs.theforeman.org/master/Administering_Red_Hat_Satellite/index-foreman.html#chap-Red_Hat_Satellite-Administering_Red_Hat_Satellite-Users_and_Roles) provides a set of concepts and procedures that define both the what and then how users can accomplish this.

Two disadvantages of writing Satellite documentation in the downstream involve duplication of effort. By the time the writing team starts to work on the Satellite feature, the developers who are responsible for the feature have long moved onto another feature in the upstream. They then have to dedicate time to switching context back to what is old work for them. The developer has also, to some extent, created documentation in the upstream that may or may not be useful or decipherable by the writing team. However, the biggest disadvantage of documentation not being upstream is the lack of exposure to the community. As with all our open source projects, the more eyes on the documentation and the more bugs raised, the better experience it will be for our customers.

After this situation was articulated by Lukáš Zapletal, Principal Software Engineer for Satellite/Foreman, we decided it was time to right this wrong. Over the past year, the Satellite documentation team together with enthusiasts from the Foreman community created what Lukáš referred to as [Foreman new-generation documentation](https://community.theforeman.org/t/foreman-new-generation-documentation/15696). This involved migrating Red Hat Satellite guides and adapting them for use both upstream and downstream by working through the following phases:

1. The writing team and the engineers worked together to put an infrastructure in place that would serve both upstream and downstream documentation. Proof of concepts was made and the wider Foreman community was consulted about whether this would be advantageous to them.
2.  The writers worked with Foreman engineers to review guides to identify pieces that are only Satellite-related and therefore must not be displayed for Foreman users.
3. The team identified terminology that needed to change between the upstream and downstream and used variables to handle this.
4. Add notes for items that require an additional explanation for Foreman users, for example, that some procedures work only with the Katello plug-in installed.
5. The writing team collaborated with the wider community to make the Installation guide work for Debian. You can view the result in [Installing Foreman on Debian/Ubuntu](http://docs.theforeman.org/guides/build/doc-Installing_Server_on_Debian/index-foreman-deb.html).

The vast majority of guides are now [available](http://docs.theforeman.org/) in the upstream, but there is still work to be done to consolidate Foreman manuals and ensure that the documentation provides the best possible experience both upstream and downstream. Although the work is still in progress, Foreman community users have provided feedback, for example in [Problem with Foreman 2.1rc2 with Remote Execution on CentOS 8](https://community.theforeman.org/t/problem-with-foreman-2-1rc2-with-remote-execution-on-centos-8/19084/33):

> “The guides on these pages greatly assisted in my understanding of the system…The “Provisioning Guide” was well written, and showed off the [very cool IMHO] hammer(1) CLI interface.”

Apart from this main difference in the idea of how to document the product, it is worth mentioning other differences between the traditional and the new documentation:

1. The new documentation is written in the AsciiDoc syntax, which is more powerful than the traditional markdown and still is quite user-friendly and easy to write. This syntax also allows for the functionality that makes the new Foreman documentation possible:
   * The AsciiDoc syntax allows for the use of if statements (ifevals) to make the content visible in only Foreman or Satellite builds.
   * The AsciiDoc syntax allows for reusing the same content in different places. For example, one file is used for the System Requirements section in [Installing Foreman on RHEL/CentOS](http://docs.theforeman.org/guides/build/doc-Installing_Server_on_Red_Hat/index-foreman.html) and [Installing Smart Proxy on RHEL/CentOS](http://docs.theforeman.org/guides/build/doc-Installing_Proxy_on_Red_Hat/index-foreman.html) guides to add the same content with slight changes.

2. The new documentation includes the Foreman + Katello deployment scenario but indicates everywhere that Katello is required.

3. Even though the new documentation is complete and describes all the main common workflows, it lacks some of the Foreman features. These are the features that were not pulled downstream completely, and the new features that did not make their way downstream yet.

4. The new documentation follows the style guidelines of the IBM Style Guide. Each PR will be reviewed by a technical writer to ensure that those guidelines are met in all content that we add.

From a Foreman perspective, we believe that the new Foreman documentation solves some of the problems around lack of focus on user scenarios of the traditional Foreman manuals and implements a better user experience. As the writing team is moving upstream, this also ensures that future content is reviewed by technical writers and therefore has a higher quality.

From a Satellite perspective, although we have not fully arrived, we already have pull requests for community members with documentation contributions aimed at Satellite 7.0. By that time, Satellite documentation will be serving more users than ever before and benefiting from the added interaction and contributions of a passionate base of community members.

I ask you to share your thoughts, comments, concerns, observations, notes about this approach to Foreman documentation. As well as to plant ideas regarding how to progress with this process and make the docs.theforeman.org a unified one stop shop for Foreman documentation.
