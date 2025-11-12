---
layout: post
title: Packit-based nightlies or how to properly test plugins in production
date: 2025-11-19  6:54:25
author: Evgeni Golov
tags:
- foreman
- packit
---

The Foreman Project offers "nightly" repositories ([rpm](https://yum.theforeman.org/), [deb](https://deb.theforeman.org/)) for everyone who wants to try out the latest changes in a production-like[^production-like] setup.
This is great to verify changes before they hit the next Foreman release.

However, these repositories have one problem: only a few packages are truly built every day (or night), the majority still requires people to prepare a release of the code.
This is done quite intentionally, as it keeps the repositories in a state where preparing a full Foreman release is rather quick, as only few packages need immediate human attention.
The downside is that you don't get the absolute latest changes to try out.

For a while now, we had [Packit](https://packit.dev) available for GitHub Pull Requests, which meant you could get an [RPM with the changes from a PR](https://community.theforeman.org/t/packit-for-foreman-get-production-rpms-from-prs/32412) and install that on a regular nightly setup.
Those builds are only kept for 60 days and easily get out-of-date once the PR is merged, which means they are great to test that explicit change, but not suitable for full integration testing of all components.

Enter the [`@theoreman/develop` COPR](https://copr.fedorainfracloud.org/coprs/g/theforeman/develop/)!
This is a new COPR repository we offer, [built by Packit](https://community.theforeman.org/t/rfc-packit-based-nightlies-for-everyone/44268), that contains builds of every single commit made to the main branches of our git repositories.

There is no testing or verification of the contents in this COPR.
If the RPM could be built, it will be published, even if the code is broken or dependencies can't be satisfied.

If you're still eager to try this out after all these warnings:
- Prepare an Enterprise Linux 9 system, [like you would for a normal nightly deployment](https://docs.theforeman.org/nightly/Installing_Server/index-katello.html#configuring-repositories_foreman)
- Enable the COPR repository: `dnf copr enable @theforeman/develop rhel-9-x86_64`
- Perform the rest of the deployment as usual

This will use the "nightly" repository on `https://yum.theforeman.org` for Rails, Puma, etc. and the `@theforeman/develop` COPR for Foreman and plugins.

You can also enable the COPR on an existing system and either use `dnf upgrade` to update all available packages, or selectively install certain packages you want to try out, [like you would upgrade a normal nightly deployment](https://docs.theforeman.org/nightly/Upgrading_Project/index-katello.html#upgrading-your-foreman-server).

[^production-like]: Nobody would really run nightlies in prod, right?!
