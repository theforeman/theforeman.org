---
layout: post
title: Foreman Community Newsletter - December 2015
author: Tomer Brisker
tags:
- foreman
- katello
- newsletter
- openscap
- ansible
- xen
- remote execution
- high availability
- windows imaging
excerpt: |
  Foreman 1.10 and Katello 2.4 coming soon, Developer Handbook published, High Availability and Windows Imaging deep dives
---

### Foreman 1.10 RC3 is out, 1.10 expected soon

Several regressions that were discovered in the release candidates have delayed the final release of 1.10.
In an attempt to deliver a stable version, we have decided to postpone the release until those issues are resolved.
If all goes well, the final 1.10 version should be released within a few days.
Thank you to all involved in testing and fixing the RCs, this helps us maintain a high standard for our releases!

### Katello 2.4 RC3 is out, 2.4 expected soon

Katello 2.4 is planned to be released in alignment with Foreman 1.10.
This release will primarily provide compatibility with Foreman 1.10, convert most objects from Elasticsearch to scoped search and fix a number of bugs.
Check out the [release notes](http://www.katello.org/docs/2.4/release_notes/release_notes.html) for a full list of updates.
Please help us with testing this RC so the final release will be as solid as possible!

### New and updated plugins this month

-   [foreman\_openscap](https://github.com/theforeman/foreman_openscap) and
    [smart\_proxy\_openscap](https://github.com/theforeman/smart_proxy_openscap)
    0.5.0 was released Novemeber 1st. Please note, this version is only compatible with Foreman 1.11 (current develop branch).
-   [foreman\_remote\_execution](https://github.com/theforeman/foreman_remote_execution)
    0.1.1 was released November 12th.
-   [foreman-xen](https://github.com/theforeman/foreman-xen)
    0.2.3 (for Foreman >= 1.10) and 0.1.7 (for older versions) were released Novemeber 17th.
-   [foreman-tasks](https://github.com/theforeman/foreman-tasks)
    0.7.7 was released December 1st.
-   [foreman\_templates](https://github.com/theforeman/foreman_templates) 2.0.1 was released December 2nd, which includes an important bug fix for template prefixes.
-   The [foreman_ansible](https://github.com/dLobatog/foreman_ansible) plugin is nearing its 1.0 release. It now supports (amongst other things) importing nested facts, measures playbook runtime and allows callbacks to use SSL, amongst other features.

### Other Updates

-   An initial [Developer Handbook](http://theforeman.org/handbook.html) has been created to ease the entry of new contributers and help maintain high standards of existing ones.
    Feel free to fork and open a pull request if you feel some important information is missing!
-   A [discussion](https://groups.google.com/forum/#!topic/foreman-dev/jiOx3_WeGmg) has taken place over the developer mailing list on increasing code review, which has been summarized up into a [blog post](http://theforeman.org/2015/11/tackling_review_culture.html) by Greg Sutcliffe.
-   A new [feature](https://groups.google.com/forum/#!topic/foreman-users/3RYfo0S5c8M) is planned to provide more information about smart proxies in Foreman, we would be happy to hear your input on this matter.
-   The Foreman installer has been updated to drop puppet 2.7 support starting with the next version of Foreman (1.11).
    For more information please read the [announcement](https://groups.google.com/forum/#!topic/foreman-users/YQNfxUzG_As).
-   The development infrastructure has seen some updates - Redmine has been updated to version 2.6.9 and Jenkins has been updated to version 1.625.2.

### New media and blogs

-   The latest [community demo](https://www.youtube.com/watch?v=RCqwTtIXRSw) took place on November 19th. Highlights:
    - yum repo export/import (beav) - https://www.youtu.be/RCqwTtIXRSw
    - remote execution iteration 4 (stbenjam) - https://www.youtu.be/RCqwTtIXRSw?t=502
    - foreman_ansible updates (dlobatog) - https://www.youtu.be/RCqwTtIXRSw?t=743
    - scoped search for content hosts/subscriptions (jomitsch) - https://www.youtu.be/RCqwTtIXRSw?t=1501
    - Rails 4 migration (the_doctor) - https://www.youtu.be/RCqwTtIXRSw?t=1689
    - compliance reports for foreman_openscap (oprazak) - https://www.youtu.be/RCqwTtIXRSw?t=2201
    - community announcements (gwmngilfen) - https://www.youtu.be/RCqwTtIXRSw?t=2359
-   We held a deep dive about [Windows Imaging](https://www.youtube.com/watch?v=_R8-0KAkoPc) with Daniel Helgenberger. Thanks Daniel!
-   We continuted our user case study series with Chris "discr33t" Pisano talking about his [High Availability](https://www.youtube.com/watch?v=bJ5a67SSA-s) setup with Foreman. He has also summarized his proccess in a [blog post](http://theforeman.org/2015/12/journey_to_high_availability.html). Thanks Chris!
-   Lukas Zapletal (lzap) gave a talk about Foreman at the Pilsen University. Read his report [here](https://groups.google.com/forum/#!topic/foreman-dev/l3-4a6pQTZU). Thanks Lukas!
-   Daniel Lobato Garcia (dlobatog) gave a talk about [Rails security](https://speakerdeck.com/elobato/20-actionable-tips-to-secure-your-rails-application-rails-israel-15) at the Rails Israel conference. He also joined the Israeli Foreman team members to show off the project at the Red Hat booth.

### Upcoming events

-   This Thursday (December 10th) is community demo time again.
    Check out the [Latest Demo Information](http://projects.theforeman.org/projects/foreman/wiki/Current_Sprint_Information) page for agenda and viewing links.
-   Another Deep Dive will take place on Monday December 14th, where Daniel Lobato will be talking about [Taxonomies](https://groups.google.com/forum/#!topic/foreman-users/Vk-4gukujgk/discussion).
-   The CFP for [FOSDEM](https://fosdem.org/) and [Config Management Camp](http://cfgmgmtcamp.eu/) has closed.
    We are awaiting the agenda to be announced, hopefully with many Foreman related talks.
    Looking forward to seeing you all in Belgium on January 30 - February 2, 2016.
-   We will be holding the [annual Foreman dinner](https://groups.google.com/forum/#!topic/foreman-users/62yYbdDlojU) on January 30th in Brussles. Please sign up via [G+](https://plus.google.com/events/co1nia0c7g6hk9b4msf98517s1o) or by mail to Greg if you wish to join us, so that we know how many seats to reserve at the restaurant.
-   We will also have a [Foreman construction day](https://groups.google.com/forum/#!topic/foreman-users/Vx_2Z_QC9j8) in Ghent right after Config Management Camp, on February 3rd. Please sign up via [Eventbrite](https://www.eventbrite.com/e/foreman-construction-day-registration-19911909056) if you intend to attend.
