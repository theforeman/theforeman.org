---
layout: post
title: In case you missed it - ForemanCon 2021
date: 2021-11-29
author: Melanie Corr
tags:
- foremancon
---

During ForemanCon 2021, we hosted a number of excellent talks that provided updates from all around the Foreman Community. All talks are available to re-watch on our [YouTube channel](https://www.youtube.com/channel/UCCo7AZ1oG6TbG0-dwjRqCmw). Let's take a look at the line up in case you missed something of interest!

Also, if you'd be particularly interested in a session or deep dive into any aspect of the Foreman project, let us know in the comments!
<!--more-->


## Foreman at the Rubin Observatory

We were absolutely thrilled to have Joshua Hoblitt from the Rubin observatory [https:lsst.org](https:lsst.org) talk to us about his work, the large "pets" he maintains, and how he uses Foreman to help manage his infrastructure. We would have happily talked to Josh for hours, and hope to have him back in the near future!  

<iframe width="560" height="315" src="https://www.youtube.com/embed/BhGRRo9ZIcU" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## Workflow updates

Foreman is a beast. Some call it a "Swiss army knife". While it can help you take control over so many aspects of your infrastructure, sometimes there are so many configuration options that it might feel overwhelming to use. Over the last year, a lot of time and energy has gone into trying to expose the right level of information you need, as well refining workflows so that you can take action as quick and effortlessly as possible. Many of the Foremancon talks focused on design and workflow improvements.

### Introducing the new Foreman host details page

While Amir and the UX team have come and demoed many components of the new host details page, this session takes a closer look over the journey, a live deep dive and some thoughts for the future of displaying host information in a meaningful way within the Foreman web UI. Watch Amir talk about modernizing of the Foreman UI.  

<iframe width="560" height="315" src="https://www.youtube.com/embed/UNYiXHv2Sco" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>


### The new Content View web UI

Content Views facilitate complex content management solutions in Foreman. There are many moving parts. Over the last year, the Katello team have worked diligently to upgrade the Content View web UI and improve the overall user experience. Watch Samir, Maria, and Andrew discuss their efforts. If you have any feedback on the work, please drop a comment!


<iframe width="560" height="315" src="https://www.youtube.com/embed/2JmGJ81QHxs" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>


### SUSE Customer Center (SCC) plugin enhancements

There is a lot of work underway to improve the SCC plugin workflows to move from a simple tree list for selection to a more user-friendly experience to allow for the easy import of SUSE products into Katello.

<iframe width="560" height="315" src="https://www.youtube.com/embed/6EUqOkYcCOg" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

In this video, Nadja takes us through the evolution of the plugin and shows us what we have to look forward to.

### Oracle ULN and Debian workflows in Foreman

You can create and sync create and sync Oracle Unbreakable Linux Network (ULN) repositories using Katello. Debian content management is also quite popular with Katello.

In this session, we look at both Oracle ULN and Debian content management, with a focus on UI enhancements for the Debian workflows. Watch Manisha guide you through these content management options for Katello.

<iframe width="560" height="315" src="https://www.youtube.com/embed/-dka_xsz6Us" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## Use cases and support updates

### Next-level service automation: ForemanACD

Modern applications are composed of different services that are operated on separate servers and are connected to each other. Bernhard introduces the foreman_acd plugin, which allows the orchestration of entirely interconnected applications. There have been updates over the last months that include the ability to reference Foreman parameters, add existing hosts to an application instance, and the improved application instance deployment progress report that Bernhard talks us through also.

<iframe width="560" height="315" src="https://www.youtube.com/embed/ojuo1hGI_Io" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

### Katello's Debian Support update

We often have users in our community ask for updates on the state of Debian support in Katello. Luckily, we've had regular updates from our project contributors from [ATIX AG](https://atix.de/en/). In this session, you can find out the latest news: the good, the bad, and the ugly ;-).

<iframe width="560" height="315" src="https://www.youtube.com/embed/jBF_-nL0Bkk" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

Markus takes the time to deliver everything you need to know about what's going on with Debian in Katello.

### OpenSCAP scanning with Foreman

Ondrej gives a brief update about the improvements to OpenSCAP integration with Foreman. The new feature supports scanning based on OVAL definitions, and about what will be available in an upcoming Foreman release.

<iframe width="560" height="315" src="https://www.youtube.com/embed/AAeN3DJ6mZo" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

### Using Salt for Configuration Management

Salt is a configuration management tool similar to Ansible and Puppet. The Foreman Salt plugin enables the management, monitoring, and configuration of Salt with Foreman. In this session, we will have a look at the present functionalities of the plugin, how it can be used to manage Salt, and latest features which are currently in development. The Salt plugin has some particularly nice and useful features, for example, it provides the ability to view results of a particular Salt state being executed.

<iframe width="560" height="315" src="https://www.youtube.com/embed/qFa0uGq1X7U" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>


## Foreman Developer talks

### Extending the new host details page from plugins

Amir hosted a second session for anyone interested in extending the new host details page to incorporate data from Foreman plugins. Amir guides us through the extension points, slot & fill, the card template, API middleware, and more in a live coding session. Basic knowledge of react is recommended.

<iframe width="560" height="315" src="https://www.youtube.com/embed/XlqpvEG4HwQ" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

### Katello's generic content type framework

Over the last few months, Ryan has regularly demoed incremental enhancements to Katello's generic content type framework. This framework allows developers to add content types to Foreman/Katello simply by listing key information in the content type’s registration file. Ryan uses the example of adding Python content to Katello, but in recent demos, we've started to see Ansible and OSTree content being pulled into Foreman/Katello using this generic content type framework. In this talk, Ryan explains to developers which information is needed in the registration file, using the Python content type as an example. He shows the implementation or UI for some content, but mainly focuses on using the registration file.

<iframe width="560" height="315" src="https://www.youtube.com/embed/AIXlgH2Z5JI" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

### Katello Applicability Deep Dive

Ian's talk focuses on the code, design diagrams, and performance improvements that can be found in  the new Katello applicability system. He demonstrates how the new applicability request queue works and the Dynflow tasks that consume its resources.

<iframe width="560" height="315" src="https://www.youtube.com/embed/77hpl5_6c_I" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

### Testing Foreman plugins in a container

Shimon talks us through his motivations for testing Foreman plugins in a container, with a short discussion afterwards.

<iframe width="560" height="315" src="https://www.youtube.com/embed/smD3-hBcEPI" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## Thank you!

A big thank you to everyone who gave a talk, joined us live, and asked questions during a packed two days.
If you've any thoughts or comments about any of the sessions, please leave a comment for us here!
