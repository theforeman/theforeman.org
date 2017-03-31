---
layout: post
title: 2017 Foreman Survey Analysis
date: 2017-03-27 11:39:32
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
it's bad. That survey closed a month ago, and I'm here to show you the results.

Firstly - **thank you** to all those who filled out the survey. We went with a
different, multi-page format this year, which resulted in a much longer survey.
That data is hugely valuable, as we'll see, but I appreciate it took extra time
to fill in. Despite this, we had our largest response to date **by far**, with
over **200** submissions.

<!--more-->

## <a name="intro"></a>Contents

* [Intro](/2017/03/2017-foreman-survey-analysis.html#intro)
* [Page 1 - Community and Core](/2017/03/2017-foreman-survey-analysis.html#page1)
* [Page 2 - Plugins, Compute, API](/2017/03/2017-foreman-survey-analysis.html#page2)
* [Page 3 - Smart Proxy & Content](/2017/03/2017-foreman-survey-analysis.html#page3)
* [Page 4 - Development & Contributing](/2017/03/2017-foreman-survey-analysis.html#page4)
* [Final thoughts](/2017/03/2017-foreman-survey-analysis.html#final-thoughts)

Since we had a multi-page survey this year, it makes sense to analyse the
results page by page, starting with:

## <a name="page1"></a>Community Metrics & Core

![How long using](/static/images/blog_images/2017-03-29-2017-foreman-survey-analysis/basic/how_long_using.png)

This is consistent with last year - there's a slight fall off in 2 and 3+ year
members, and a small increase in the 3 & 6 month segments, but overall the
picture looks the same as 2016 and 2015.

![What version used](/static/images/blog_images/2017-03-29-2017-foreman-survey-analysis/basic/which_version.png)

Once again, I'm impressed by how quickly a big section of the community
upgrades. When this survey was launched, 1.14 had only been out for about a
week; taken with 1.13 this means some 70% of the community were on some form of
"latest", which is great news. It's good to see a smaller number of people on
really old versions (15.2% on 1.11 or older, versus 25% last year) - seems like
the message to keep up to date is getting out there - but as always, if there's
anything holding you back from upgrading, do [get in touch][contact]!

![Nodes managed](/static/images/blog_images/2017-03-29-2017-foreman-survey-analysis/basic/how_many_nodes.png)

Slight increase in large (>1k nodes) installations here (<10% last year), but
nothing significant - the majority of our user base has less than 200 nodes
managed. It is good to see representations from all sizes though, as we've done
a fair bit of work on scalability this year (see [this case study][45k nodes]
for example).

![Number of Users](/static/images/blog_images/2017-03-29-2017-foreman-survey-analysis/basic/how_many_people.png)

Broadly consistent with previous years, in that most of our user have
relatively few people accessing Foreman directly. Perhaps next year we'll
change this question to learn more about how many people use the Roles and
Permissions (versus full admin users), as I think the real split here is how
many people have a single "Foreman guy" versus those who try to do things like
self-service infra, and so forth.

Now for a few tables on OS support:

<table class="table table-bordered table-striped" style="width:100%">
  <thead>
    <tr>
      <th style="text-align: center">OS Support</th>
      <th style="text-align: center">RHEL</th>
      <th style="text-align: center">CentOS</th>
      <th style="text-align: center">Fedora</th>
      <th style="text-align: center">Debian</th>
      <th style="text-align: center">Ubuntu</th>
      <th style="text-align: center">Other</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style="text-align: center"><strong>Foreman</strong></td>
      <td style="text-align: center">26%</td>
      <td style="text-align: center">62%</td>
      <td style="text-align: center">2%</td>
      <td style="text-align: center">18%</td>
      <td style="text-align: center">12%</td>
      <td style="text-align: center">6%</td>
    </tr>
    <tr>
      <td style="text-align: center"><strong>Hosts</strong></td>
      <td style="text-align: center">34%</td>
      <td style="text-align: center">62%</td>
      <td style="text-align: center">3%</td>
      <td style="text-align: center">21%</td>
      <td style="text-align: center">16%</td>
      <td style="text-align: center">21%</td>
    </tr>
  </tbody>
</table>

As per last year, this is a multi-select so the totals are >100% - however we
did break it up a bit (last year was just "Red Hat family" and so on). I think
the most striking thing here is the low value of Fedora use, particularly for
provisioned hosts. Otherwise it's about what you'd expect with around twice as
many people using RPM versus DEB. 20% in "Other" for hosts is high,  and this
has a wide list of answers - Windows, Scientific Linux, Oracle, various BSDs,
and more are represented.

![Regions](/static/images/blog_images/2017-03-29-2017-foreman-survey-analysis/basic/geography.png)

The "Other" section contains people who were willing to be more specific, so
the chart is a bit out, but broadly there's no surprises here. I'm well aware
that we're strongest in Europe and North America, and I do think this is the
sort of thing that tends to grow organically. Do spread the word though,
particularly if you're heading to conferences in other parts of the world. If
you'd like to take some Foreman stickers with you to events, you can [email
me][email]!

### Meeting expectations

![User Support](/static/images/blog_images/2017-03-29-2017-foreman-survey-analysis/basic/user_support.png)

We have a great reputation for our support, and that's reflected here as with
previous years. Overall, people seem happy (all categories have a majority of
replies in the 4+ rating), but as we'll see in a moment, there's more we can
do.

![Major and Minor releases](/static/images/blog_images/2017-03-29-2017-foreman-survey-analysis/basic/major_releases.png)

Once again we score well here, and people are happy with both frequency and
stability. Our ratings on fixing major bugs have dropped  a little, but it's
still a good result.

![Overall expectations](/static/images/blog_images/2017-03-29-2017-foreman-survey-analysis/basic/requirements.png)

Same picture again here, broadly (>75%) people are happy with how Foreman
performs for them. That's good to hear, but we do have to be aware that all
three of these charts are very biased - the people who dislike our features,
schedules or bug-fixing work have probably already left the community.

There's always room to improve, and that can be seen in the free-text question
about support and documentation. Whilst a lot of replies were broadly "It's
great", there were a few themes. Here's a rough grouping of the 37 replies:

<table class="table table-bordered table-striped" style="width:100%">
  <thead>
    <tr>
      <th style="text-align: center">Happy</th>
      <th style="text-align: center">General improvements</th>
      <th style="text-align: center">Offer tutorials</th>
      <th style="text-align: center">Other comments</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style="text-align: center">10</td>
      <td style="text-align: center">10</td>
      <td style="text-align: center">9</td>
      <td style="text-align: center">8</td>
    </tr>
  </tbody>
</table>

Bear in mind the other 167 responders had no comment to add, and are presumably
mostly happy. One common theme was to offer off-line docs (PDF, ePUB etc.) so I
may look into this.

We also asked what people use Foreman for right now, and this was free text.
Here's a rough grouping, bear in mind that some answers go in two groups, and
some just make no sense (what category do I put the comment "awesome" in?):

<table class="table table-bordered table-striped" style="width:100%">
  <thead>
    <tr>
      <th style="text-align: center">Inventory</th>
      <th style="text-align: center">Reporting</th>
      <th style="text-align: center">ENC (or similar)</th>
      <th style="text-align: center">Provisioning</th>
      <th style="text-align: center">Content / Patch management</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style="text-align: center">5%</td>
      <td style="text-align: center">17%</td>
      <td style="text-align: center">26%</td>
      <td style="text-align: center">45%</td>
      <td style="text-align: center">8%</td>
    </tr>
  </tbody>
</table>

Obviously this is very rough and subject to my interpretation of comments, but
it's interesting nonetheless. We also asked what future plans you were looking
into:

### What expansion plans do you have for Foreman in the next year?

<table class="table table-bordered table-striped" style="width:100%">
  <thead>
    <tr>
      <th style="text-align: center">None</th>
      <th style="text-align: center">Scaling up</th>
      <th style="text-align: center">Provisioning</th>
      <th style="text-align: center">Puppet</th>
      <th style="text-align: center">Katello</th>
      <th style="text-align: center">New Compute types</th>
      <th style="text-align: center">New Plugins</th>
      <th style="text-align: center">Other</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style="text-align: center">9%</td>
      <td style="text-align: center">11%</td>
      <td style="text-align: center">13%</td>
      <td style="text-align: center">5%</td>
      <td style="text-align: center">15%</td>
      <td style="text-align: center">20%</td>
      <td style="text-align: center">20%</td>
      <td style="text-align: center">8%</td>
    </tr>
  </tbody>
</table>

A nice mix here, but it does highlight that there's a whole ecosystem of extras
for Foreman, and that you can switch on pieces of functionality in stages - no
need to do it all in one go. The 15% anting to add [Katello][katello] will no
doubt be watching the ongoing work to make Katello more Foreman-friendly with
great anticipation (see further down for more Katello goodness)!

![What next](/static/images/blog_images/2017-03-29-2017-foreman-survey-analysis/basic/what_next.png)

This is an interesting one, since it's pretty evenly spilt (only the API got a
smaller share). I think it's fair to say that we're hearing the feedback that a
release or two focussed on stability would be appreciated by the community, and
if you consider that to be bug fixes (green) and UI improvements to work flows
on existing features (blue) then we're looking at >50% of the votes.

![Phone home](/static/images/blog_images/2017-03-29-2017-foreman-survey-analysis/basic/phone_home.png)

Pretty clear cut, and I'm not surprised - this is a dangerous topic, and many
communities have burned themselves on it. The goal is noble, but it's hard to
do right. The feedback is clear here, but there's some good suggestions from
the "Other" section which I'll use to redraft the proposal to something more
acceptable.

Finally we asked for any other comments - obviously this is a very wide
question, and it's impossible to summarize it in any meaningful way here.
However, there's a nice mix of simply "no, it's great" and constructive ideas
for improvement here, and I'll log some of them as issues in [the bug
tracker][issues].

## <a name="page2"></a>Plugins, Compute, and API

Here we looked at the extensions to Foreman - plugins, compute resources and
our API and CLI tooling. Starting with plugins...

![Plugins](/static/images/blog_images/2017-03-29-2017-foreman-survey-analysis/plugins/know_plugins.png)

Still a few people who weren't aware of our plugin system, so if that's you,
you want to go to out [plugins page][plugins] and take a look to see if there's
anything there can help you get more out of Foreman!

Looking at what plugins people use, it's a pretty huge graph, so I've rewritten
it as a table for ease of reading...

<table class="table table-bordered table-striped" style="width:100%">
  <tbody>
      <tr>
        <th style="text-align: left">abrt</th><td style="text-align: center">2.8%</td>
        <th style="text-align: left">katello</th><td style="text-align: center">34.8%</td>
      </tr>
      <tr>
        <th style="text-align: left">ansible</th><td style="text-align: center">24.7%</td>
        <th style="text-align: left">memcache</th><td style="text-align: center">12.9%</td>
      </tr>
      <tr>
        <th style="text-align: left">audited_notifications</th><td style="text-align: center">1.7%</td>
        <th style="text-align: left">monitoring</th><td style="text-align: center">6.7%</td>
      </tr>
      <tr>
        <th style="text-align: left">bootdisk</th><td style="text-align: center">24.7%</td>
        <th style="text-align: left">noenv</th><td style="text-align: center">0%</td>
      </tr>
      <tr>
        <th style="text-align: left">chef</th><td style="text-align: center">6.7%</td>
        <th style="text-align: left">omaha</th><td style="text-align: center">2.2%</td>
      </tr>
      <tr>
        <th style="text-align: left">cockpit</th><td style="text-align: center">9.6%</td>
        <th style="text-align: left">openscap</th><td style="text-align: center">15.7%</td>
      </tr>
      <tr>
        <th style="text-align: left">column_view</th><td style="text-align: center">12.4%</td>
        <th style="text-align: left">ovirt</th><td style="text-align: center">17.4%</td>
      </tr>
      <tr>
        <th style="text-align: left">custom_banner</th><td style="text-align: center">3.4%</td>
        <th style="text-align: left">param_lookup</th><td style="text-align: center">0.6%</td>
      </tr>
      <tr>
        <th style="text-align: left">custom_parameters</th><td style="text-align: center">4.5%</td>
        <th style="text-align: left">pipeline</th><td style="text-align: center">1.1%</td>
      </tr>
      <tr>
        <th style="text-align: left">default_hostgroup</th><td style="text-align: center">19.1%</td>
        <th style="text-align: left">plugin_computeresource</th><td style="text-align: center">2.8%</td>
      </tr>
      <tr>
        <th style="text-align: left">dhcp_browser</th><td style="text-align: center">23.6%</td>
        <th style="text-align: left">plugin_exec_cmd</th><td style="text-align: center">1.1%</td>
      </tr>
      <tr>
        <th style="text-align: left">discovery</th><td style="text-align: center">36.5%</td>
        <th style="text-align: left">puppetdb_foreman</th><td style="text-align: center">37.6%</td>
      </tr>
      <tr>
        <th style="text-align: left">epel_release</th><td style="text-align: center">9.6%</td>
        <th style="text-align: left">radiator</th><td style="text-align: center">1.1%</td>
      </tr>
      <tr>
        <th style="text-align: left">expire_hosts</th><td style="text-align: center">7.9%</td>
        <th style="text-align: left">remote_execution</th><td style="text-align: center">21.9%</td>
      </tr>
      <tr>
        <th style="text-align: left">graphite</th><td style="text-align: center">7.3%</td>
        <th style="text-align: left">reserve</th><td style="text-align: center">0%</td>
      </tr>
      <tr>
        <th style="text-align: left">hooks</th><td style="text-align: center">23.6%</td>
        <th style="text-align: left">resources</th><td style="text-align: center">3.4%</td>
      </tr>
      <tr>
        <th style="text-align: left">host_extra_validator</th><td style="text-align: center">2.2%</td>
        <th style="text-align: left">salt</th><td style="text-align: center">7.3%</td>
      </tr>
      <tr>
        <th style="text-align: left">hostgroup_extra_validator_foreman</th><td style="text-align: center">0.6%</td>
        <th style="text-align: left">sentry</th><td style="text-align: center">1.1%</td>
      </tr>
      <tr>
        <th style="text-align: left">host_overview</th><td style="text-align: center">4.5%</td>
        <th style="text-align: left">setup</th><td style="text-align: center">11.8%</td>
      </tr>
      <tr>
        <th style="text-align: left">host_rundeck</th><td style="text-align: center">5.6%</td>
        <th style="text-align: left">slack</th><td style="text-align: center">3.4%</td>
      </tr>
      <tr>
        <th style="text-align: left">hubot_notify</th><td style="text-align: center">0.6%</td>
        <th style="text-align: left">templates</th><td style="text-align: center">31.5%</td>
      </tr>
      <tr><th style="text-align: left">Other</th><td style="text-align: center">5.1%</td></tr>
  </tbody>
</table>

If you want to see this as a bar chart image you can [click
here](/static/images/blog_images/2017-03-29-2017-foreman-survey-analysis/plugins/plugin_use.png).
The usual suspects are here ([Katello][katello], [Discovery][discovery],
PuppetDB, Hooks, etc.) but also a big increase for [Ansible][ansible] (24.7%,
up from 13% last year) and [Remote Execution][rex] (21.9%, up from 6.5%), and
much more. It's great to see the hard work of these plugin authors finding it's
way into peoples deployments, and while it's hard to represent the data, I hope
have even more plugins here next year.

### Provisioning & Compute Resources

First we asked about provisioning in general...

![Provisioning](/static/images/blog_images/2017-03-29-2017-foreman-survey-analysis/provisioning_api/provisioning.png)

I find the 22% of people who provision outside of Foreman interesting - this
will never be zero, but it seems high enough that maybe there's a use case
we're not addressing here. If you're one of these 22%, and it's something you
think we can fix, tell us what's missing!

Then we looked at specific platforms you might provision on. Again, I've turned
this to a table, but the bar chart is
[here](/static/images/blog_images/2017-03-29-2017-foreman-survey-analysis/provisioning_api/compute_resources.png).

<table class="table table-bordered table-striped" style="width:100%">
  <tbody>
      <tr>
        <th style="text-align: left">Bare Metal</th><td style="text-align: center">74.6%</td>
        <th style="text-align: left">OpenNebula</th><td style="text-align: center">3%</td>
      </tr>
      <tr>
        <th style="text-align: left">Amazon EC2</th><td style="text-align: center">19.8%</td>
        <th style="text-align: left">OpenStack</th><td style="text-align: center">19.8%</td>
      </tr>
      <tr>
        <th style="text-align: left">Azure</th><td style="text-align: center">4.6%</td>
        <th style="text-align: left">oVirt</th><td style="text-align: center">17.3%</td>
      </tr>
      <tr>
        <th style="text-align: left">DigitalOcean</th><td style="text-align: center">9.1%</td>
        <th style="text-align: left">Rackspace</th><td style="text-align: center">2%</td>
      </tr>
      <tr>
        <th style="text-align: left">Docker</th><td style="text-align: center">16.2%</td>
        <th style="text-align: left">VMWare</th><td style="text-align: center">51.3%</td>
      </tr>
      <tr>
        <th style="text-align: left">Google Compute Engine</th><td style="text-align: center">3.6%</td>
        <th style="text-align: left">Xen</th><td style="text-align: center">6.1%</td>
      </tr>
      <tr>
        <th style="text-align: left">Libvirt</th><td style="text-align: center">30.5%</td>
        <th style="text-align: left">Other</th><td style="text-align: center">7.1%</td>
      </tr>
  </tbody>
</table>

No great surprises here - once again physical provisioning is huge, with 75%
doing some form of bare metal (I guess that includes "underclouds" for Docker,
OpenStack etc.). That's even more than last year (63%), which I find
interesting as we talk more and more about hybrid and on-premise cloud
solutions. This is also seen in OpenStack getting double the share (10% ->
19.8%).

For the rest, it's about what I'd expect anecdotally. The variety is good
though - this is a handy graph when explaining to people that we really *do*
support many different platforms, and that people actually use that support.

### Hammer & API

![Hammer](/static/images/blog_images/2017-03-29-2017-foreman-survey-analysis/provisioning_api/hammer.png)

Nothing new here - [Hammer][hammer] has always trended at around 50%. Looking
at why that isn't growing, the free text comments seems to point to a
combination of performance issues, lack of documentation, and showcasing it's
features.  Perhaps it's time we had some more hammer blog posts?

![API](/static/images/blog_images/2017-03-29-2017-foreman-survey-analysis/provisioning_api/api.png)

Also broadly the same from last year, I don't think we can say much more here.
It's clear that the API is important to people, and we do take pains to try and
keep it in sync. Comments in the free text are generally positive, but to point
to a lack of real-world examples to round out the current fairly dry
[Apidoc][apidoc] pages. More blog posts!

## <a name="page3"></a>Smart Proxy & Content

We went into a lot more detail on proxies this year, since it's starting to
develop a plugin community of it's own.

![Proxies](/static/images/blog_images/2017-03-29-2017-foreman-survey-analysis/proxies/number.png)

No surprises here, most people run just a few proxies.

<table class="table table-bordered table-striped" style="width:100%">
  <tbody>
      <tr>
        <th style="text-align: left">BMC</th><td style="text-align: center">20.1%</td>
        <th style="text-align: left">Puppet</th><td style="text-align: center">85.7%</td>
      </tr>
      <tr>
        <th style="text-align: left">DHCP</th><td style="text-align: center">63.5%</td>
        <th style="text-align: left">PuppetCA</th><td style="text-align: center">69.8%</td>
      </tr>
      <tr>
        <th style="text-align: left">DNS</th><td style="text-align: center">52.9%</td>
        <th style="text-align: left">Realm</th><td style="text-align: center">14.8%</td>
      </tr>
      <tr>
        <th style="text-align: left">Facts</th><td style="text-align: center">44.4%</td>
        <th style="text-align: left">Templates</th><td style="text-align: center">23.3%</td>
      </tr>
      <tr>
        <th style="text-align: left">Logs</th><td style="text-align: center">30.2%</td>
        <th style="text-align: left">TFTP</th><td style="text-align: center">63%</td>
      </tr>
      <tr>
        <th style="text-align: left">OpenSCAP</th><td style="text-align: center">10.1%</td>
        <th style="text-align: left">Other</th><td style="text-align: center">7.4%</td>
      </tr>
  </tbody>
</table>

Again, the bar graph of this is
[here](/static/images/blog_images/2017-03-29-2017-foreman-survey-analysis/proxies/features.png).
I'm unsurprised by the high values of Puppet(,CA) and TFTP since these come out
of the box with our default install. DHCP and DNS are also expected to be high
since we know from earlier that a large amount of the community do
provisioning. It is interesting, though, to see a significant uptake in things
like Realm or OpenSCAP proxies, and the few entries of Other are mainly Salt,
Ansible, Discovery, and Remote Execution entries.

Then there's proxy plugins ([bar
chart](/static/images/blog_images/2017-03-29-2017-foreman-survey-analysis/proxies/plugins.png)).

<table class="table table-bordered table-striped" style="width:100%">
  <tbody>
      <tr> <th style="text-align: left">dhcp_infoblox</th><td style="text-align: center">15%</td> </tr>
      <tr> <th style="text-align: left">dns_infoblox</th><td style="text-align: center">13.8%</td> </tr>
      <tr> <th style="text-align: left">dns_powerdns</th><td style="text-align: center">11.3%</td> </tr>
      <tr> <th style="text-align: left">dns_route53</th><td style="text-align: center">5%</td> </tr>
      <tr> <th style="text-align: left">pulp (katello)</th><td style="text-align: center">63.7%</td> </tr>
      <tr> <th style="text-align: left">vault</th><td style="text-align: center">3.8%</td> </tr>
      <tr> <th style="text-align: left">Other</th><td style="text-align: center">22.5%</td> </tr>
  </tbody>
</table>

For this question, I deliberately avoided plugins which are merely companions
to core Foreman plugins (e.g. Discovery, Remote Execution, OpenSCAP, etc.),
since this doesn't tell us anything new (with the exception of Pulp/Katello,
since Pulp can be used standalone from Katello). Instead, I looked for info on
how people are extending the proxy itself.

