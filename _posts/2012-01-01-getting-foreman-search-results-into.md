---
layout: post
title: Getting foreman search results into your Puppet manifest
date: '2012-01-01T10:42:00.000+02:00'
author: Ohad Levy
tags:
- puppet
- foreman
modified_time: '2014-06-17T16:44:46.618+03:00'
blogger_id: tag:blogger.com,1999:blog-6789674575954398874.post-8664636421397627110
blogger_orig_url: http://blog.theforeman.org/2012/01/getting-foreman-search-results-into.html
---

Lets say you want to know all of the hosts your monitoring host need to
monitor, or maybe, the hosts to which your database needs to allow
access to, traditionally, the solution to this problem was using Puppet
storeconfigs.

In this [blog
post](http://blog.theforeman.org/2012/01/advance-search-tips-in-foreman.html),
I mentioned how you could utilize foreman search language to get
customized results.

<!--more-->

While storeconfigs is a great solution, and if it works for you, by all
means, please do keep using it, but in this post I would like to show
you how to use Foreman to query for similar data + foreman data as
well.

Lets say, we want to allow VPN access only to client hosts which ran
puppet in the last week.

{% gist ohadlevy/1546708 %}

You could easily change the search conditions, for example, to get a
list of hosts without any puppet failures, simply change the query to
<span style="background-color: yellow;">status.failed = 0.</span>

we could easily search for conditions based on facts, puppet classes,
owner, reports and combination of them.

the output from the puppet function, may include complex data, such as
Arrays and Hashes as well, and it depends on the query object used, for
example, host lists would mostly be an Array, however, host facts would
be a hash, for example:

{% gist ohadlevy/1546750 %}

which you could utilize either in templates or versions of puppet that
supports hashes.

**Quick start**


1.  Install and setup foreman ([Foreman puppet
    modules](https://github.com/theforeman/foreman-installer) might be a
    quick starting point).
2.  If you are not using the official foreman installer, download and
    put the following
    [file](https://github.com/theforeman/puppet-foreman/blob/master/lib/puppet/parser/functions/foreman.rb) in
    your modules lib directory, and ensure you are using pluginsync.
3.  adjust the file to point to your foreman server.
4.  use it in your manifest.
