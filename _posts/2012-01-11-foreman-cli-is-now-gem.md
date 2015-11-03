---
layout: post
title: Foreman CLI is now a gem
date: '2012-01-11T09:23:00.000+02:00'
author: Ohad Levy
tags:
- foreman
- API
- cli
modified_time: '2012-01-11T09:26:27.471+02:00'
blogger_id: tag:blogger.com,1999:blog-6789674575954398874.post-4262998233202487687
blogger_orig_url: http://blog.theforeman.org/2012/01/foreman-cli-is-now-gem.html
---

[Brian Gupta](mailto:brian.gupta@brandorr.com) did a great job with
coming up with  a CLI for foreman, and just released it as a gem.

<!--more-->

To install, simply run:

<span style="text-align: -webkit-auto; white-space: pre-wrap;">gem
install foremancli</span>
<span
style="text-align: -webkit-auto; white-space: pre-wrap;">foremancli
-h</span>
    Usage: foremancli [options] ...
        -d, --debug                      Output more information
        -u, --user USER                  Foreman user
        -p, --pass PASSWORD              Foreman password
        -s, --server URL                 Foreman Server URL
            --json                       JSON output
            --yaml                       YAML output
            --status                     Foreman status
            --custom COLLECTION          Custom COLLECTION string, see: http://theforeman.org/projects/foreman/wiki/API
            --architectures [filter]     Retreive a list of architectures
            --common_parameters [filter] Retreive a list of common_parameters
            --config_templates [filter]  Retreive a list of config_templates
            --domains [filter]           Retreive a list of domains
            --environments [filter]      Retreive a list of environments
            --fact_values [filter]       Retreive a list of fact_values
            --hosts [filter]             Retreive a list of hosts
            --hostgroups [filter]        Retreive a list of hostgroups
            --media [filter]             Retreive a list of media
            --puppetclasses [filter]     Retreive a list of puppetclasses
            --reports [filter]           Retreive a list of reports
            --roles [filter]             Retreive a list of roles
            --settings [filter]          Retreive a list of settings
            --lookup_keys [filter]       Retreive a list of lookup_keys
            --dashboard [filter]         Retreive a list of dashboard
            --operatingsystems [filter]  Retreive a list of operatingsystems
            --subnets [filter]           Retreive a list of subnets
            --ptables [filter]           Retreive a list of ptables
            --users [filter]             Retreive a list of users
            --auth_source_ldaps          Retreive a list of auth_source_ldaps
            --hypervisors                Retreive a list of hypervisors
            --lookup_values              Retreive a list of lookup_values
            --smart_proxies              Retreive a list of smart_proxies
            --statistics                 Retreive a list of statistics
            --usergroups                 Retreive a list of usergroups
            --audits                     Not implemented
            --bookmarks                  Not implemented
        -h, --help                       Show this message

         ENVIRONMENT VARIABLES:

         FOREMAN_SERVER                  Foreman Server URL
         FOREMAN_USER                    Foreman user
         FOREMAN_PASSWORD                Foreman password

         CLI options take precendence over ENVIRONMENT VARIABLES

         FILTERS:

         Please see:
         http://theforeman.org/projects/foreman/wiki/Search_API

         Examples:
         --hosts "domain = domain.com AND class = squid"
         --hosts "domain = domain.com AND facts.architecture = x86_64 AND \
           class = module::class
         --classes "name = squid"
         --domains "name = domain.com"


happy hacking
