---
layout: post
title: Foreman Community Newsletter - January 2016
author: Adam Ruzicka
tags:
- foreman
- katello
- newsletter
excerpt: |
  Foreman 1.10 and Katello 2.4 released. Read on for details of new plugin releases, upcoming events, and new recordings to watch!
---

### Foreman 1.10 is out
Foreman 1.10 was released on 23rd of December 2015 making it an early Christmas present. The headline features include [orchestration rebuilder](https://www.youtube.com/watch?v=MxPtzWhiE1o) for rebuilding hosts' DHCP, DNS and TFTP records, [global statuses](https://www.youtube.com/watch?v=2FNLwf5Z47A) for hosts, host and host group cloning improvements, support for [unsetting attributes](https://www.youtube.com/watch?v=eXRiCYjmXBk), enhanced DNS plugin support and [parameter improvements](https://www.youtube.com/watch?v=hXl70osESlQ). Full release notes can be found [here](http://theforeman.org/manuals/1.10/index.html#Releasenotesfor1.10).

### Katello 2.4 is out
Katello 2.4 which brings a number of improvements was released on 5th of January 2016, shortly after Foreman's 1.10 release. This release provides compatibility with Foreman 1.10, migrates most objects from Elasticsearch to scoped_search and lots of improvements and bug fixes. Check out the [release notes](http://www.katello.org/docs/2.4/release_notes/release_notes.html) for a full list of updates.

Thanks to everyone who contributed to these releases - code, testing, bug reports, translations, your efforts are very much appreciated!

### New and updated plugins since last December's newsletter
  - [foreman-tasks](https://github.com/theforeman/foreman-tasks) updated to 0.7.10 on 7th of January 2016
  - [foreman_setup](https://github.com/theforeman/foreman_setup) updated to 3.1.0 on 6th of January 2016
  - [foreman_templates](https://github.com/theforeman/foreman_templates) updated to 2.0.3 on 6th of January 2016
  - [smart_proxy_remote_execution_ssh](https://github.com/theforeman/smart_proxy_remote_execution_ssh) updated to 0.0.10 on 22nd of December 2015
  - [foreman-docker](https://github.com/theforeman/foreman-docker) updated to 2.0.0 on 18th of December 2015
  - [foreman-one](https://github.com/theforeman/foreman-one) updated to 0.4 on 18th of December 2015
  - [smart_proxy_chef](https://github.com/theforeman/smart_proxy_chef) updated to 0.1.6 on 18th of December 2015
  - [chef-handler-foreman](https://github.com/theforeman/chef-handler-foreman) updated to 0.1.1 on 18th of December 2015
  - [foreman_remote_execution](https://github.com/theforeman/foreman_remote_execution) updated to 0.1.2 on 17th of December 2015
  - [hammer-cli](https://github.com/theforeman/hammer-cli) updated to 0.5.1 on 15th of December
    - [hammer-cli-foreman](https://github.com/theforeman/hammer-cli-foreman) updated to 0.5.1 on 14th of December
    - [hammer_cli_foreman_remote_execution](https://github.com/theforeman/hammer_cli_foreman_remote_execution) updated to 0.0.2 on 17th of December 2015

### New media and blogs

- The latest [community demo](https://www.youtube.com/watch?v=gvOFbmZO1yM&list=PLLTIBSsvp9qQwNxhQVtaqNNkMkvsHldGA) took place on December 10th. Highlights:
  - [Bare metal image-based provisioning (lzap)](https://youtu.be/gvOFbmZO1yM?t=0)
  - [Remote execution: CLI (stbenjam)](https://youtu.be/gvOFbmZO1yM?t=575)
  - [Remote execution: Recurrence (aruzicka)](https://youtu.be/gvOFbmZO1yM?t=840)
  - [Remote execution: Effective user (inecas)](https://youtu.be/gvOFbmZO1yM?t=1220)
  - [Parameter UI improvements (tbrisker)](https://youtu.be/gvOFbmZO1yM?t=1675)
  - [Hammer: Setting parameters for Taxonomies (tstrachota)](https://youtu.be/gvOFbmZO1yM?t=2062)
  - [Hammer: Setting CLI defaults (aglodboi)](https://youtu.be/gvOFbmZO1yM?t=2256)
  - [Community updates (gwmngilfen)](https://youtu.be/gvOFbmZO1yM?t=2785)

- We held a deep dive about [Taxonomies](https://www.youtube.com/watch?v=D4cON77hmnI) with Daniel Lobato Garcia, covering used Models, how they interact with Roles and Filters and how they interact with other plugins. Thanks Daniel!

### Upcoming events
- There is another [Deep Dive](https://www.youtube.com/watch?v=0BSnlUkCC7I) planned for Tuesday January 19th, where Dmitri Dolguikh will be talking about the Smart Proxy, aiming to provide an overview of proxy plugins and plugin providers, validators, events and event reporting.
- [FOSDEM](https://fosdem.org/2016/) takes place on 30th and 31st of January, where in the Virt/IAAS devroom, Oved Ourfali will be doing a talk on "Bringing Host Lifecycle and Content Management into oVirt". In this talk Oved will give an overview of oVirt, Foreman, and Katello , and show how we use the latter two in oVirt to give a Powerful Virtualizaed Data-Center Management system. More details are available in [talk details](https://fosdem.org/2016/schedule/event/virt_iaas_host_lifecycle_content_management_in_ovirt/)

- [Config Management Camp](http://cfgmgmtcamp.eu/) takes place on 1st and 2nd of February and Foreman will have dedicated track there. List of Foreman related talks from all tracks includes:
  - Case study: Dynamic management of heterogeneous test environments using Foreman by Shimon Stein 
  - Hosts' Lifecycle with Ansbile and Foreman by Daniel Lobato
  - Community Update by Greg Sutcliffe
  - Intro to parameters in Foreman by Tomer Brisker
  - Demystifying the Foreman by Julien Pivotto
  - Foreman and remote execution by Marek Hulan
  - Security and Compliance reports in foreman by Shlomi Zadok
  - PXEless discovery by Stephen Benjamin
  - There's a plugin for that by Greg Sutcliffe
  - Extending operating systems support of Foreman by Michael Moll
  - Foreman and PowerDNS by Ewoud Kohl van Wijngaarden
  - Infrastructure as code, foreman_provision by Nils Domrose
  - SaltStack integration with Foreman by Stephen Benjamin

- We will be holding the [annual Foreman dinner](https://groups.google.com/forum/#!topic/foreman-users/62yYbdDlojU) on January 30th in Brussels. Please sign up via [G+](https://plus.google.com/events/co1nia0c7g6hk9b4msf98517s1o) or by mail to [Greg](mailto:greg.sutcliffe@gmail.com) if you wish to join us, so that we know how many seats to reserve at the restaurant.
- We will also have a [Foreman construction day](https://groups.google.com/forum/#!topic/foreman-users/Vx_2Z_QC9j8) in Ghent right after Config Management Camp, on February 3rd. Please sign up via [Eventbrite](https://www.eventbrite.com/e/foreman-construction-day-registration-19911909056) if you intend to attend.

- For more details see this [post](http://theforeman.org/2016/01/upcoming-conferences-and-events-in-the-foreman-community.html)
