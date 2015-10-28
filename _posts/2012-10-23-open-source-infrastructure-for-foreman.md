---
layout: post
title: Open source infrastructure for the Foreman project.
date: '2012-10-23T14:35:00.000+02:00'
author: Sam Kottler
tags:
- puppet
- foreman
- community
modified_time: '2012-10-23T14:56:48.306+02:00'
blogger_id: tag:blogger.com,1999:blog-6789674575954398874.post-2158819999662401007
blogger_orig_url: http://blog.theforeman.org/2012/10/open-source-infrastructure-for-foreman.html
---

### Overview

We started working on a new project to create build and test pipelines
for releasing code and running tests, and small, but dense
infrastructure arose from working on that project. Instead of keeping
the Puppet code locked up, we decided specifically to make it public.
There are lots of benefits of doing this, but it made sense specifically
for us so others can help manage the infrastructure on an unfettered
basis. Lots of other benefits come with [public Puppet
code](http://github.com/theforeman/foreman-infra), too, like thinking
more acutely about storing private information in the repositories and
reducing the ability of manual changes to cause issues in the test
environment.  

<!--more-->

### The tools

Jenkins lives in the center of the infrastructure and is key to the
development process; ensuring our tests pass, building packages, and
validating our installer. We had been using [Travis
CI](http://www.travisci.org/), a great project that is changing the way
open source projects test their code. There were a few issues with
Travis; Foreman isn't a "standard" Rails application in that it requires
some gems with native extensions that were hard to get installed on
Travis. Additionally, the ability to run tests on different operating
systems is key, and Travis only supports Ubuntu right now. Lastly, it's
not possible to run builds without pushing to the repository, which
makes testing out new configurations a burden. We wanted to be able to
build more complex pipelines like building development packages after
tests pass. That's certainly possible on Travis, but Jenkins provides a
central place to build flexible jobs and provides facilities like build
slaves, which are great for building Debian packages and RPM's and
testing across different platforms and databases.  
  
Here's a complete rundown of the different tools we are using right
now:  
  
- Puppet & the Foreman (of course)  
- Jenkins  
- pbuilder  
- reprepo  
- mock  
- Redmine & friends (for theforeman.org)  
  

### The implementation

We currently have less than a dozen machines; several builders, a few
testing machines, Jenkins (only runs the interface, no builds), and a
server that runs [the website](http://www.theforeman.org/). The CI
infrastructure runs on a physical box with KVM & libvirt for
virtualization, provisioned via the Foreman. Servers are grouped via the
"hostgroup" feature in Foreman and given the appropriate classes via the
ENC. Despite the low number of instances, being able to dynamically
provision new builders in a few minutes is endlessly convenient.  
  

### What's left?

#### Sensitive data

There is still a lot of different pieces the need to be addressed as the
project grows. One of them is that we don't have an easy way to store
sensitive data in the public repository. One option to handle that is
GPG encyrption and then storage in the public repo using some variation
of [this
technique](http://www.craigdunn.org/2011/10/secret-variables-in-puppet-with-hiera-and-gpg/),
with Foreman as the provider of the parameters. Most of the files that
need to remain private, like the private key for accessing slaves, are
stored on the Jenkins master; we don't need to distribute them too
widely so manual placement works for now.  
  

#### Contribution

It's really easy to contribute to the infrastructure codebase right now;
fork the repo, make your changes, submit a pull request. What's not so
easy is getting those changes out onto the puppet master - this is still
a manual task that I run each time a change gets made. Ultimately the
deployment to the master will probably be handled via Capistrano and
Jenkins on a post-receive hook from the Github repository which will
completely alleviate this problem. Using Capistrano is also great
because it allows easy rollback should a deployment to the master go
sideways.  
  

### The takeaway

As far as I'm concerned we're just getting started! There is a lot more
work to do on both the infrastructure and automation sides. Now that
most of the initial work to get the project off the ground is  complete,
incremental changes will be in order to keep the dependencies of the
builders up to date and ensure things running smoothly. Spending the
time to think through the architecture and build a system that will work
as the community around Foreman grows has absolutely been a worthwhile
use of time.  
  
More posts to come soon about the work that the team has been doing on
automated package building and repository promotion - keep an eye out!