It's good to see the Infoblox, PowerDNS, and Route53 plugins getting some use
here - it's nice to showcase some of these proxy plugins and demonstrate how we
try to help people connect to other systems they may already have in place.
Hopefully there'll be more plugins here next year.

![Puppet](/static/images/blog_images/2017-03-29-2017-foreman-survey-analysis/proxies/puppet.png).

Initially, I was surprised at how many people are still on Puppet 3 - after
all, Puppetlabs called End Of Life on the 3.x series at the start of 2017. But
then, I thought "Is this an upgrade issue?". Turns out, it might be - if you
look at the people who answered "Mainly Puppet 3" and then reference the "How
long have you been using Foreman?" answers, only 20% of Puppet 3 users have
been using Foreman for less than a year (versus ~40% for Puppet 4). That makes
a lot more sense - the Puppet 3 to Puppet 4 migration is a lot of work.

For us though, this tells us we need to maintain the Puppet 3 parser in the
proxy for a while longer yet, and that's good to know. With 3.x now end of
life, it would be an easy assumption that we could drop it in a few releases
time - now we know not to.

![Standalone](/static/images/blog_images/2017-03-29-2017-foreman-survey-analysis/proxies/standalone.png).

This one caught me entirely off guard - 10% of responses use the proxy
directly, without going through Foreman! I'd have put that at a few percent, at
most. The main lesson here is that we need to be very careful with the proxy
APIs as we go forward, so as not to break anything for people using the proxy
directly.

