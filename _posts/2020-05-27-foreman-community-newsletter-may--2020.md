---
layout: post
title: Foreman Community Newsletter (May 2020)
date: 2020-05-27 18:00:00
author:
  name: Melanie Corr
  uri: mcorr
tags:
- foreman
- newsletter
- community
excerpt: |
  Foreman 1.24.3 and Katello 3.15.1 released, and a return to live community demos!
---

As the weather improves and the world starts to open up, take some time to catch up with the latest Foreman Community news!

### Foreman 1.24.3 has been released

As well as a number of general and UI bug fixes, this release includes support for Ubuntu 20 provisioning. More than likely, this will be the last release of the 1.24 line. For more information, see the [release announcement](https://community.theforeman.org/t/foreman-1-24-3-has-been-released/18928) and the [release notes](https://theforeman.org/manuals/1.24/index.html#Releasenotesfor1.24.3).

### Foreman 2.1.0 RC1 is ready for testing

After the milestone release of Foreman 2.0 last month, progress on all fronts continues towards the release of Foreman 2.1.0. Whether you install and work through various scenarios, or simply add a documentation fix, your contribution will add to the stability of this release.

For information about how to help, [see the RC announcement ](https://community.theforeman.org/t/foreman-2-1-0-rc1-is-ready-for-testing/18843)

### Katello 3.15.1 has been released!

This is a follow-up release for 3.15.0 that includes several fixes for Pulp2-to-Pulpcore migration for File and Docker content types.

For more information see the [release announcement](https://community.theforeman.org/t/katello-3-15-1-has-been-released/18960).

### Katello 3.16 RC 1.1 is ready for testing

Katello 3.16 boasts an enhanced feature set and further progress with Pulp 3. For more information, check out the [changelog](https://github.com/Katello/katello/blob/KATELLO-3.16/CHANGELOG.md) and give it a try. If you'd like to contribute to this RC, see [this post](https://community.theforeman.org/t/katello-3-16-rc1-1-is-ready-for-testing/18938).

### Foreman Birthday Party - save the date!

Like most events, the Foreman Birthday Party 2020 will move online. The preliminary date is Tuesday, July 28. This event will be organized in conjunction with [@bernhard_suttner](https://community.theforeman.org/u/bernhard_suttner/) and the team at Atix. If you have any ideas or preferences for talks and activities for the Birthday Party, let us know.

### Community demos return to livestreaming

Despite a sub-optimal ten minutes, the [Foreman Community Demo #78](https://www.youtube.com/watch?v=0-JZwAOuLKY) returned to live streaming for the first time since the deprecation of Hangouts on Air. [@ezr-ondrej](https://community.theforeman.org/u/ezr-ondrej)’s presentation was hit hardest by the technical problems, but he handled restarting several times with an otherworldly grace and calm. Thank you, Ondrej!

There were ten demos in total, of both new Foreman core and Katello functionality. All time stamps for the different demos have been added to the video description.

The next community demo is scheduled for June 4th. If you'd like to demo something you've been working on, please add yourself to [the wiki](https://community.theforeman.org/t/foreman-community-demo-79/18813).


### RFCs of note

Here is a sample of some of the RFCs that were proposed over the month of May. Feel free to join the discussion at any stage. If you have nothing to add, a simple “I agree” can help the original poster know that their proposals have support, so please, don’t feel shy!

* As part of the plan to make Puppet optional, [@ezr-ondrej](https://community.theforeman.org/u/ezr-ondrej) announced the start of the effort to create an independent [Foreman statistics plugin](https://community.theforeman.org/t/trends-and-statistics-plugin/18745).

* [@ehelms](https://community.theforeman.org/u/ehelms/) raised the problem of the conceptual differences and the confusion between the terms [Smart Proxy, Foreman Proxy, and  Foreman Proxy with Content](https://community.theforeman.org/t/rfc-smart-proxy-foreman-proxy-foreman-proxy-with-content/18735/19).

* With the shift to modularity in CentOS 8, [@lzap](https://community.theforeman.org/u/lzap/) highlighted an issue with the naming [convention for CentOS installation media](https://community.theforeman.org/t/rfc-rename-centos-mirror-installation-media/18867) shipped with Foreman and proposed a range of possible naming conventions to avoid confusion.

* [@ekohl](https://community.theforeman.org/u/ekohl/) outlined a proposal for [disabling TFTP by default](https://community.theforeman.org/t/disable-foreman-proxy-tftp-support-by-default/18892) for foreman-proxy.

* Further refining the points that he outlined in his original thread, [@lzap](https://community.theforeman.org/u/lzap/) describes the idea of introducing a [Common Facts Model](https://community.theforeman.org/t/rfc-common-fact-model/18900) in greater detail  and once again calls for contributions and feedback in his [user survey](https://docs.google.com/forms/d/e/1FAIpQLScYG64toFTv4PySuRk03Zfn29mjcM3kGGaZaiF2tNlAIx28lA/viewform).

### Katello and Pulp 3

[@Justin_Sherrill](https://community.theforeman.org/u/Justin_Sherrill) wrote [a blog](https://community.theforeman.org/t/katello-saying-goodbye-to-pulp-2/18709) outlining some major benefits and changes that will come with Katello’s adoption of Pulp 3. As well as the many enhancements, there are also some deprecations, namely around Puppet and OSTree content management. Take a look at the blog and the [feedback](https://community.theforeman.org/t/katello-saying-goodbye-to-pulp-2/18709) on the blog, and if you have any questions or concerns, do reach out.

### Discontinued Foreman Docker plugin

While the [readme](https://github.com/theforeman/foreman_docker) in GitHub had been updated with the following note: **This plugin has been discontinued. The latest release only helps with its removal. If you’re interested in taking over the maintenance, let us know.**, [@tomabg](https://community.theforeman.org/u/tomabg/) reported the lack of coverage of this, and it became clear no formal announcement was ever made. Apologies for any confusion and thanks again to [@tomabg](https://community.theforeman.org/u/tomabg/) for letting us know.

### Acknowledgements

Thanks to everyone who contributes to the Foreman community - patches, plugins, testing, bug reports, translations, interviews, presentations, and everything else. Your efforts are very much appreciated!
