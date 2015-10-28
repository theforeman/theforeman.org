---
layout: post
title: Foreman Community Newsletter - January 2014
date: '2014-01-28T22:15:00.003+02:00'
author: Dominic Cleal
tags:
- katello
- events
- community
- newsletter
modified_time: '2014-01-28T23:56:22.600+02:00'
blogger_id: tag:blogger.com,1999:blog-6789674575954398874.post-4645622021234825583
blogger_orig_url: http://blog.theforeman.org/2014/01/foreman-community-newsletter-january.html
---

Welcome to a new year, already with lots of exciting developments.  
  
<!--more-->

### Foreman 1.4.0 about to be released

We're very close to announcing the general availability of Foreman
1.4.0, with contributions from over eighty individuals, and  
  
At the time of writing, 1.4.0-RC2 is available for download and is
stable, with just one or two known bugs to be fixed in 1.4.0 final.  The
final release should be available on Thursday 30th January.  
  
Key new features are compute profiles, image user-data (cloud-init)
support, web UI enhancements, Kerberos support, a new plugin
registration and extension framework, plus lots of new provider support
in the smart proxy.  
  
Lots more information is available in the [Foreman 1.4 release
notes](http://theforeman.org/manuals/1.4/index.html#Releasenotesfor1.4). 
Keep an eye on the website or the [foreman-announce
list](https://groups.google.com/forum/#!forum/foreman-announce) for the
final availability.  
  

### Upcoming events

This weekend and coming week, the largest ever group of Foreman users
and developers will congregate in Brussels, Belgium for the
[FOSDEM](https://fosdem.org/2014/) and
[CfgMgmtCamp](http://cfgmgmtcamp.eu/) events.  
  
Just before FOSDEM will be a [CentOS Dojo
event](http://wiki.centos.org/Events/Dojo/Brussels2014) in Brussels, at
which Julien Pivotto will give a talk on Lifecycle Management with
Foreman.  
  
Moving on to FOSDEM, there will be some Foreman-related talks:  

-   Config management: [Foreman integration with Chef and
    others](https://fosdem.org/2014/schedule/event/foreman_integration_chef/),
    Marek Hulán
-   Virtualisation and IaaS: [Foreman
    Project](https://fosdem.org/2014/schedule/event/virtiaas09/), Ohad
    Levy
-   Testing and automation: [Automation in the Foreman
    infrastructure](https://fosdem.org/2014/schedule/event/automating_foreman_instructure/),
    Greg Sutcliffe

On Sunday evening, if you're still in the Brussels area, please join us
for a meal.  Reply to [the Google+
event](https://plus.google.com/u/0/events/chakerf46aqaeffi7kh7llm0jvg)
for numbers.  

At CfgMgmtCamp, we'll hold a dedicated Foreman track with a variety of
talks.  The [complete schedule](http://cfgmgmtcamp.eu/Foreman.html) has
fifteen talks on a variety of Foreman-related subjects, including:  

-   [Deploying Foreman in enterprise
    environments](http://cfgmgmtcamp.eu/foreman/deploying_foreman_in_enterprise_environments.html),
    Nils Domrose
-   [Realtime remote management with MCollective and
    Foreman](http://cfgmgmtcamp.eu/foreman/real-time_remote_management_with_mcollective_and_foreman.html),
    Sam Kottler
-   [Hammer - a CLI tool for
    Foreman](http://cfgmgmtcamp.eu/foreman/hammer_-_cli_tool_for_foreman.html),
    Tomas Strachota
-   [Managing Foreman with
    Foreman](http://cfgmgmtcamp.eu/foreman/managing_foreman_with_foreman.html),
    Ewoud Kohl van Wijngaarden

Lastly, at [AsiaBSDCon 2014](http://2014.asiabsdcon.org/) in early
march, Martin Matuška will give a talk on Foreman and FreeBSD
provisioning.  
  

### Katello installer: alpha testing

The team behind Katello is making good progress in adapting it to be a
Foreman plugin, with a new combined installer.  
  
If you're interested in trying it out in the early stages and report
bugs, [read Eric's
e-mail](https://groups.google.com/d/msg/foreman-dev/nq4plJ09Yl4/UepvvXOWuwYJ)
to foreman-dev for more details.  
  

### Further watching

The last development sprint was completed at the beginning of December,
and the sprint demo shows lots of features that are either available in
nightly or upcoming work.  
  
This includes user data support, an update on the permissions system
changes, compute profiles, dynamic API bindings and Puppet future parser
support.  

-   [Foreman Sprint Demo 18](http://www.youtube.com/watch?v=L_WwMk612wI)

The team regularly holds "deep dive" sessions to explore a new feature
or topic.  Join the [Foreman Google+
community](https://plus.google.com/u/0/communities/106976851375995577697)
to keep up with these events. Here are the recent recordings:  

-   [Organization and location
    inheritance](http://www.youtube.com/watch?v=_9DEKT5Irmc): Joseph
    shows a change to allow a parent/child organization/location concept
-   [Dynflow tools and
    concepts (1/2)](http://www.youtube.com/watch?v=5dprXA7gbSI),
    [Dynflow
    executors (2/2)](http://www.youtube.com/watch?v=drBY8Z1CcKs): Petr's
    two part deep dive on Dynflow for task orchestration