Also, if you're one of those people, come [talk to me][email] - I'd love to
learn more about what you're doing there!

### Content

This year we added some questions on Katello & Pulp, as there's a sizeable
component of the community that makes use of the huge feature set these two
projects bring to the table:

![Content](/static/images/blog_images/2017-03-29-2017-foreman-survey-analysis/content/manage_content.png).

This is interesting, but only in comparison to the plugins chart on page 2.
There we see 34.8% use for Katello, yet 60.8% say they do manage content in
some way (not necessarily through Foreman). That's big news, it means there's
plenty more ways in which we can help solve content problems.

So naturally we then ask *how* they manage the content
([chart](/static/images/blog_images/2017-03-29-2017-foreman-survey-analysis/content/how_content.png)):

<table class="table table-bordered table-striped" style="width:100%">
  <tbody>
      <tr>
        <th style="text-align: left">Katello</th>
        <th style="text-align: left">Standalone Pulp</th>
        <th style="text-align: left">Other</th>
      </tr>
      <tr>
        <td style="text-align: left">50%</td>
        <td style="text-align: left">17.2%</td>
        <td style="text-align: left">41.8%</td>
      </tr>
  </tbody>
</table>

So 50% use Katello - that supports the earlier data (half of 60.8% isn't so far
away from 34.8%). That's fine, but it gets better - with 22% using [Pulp][pulp]
directly (in a *Foreman* survey), something is clearly blocking adoption of
Katello. That breaks down into two groups, I think - people who can't adopt
Katello because it can't currently be added to a running Foreman, and those for
whom Katello doesn't yet support their work flow.  Happily work is under way to
improve the situation, and to make Katello less monolithic, which should help
with both of these. Next year's numbers will tell!

