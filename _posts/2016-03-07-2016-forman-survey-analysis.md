---
layout: post
title: 2016 Foreman Survey Analysis
date: 2016-03-07 14:34:44
author: Greg Sutcliffe
tags:
- usage
- foreman
- events
- plugins
- community
- survey
- API
- virtualization
- cfgmgmtcamp
- puppet
- devconf
- fosdem
- chef
- use cases
---

Over the course of February, we again ran the Foreman Community Survey to get
feedback on how we're doing and what needs to be addressed. I've now had some
time to sit down and look through the data, and share some insights with you
all.

Firstly - **thank you** to all those who filled out the survey. It was a little
bit longer this year, as we looked to get data on how we can grow the
contributor community as well as the user community, so thanks for taking the
time. It's great to hear all your feedback.

<!--more-->

## <a name="intro"></a>Contents

* [Intro](/2016/03/2016-forman-survey-analysis.html/#intro)
* [Community Diversity](/2016/03/2016-forman-survey-analysis.html/#diversity)
* [Support and Docs](/2016/03/2016-forman-survey-analysis.html/#support)
* [Specific Features](/2016/03/2016-forman-survey-analysis.html/#foreman-features)
* [Upcoming Work](/2016/03/2016-forman-survey-analysis.html/#upcoming-work)
* [Events](/2016/03/2016-forman-survey-analysis.html/#events)
* [Contributor Survey](/2016/03/2016-forman-survey-analysis.html/#contributor-survey)
* [Final thoughts](/2016/03/2016-forman-survey-analysis.html/#final-thoughts)

Sadly, response were slightly down from last year (**76 responses**) and the
smaller sample size makes it difficult to draw strong conclusions. According to
other metrics, we have usually 250ish active people in IRC each month, and some
2000 people on the mailing list. Suggestions on how to reach more people with
the survey are, of course, [welcome][contact]!

That said, we can still look at the results and look for trends, especially as
compared to last year (which we couldn't do then, it being the first such
survey). Lets start with some stats on...

## <a name="diversity"></a>Community Diversity

![How long using](/static/images/blog_images/2016-03-07-2016-forman-survey-analysis/how-long-using.png)

This is broadly similar to last year, with some 40% of the community having
used Foreman for under a year. We do see a shift in the 3+ years category, with
a corresponding drop in 1 and 2 year categories, but it's nice to see that the 3
months category remains stable at 13% - we seem to be continuing to attract new
people to the community, which is great. Having more "old hands" around to
answer questions is starting to be noticable on IRC and the mailing lists, too.

![What version used](/static/images/blog_images/2016-03-07-2016-forman-survey-analysis/what-version-using.png)

I was quite surprised by this - Foreman 1.10 was released at Christmas, meaning
it had only been out for 4 weeks by the time of the survey. It's great to see
people so quick to upgrade something which can be so deeply embedded in the
infrastructure. When you add in 1.9 (we still support the last two versions, so
this is the total supported userbase) we get 71% which is a bit of a drop on
last year (86%). A quarter of responses are running an unsupported version of
Foreman - as we said last year, if there's anything holding you back from
upgrading, do [get in touch][contact]!

![Nodes managed](/static/images/blog_images/2016-03-07-2016-forman-survey-analysis/nodes-managed.png)

Again similar to last year, we see under 10% of responses coming from large
installations (>1k nodes). It is good to see a spread here though, as it shows
we're meeting the needs of a wide variety of infrastructure usecases and
network topologies.

![Number of Users](/static/images/blog_images/2016-03-07-2016-forman-survey-analysis/number-users.png)

Interestingly, larger numbers of users (>10) shows growth this year, up to
nearly 25%. Hopefully this is due to continuing effort in our Roles,
Authorization, and Locations/Organisations features. That said, a solid 50%
remain in the 1-5 section, so keeping the option to disable or streamline these
features is also important. This is relevant due to the discussion around
Locations/Organisations at the moment.

Finally for diversity, lets have a couple of bar charts:

![Operatingsystems](/static/images/blog_images/2016-03-07-2016-forman-survey-analysis/operatingsystems.png)

This year we allowed respondents to select more than one option, as "most" is
subjective, especially when you put proxies and Foreman itself in the same
question.

Keeping this in mind, we see that Red Hat family distros remain constant at
75%, but there's a marked increase in deb-based distros (up 5%) and in "Other"
which is up 10%. It would be very interesting [to hear from those users][contact]
about what OSs they are using!

![Hammer vs API](/static/images/blog_images/2016-03-07-2016-forman-survey-analysis/hammer-vs-api.png)

Hammer remains stable this year at just under 50%, and it's good to see APIv1
declining. The real surprise here, however, is the "No" response jumping from
just 6% to 32%. I have no data to suggest why this might be, but one conclusion
is that the tooling we're providing to the newer users joining the community is
now sufficient for their needs. If you've got a story about this,
[let us know][contact]!

Overall, the community seems diverse in many respects, with different sizes,
ages, OSs and usecases. This is good news as we move forward, since it shows we
have broad appeal to people just discovering Foreman today.

## <a name="support"></a>Support and Docs

Moving on then, we have a number of question related to how well we meet
support needs of the community:

![IRC and Lists](/static/images/blog_images/2016-03-07-2016-forman-survey-analysis/irc-and-lists.png)

It's not very visible (thanks Google), but the vertical axis is, in order:

* I know of the IRC channel, but don't use it
* I use the IRC channel
* I know of the mailing list, but don't use it
* I use the mailing list
* I wasn't aware of either

The really important number for me here is the last one - 7% not aware of our
primary support systems. That's both good (it's *only* 7%) and bad (how do we
reach those people). For the others, so long as they know that the IRC channel
and mailing lists exist, that's good - they can get help when they need it.

To those who said they spend active time on the lists and on IRC - *thank you!*
User-to-user support is one of the things that makes community leads go all
warm and fuzzy and liable to buy rounds ;)

![User Support](/static/images/blog_images/2016-03-07-2016-forman-survey-analysis/user-support.png)

We have a great reputation for our IRC channel, and that's reflected here in
the 5-star rating our IRC support gets in the survey results. Happily the other
support routes also do well, getting 4s across the board. This is great to see,
but there's always more we can do, as seen below in the free-text comments.

![Major and Minor releases](/static/images/blog_images/2016-03-07-2016-forman-survey-analysis/major-and-minor.png)

I was worried about this one - if, say, frequency had come out as bad, we'd have
no data on whether it was too fast or too slow, etc.

Thankfully, we seem to do pretty well across the board, with the majority being
3+ in every category, which is all the more important since it's largely the
same as last year, showing that we have consistency in our releases as well as
providing what our users want. Whilst a lot of people work on each release, I
think it's worth calling out [Dominic Cleal][dominic] for all he does around
release engineering - thanks!

The final support question was a free text field, and I don't plan to
cut'n'paste the entire result set, but we did get some themes. Out of the 17
responses to this question:

* 11 were generally positive about the support/docs (65%)
* 7 requested more diagrams or how-to guides (potentially including screencasts) (41%)
* 3 specifically requested improvements to plugin docs (18%)

It's good to see two-thirds of the responses are positive, as a lot of effort
goes into the manual and support channels. I still plan to produce my
"beginners guide" screencast series "soon(tm)". Plugins, as ever, remain the
responsibility of the authors, but the development community tries to help out
where we can. Writing docs is also a great way to get [started with
contributing][contribute], if you're so inclined!

## <a name="foreman-features"></a>Specific Foreman Features

Now we move onto the detail in some of Foreman's features:

![Compute Resources](/static/images/blog_images/2016-03-07-2016-forman-survey-analysis/compute-resources.png)

This graph is fascinating for quite a few reasons. Firstly, in a change from
last year, we explicitly included "Physical hardware" as an option - although
the question is about Compute Resources, in reality it should have been "What
do you provision on with Foreman?". By including this separately from "None",
we get that nearly two-thirds of the community still manage physical hardware
with Foreman. PXE is not dead yet, it seems!

The other interesting figures are in the shifts from last year. EC2 and
OpenStack both lose a few percentage points (most likely due to the lack of
support for newer advanced networking & storage features), while VMware and
Docker (no surprise there) gain a few. The really big increases, though, are in
Libvirt and oVirt, which given the Docker hype this year is really surprising
to me. Other is also up substantially, perhaps in a nod to our plugin
structure for Compute Resources.

Overall, this graph nicely highlights the diversity of infrastructure that
we're able to support, and cautions us about getting to narrow-minded with
respect to a particular platform. We do well because of our neutrality.

![Taxonomies](/static/images/blog_images/2016-03-07-2016-forman-survey-analysis/taxonomies.png)

One of our more advanced features, Locations / Organisations are a scoping
mechanism, useful if you have resources that should only matter to certains
places or people (e.g. multi-tenant setups). Whats interesting here is that
while the number of users not using Locs/Orgs is constant, many of those who
used just one last year now use both (24% -> 33%).

We actually asked three questions on this feature, as the developer community
wanted to gather usecases for a potential refactoring of the feature, and
wanted to be sure we didn't break it for anyone. We'll be able to say more on
this once the refactoring is decided on (or not)

This next graph is huge. Sorry ;)

![Plugin Usage](/static/images/blog_images/2016-03-07-2016-forman-survey-analysis/plugin-usage.png)

Most of the big usage numbers here are entirely expected.
[Discovery][discovery] tops the chart again, but it's good to see
[Katello][katello] move in to second place; closely following are
[foreman\_hooks][hooks], [puppetdb\_foreman][puppetdb],
[foreman\_templates][templates] and [foreman\_bootdisk][bootdisk]. I'll admit I
was surprised to see [foreman\_dhcp\_browser][dhcp] up at 30% - perhaps this
indicates a need for more Smart Proxy visibility from within the UI? Happily,
such things are in progress and you'll be able to see a lot of it in 1.11. The
Release Candidates are [out now][rc1] if you just can't wait!

The fast movers are foreman\_ansible, and foreman\_openscap, both developed this
year - in particular the Ansible plugin is only a few months old, so it's 13%
uptake is rapid indeed.

As with last year, this shows some of the activity in our plugin ecosystem,
which is great to see. We really want to see plugins succeed, and provide a lot
of materials to help get started writing them, so graph like these are a reward
for that effort.

## <a name="upcoming-work"></a>Upcoming work

For this, we changed the style this year. Rather than ask for interest ratings
on individual features from 1-5 (which can be a problem since not every feature
is of interest to all users), we decided to simply ask for your top 3 wishes,
in no specific order. This list was drawn from the items still not done from
last year, from some things that come up over and over in conversations, and so
on.

![Future Features](/static/images/blog_images/2016-03-07-2016-forman-survey-analysis/future-features.png)

Overwhelmingly, Puppet 4 support tops the bill. We knew this would be high on
the list, so we took time to meet with Puppetlabs at CfgMgmt Camp, and come up
with a plan of action (you can read it [here][puppet4]). This work is
*tentatively* scheduled for 1.12, but as ever with open source, there's no
promises.

Following that, we see better container support coming in strong. We've already
got a Docker plugin, Docker registry support via Pulp/Katello, and CoreOS &
Atomic provisioning support. Do file [feature requests][issues] on this area if
you have specific features relating to containers you'd like to see.

All the others come in roughly equally, with a very slight edge to networking
and IPv6. The developer community will be taking this on board in the coming
year, and I really hope that next year (as with this year) we can say that
we've delivered on a lot of these items.

We also had a free-text field for people to put their #1 wish in. Again, Puppet
4 comes out strongly here, but also more Ansible integration, VMware, IPv6 and
Katello development were common.

## <a name="events"></a>Events

We split this up this year. Last year we only asked if you would like to attend
events - this time we also asked if you'd be willing to help organise them:

![Meetups](/static/images/blog_images/2016-03-07-2016-forman-survey-analysis/meetups.png)

We see that the US and EMEA are popular, but a sizeable chunk of people would
like a local meetup. We're investigating getting involved with other local
events such as DevOpsDays and so forth - if there's an event near you that you
think we should be at, [let us know][contact]!

I'm *really* excited that 22 peaople said they'd be willing to speak about
Foreman at conferences, and 16 people would be willing to help set up events -
*thanks*! However, this is an anonymous survey! Please, please *email me* with
me about this - I'm starting to build a collection of potential speakers (and
their areas of travel), and potential event locations to see what we can match
up.

Again, if you responded to this question - *please* [email me][email]! Thanks!

## <a name="contributor-survey"></a>Contributor survey

I'll keep this section brief, but here's two interesting graphs:

![Contribute](/static/images/blog_images/2016-03-07-2016-forman-survey-analysis/do-you-contribute.png)

Clearly, the responses to this question will be strongly skewed in the
contributor survey. However, I think it's notable that 20% of people felt
strongly enough to fill this out even though they are *not* currently a
contributor - it implies there's probably more people in this position. We owe
it to ourselves to support new contributors and help them get started.

I do have some ideas here, such as more screencasts (how about a "Let's Play"
of writing a plugin?) and also perhaps a "where can I help" workflow on the
website, similar to the [Mozilla site](https://www.mozilla.org/en-US/contribute).

![Dev Support](/static/images/blog_images/2016-03-07-2016-forman-survey-analysis/dev-support.png)

Leading on from that, it seems that while we are consistently good at helping
out once we get to reporting and monitoring PRs, the picture for helping those
who are stuck (either stuck *in* some code, or stuck just getting started) is a
bit more mixed. Work is underway to write a [developer handbook][handbook]
which is helping to clarify this, and further work remains to be done on it.
This should probably re-emphasize the IRC dev channel as the primary means of
support when contributing.

## <a name="final-thoughts"></a>Final thoughts

It's fascinating reading through all the comments and stats - there's more data
in here than I can show without this becoming a book, but I'll be using it
myself in my role to assist the community further.

Hopefully the above gives you a flavour of where we're at. For myself, I feel
that we get good marks for our support, and we do a good job of handling
releases, new features, etc as well. Well done to everyone who participates in
making this one of the best communities I've ever been in!

I'll leave you with a few of my favourite quotes from the question "Do you have
any additional comments or special requests?":

* Thank you for a great solution!!! Keep up the great work!
* When I adopted Foreman I mostly wanted a good DHCP/PXE provisioner with a solid, simple classifyer. You've come to meet and exceed my needs
* Thank you! You guys are making my team spend much less time configuring servers and instead they can do productive stuff
* Thanks for the t-shirt at FOSDEM!

I freely admit cherry-picking these - but the other comments are just as
valuable! All the feedback will be noted down for future use.

Thanks once again to everyone who filled out the survey!

<!-- link ids -->
[contact]: http://theforeman.org/support.html#Mailinglists "Mailing Lists"
[contribute]: http://theforeman.org/contribute.html "Contributing"
[handbook]: http://theforeman.org/handbook.html "Developer Handbook"
[issues]: http://projects.theforeman.org/projects/foreman/issues/new "Foreman - New Issue"
[puppet4]: https://groups.google.com/d/topic/foreman-dev/Ijvodu1hJkE/discussion "Puppet 4 Discussion"
[dominic]: https://github.com/domcleal "Dominic Cleal on GitHub"
[rc1]: http://tinyurl.com/foreman-1-11-rc1 "1.11 RC1 announcement"
[katello]: http://katello.org
[discovery]: http://theforeman.org/plugins/foreman_discovery
[hooks]: https://github.com/theforeman/foreman_hooks
[puppetdb]: https://github.com/theforeman/puppetdb_foreman
[templates]: https://github.com/theforeman/foreman_templates
[bootdisk]: https://github.com/theforeman/foreman_bootdisk
[dhcp]: https://github.com/theforeman/foreman_dhcp_browser
[email]: mailto:greg.sutcliffe@gmail.com
