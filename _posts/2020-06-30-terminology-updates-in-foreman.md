---
layout: post
title: Terminology Updates in Foreman
date: 2020-06-30 13:08:45
author: Tomer Brisker, Melanie Corr, Ori Rabin
tags:
- foreman
---

Over a week ago, [@lzap](https://community.theforeman.org/u/lzap/summary) published an [RFC](https://community.theforeman.org/t/rfc-replacing-blacklist-with-blocklist-in-our-templates/19276) about removing the term blacklist from Foreman templates. A short discussion about this took place on the related [Pull Request](https://github.com/theforeman/community-templates/pull/746). With a wider discussion taking place in the tech, open source, and academic worlds (please see **Further Information** at the bottom of this post for some links), the community management team wants to take a moment to outline our thoughts on this in the context of the Foreman community. While normally RFCs and PRs go through a longer process, we think it is important to address this specific RFC and outline some action items.

<!--more-->


### This is not about about modifying any community guidelines

Over the years that we have worked within the community, discussed topics on Discourse, and collaborated within GitHub and Redmine, we have admired the community members for their openness and commitment to the technical aspects of the project. We have seen the open and welcoming spirit to new community members. We have observed great displays of patience and respect. We have also observed a passionate commitment to model behaviour without the need for strict rules or guidelines to be drawn up or any need for enforcement. To observe the Foreman community in action is to observe a disciplined and principled set of engineers within the open source space.

### Doing nothing says as much as doing something

There has always been a strong desire within the community to remain focused on technology and to avoid the politics of the outer world. For the most part, this has been possible. A deep dive within the Foreman archives is a testament to the daily focus on specific technical problems and how to resolve them for our users. However,  when certain terminology that seems harmless is highlighted as exclusionary, bigoted, and a vestige of societal legacies that are oppressive, as much as we would like to remain neutral on politics, inaction on language like this can imply an attitude or stance that is not a reflection of our community members and is not in line with our community guidelines.

While the behaviour of the Foreman community members is exemplary and the community is an overwhelmingly positive place, we can never rest in the assumption that words do not injure our community members. While we come together to focus on the code and the user experience, we might never know the realities and obstacles individual community members have had to overcome. We can never know how a gesture like this will impact an individual among us. We also have no way of knowing what reasons people have for deciding not to take part in our community - as they aren't around to ask.

### Technical impact to changing terminology

Making these changes does not have a large technical impact on Foreman in most cases. 

With regards to the original pull request opened by @lzap, to try and maintain consistency, we are monitoring the Linux Kernel Mailing List to see if they update their terminology so that we can remain consistent. If there are changes made to the Linux Kernel, we will still need to support both kernel parameters for a while because there will be systems with old kernels. If they do decide to change the naming, we can also change it in our code and user interfaces and handle the backwards compatibility internally.

In general, we believe the best approach when dealing with terminology coming from external resources that Foreman interacts with, such as the case of the kernel parameters, is to remain consistent with the external resource's naming in order to avoid confusion.

Apart from that, [@Marek_Hulan](https://community.theforeman.org/u/marek_hulan/summary) has found some cases in the [virt-who configure plugin's API](https://github.com/theforeman/foreman_virt_who_configure/blob/master/app/controllers/foreman_virt_who_configure/api/v2/configs_controller.rb#L44-L45). Since this API is internal to Foreman, we can consider deprecating it and eventually replacing it with a newer version that uses more neutral terminology.

A similar approach can be taken for any other internal usages of such terms - gradually replacing them, while reducing confusion and avoiding breaking users' workflows.

[@lzap](https://community.theforeman.org/u/lzap/summary) has outlined on the [RFC](https://community.theforeman.org/t/rfc-replacing-blacklist-with-blocklist-in-our-templates/19276/6) various locations where he has found the terminology. We encourage the community to join the discussion about how to proceed.

Thank you for understanding.

Melanie, Ori, & Tomer


### Further Information

#### Some examples from other projects:

* [Rails](https://github.com/rails/rails/pull/33681)
* [Rubocop](https://github.com/rubocop-hq/rubocop-rails/pull/265)
* [Mozilla](http://mckay.pub/2015-01-07-allowed/)

#### Some further reading:

* [https://blog.carbonfive.com/problematic-terminology-in-open-source/](https://blog.carbonfive.com/problematic-terminology-in-open-source/)

* [https://www.dreamhost.com/blog/addressing-problematic-coding-terms-open-source-community/](https://www.dreamhost.com/blog/addressing-problematic-coding-terms-open-source-community/)

* [https://www.ncbi.nlm.nih.gov/pmc/articles/PMC6148600/](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC6148600/)

* [https://developer-tech.com/news/2020/jun/15/github-replace-slavery-terms-master-whitelist/](https://developer-tech.com/news/2020/jun/15/github-replace-slavery-terms-master-whitelist/)

* [https://chromium.googlesource.com/chromium/src/+/master/styleguide/inclusive_code.md#racially-neutral](https://chromium.googlesource.com/chromium/src/+/master/styleguide/inclusive_code.md#racially-neutral)

* [https://lkml.org/lkml/2020/6/9/392](https://lkml.org/lkml/2020/6/9/392)

* [https://meta.discourse.org/t/discussion-about-black-lists-etc/156341](https://lkml.org/lkml/2020/6/9/392)