"Other" has a big chunk too, and here we see things like Aptly, Artifactory,
R10K, Git, Spacewalk, and so on. My conclusion here is that this is mainly
about content *types* that we can't currently handle, or where the overhead is
high (R10K is much easier to use than Katello for Puppet modules if you don't
care about Lifecycle management, for example).

In terms of the types of content management people use with Foreman
([chart](/static/images/blog_images/2017-03-29-2017-foreman-survey-analysis/content/content_via_foreman.png)):

<table class="table table-bordered table-striped" style="width:100%">
  <tbody>
      <tr>
        <th style="text-align: left">Mirroring Upstream Content</th>
        <th style="text-align: left">Upstream Lifecycle Management</th>
        <th style="text-align: left">Internally Generated Content</th>
        <th style="text-align: left">Internal Lifecycle Management</th>
        <th style="text-align: left">Other</th>
      </tr>
      <tr>
        <td style="text-align: left">86.7%</td>
        <td style="text-align: left">65.7%</td>
        <td style="text-align: left">63.6%</td>
        <td style="text-align: left">58%</td>
        <td style="text-align: left">2.8%</td>
      </tr>
  </tbody>
</table>

Not so interesting - what this tells us is that the people who do any content
management do tend to use *all* the features of Katello. That covers the
handling of upstream (e.g. EPEL) content, as well as internal stuff. I do
wonder if this picture will be different when more of the features are
optional...

