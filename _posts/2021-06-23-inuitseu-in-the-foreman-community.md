---
layout: post
title: inuits.eu in the Foreman community
date: 2021-06-23  8:34:24
author: Kris Buytaert
tags:
- foreman
---

While Foreman is free and open source, and the Foreman community does everything it can to [support](https://theforeman.org/support.html) users, sometimes users cannot get to where they want to be without professional help. Foreman is a complex tool. To get started, you require a certain level of Linux sysadmin knowledge. On our [Professional Services](https://theforeman.org/professional-services.html) page, we keep a list of known vendors and consultants who work with Foreman. In this post, we hear from Kris Buytaert of [inuits.eu](inuits.eu), the organizer of ConfigMgmtCamp, one of the biggest events in the Foreman social calendar each (normal) year, and their history with the Foreman community.
<!--more-->

**Tell us about [inuits.eu](inuits.eu)**

Inuits is an Open Source consultancy with over 100 consultants spread all over Europe, headquartered in Belgium. We help organisations to leverage open source to run their business.

**How did [inuits.eu](inuits.eu) become involved in the Foreman**

We were early Puppet adopters and were playing with different tools in the ecosystem. Foreman was one of those tools that gave us a lot of power,
Not sure if it was the first time we encountered Foreman, but after FOSDEM 2013, we hosted a #monitoringlove hackathon at our office.
Since then, we've contributed some patches to both the Foreman and Puppet code base around it. We've also hosted meetups and anniversary parties.
As the organiser of ConfigMgmtCamp, obviously Foreman was one of the communities I wanted to give a place to meet and hack on things, so the initial smallish hackathon at our office now got replaced by a much bigger community event.

**What kind of Foreman-related professional services do you offer?**

A Foreman instance is typically integrated in every Puppet setup we do for a customer. We are mostly helping out customers to set up their infrastructure this way and assist them with deploying the right toolset. In a lot of setups that means a combination of Puppet for desired state, Pulp to have full control over the packages one deploys and Foreman as a really nice combination to have good control over your infrastructure.

**Can you give some examples of problems inuits.eu helped solve for their clients using Foreman?**

The biggest problem most organisations tend to face is in not having an overview of what is running. Foreman gives you a nice window into your infrastructure, what nodes you have, and what environments they are mapped to.

You also get to see what changes were recently made too those nodes, both successful and failing changes and that is a tremendous help for people that are trying to debug problems. The fact that one can trivially point to Foreman and see these are the changes to that host during this period will help to determine root causes of a problem much quicker.

**What do you think Foreman could do better? What problems do you see customers facing that Foreman could but isn't currently solving?**

At some point, there was a discussion about adding parameters or triggering provisioning from the web UI versus having it all defined in code and stored in Git.
We never used those Foreman features because we would lose the history in git (and the relations/references to tasks) of when someone triggered provisioning or when someone modified a parameter. For us, git in combination with a pipeline that includes testing is the ultimate single source of truth. Our approach, however, is not one that works for the average end user. Maybe this already exists, but some form of mirroring changes in the UI to version control that we have code that is 100% reproducible from infrastructure.

_If you are a professional working with Foreman, see our [Professional Services](https://theforeman.org/professional-services.html) page for information about how to be listed on [theforeman.org](theforeman.org)_.
