---
layout: post
title: Foreman community survey results
date: '2015-02-23T13:57:00.000+02:00'
author: Daniel Lobato
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
modified_time: '2015-02-23T14:02:07.075+02:00'
blogger_id: tag:blogger.com,1999:blog-6789674575954398874.post-5796790676124730022
blogger_orig_url: http://blog.theforeman.org/2015/02/foreman-community-survey-results.html
---

February has been an intense month for the Foreman team. We gave a few
talks at
[**FOSDEM**](https://speakerdeck.com/elobato/foreman-from-git-init-to-official-plugin),
got in touch with the community at
[cfgmgmtcamp](https://speakerdeck.com/elobato/provision-and-manage-docker-containers-with-foreman-1),
and overall had a great time.

After all of these events - we will go over them in the February
newsletter - we are now ready to discuss what the results of the
community survey have been. First and foremost, **THANK YOU** to
everyone that replied. We are incredibly thrilled to hear how all of you
are using the tool.

<!--more-->

The reason why we launched the survey was essentially to understand what
features should we focus on and what are we missing. I think the results
will be instrumental to Foreman's development in the future. We had a
total of **118** responses.

Let's discuss some insights:

![How long using](/static/images/blog_images/2015-02-23-foreman-community-survey-results/how-long-using.png)

Half of our user base have been using Foreman for one year or less. It
surprised me so many people joined us during the last year, and expected
most users to have been using Foreman for longer. Hopefully we can keep
up launching new features so that we this ratio remains similar in
2016.

![What version used](/static/images/blog_images/2015-02-23-foreman-community-survey-results/what-version-used.png)

1.7.x was around for about one month and a half at the time the survey
was released. We support the two latest minor versions (1.7 and 1.6 in
this case) so 86% of the installations are officially supported. If you
are using 1.5 or older versions, please take into account your
installation security might be compromised and upgrade. Tell us on
\#theforeman or \#theforeman-dev (IRC channels on Freenode) if there is
any particular bug or feature in new releases that holds you back.

![Nodes managed](/static/images/blog_images/2015-02-23-foreman-community-survey-results/nodes-managed.png)

The vast majority of installations (86%) are under **1000 nodes**. We
love feedback from our biggest users as they have unusual performance
problems that lead to improvements for both small and large
installations. The needs of most users are covered by less than 1000
nodes, which Foreman can deal with very well. Larger installations (100k
nodes even!) are not unheard of, and JJ (John Jawed) from eBay/PayPal
[talked about his experiences with Foreman and Puppet at Puppetconf
2014](https://www.youtube.com/watch?v=qbSTQfbKp_g) managing a very large
deployment.

![Operatingsystems](/static/images/blog_images/2015-02-23-foreman-community-survey-results/operatingsystems.png)

I would have expected a larger proportion of Debian/Ubuntu users, we
devote some time to its packaging and testing. I think this graph does
show an over representation of users of Red Hat based servers, partly
because the survey was initially sent to a series of employees at Red
Hat.

![Number of Users](/static/images/blog_images/2015-02-23-foreman-community-survey-results/number-users.png)

This question helps us to prioritize features. For instance, RBAC is a
important concern for installations with more than 10 users, however
they make up 20% of all installations.

![Hammer vs API](/static/images/blog_images/2015-02-23-foreman-community-survey-results/hammer-vs-api.png)

More or less expected, although usage of Hammer is a bit low (&lt; 50%).
Our guess is that we might not publicize as much as it deserves. If you
have been looking for a good Foreman CLI, you can find instructions
about how to install it [in the Github
repository](https://github.com/theforeman/hammer-cli-foreman) . It also
supports Katello through
[hammer-cli-katello](https://github.com/theforeman/hammer-cli-katello)
and has a pluggable interface so extensions can be easily written for
any plugin.
API v1 is still used by 12% of the respondents, we would like to remind
you v1 is deprecated and urge you to update your scripts to use v2 which
is considered stable now. If there is any feature you are missing,
please tell us in the [mailing
list](https://groups.google.com/forum/#!forum/foreman-users) or
\#theforeman-dev on IRC.

![Taxonomies](/static/images/blog_images/2015-02-23-foreman-community-survey-results/taxonomies.png)

![Compute Resources](/static/images/blog_images/2015-02-23-foreman-community-survey-results/compute-resources.png)

This graph was the most surprising of all. I would have expected
Openstack or EC2 to be number one, but they are not even in the top 3.
Perhaps the lack of support of advanced features, or volumes are
responsible in this case. Similarly, VMware support is not very good yet
most of our users with compute resources use it. GCE is completely
broken due to changes in the Foreman API, and we did not catch it.
Docker's case is particularly interesting as it surpasses Openstack in
usage, even though it is not useful to deploy clusters yet. We expect
usage can only increase.

![Meetups](/static/images/blog_images/2015-02-23-foreman-community-survey-results/meetups.png)

Most people were interested about a meet up in their area. It would be
interesting to know in particular which areas would have a large enough
group of users to organize an event. If you would be interested, please
send an email to the [foreman-users mailing
list](https://groups.google.com/forum/#!forum/foreman-users).

![Deployments](/static/images/blog_images/2015-02-23-foreman-community-survey-results/deployments.png)

The graphs seem to support that people are happy with their config
management tools. However the configuration of a whole infrastructure
remains an unsolved problem. Results for the multi host deployment
interest make us confident when exploring this area. Petr Chalupa
[explained at cfgmgmtcamp
'15](http://blog.pitr.ch/presentations/2015/cfgmgmtcamp/#1) some plans
that Foreman will follow in this area.

![Remote Execution](/static/images/blog_images/2015-02-23-foreman-community-survey-results/remote-execution.png)

By far the most requested feature. The question is unintentionally
vague, but what I had in mind when I wrote the question was mainly
scheduling of Puppet runs / Salt highstate, improving what we already
have, getting a console, and perhaps adding hooks to make Foreman a
gateway for the dbus API.

![Other Tools](/static/images/blog_images/2015-02-23-foreman-community-survey-results/other-tools.png)

This one graph is a bit skewed, as most users who already use Foreman
are already happy with their current configuration management solution.
However, we do realize one of the main drivers for new users would be to
stop being as Puppet focused as we are now and integrate better with
other solutions.

![Containers](/static/images/blog_images/2015-02-23-foreman-community-survey-results/containers.png)

Most users are not managing installations where containers are important
yet. However the industry has its eyes set on containers for the future,
so it's not a surprise people would like to have it in Foreman already
to fiddle with it.

![OpenSCAP](/static/images/blog_images/2015-02-23-foreman-community-survey-results/openscap.png)

OpenSCAP is a new feature in Foreman, and most users will be unfamiliar
with it. Governmental procedures for IT security are often more
standardized than at private companies, however we recommend migrating
your compliance rules to OpenSCAP to get better security compliance at
your data center and manage it through Foreman.

![Mobile App](/static/images/blog_images/2015-02-23-foreman-community-survey-results/mobile-app.png)

![Network Handling](/static/images/blog_images/2015-02-23-foreman-community-survey-results/network-handling.png)

Improved networking has continually been high on the list of requests
for future Foreman releases. We're happy to report that 1.8 will feature
a completely redesigned UI in the Network tab, allowing use of separate
provisioning networks, bonds, aliases and so on. We've also merged the
creation of "physical" devices on virtual machines into this UI,
removing the duplication of workflow on the VM tab. Please do give us
feedback on this new UI and see the list of things we still want to
implement at [ticket
\#2509](http://projects.theforeman.org/issues/2409)

![Parameters](/static/images/blog_images/2015-02-23-foreman-community-survey-results/parameters.png)

![Puppet classes](/static/images/blog_images/2015-02-23-foreman-community-survey-results/puppet-classes.png)

![JS UI](/static/images/blog_images/2015-02-23-foreman-community-survey-results/js-ui.png)

![UX](/static/images/blog_images/2015-02-23-foreman-community-survey-results/ux.png)

As expected, improvements to features we already have are very favoured
by the community. However we remain open to new, different contributions
that allow people from other communities to start using Foreman.

![Plugin Usage](/static/images/blog_images/2015-02-23-foreman-community-survey-results/plugin-usage.png)

Here is a distribution of the percentage of users that use each Foreman
plugin. We only asked for plugins in the [official list in the
wiki](http://projects.theforeman.org/projects/foreman/wiki/List_of_Plugins)
, so if you have created a plugin and you cannot find it there, please
add it. As expected very generic plugins such as discovery and
default\_hostgroup are very widely used, and more specific features like
Xen, Salt, are less used. The Salt plugin has already overtaken Chef,
and Foreman in the future should be able to easily assimilate more
configuration management tools such as Ansible, and remove the Puppet
dependencies if you just want to use it as an inventory.

![Requirements](/static/images/blog_images/2015-02-23-foreman-community-survey-results/requirements.png)

To finish, I would like to list some features you asked for in the
survey very frequently. We will take these seriously for future
releases, as 1.8 is almost out of the door:

-   Multi-factor authentication, required for government deployments.
-   Hyper-V as a compute resource - most likely this can be implemented
    as a plugin
-   Dashboard customization ([on the making at
    \#8106](https://github.com/theforeman/foreman/pull/2046))
-   Provisioning in VMware data store clusters.
-   Better documentation, especially for plugins and the CLI.
-   Up to date screencasts
-   Determining what Puppet classes are causing failed Puppet runs in
    the whole deployment, dashboard is not enough.
-   Ansible support and less dependency on Puppet
-   Support to deploy in Docker clusters and not just individual
    containers
-   IPv6 support.

Thanks again for responding to the survey, our community drives Foreman
success!