For types of content managed it's not so clear
([chart](/static/images/blog_images/2017-03-29-2017-foreman-survey-analysis/content/content_types.png)):

<table class="table table-bordered table-striped" style="width:100%">
  <tbody>
      <tr>
        <th style="text-align: left">RPM repos</th>
        <th style="text-align: left">SuSE repos</th>
        <th style="text-align: left">Puppet Modules</th>
        <th style="text-align: left">Docker</th>
        <th style="text-align: left">ISOs</th>
        <th style="text-align: left">Other</th>
      </tr>
      <tr>
        <td style="text-align: left">82%</td>
        <td style="text-align: left">8.7%</td>
        <td style="text-align: left">57.3%</td>
        <td style="text-align: left">24.7%</td>
        <td style="text-align: left">26%</td>
        <td style="text-align: left">17.3%</td>
      </tr>
  </tbody>
</table>

No-one should be surprised to see RPMs top of this list, but the rest is pretty
mixed. For me, this does point again to making *content* management more
general than *RPM* management, but that's already been the direction for a
while.

Finally, the big question - what other content types should be added
([chart](/static/images/blog_images/2017-03-29-2017-foreman-survey-analysis/content/content_plans.png)):

<table class="table table-bordered table-striped" style="width:100%">
  <tbody>
      <tr>
        <th style="text-align: left">Python Modules</th>
        <th style="text-align: left">Rubygems</th>
        <th style="text-align: left">NPM Modules</th>
        <th style="text-align: left">Debian Packages</th>
        <th style="text-align: left">Java Archives</th>
        <th style="text-align: left">Other</th>
      </tr>
      <tr>
        <td style="text-align: left">38.7%</td>
        <td style="text-align: left">41.2%</td>
        <td style="text-align: left">22.7%</td>
        <td style="text-align: left">58.8%</td>
        <td style="text-align: left">26.9%</td>
        <td style="text-align: left">13.4%</td>
      </tr>
  </tbody>
