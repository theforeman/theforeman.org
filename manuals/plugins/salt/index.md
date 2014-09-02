---
layout: manual
title: Salt Plugin 
---

# 1. {{ page.title }}

Salt support in Foreman is implemented by two plugins, smart_proxy_salt and
foreman_salt.

Foreman 1.6 or greater is required. 

# 2. Installation

You will need to install the Smart Proxy plugin, `smart_proxy_salt`, as well
as the Foreman plugin, `foreman_salt`. 

The Smart Proxy needs to run on the same server as the Salt master, which may
be the same server as Foreman.

See [How to Install a Plugin](/manuals/latest/index.html#6.1InstallaPlugin)
for more info.

## 2.1 Smart Proxy

Install the Salt Smart Proxy package for your operating system (see install a
plugin above).

The Salt smart proxy needs to run on the same server as your Salt master, and
the foreman-proxy user needs to be able to run the 'salt' and 'salt-key'
commands via sudo.  You'll need to add something like this to /etc/sudoers:

    Cmnd_Alias SALT = /usr/bin/salt, /usr/bin/salt-key
    foreman-proxy ALL = NOPASSWD: SALT

Next, configure Salt to use the Foreman external node classifier, edit
/etc/salt/master and add:

    master_tops:
      ext_nodes: /usr/bin/foreman-node

While in /etc/salt/master, also enable the autosign file, which the smart proxy
will manage:

    autosign_file: /etc/salt/autosign.conf

Set group ownership to foreman-proxy and allow group writing:

    touch /etc/salt/autosign.conf
    chgrp foreman-proxy /etc/salt/autosign.conf
    chmod g+w /etc/salt/autosign.conf

You'll also need to edit /etc/salt/foreman.yaml to set the appropriate
settings (if you're already using Puppet in Foreman, consult
/etc/puppet/foreman.yaml or /etc/puppet/node.rb).

Make sure to restart the `foreman-proxy` service at this point.

## 2.2 Foreman

Add the Smart Proxy to Foreman (under Infrastructure, Smart Proxies).  If it is
an existing smart proxy, click 'Refresh Features'.  You should see it has the
Salt feature. 

# 3. Features

## 3.1 Provisioning

When creating a new Host, you'll see a drop down to select the 'Salt Master'.

Hosts assigned a Salt Master will provision and register as minions
automatically.  The default Foreman templates support this.  If you are
installing on an existing Foreman installation, you may need to update your
templates to the latest, perhaps by using the [templates
plugin](https://github.com/theforeman/foreman_templates).

Provisioning works as follows on a host with a salt master defined:

  - When the host requests it's template, foreman temporarily adds a record to Salt's autosign file
  - At the end of the provisioning process (e.g. kickstart %post)
       - salt-minion package is installed
       - `/etc/salt/minion` is configured
       - `salt-call --grains` is run in order to trigger key signing
  - When the host finishes the build, Foreman removes the autosign entry


## 3.2 Node Classification

Foreman provides an interface for adding salt modules (Salt State files - SLS)
to either a Foreman host group or a host.  Salt will know to apply these
modules through the external node classification feature. This is done in
addition to top.sls.

In the example below, the inherited modules are coming from the host's host
group, and you may add additional modules specifically to this new host:

![](/static/images/plugins/salt/modules.png)

Note that Foreman parameters become pillars inside of Salt.


## 3.3 Key Management

This plugin provides a UI interface to both Salt Keys and the Autosign
entries.  Navigate to the Smart Proxy's page, and click on 'Salt Keys' or 'Salt
Autosign' next to the Smart Proxy in the action buttons.


### 3.3.1 Autosign

Foreman manages the lifecycle of a salt minion's keys.  When the minion
provisions, the autosign record will be added automatically, and when the build
finishes it is removed.  You may also manually enter an autosign entry, for
example, to support automatically signing an entire domain managed outside
foreman (e.g. '*.example.com').

![](/static/images/plugins/salt/autosign.png)

## 3.4 Highstate

"Run Salt" button on the hosts page will trigger a state.highstate run.

![](/static/images/plugins/salt/runsalt.png)

## 3.5 Grains

Currently, we will upload the cached grains to Foreman when an external node
classifier is run (e.g. when running state.highstate).  You can view them in
Foreman's Fact browser.  Structured facts are navigable by clicking on the name
and drilling down in child values.

![](/static/images/plugins/salt/grains.png)

# 4 Help

If you find a bug, please file it in
[Redmine](http://projects.theforeman.org/projects/salt/issues/new).  You can
find us on freenode on #theforeman as well.

See the [troubleshooting
section](/manuals/latest/index.html#7.2GettingHelp) in the
Foreman manual for more info.
