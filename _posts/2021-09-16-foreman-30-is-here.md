---
layout: post
title: Foreman 3.0 is here!
date: 2021-09-16 12:52:30
author: Foreman
tags:
- foreman
---

Foreman 3.0 has been released. Here is a summary of what's new in this major version.

<!--more-->

### Preview of the new host detail page

Foreman 3.0 is an important milestone on the road to modernizing Foreman’s user
interface. In this release, our main focus is on the host detail page. The
experimental and all new host details page is finally ready for users to start
testing it and sending us feedback via our community forums or IRC.

<img src="/static/images/blog_images/2021-09-16-new-foreman-host-page.png"  />

To enable the new host page, head over to Administer - Settings - Generic and
set Show Experimental Labs setting to Yes. At this point, clicking on a host
will still open the current host detail page. To view the new page, on
any host, click on its dropdown action button and select *New Details Page*.

<img src="/static/images/blog_images/2021-09-16-new-host-detail-button.png"  />

We are looking for your feedback that will help us create the best possible user interface.

<img src="/static/images/blog_images/2021-09-16-new-foreman-status-page.png"  />

### Puppet ENC functionality extracted to foreman_puppet plugin

Foreman without the plugin no longer includes Puppet environments, config
groups, Puppet classes and smart class parameters. It is still possible to
assign a Puppet environment to a host using the `puppet_environment` parameter.
This is also the case for setting Puppet server and Puppet CA server for
provisioning, which can be defined using the `puppet_server` and
`puppet_ca_server`. A rake task will be provided to allow automatically
migrating these values to parameters for users who do not wish to continue
using the plugin. By default, this plugin is still installed in 3.0 both on
fresh installs and upgrades, but will default to off in future releases. More
information can be found on our Discourse in thread [Puppet ENC plugin
development](https://community.theforeman.org/t/puppet-enc-plugin-development/20687)
and [Puppet in 3.0
release](https://community.theforeman.org/t/puppet-in-3-0-release/24429)

### Kerberos authentication using mod_auth_gssapi

The installer will now deploy `mod_auth_gssapi` instead of `mod_auth_kerb` if
called with `--foreman-ipa-authentication=true`. Existing installations will be
upgraded to use `mod_auth_gssapi` too. This allows deploying Kerberos
authentication on CentOS 8, which lacks `mod_auth_kerb`. Debian and Ubuntu also
provide `mod_auth_gssapi` and the installer can now deploy Kerberos
authentication there too.

### Fact parsers are included in core

Fact parsers for Ansible, Chef, Salt and Subscription Manager were moved to the
Foreman core. This is the first step in refactoring fact handling in Foreman to
be simpler, faster and easily extendable. Thanks to that, it's now possible to
upload facts from these tools even if the respective plugin is not installed.

### More information

For upgrade warnings and deprecations, head over to the [official release
notes](https://theforeman.org/manuals/3.0/index.html#Releasenotesfor3.0).
