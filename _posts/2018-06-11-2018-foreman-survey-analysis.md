---
layout: post
title: 2018 Foreman Survey Analysis
date: 2018-06-11 10:00:00
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
- puppet
- katello
- pulp
- content
- use cases
---

As with previous years, we ran a Foreman Community Survey in order to give you
all the opportunity to tell us how we're doing - where it's good, and where
it's bad. That survey closed a while ago, and I'm here to show you the results.

<!--more-->

Firstly - **thank you** to all those who filled out the survey. We kept the same
multi-page format since it seems to work, and even without prize incentives, we
got over 160 responses! You're all legends :)

If you've seen the previous community survey analysis posts, you'll note the
style is a bit different this year. The two main changes are (a) lots of
comparisons to the 2017 data, and (b) [no pie charts][evil-pies], since bar
charts are generally better for comparisons between parts (which is mostly what
we're doing). That's because I'm using R and R-Markdown to write the report with
the code embedded, and you can find the RMarkdown [here][gitlab] if you want to
check my working.

Unless otherwise noted, the scales on these graphs are all percentages - I've
removed the y-axis labels as it saves space and would be very repetitive. The
survey data in 2017 was collected over about a month (February); in 2018 it was
collected over about 2 months (February & March).

I appreciate this report is pretty long. If you're short on time, you can jump
straight to the conclusion (or other sections) using these handy links:

## Contents

* [Intro](/2018/06/2018-foreman-survey-analysis.html)
* [Page 1 - Community and Core](/2018/06/2018-foreman-survey-analysis.html#page1)
* [Page 2 - Plugins, Provisioning, Monitoring](/2018/06/2018-foreman-survey-analysis.html#page2)
* [Page 3 - Smart Proxy & Content](/2018/06/2018-foreman-survey-analysis.html#page3)
* [Page 4 - Development & Contributing](/2018/06/2018-foreman-survey-analysis.html#page4)
* [Conclusions](/2018/06/2018-foreman-survey-analysis.html#conclusions)

The same page-by-page analysis from last year still works, so let's get to it
with:

## <a name="page1"></a>Community Metrics & Core

Let's start with some data about the community itself. Here we see the "age" of
users (as in, how long a user has been participating in the community),
location, and some data about how quickly people upgrade:

![](/static/images/blog_images/2018-survey-images/community-1.svg)<!-- -->![](/static/images/blog_images/2018-survey-images/community-2.svg)<!-- -->

The geography data isn't too interesting - we see pretty much the same
distribution as last year. Would be great to raise that "N America" bar though...

The "age" chart is more concerning. Bear in mind that we're one year on from the
2017 data (obviously), and we see an increase in the 2-3 year parts, and a
corresponding drop in the < 1 year part. That implies that either (a) we're not
doing a good job of bringing new users to the community, or (b) the new users
weren't aware of the survey. Most likely it's a mix of both.

For version information, this is even better than last year - over half the
community on the latest version! However, like many statistics, this can be a
little misleading. Last year the survey was held just a few weeks after 1.14 was
released, but this year 1.16 had been out quite a while (indeed, 1.17 came out
just after it ended). Additionally, 1.16 was quite delayed, and many people were
very keen to get some of the new features, so we expect high adoption anyway. My
instinct is that the number of people on the latest version **at the same point
in the release cycle** is broadly similar across both years.

A more concrete measure is that the amount of people running an unsupported
version (`$latest.major-2` or older) has decreased by over half (27% last year
to 11% this year). That's good news!

---

Let's look at how people run Foreman. Here's some data on the size of
infrastructure, user base, and specs of Foreman servers:

![](/static/images/blog_images/2018-survey-images/hardware-1.svg)<!-- -->![](/static/images/blog_images/2018-survey-images/hardware-2.svg)<!-- -->![](/static/images/blog_images/2018-survey-images/hardware-3.svg)<!-- -->

Firstly, I think the infrastructure size is interesting. We see a 10% *drop* in
the 10-49 group, and a corresponding 9% increase in the 200-599 group. Is this
because we scale better? Or, combining with the "age" graph from before, perhaps
this is driven by older users bringing more nodes under Foreman's control? Hard
to say.

I'm also happy to see some small upticks in the 600+ and larger sizes, as we've
spent significant effort on performance this year. It's nice to see that
reflected in the results.

The users graph is less interesting - broadly this is the same as last year.

For OS, I think the most notable thing is the increase in diversity. CentOS and
RHEL have got significant drops, and most others (including "Other", a grab-bag
of things like AIX, FreeBSD, etc) have increased. I'm unsure what's *driving*
this, but I hope it means we're gaining appeal in new areas - it *certainly*
means we need to pay more attention to supporting different OSs.

The hardware graph is new this year, so I have no comparison data, but I don't
think it's very surprising. We know that Katello is one of our most popular
plugins to Foreman, and that comes with significant requirements, so it's
entirely expected to see plenty of >2 cores and >8Gb of RAM in use by most
people.

---

We asked you to rate how we do in terms of support, so lets also look at that.
As an arbitrary definition of "good support", I've plotted the total 4 or 5
ratings out of 5 (as a percantage of all the replies):

![](/static/images/blog_images/2018-survey-images/support-1.svg)<!-- -->![](/static/images/blog_images/2018-survey-images/support-2.svg)<!-- -->

There's a few results here, and I'll start with the positive ones...

Firstly, the "Overall Satisfaction" is *exactly* the same as last year, in that
78% of the community give us 4+ on this. Likewise, *every* result in these 10
questions is over 50%, so apparently we still give out good support! Thanks for
the positive vibes, everyone!

On a more serious note, apart from the overall satisfaction, every single one of
these results shows a downward trend. Some are small, and could be simply noise
in the data, but even so, it's cause for concern. I'll talk more about this in
the conclusions.

The free-text-field questions back this up, largely people are mentioning the
things we see here such as upgrades, docs, stability. I'll get summaries of
these questions posted to the forum, as there's too much to include here.

---

## <a name="page2"></a>Plugins

Not much has changed in the the world of plugins. Once again, a high proportion
of the community
(93.87%, up from
89.11% last year), so
that's good to see. In terms of plugin popularity, here's a breakdown of the
most popular plugins. This is a multiple choice question, so I've also shown the
total "votes" cast here.

![](/static/images/blog_images/2018-survey-images/popular-plugins-1.svg)<!-- -->

Firstly, note the "Other" is top - this represents the "long tail" of plugins we
know exist out there (over 90 on our wiki page!). Foreman has a strong culture
of helping you to fix the "last mile" in your own environment, and this is the
resulting evidence.

More notably, Katello (shown in green) is now the most popular plugin - a huge
result given the effort that's gone into stabilising it over the last year. Well
done to all the Katello devs! I also think the increase in Remote Execution (in
pink) may be linked to the Katello result (I will do some studies on this later,
looking at common patterns in plugin use), but in any case it's good to see. REX
is an excellent plugin, and gains more power and flexibility all the time.

The other two are strongly connected I suspect - Ansible (blue) has had a big
increase in popularity, while PuppetDB (orange) has fallen sharply. Given
Ansible's meteoric rise in popularity over the last few years, combined with the
Foreman Ansible plugin maturing nicely this year, I think this is fairly easy to
understand.

---

### Provisioning

Now let's take a look at the provisioning side of Foreman. First, some simple
Yes/No style data:

![](/static/images/blog_images/2018-survey-images/provisioning-1.svg)<!-- -->

For provisioning, a slight increase in those using Foreman, slight decrease in
those not using Foreman, not too remarkable. Likewise, there's a slight increase
in people using Hammer, which is nice to see.

On the API front, we see more people using the API overall, but with less using
API v1 - this is good news, since API v1 has now been officially dropped from
the project anyway!

Compute resources are slightly more exciting:

![](/static/images/blog_images/2018-survey-images/compute-resources-1.svg)<!-- -->

Bare metal is still king, as ever, as is VMWare. The rest though, is more
volatile. The remarkable things I see are (a) how much Openstack has dropped,
(b) EC2 catching up to Libvirt, and (c) both HyperV & Azure racing up. How
quickly this field changes from year to year only goes to show that we need help
writing plugins for the various providers, as it's impossible to keep up in the
core team.

We were interested in the NoVNC console usage too, and I think you could take
this either way. If we could support it on *every* platform, then over half the
community would be using it. However, that's not really feasible, so you're left
with something that 20% and probably another 15-20% *might* use if they could.
So, not a huge selling point, but useful if you're on a supported platform.

We also asked about whether people modify their cronjobs -
80.49%
of the responses said "No", which I think gives us confidence that we can assume
the cronjobs we ship are getting used.

---

### Monitoring

A new question we asked about this year was around monitoring - whether you
monitor Foreman and it's hosts, and what you use to do that:

![](/static/images/blog_images/2018-survey-images/monitoring-1.svg)<!-- -->

Some nice things to note here. Most people are monitoring hosts (89.02%), but less than half are monitoring Foreman or the Proxies. We
should perhaps provide a blog post on what things should be monitored.

Looking at monitoring systems, there's lots of love for Zabbix and Nagios. The
"Other" category contains a lot of one-off answers, but also a few people using
other tools but looking to switch to Zabbix/Nagios/Icinga soon. This data is
sure to be useful to the
[foreman_monitoring](https://github.com/theforeman/smart_proxy_monitoring)
authors for what to support in the future.

---

## <a name="page3"></a>Proxies

Let's move on from Foreman to the Proxy. The Foreman Proxy is a key piece of our
architecture, and it's important we understand how it's used.

It's not common, but we do know some community members who run *only* proxies in
a standalone fashion, using the resulting REST API for services as a way to
improve the automation of their network. This year
7.19%
were doing this, compared to
10.26%
last year. It's clearly not common, but we're glad people find ways to make use
of (and contribute to!) our projects.

Lets look at some more data on infrastructure size, Puppet usage, built-in Proxy
features, and extending it with plugins:

![](/static/images/blog_images/2018-survey-images/proxies-1.svg)<!-- -->![](/static/images/blog_images/2018-survey-images/proxies-2.svg)<!-- -->![](/static/images/blog_images/2018-survey-images/proxies-3.svg)<!-- -->

The size data hasn't changed much, so I don't think there's much to say there.
The Puppet changes are also expected as Puppet 3 is shortly to be out of support
soon. It is worth noting that the number of users with no Puppet at all has
risen sharply - this is in line with the other Puppet / Ansible related changes
we've seen in the other data.

The features haven't changed much either. I think we can see a slight increase
in the use of provisioning (shown here in the rise of TFTP/DHCP/DNS features,
and also in the provisioning graphs earlier).

Plugins are tricky. I deliberately exclude proxy plugins which can only be used
with plugins already covered above (e.g OpenSCAP), although somehow Pulp managed
to sneak through my filtering, and a few people put this type of plugin in the
"Other" field (which you see for Salt, REX, etc.). Discounting these (since we
already know quite a bit about their popularity from the previous question),
what we see is that the remaining data is dominated by the provider plugins for
DNS/DHCP. I really like how we're able to offer that level of abstraction,
making it easy to switch provider and maintain the rest of your automation
stack.

---

## Content

With Katello now the most popular plugin for additional functionality, it's only
natural that we devote some time to understanding that perspective of our community.
This year we see a slight increase in those doing content management, from
60.78%
last year, up a little to
63.52%
this year.

Digging in to both the *ways* content is managed, and the *types* of content handled, there's not a lot of change:

![](/static/images/blog_images/2018-survey-images/manage-content-1.svg)<!-- -->![](/static/images/blog_images/2018-survey-images/manage-content-2.svg)<!-- -->

All of these are broadly consistent to last year. The only notable result I see
here is the strong increase the desire for handling Python packages in Katello -
perhaps someone needs to go create a ticket for that?

---

## <a name="page4"></a> Contributing & Development

Finally, we want to know about our developers - both those working on Foreman
today, but also those who are just trying to get started with us. We see a very
similar distribution of these as last year -
34% don't contribute,
38% do, and
29%
need help to get started.

Digging into this, we asked about what resources people were aware of, what
areas they help with (or would like to), and how we do in supporting our
developers:

![](/static/images/blog_images/2018-survey-images/contribute-1.svg)<!-- -->![](/static/images/blog_images/2018-survey-images/contribute-2.svg)<!-- -->

In terms of resources, I'm concerned in the drop in awareness of the Developer
Handbook. That clearly needs another look in terms of promotion and possibly
restructuring. I'm also concerned in the rise of Bug Reporting & Triage as a
help category - that means (a) we've got a *lot* more bugs (which we also saw in
the decrease in release stability rating above), or (b) it's not easy enough to
submit bugs. I'm inclined to believe it's most (a), but I am planning an upgrade
to Redmine soon, so perhaps we can improve the workflows there too.

The developer ratings follow as similar pattern as the user ratings above -
static or decreasing, with RFCs a particular sore point.

## <a name="conclusions"></a> Conclusions

I'll start by saying that these results don't surprise me. As the Community
Lead, I get to chat with a lot of folks and hear about their problems and
frustrations in private, so I was already aware that satisfaction was down. If
anything, I'm happy it's not lower.

It's also important to note that this is not a *bad* result in isolation - if I
didn't show the 2017 data, it would look pretty good! This is not a cause for
sadness, but it *is* a call to action if we're to reverse this trend in next
year's survey.

I've saved one graph for last - what the community thinks we should work on
next. Let's take a look:

![](/static/images/blog_images/2018-survey-images/next-1.svg)<!-- -->

No surprise that bugs and stability top the list, given the rest of the data,
but let's look at this with a different lens...

Taken together, we have issues with bug counts, stability, new user experiences,
upgrade processes, and release frequency. It's my belief that the solution to
this is making Foreman run in a container. The implications of such a change are
huge:

* Having complete control of the runtime environment of Foreman will considerably reduce the matrix of support
  * Today, every conversation with a user must start with "What OS are you on?"
* Removes much of our packaging overhead
* Simplifies plugins (probably, that needs some definition)
* Removes (or at least largely simplifies) the need for our complex installer.

This should lead to much greater stability, faster work on bugs (because the
runtime is always the same), and a better experience for new-users (because
there's no conflicts with other services on the same box, or weirdness in a
particular OS). There's also some benefit from a developer perspective, as
getting a dev environment up *could* be made easier.

From this perspective, let's look at that graph again. 10% of the community
want this feature directly (marked "Containers - Foreman"), but the argument
can be made that such a move is beneficial for the Bugs, and support for host
containers in Foreman itself (marked "Containers - Hosts"). One could also
argue that's a step towards better HA support, since containers are far more
flexible in that regard. Putting all that together, 67.37% of the community
could be served by such a move (although clearly, much of this requires
significant effort and changes to the architecture, especially for HA - don't
expect this overnight!).

I should stress that this is my *personal* opinion, and I have no actual power
to command that this happens :P. However, work has already been started by
Eric's team, and I'll be championing this in the future. I've been *strongly*
swayed by my experiences with Discourse's Docker implementation, and as a fellow
Rails project, I think there's much we can learn from them. Clearly we need to
make sure there's good migration paths for existing users, and there'll be much
tooling to sort out. Contribution will be *very* much welcome if this excites
you!

There are, of course, smaller changes we can make along the way. I'm arranging a
regular core-Foreman bug triage which I hope will help get the right bugs
prioritised (or closed). We're also looking into how to improve our release
management process so that new releases get out the door on time - no blame to
our current release managers though, they work hard and it's a pretty thankless
task! However it's clear that our usual 3-month timescale has slipped recently,
and we'd like to get that back.

We also need to address the issue of communication, discussion, and
documentation. I believe on this area we're already improving - the survey was
taken right after the move to Discourse, and now that things have settled down
there, I'm seeing much greater interaction in the community on the forum. We've
already implemented a new RFC process using the forum with voting, and the
Solved plugin for the Support board is helping people to focus their efforts. I
also hope it'll assist new members of the community in finding their way to the
resources they need.

I'll be continuing to develop our Discourse integrations this year (we have
proposals for migrating some of the old wiki content, and also integrating the
blog), and I should *finally* be able to do the metrics dashboard too, which
will give us a view on things like time-to-close for bugs and PRs, failure rates
in Jenkins, and so forth. I hope this will enable us to be more pro-active in
keeping the community healthy.

Thanks for reading! As ever, if you have comments or questions, hit [me][me] up
on the [forum][forum] to discuss it further!

[evil-pies]: https://www.quora.com/How-and-why-are-pie-charts-considered-evil-by-data-visualization-experts
[forum]: https://community.theforeman.org/
[gitlab]: https://gitlab.com/gwmngilfen/survey-data/
[me]: https://community.theforeman.org/u/Gwmngilfen
