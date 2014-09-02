---
layout: manual
title: Salt Plugin
---

# 1. {{ page.title }}

Salt support in Foreman is implemented by two plugins, smart_proxy_salt and
foreman_salt.  These are compatible with Foreman 1.6 or newer.

## 1.1 Release Notes

### 1.1.1 Foreman plugin

- **0.0.2**: First public release.  Support for automated provisioing of
  minions, node classification, states, pillars, key management, highstate run
  on a node, and grain import

### 1.1.2 Smart Proxy plugin

- **0.0.2**: First public release. See [the wiki](https://github.com/theforeman/smart_proxy_salt/wiki/Salt-Proxy-API)
  for info on current API end points.


# 2. Installation

You will need to install the Smart Proxy plugin, `smart_proxy_salt`, as well
as the Foreman plugin, `foreman_salt`.

See [How to Install a Plugin](/manuals/latest/index.html#6.1InstallaPlugin)
for more info.

## 2.1 Smart Proxy

Install the Salt Smart Proxy package for your operating system (see above).

The Salt smart proxy needs to run on the same server as your Salt master, and
the foreman-proxy user needs to be able to run the 'salt' and 'salt-key'
commands via sudo.

Add this to /etc/sudoers:

    Cmnd_Alias SALT = /usr/bin/salt, /usr/bin/salt-key
    foreman-proxy ALL = NOPASSWD: SALT


In `/etc/salt/master`, make the following changes:

  - Configure Salt to use the Foreman external node classifier:

        master_tops:
          ext_nodes: /usr/bin/foreman-node

  - In order to enable pillar data as well:

        ext_pillar:
          - puppet: /usr/bin/foreman-node

  - Enable the autosign file, which the smart proxy will manage:

        autosign_file: /etc/salt/autosign.conf

Set group ownership to foreman-proxy and allow group writing:

    touch /etc/salt/autosign.conf
    chgrp foreman-proxy /etc/salt/autosign.conf
    chmod g+w /etc/salt/autosign.conf

Lastly, edit `/etc/salt/foreman.yaml` to set the appropriate
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

  - When the host requests it's template, Foreman temporarily adds a record to Salt's autosign file
  - At the end of the provisioning process (e.g. kickstart %post)
       - salt-minion package is installed
       - `/etc/salt/minion` is configured
       - `salt-call --grains` is run in order to trigger key signing
  - When the host finishes the build, Foreman removes the autosign entry

## 3.2 Node Classification

Foreman provides an interface for adding 'Salt modules' (Salt State files - SLS)
to either a Foreman host group or a host.  This is currently incorrectly named
as modules, and will be renamed to 'States' in the next release.

Salt will know to apply these states through the external node classification
feature. This is done in addition to top.sls.

In the example below, the inherited modules are coming from the host's host
group, and you may add additional modules specifically to this new host:

![](/static/images/plugins/salt/modules.png)

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

### 3.3.2 Keys

The Salt Keys interface allows you to manually accept, reject, or delete keys.
This is useful for managing hosts outside of Foreman's orchestration.

![](/static/images/plugins/salt/key_management.png)

## 3.4 Highstate

"Run Salt" button on the hosts page will trigger a state.highstate run.

![](/static/images/plugins/salt/runsalt.png)

## 3.5 Pillars

Foreman parameters are available inside Salt by setting ext_pillar in /etc/salt/master:

    ext_pillar:
      - puppet: /usr/bin/foreman-node

## 3.6 Grains

Currently, we will upload the cached grains to Foreman when an external node
classifier is run (e.g. when running state.highstate).  You can view them in
Foreman's Fact browser.  Structured facts are navigable by clicking on the name
and drilling down in child values.

![](/static/images/plugins/salt/grains.png)

# 4 Help

## 4.1 Troubleshooting

If you find a bug, please file it in
[Redmine](http://projects.theforeman.org/projects/salt/issues/new).  You can
find us on freenode on #theforeman as well.

See the [troubleshooting section](/manuals/latest/index.html#7.2GettingHelp)
in the Foreman manual for more info.

## 4.2 Contributing

Follow the [same process as Foreman](http://theforeman.org/contribute.html#SubmitPatches)
for contributing.
