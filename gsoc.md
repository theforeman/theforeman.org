---
layout: contribute
title: Google Summer of Code
---
## Mentors

Please see [GSoC mentoring](http://en.flossmanuals.net/GSoCMentoring/) and [Federico's GSoC howto](https://people.gnome.org/~federico/docs/summer-of-code-mentoring-howto/) for information on mentoring.

## Project Suggestions

Please list project selections below. Send a pull request with the content of your proposal to [theforeman.org at Github](http://github.com/theforeman/theforeman.org). See [Dave Neary's post](http://www.outercurve.org/Blogs/EntryId/45/Making-the-most-of-Google-Summer-of-Code-Dave-Neary-guest-blogger) for
suggestions on how to propose ideas. They should be useful to the community, and achievable by a student in the time allotted.

## Projects

### Puppet Forge and Foreman

* *Status*: Not started
* *Summary of idea*: Integration of Puppet Forge into Foreman
* *Knowledge prerequisite*: Familiarity with Ruby, configuration management. Experience with infrastructure a plus
* *Skill level*: Medium
* *Contacts*:
* *Mentor(s)*: Daniel Lobato Garcia
* *Notes*: In a similar way to what Foreman is doing now to pick up provisioning templates from the community, I believe we could take advantage of the Puppet Forge to allow users to use modules from there. Importing these modules into a new model, and importing the puppet classes into Foreman should be achievable by a motivated student with help from the community. This will allow Foreman users to configure their hosts without having to worry about keeping repositories for modules already in the Puppet Forge.

### Multi-host deployments in the Foreman

* *Status*: Not started
* *Summary of idea*: Multi-host deployments support in the Foreman
* *Knowledge prerequisite*: Familiarity with Ruby, configuration management. Experience with infrastructure a plus
* *Skill level*: Medium
* *Contacts*:
* *Mentor(s)*: Ivan Nečas
* *Notes*: The Foreman already knows how to take an unconfigured machine and turn it into something useful. In real life, however, often there is need to configure more hosts to do something useful. It seems like natural step to teach Foreman how to orchestrate multi-host applications. You have already hostgroups for web server, database server, load balancer? After this effort, Foreman will put all the pieces to together for you as well. And since Foreman is life-cycle management system, it should support also ongoing operations, such as rolling updates etc.

### Compute resource (virtualization) benchmarks

* *Status*: Not started
* *Summary of idea*: Benchmark compute resources, graph them and use this information in Foreman.
* *Knowledge prerequisite*: Familiarity with Ruby, configuration management. Experience with infrastructure a plus.
* *Skill level*: Medium
* *Contacts*:
* *Mentor(s)*: Daniel Lobato Garcia
* *Notes*: Compute resources could be expensive. Whether you are managing your own virtualization resources with Ovirt, or you're using EC2 in Amazon, currently Foreman does not offer you a way to check what are the utilization stats for this. We should offer a way for users to do this and graph this information. This information can be also used to scale up and down your instances, using some policies like keeping track of energy savings, morning-night usage, etc..
* *Internal Note: It would be useful to track compute resources usage per host group.

### Host health checks

* *Status*: Not started
* *Summary of idea*: Hosts list and single host view in Foreman need to show health checks and possibly alarms.
* *Knowledge prerequisite*: Familiarity with Ruby and monitoring/alarm systems.
* *Skill level*: Medium-high
* *Contacts*:
* *Mentor(s)*: Daniel Lobato Garcia
* *Notes*: We claim Foreman does monitoring, but in reality it's tracking very little information (Puppet reports and facts about the machine) compared to how it could be. It would be great if we could build upon Nagios, Ganglia and other monitoring systems to add a health checks layer to our hosts view. In addition to that we could add some alerting to notify users when something is wrong with their hosts.

### Foreman-as-a-service

* *Status*: Not started
* *Summary of idea*: Multi-tenancy hosted instance of Foreman in the cloud
* *Knowledge prerequisite*: Ruby on Rails
* *Skill level*: Medium
* *Contacts*:
* *Mentor(s)*: Joseph Magen, Ohad Levy
* *Notes*: We want to offer a way for new users to Foreman to have a low-barrier entry way to start playing with Foreman and spin up some VMs in several compute resources such as Rackspace, EC2 and Google Compute Engine. This would be a non-full featured version of Foreman to encourage users to install a full featured Foreman version.

### Foreman git interface

* *Status*: Not started
* *Summary of idea*: Control the Foreman via editing a git repository
* *Knowledge prerequisite*: Ruby on Rails, Git
* *Skill level*: Medium
* *Contacts*:
* *Mentor(s)*: Ivan Nečas
* *Notes*: Sysadmins don't like UIs that much. API/CLI is better but
   still, there is an ultimate tool every administrator loves: git.
   The idea is to have a tooling, that would turn the Foreman instance
   into a git repository of the managed infrastructure, allowing the
   user to edit that as any other config files, and reflecting the
   changes into the Foreman instance again via the API,once the
   changes are pushed.

   Effectively, you would have a git repository
   representing the whole infrastructure. Cloning a host would
   copying a file, changing a parameter would mean just editing it's
   representation. One could even manage the whole infrastructure with
   Puppet (and another over Foreman managing that Puppet master [joking] :)
