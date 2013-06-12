---
layout: support
title: Support
---

There are two primary methods of getting support for the Foreman: IRC and mailing lists.

### Gathering information

To get appropriate support, you need to provide sufficient information about
your operating system, environment and setup. You can utilize the
foreman-debug tool which collects information about your OS, Foreman and
related components. If you installed from packages, the command is available
to root:

    # foreman-debug

If you installed from git, you can find it in the Foreman directory:

    # script/foreman-debug

If you run it without any options, it will collect data, filter out possible
passwords or tokens and create a tarball which can be safely handed over to
us.

### IRC
We work on the [irc.freenode.net](http://webchat.freenode.net/) servers. You can get general support in #theforeman, while development chat takes place in #theforeman-dev.

### Mailing lists
Mailing lists are available via Google Groups. Much like IRC, we have a general users (support, Q/A, etc) lists and a development list:

* [foreman-users](https://groups.google.com/forum/?fromgroups#!forum/foreman-users)
* [foreman-dev](https://groups.google.com/forum/?fromgroups#!forum/foreman-dev)

### Issue tracker
We use Redmine to report and track bugs and feature requests, which can be found here: [http://projects.theforeman.org/projects/foreman/issues](http://projects.theforeman.org/projects/foreman/issues)