</table>

I'm glad to see strong support for DEBs, as I've long advocated for Katello to
support that. What's more interesting is that this isn't a single run-away
winner - Python, Ruby, Java, and Node all make a strong showing too. I think
this shows there's a demand for on-premise handling of *all* the various
services we (as developers) rely on almost without thinking (Rubygems, PyPi,
etc). Being able to easily extend to Katello to support new content types seems
to be something that might be wanted.

## <a name="page4"></a>Development & Contributing

Finally we have the developer survey, starting with contributions:

![Contribute](/static/images/blog_images/2017-03-29-2017-foreman-survey-analysis/contribute/contribute.png)

One good, one bad. Firstly, the share of "Yes" has dropped from last year -
that makes me sad, since it's my job to grow our communities, not shrink them.
However, we do have nearly three times as many votes as last year which means
in absolute terms "Yes" votes have gone from 33 to 75 :)

Better though is that the share of people who *want* to contribute has
increased substantially.... Now I just need to work on helping you guys out!

In terms of where that contribution (or desire to) lands
([chart](/static/images/blog_images/2017-03-29-2017-foreman-survey-analysis/contribute/what_areas.png)):

<table class="table table-bordered table-striped" style="width:100%">
  <tbody>
      <tr>
        <th style="text-align: left">Bug Reporting</th>
        <th style="text-align: left">RC Testing</th>
        <th style="text-align: left">Translating</th>
        <th style="text-align: left">Packaging</th>
        <th style="text-align: left">Installer</th>
        <th style="text-align: left">Coding Core/Proxy</th>
        <th style="text-align: left">Coding Plugins</th>
        <th style="text-align: left">Unsure</th>
        <th style="text-align: left">Other</th>
      </tr>
      <tr>
        <td style="text-align: left">61.9%</td>
        <td style="text-align: left">26.5%</td>
        <td style="text-align: left">12.3%</td>
        <td style="text-align: left">12.3%</td>
        <td style="text-align: left">21.9%</td>
        <td style="text-align: left">21.3%</td>
        <td style="text-align: left">25.2%</td>
        <td style="text-align: left">14.2%</td>
        <td style="text-align: left">10.3%</td>
      </tr>
  </tbody>
