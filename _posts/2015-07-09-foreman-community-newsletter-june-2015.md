---
layout: post
title: Foreman Community Newsletter - June 2015
date: '2015-07-09T13:52:00.001+03:00'
author: Marek Hulán
tags:
- katello
- foreman
- media
- plugins
- community
- use cases
modified_time: '2015-07-09T13:52:29.898+03:00'
blogger_id: tag:blogger.com,1999:blog-6789674575954398874.post-2299346763897428216
blogger_orig_url: /2015/07/foreman-community-newsletter-june-2015.html
excerpt: |
  Foreman 1.8.2 bugfix release, 1.9 RC1 is ready for testing, changes in
  community-templates, new videos, and more!
---

### Foreman 1.8.2 bug fix release

A new bug fix release has been published on June 16th. Mostly fixes bugs
around network interfaces  
for unmanaged hosts but also other areas were touched including:  

-   prevented extra tokens creation with Foreman Discovery
-   missing VMware SCSI controller field restored
-   fact uploads from Windows hosts fixed
-   errors viewing dashboard/reports list in multi-org mode fixed

For more information see the [official
announcement](https://groups.google.com/forum/#!topic/foreman-users/_C3pdnAf2pA)  

### Katello 2.2.1 and 2.2.2 bug fix releases

Two new bug fix versions of Katello have been released in June. List of
fixes can be found in Katello
[documentation](http://www.katello.org/docs/2.2/release_notes/release_notes.html),
For upgrade instructions see
[2.2.1](https://groups.google.com/forum/#!searchin/foreman-users/katello$202.2.1$20release/foreman-users/18yUBrdUnP4/guF-JHV_X30J)
and
[2.2.2](https://groups.google.com/forum/#!searchin/foreman-users/katello$202.2.2$20release/foreman-users/G8EPpNzG7Ag/MzRi5HeFXUMJ) announcements.  

### Foreman 1.9 branched out, RC1 ready for testing

We started preparations for upcoming 1.9 release. A develop branch was
cloned to 1.9-stable and we have  
already released RC1. The most interesting features follows:  
-   new select boxes with inline searching, see
    [video](https://www.youtube.com/watch?v=E2PSCFsa9yM) and Shlomi's
    [blog
    post](http://foreman-shlomizadok.rhcloud.com/2015/06/18/select2-landing-in-foreman/)
-   [fullscreen
    editing](https://www.youtube.com/watch?v=ETzNfGTqc00) for parameters
-   partition tables auditing, scoping per organizations and locations,
    file uploads and editor improvements, first presentation in
    [community demo](https://www.youtube.com/watch?v=CTfIPD2w8sY)
-   logging improvements including more details in messages,
    configurable output (e.g. syslog) and more
-   more email notifications
-   cloud-init support on libvirt
-   copying fact values, short video demonstration
    [here](https://www.youtube.com/watch?v=EQVakzL49rQ)

We appreciate help with RC testing. More information about how to
install and report bugs in the announcement on [mailing
list](https://groups.google.com/forum/#!topic/foreman-users/2oeNi0NDyK0)

  

At the same time, Katello 2.3 has been branched out so the release can
be aligned.  

### New community-template branches

Community templates repository has been migrated to follow the same
branch schema as other repositories. Master branch was renamed to
develop and we have stable branches for 1.7, 1.8, 1.9. If you use
[foreman\_templates](https://github.com/theforeman/foreman_templates)
plugin for provisioning templates synchronization, you can use
[branch](https://github.com/theforeman/foreman_templates#rake-options)
option to specify correct version.  

### Plugin releases

-   [foreman\_chef](https://github.com/theforeman/foreman_chef) 0.1.4
    and
    [smart\_proxy\_chef](https://github.com/theforeman/smart_proxy_chef)
    0.1.4 bug fixes released
-   [foreman\_salt](https://github.com/theforeman/foreman_salt) 3.0.0
    and [smart\_proxy\_salt](https://github.com/theforeman/smart_proxy_salt)
    has reached 2.1.3 adding support salt 2015.05 and Ruby 1.8.7
    compatibility
-   new
    [foreman\_bootdisk](https://github.com/theforeman/foreman_bootdisk) 6.0.0.
    release is compatible with Foreman 1.9+
-   [foreman-xen](https://github.com/theforeman/foreman-xen) 0.1.1
    released restoring compatibility with Foreman 1.8

### Quick updates

-   [Foreman media](http://theforeman.org/media.html) page has been
    updated with new videos (Lifecycle Management with Foreman,
    Puppetcamp 2015: selling management and developers on puppet)
-   New version of [Kafo](https://github.com/theforeman/kafo/) (0.6.11)
    has been released, fixing validations issues
-   Another [case study](https://www.youtube.com/watch?v=8-o27p39dIM)
    recorded and published by Daniel, this time with a consulting
    company Inuits
-   Shlomi has published introduction to [OpenSCAP
    plugin](https://github.com/theforeman/foreman_openscap) on his
    [blog](http://foreman-shlomizadok.rhcloud.com/2015/06/09/openscap-foreman/)
-   Daniel's
    [blog](http://blog.daniellobato.me/coreos-cluster-deployments-with-foreman/)
    about deploying CoreOS cluster using Foreman
-   You can follow us on twitter
    using [@ForemanProject](https://twitter.com/ForemanProject) and
    [\#theforeman](https://twitter.com/hashtag/theforeman?src=hash)
