---
layout: post
title: Hammer - CLI for Foreman (Part I - Setup)
date: '2013-11-19T14:18:00.000+02:00'
author: Martin Bačovský
tags:
- installation
- foreman
- configuration
- hammer
- cli
modified_time: '2013-11-19T14:18:03.059+02:00'
blogger_id: tag:blogger.com,1999:blog-6789674575954398874.post-4517522316589167569
blogger_orig_url: http://blog.theforeman.org/2013/11/hammer-cli-for-foreman-part-i-setup.html
---

  

Since version 1.3 the Foreman is shipped with new command line interface
- \[Hammer\]. The goal is to provide full featured alternative to web
user interface. In the first post of Hammer series we will focus on
installation and configuration.  

<!--more-->
  
Hammer can be installed from the same rpm or deb
[repository](http://theforeman.org/manuals/1.3/index.html#3.3InstallFromPackages)
as the Foreman server. As an alternative it can be installed from
[rubygems.org](https://github.com/theforeman/hammer-cli#installation-from-gems)
or from
[sources](http://theforeman.org/manuals/1.3/index.html#CLI%28Hammer%29).
For this post we will assume that you want to access your Foreman from
Fedora 19. For the alternatives please check the [hammer
docs](https://github.com/theforeman/hammer-cli#installation).  
  
To install Hammer  

    # configure yum repo
    yum localinstall \
        'http://yum.theforeman.org/releases/latest/f19/x86_64/foreman-release.rpm'

    # install the hammer package
    yum install rubygem-hammer_cli_foreman

  
Now we can take a look at configuration. For a start, copy:  

    :modules:
        - hammer_cli_foreman

    :foreman:
        :host: 'https://foreman.my.net/'
        :username: 'admin'
        :password: 'changeme'

    :log_dir: '~/.foreman/log'
    :log_level: 'error'

  
to the file ~/.foreman/cli-config.yml  
  
This configuration turns on the module with Foreman commands, sets the
server URL and your credentials and some basic logging. For more options
check again the
[manual](http://theforeman.org/manuals/1.3/index.html#3.5.6CLI) or
[hammer
docs](https://github.com/theforeman/hammer-cli#format-and-locations). It
is also good to know that the configuration is looked up on the
following locations and is loaded in this order:  

1.  /etc/foreman/cli\_config.yml
2.  ~/.foreman/cli\_config.yml
3.  ./config/cli\_config.yml              \#config dir in CWD
4.  custom location specified on command line - -c CONF\_FILE\_PATH

Later files have precedence if they redefines the same option.  
  
And we are done. Now you can test that it works:  

    $ hammer -h

    Usage:
        hammer [OPTIONS] SUBCOMMAND [ARG] ...
    Parameters:
        SUBCOMMAND                    subcommand
        [ARG] ...                     subcommand arguments

    Subcommands:
        shell                         Interactive Shell
        architecture                  Manipulate Foreman's architectures.
        global_parameter              Manipulate Foreman's global parameters.
        compute_resource              Manipulate Foreman's compute resources.
        domain                        Manipulate Foreman's domains.
        environment                   Manipulate Foreman's environments.
        fact                          Search Foreman's facts.
        report                        Browse and read reports.
        puppet_class                  Browse and read reports.
        host                          Manipulate Foreman's hosts.
        hostgroup                     Manipulate Foreman's hostgroups.
        location                      Manipulate Foreman's locations.
        medium                        Manipulate Foreman's installation media.
        model                         Manipulate Foreman's hardware models.
        os                            Manipulate Foreman's operating system.
        organization                  Manipulate Foreman's organizations.
        partition_table               Manipulate Foreman's partition tables.
        proxy                         Manipulate Foreman's smart proxies.
        subnet                        Manipulate Foreman's subnets.
        template                      Manipulate Foreman's config templates.
        user                          Manipulate Foreman's users.

    Options:
        -v, --verbose                 be verbose
        -c, --config CFG_FILE         path to custom config file
        -u, --username USERNAME       username to access the remote system
        -p, --password PASSWORD       password to access the remote system
        --version                     show version
        --show-ids                    Show ids of associated resources
        --csv                         Output as CSV (same as --adapter=csv)
        --output ADAPTER              Set output format. One of [base, table, silent, csv]
        --csv-separator SEPARATOR     Character to separate the values
        -P, --ask-pass                Ask for password
        --autocomplete LINE           Get list of possible endings
        -h, --help                    print help

In future posts we will focus on configuring Foreman via Hammer and host
provisioning options for various providers.  
  
If there is anything you would like us to focus on in the Hammer series
let us know in the comments below.