</table>

Bug reporting and Release Candidate testing are the big share, and that's what
I'd expect - the level of effort you guys put into our RC phases astounds me
every single time, so as always **thanks!** The 20+ people in "I'm not sure"
need to come [talk to me][email] so I can help you get started with something
easy - I'm also going to start regular "community office hours" soon so watch
out for that!

![Ease](/static/images/blog_images/2017-03-29-2017-foreman-survey-analysis/contribute/ease_of_use_3.png)

This one worries me. While our user docs get generally good feedback, the
picture here is *much* less clear. For new devs, there's a lot of people who
can't find docs or get set up with a dev environment, and for existing devs we
seem to have issues with discussing and providing feedback on new ideas.

The latter doesn't surprise me, and plans to improve this are already being
discussed on the developer mailing list. But it does seem like some more work
is needed in our on-boarding of new devs. We do have the [Handbook][handbook]
and suchlike on the website, but perhaps it can be better structured or added
to. I'll have a think about it.

We also wanted to know what the dev community was aware of, in terms of
resources available to them
([chart](/static/images/blog_images/2017-03-29-2017-foreman-survey-analysis/contribute/resources.png)):

<table class="table table-bordered table-striped" style="width:100%">
  <tbody>
      <tr>
        <th style="text-align: left">Handbook</th>
        <th style="text-align: left">Wiki</th>
        <th style="text-align: left">Prior Deep Dives</th>
        <th style="text-align: left">Requesting Deep Dives</th>
        <th style="text-align: left">Prior Demos</th>
        <th style="text-align: left">Presenting on a Demo</th>
      </tr>
      <tr>
        <td style="text-align: left">63.6%</td>
        <td style="text-align: left">88.1%</td>
        <td style="text-align: left">38.4%</td>
        <td style="text-align: left">10.6%</td>
        <td style="text-align: left">39.7%</td>
        <td style="text-align: left">10.6%</td>
      </tr>
  </tbody>
