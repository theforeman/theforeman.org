---
layout: post
title: Tackling review culture
date: 2015-11-30 12:57:56
author: Greg Sutcliffe
tags:
- foreman
- developers
- community
- culture
- github
- reviews
excerpt: |
  Over the last few years, the Foreman Developer community has repeatedly hit
  issues with mounting PR queues. I'm going to share my thoughts on how we're
  going to take some positive action on it this time...
---

I'll start with a clarification: **This problem isn't unique to Foreman**

What problem? Oh, right, I haven't defined it yet. So here's the issue -
sometimes, every few months or so, we hit a situation where on one (or more) of
our repos, Pull Requests (PRs) are being forgotten about. This leads to
problems - if they're big PRs, it probably means something important isn't
getting done. If it's small PRs, then likely, it's useful bugfixes that aren't
getting merged. If the author is a core dev, then it's demoralising, and they
may leave the project. If it's a new contributor, the experience may put them
off further contribution. It's not good, any way you slice it.

As stated, this isn't unique to Foreman - any project will undergo this kind of
issue as it grows. The real challenge is - **what do we do about it**?

We've had discussions repeatedly in the past about what actions to take, but
mostly, it's been short term solutions such as people choosing to focus on the
repo that's been neglected. Since I now have the responsibility of helping the
community solve the things that block it from being most effective, I decided
to try and tackle this.

The rest of this post is devoted to my own musings, and musing of others, taken
from [this
post](https://groups.google.com/d/msg/foreman-dev/jiOx3_WeGmg/QFfTpCChDwAJ) on
the dev mailing list, and the action plan for the next few months.

# So what's up with reviews?

There's really 3 issues we need to address.

## Reviews are *hard*

...but not as hard as we make them out to be. It's a perception problem. The
prevailing assumption is that the reviewer needs to be smarter than the person
who authored the code - because they have to understand it *and* look for
problems the author didn't see.

I actually disagree with that statement - reviewing works because we all bring
different viewpoints to our review. We spot issues not because we are smarter,
but because we've been exposed to those things before, which the author may not
have. However, we do have a perception problem - if reviews are seen as hard,
no one wants to even try. We need to get the concepts behind a review over
better.

## Reviews are not sexy

Let's face it, given the choice between reviewing someone's patch and writing
code of our own, most developers would choose writing their own. Reviewing is
not glamorous.

The problem here is that we give *no* acknowledgement of the time and effort
people spend reviewing code. Reviewers are not in the Contributors file. They
don't show up in Redmine metrics or Github. Nothing. I don't think we can make
reviews actually sexy, but if we don't at least make reviewers feel warm and
fuzzy for doing reviews, we're going to lose out to coding every time.

## Reviews are hard to find

This is counter intuitive - they're all up on GitHub, right? Nicely labelled,
easy to sort? Well, yeeesss, kind of.

The issue is one of fragmentation. GitHub makes it very easy to get
tunnel-vision, looking only at a few repos that are of interest to you and not
seeing the wider picture. While you *can* search the entire `theforeman`
namespace on GitHub, I expect few people actually do, and it's certainly not
intuitive to new users. Additionally, those who work by email miss all the
labels completely.

If we can't make it easy to find the PRs that need urgent attention, then even
the most competent and willing reviewers are wasted.

# What's da plan, sarge?

Really, there's a few steps we can take to tackle the above points.

Regarding making reviewing accessible, it's mostly a case of better
documentation. Daniel Lobato is preparing a developers Handbook, which will
contain many things to do with setting up, testing, patching and reviewing
Foreman code. It will include sections on:

* Guidelines/Style for authors
* Guidelines/Style for reviewers
* Reviewer mentoring & reviewer/author collaboration
* Expectations for new reviewers

and more. The aim is to demystify the art of the review, and promote the idea
that a review is a positive thing you can do as a new contributor to Foreman.

For appreciating and attributing to reviewers, we're planning to build some
metrics based on GitHub. We'll be setting the Assigned-To field on each pull
request (new reviewers without direct access to this will have a way to request
it via a comment to PrProcessor). This will allow us to see who's doing
reviews, and how many, and give appropriate thanks to those people.

For discovering PRs to review, the above system will also collect metrics on
the PRs themselves, in an attempt to determine the "age" of the PR. In
particular, we want to know the urgency of the PR, using this method:

* Have there been any comments other than the author/theforeman-bot
  * If no, age is just how long it's been open
  * If yes, is the last (by date) comment from the author?
    * If no, it's waiting for response by the author, skip
    * If yes, the author is either asking a question, or has replied to review
      comments
      * Age is therefore time since last author comment

We can probably augment this further if the Assigned-To field is set, because
then we can check the last time the assigned person commented, too.

Hopefully this enables us to see which PRs are in need of input without any
author waiting too long.

In addition, we'll gather general stats about no. of PRs, no. of reviews, no.
of waiting PRs and so on, for display either in the newsletter or the community
demo.

# Wrapping it up

That's our plan - we'll be implementing this in the next few weeks, and intend
to review the situation at ConfigManagementCamp at the start of Feb. Hopefully,
we'll be able to report an improvement!

I'd love to hear further thoughts from everyone on how this might work out,
whether it would encourage you to start reviewing code (or review more), or
indeed anything else you want to mention. Let's hear it in the comments below!
