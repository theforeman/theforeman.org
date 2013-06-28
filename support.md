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

### Mailing lists
Mailing lists are available via Google Groups. Much like IRC, we have a general users (support, Q/A, etc) lists and a development list:

* [foreman-users](https://groups.google.com/forum/?fromgroups#!forum/foreman-users) or email `foreman-users+subscribe@googlegroups.com`
* [foreman-dev](https://groups.google.com/forum/?fromgroups#!forum/foreman-dev) or email `foreman-dev+subscribe@googlegroups.com`

There is also a low-traffic list dedicated to release and security announcements:

* [foreman-announce](https://groups.google.com/forum/?fromgroups#!forum/foreman-announce) or email `foreman-announce+subscribe@googlegroups.com`

### Issue tracker
We use Redmine to report and track bugs and feature requests, which can be found here: [http://projects.theforeman.org/projects/foreman/issues](http://projects.theforeman.org/projects/foreman/issues)

### IRC

A great place to get real-time help with The Foreman is our IRC channel: #theforeman
on [irc.freenode.net](http://webchat.freenode.net/). There are
usually many helpful people there in addition to some of the Foreman
developers. For development discussions, there is also #theforeman-dev.

Please read and understand [this fantastic guide](http://workaround.org/getting-help-on-irc)
to getting help for open-source projects on irc before diving in. All of the
points there apply to #theforeman, especially "Don't repeat yourself", "Don't
ask to ask", and "Stick around".  #theforeman in particular has concentrations
of people in Europe (CEST) and East-coast US (EST), so asking your question
when those time zones are in business hours is more likely to get a good
result.

Be aware that the IRC channel is not an official support channel, it's an ad
hoc group of people (some of whom work on Foreman for a living) self-organizing
to help each other out. If you do not receive an answer to your question,
(especially if you have not followed the getting help on IRC best practices!),
that doesn’t mean you are out of options; the software may [have a
bug](http://projects.theforeman.org/projects/foreman/issues), the docs may be
lacking, or it's possible Foreman doesn't yet support your use case. It just
means you need to keep troubleshooting to find out which.

We also have a few IRC-specific guidelines:

* Don't be a jerk: Treat people with respect and consideration.
* Be helpful: Be patient with new people and be willing to jump in to answer questions.
* Stay calm: The written word is always subject to interpretation, so give people the benefit of the doubt and try not to let emotions get out of control.
* Don't post chunks: Avoid posting big chunks of text - use a [pastebin](http://pastie.org/) or similar service to shorten it to a link. Likewise, try not to spam the channel with many messages, it breaks the flow of other conversations.
* Be patient: Folks might not be around when you ask a question, so wait a while for someone to speak before leaving.
* Search first: Believe it or not, your question might not be new or you might be able to find someone who has already asked or answered your question. Do a thorough search of the [Manual](http://theforeman.org/), the [Redmine Issues](http://projects.theforeman.org/projects/foreman/issues), and the [Mailing List](https://groups.google.com/forum/#!forum/foreman-users) to see if it has been answered before.
* Don't private message: Ask permission before you send someone a private message (PM). Not everyone likes them. Also, by keeping it in public, others with similar issues can see the solution you were given.
* Don't highlight specific people unless you are already discussing something with them. Highlighting a specific user with your opening question makes it far less likely others will respond.
* Try to keep conversations on-topic where possible - going off on a tangent doesn't solve anyone's problem.

More information: This [IRC primer](http://irchelp.org/irchelp/ircprimer.html) for new users and the [general IRC guidelines, from freenode](http://freenode.net/channel_guidelines.shtml), are also useful resources.

(_Thanks to the [Puppet Labs IRC Guidelines](http://docs.puppetlabs.com/community/community_guidelines.html#irc-guidelines) for the original document_)