</table>

Seems plenty of people are still unaware of our various development resources -
this comes back to the previous point about potentially restructuring things
for new/existing devs to make finding things easier.

The last two questions about contributing in general were interesting. Many
people simply said they'd like to help but have no free time. That's fair
enough! There's also plenty of people who say they can't contribute because
they don't know Ruby - that's no excuse! Contribution isn't just code, and as
you can see above, we also need help in translations, packaging, installer
Puppet modules - even just hanging out on the dev list and giving feedback on
ideas is hugely useful.

There's a few good specific points raised, such as promoting
[Forklift][forklift] better which I'll take on board and deal with - thanks!

## <a name="final-thoughts"></a>Final thoughts

Phew, quite the essay - the survey was huge, and even a cursory analysis has
taken me far longer than I expected. I hope to have time to go into it further
and maybe start drawing some trends from all 3 years of survey data, but we'll
see. As always, the raw data alone is hugely helpful in shaping the direction
of the next year's work.

It definitely feels like the mood of the community currently trends towards bug
fixing and stability right now - and I heard this a lot in person during the
recent conferences. I also think it's fair to expect that the UI will come in
for some scrutiny too, as we have dedicated UX people involved now. Taken
together, I hope the next year brings a long of much-needed polish to
features that *work* but perhaps not always in the smoothest possible way.
Time will tell.

As always, **huge thanks** to the community for all that you do; for
contributing (in whatever way you do), for filling out the survey, for
assisting each other on the mailing lists/IRC; and so much more. This remains
the best community I know of, and I hope you'll stick with us until the next
community survey, at least :)

As usual, I'll leave you with a few of my favourite quotes from the free-text
questions:

* "Thanks for this great tool!" [General]
* "I wouldn't be able to do things efficiently without it." [Hammer]
* "Not enough time (OK, you won't solve that).  Otherwise the project/community
  seems very friendly/approachable!" [Contributing]

I freely admit cherry-picking these - but the other comments are just as
valuable! All the feedback will be noted down for future use.

Thanks once again to everyone who filled out the survey, and congratulations to
the prize winners!

<!-- link ids -->
[contact]: http://theforeman.org/support.html#Mailinglists "Mailing Lists"
[contribute]: http://theforeman.org/contribute.html "Contributing"
[handbook]: http://theforeman.org/handbook.html "Developer Handbook"
[issues]: http://projects.theforeman.org/projects/foreman/issues/new "Foreman - New Issue"
[email]: mailto:greg.sutcliffe@gmail.com
[45k nodes]: https://youtu.be/WwY_IawhRKc?list=PLLTIBSsvp9qRcL6yCQqmdMJSRSYNI9DbK
[katello]: https://theforeman.org/plugins/katello
[plugins]: https://theforeman.org/plugins
[discovery]: https://theforeman.org/plugins/foreman_discovery
[ansible]: https://theforeman.org/plugins/foreman_ansible
[rex]: https://theforeman.org/plugins/foreman_remote_execution
[hammer]: https://theforeman.org/manuals/1.14/index.html#3.5.6CLI
[apidoc]: https://theforeman.org/api/1.14/index.html
[pulp]: http://pulpproject.org
