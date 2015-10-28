---
layout: post
title: Creating a new host using foreman API
date: '2012-01-01T11:00:00.001+02:00'
author: Ohad Levy
tags:
- puppet
- foreman
- API
modified_time: '2014-04-09T15:36:02.160+03:00'
blogger_id: tag:blogger.com,1999:blog-6789674575954398874.post-6387106321044045589
blogger_orig_url: http://blog.theforeman.org/2012/01/creating-new-host-using-foreman-api.html
---

Using [foreman API](http://theforeman.org/projects/foreman/wiki/API) is
fairly simple, in here I'll show an example using curl.

Using this simple script, you could automate your VM/Bare metal
provision process + Puppet configuration in one simple step.

<!--more-->

**Create a new Host**

{% gist ohadlevy/1546769 %}

In this example, I've hidden most of the logic in the host group
attribute in foreman.
meaning that it already knows the Provisioning and Puppet attributes,
but its not a problem to define extend the script not to relay on a
given hostgroup, or simply override certain default attributes ( such as
memory size, or host operation system etc).

Best way to figure out the additional attributes (besides
[RTFM](http://theforeman.org/projects/foreman/wiki/API)) is simply to
look at foreman log during the creation POST command.

a typical response from foreman, would include the ipaddress (that
was automatically assigned), mac address (that was auto generated if its
a vm), etc etc.

Note that in order to use the hostgroup, you would need to know its
ID, that's easily done if you simply look at the URL while you edit an
existing hostgroup, for example, if
your URL is* https://foreman/hostgroups/1-base/edit*, then the ID is
1.

**Delete a Host**

{% gist ohadlevy/1546777 %}
