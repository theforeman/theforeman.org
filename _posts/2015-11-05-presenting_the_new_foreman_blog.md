---
layout: post
title: Presenting the new Foreman Blog!
date: 2015-11-05 09:25:28
author: Greg Sutcliffe
tags:
- foreman
---

Some while ago, I realized that the entire Foreman website was written in
Markdown and stored in GitHub, where any contributor can help to improve it -
but not the blog! An area almost entirely composed of text; an area where guest
posts would be hugely valuable; an area where fixes to old popular posts would
be fantasic; all written on Blogger, where we can't easily get contribution
from the community. Sigh.

Well, no longer! Today we're unveiling the new Foreman Blog!

<!--more-->

## What's new?

In terms of content - very little. The old posts have been imported from
Blogger via their XML export tool, and then converted to Markdown via the
awesome [Pandoc](pandoc.org) tool. Images were downloaded from blogger too, and
Gists loaded via the *jekyll-gist* gem which was already part of the website
stack. However, the vast majority of the text is unchanged.

The URL has changed though - it's now
[http://theforeman.org/blog]({{site.baseurl}}blog)

## What's changed?

We've tried pretty hard to be consistent. Obviously the style of the pages now
comes under the general styling of the overall Foreman website, so that's a
plus. Later this week we'll redirect *blog.theforeman.org* to *theforeman.org*
so that the permalinks stored in search engines will continue to work.

There is an RSS feed, of course. You can get it at
[/feed.xml]({{site.baseurl}}feed.xml) and there's an RSS icon at the top
of the blog index. Please do update your RSS readers if you're using the old Blogger
feed.

Post comments appear to be present and correct, so there should be no
changes or continuity loss from Blogger.

## Great! How can I help?

As part of my role as the new Community Lead, I'll definitely be posting more
about all sorts of Foreman related things, as well as my own activities to keep
the community informed. In addition, the main goal for changing to Markdown was
to enable community contribution, so ...

If you see any bugs or problems with any old blog posts, please do let us know
in the [issue tracker](https://github.com/theforeman/theforeman.org/issues) or
even better, open a Pull Request to fix the problem (see
[Contributing]({{site.baseurl}}contribute.html#Documentationandwebsite)
for a guide on that). You can find the raw text of the posts
[here](https://github.com/theforeman/theforeman.org/tree/gh-pages/_posts).

If you want to rework an old blog post for a newer version of Foreman, please
feel free to do so - many of the older blog posts (such as the one on EC2
provisioning) are very popular, but were written for much older versions of
Foreman. The community will no doubt make good use of updated versions. PRs are
very much welcome.

I'd also like to encourage guest authorship on the blog. If you have a blog
post of your own that you'd like to reshare on the Foreman blog as part of
this, please do open a PR (or send me the text of the blog if you're not into
Git).

Above all enjoy the new blog, and let us know about what you like/don't like in the comments below!
