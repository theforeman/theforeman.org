---
layout: plugin
title: Foreman Salt 2.0 Manual
version: 2.0
# uncomment for older versions than stable or nightly
robots: noindex
---

# 1. {{ page.title }}

Salt support in Foreman is implemented through two plugins, smart_proxy_salt and foreman_salt. These plugins enable Foreman to manage Salt minions, including provisioning, keys, states, pillars, and grains, as well as providing advanced reporting features.

The core plugin major version will increment with the specific Foreman release, as shown in the table below.  Proxy releases tend to be compatible for longer, as the Foreman Proxy plugin API changes less frequently.

<table class="table table-bordered table-condensed">
  <tr>
    <th>Foreman</th>
    <th>foreman_salt</th>
    <th>smart_proxy_salt</th>
  </tr>
  <tr>
    <td>1.6.x</td>
    <td>0.x</td>
    <td>0.x - 1.x</td>
  </tr>
  <tr>
    <td>1.7.x</td>
    <td>1.x</td>
    <td>0.x - 1.x</td>
  </tr>
  <tr>
    <td>1.8.x</td>
    <td>2.x</td>
    <td>2.x</td>
  </tr>
</table>

## 1.1 Release Notes

### 1.1.1 Foreman plugin

- **2.0**:
  - Compatibility with Foreman 1.8
  - RESTful API
  - Hammer CLI plugin
  - Misc bug fixes

- **1.1.1**:
  - Small bug fix for handling Foreman rollbacks correctly when orchestration fails

- **1.1.0**:
  - Support for importing Salt state.highstate reports
  - Fix an issue where Salt environment is not applied to a host from the hostgroup

- **1.0**:
  - Fixes for compatibility with Foreman 1.7 and other minor code clean-up only

- **0.0.4**:
  - Fixed an issue where the ENC would not render correctly for any other environment than 'base'

- **0.0.3**:
  - Renamed 'Salt Modules' to the proper term, 'Salt States'
  - Allowed periods in Salt state name
  - Support Salt-specific environments
  - Fixed an issue where a user could not delete a host without salt

- **0.0.2**: First public release. Support for automated provisioning of
  minions, node classification, states, pillars, key management, highstate run
  on a node, and grain import

### 1.1.2 Smart Proxy plugin

- **2.0**: Foreman 1.8 compatibility

- **1.0**: Support for uploading Salt state.highstate reports

- **0.0.2**: First public release. See [the wiki](https://github.com/theforeman/smart_proxy_salt/wiki/Salt-Proxy-API)
  for info on current API end points.

## 1.2 Contributors

We'd like to thank the following people who contributed to Foreman Salt:

Arnold Bechtoldt, Daniel Lobato, Dominic Cleal, Michael Moll, Lukáš Zapletal, Stephen Benjamin


# 2. Installation

You will need to install the Smart Proxy plugin, `smart_proxy_salt`, as well as the Foreman plugin, `foreman_salt`. RPM and DEB packages are available in the official Foreman repositories.

If using the Foreman installer, install the core and smart proxy plugins with:

```
foreman-installer --enable-foreman-plugin-salt --enable-foreman-proxy-plugin-salt
```

For manual installation, see [How to Install a Plugin](http://www.theforeman.org/manuals/latest/index.html#6.1InstallaPlugin) for more info.


## 2.1 Smart Proxy

Install the Salt Smart Proxy package for your operating system (see above). The Salt smart proxy needs to run on the same server as your Salt master, and the foreman-proxy user needs to be able to run the 'salt' and 'salt-key' commands via sudo.

Add this to /etc/sudoers:

    Cmnd_Alias SALT = /usr/bin/salt, /usr/bin/salt-key
    foreman-proxy ALL = (ALL) NOPASSWD: SALT
    Defaults:foreman-proxy !requiretty

In `/etc/salt/master`, make the following changes:

  - Configure Salt to use the Foreman external node classifier:

        master_tops:
          ext_nodes: /usr/bin/foreman-node

  - In order to enable pillar data as well:

        ext_pillar:
          - puppet: /usr/bin/foreman-node

  - Enable the autosign file, which the Smart Proxy will manage:

        autosign_file: /etc/salt/autosign.conf

  - Set group ownership to foreman-proxy and allow group writing:

        touch /etc/salt/autosign.conf
        chgrp foreman-proxy /etc/salt/autosign.conf
        chmod g+w /etc/salt/autosign.conf

  - Edit `/etc/salt/foreman.yaml` to set the appropriate settings:

        ---
        :proto: https
        :host: foreman.example.com
        :port: 443
        :ssl_ca: "/etc/puppet/ssl_ca.pem"
        :ssl_cert: "/etc/puppet/client_cert.pem"
        :ssl_key: "/etc/puppet/client_key.pem"
        :timeout:  10
        :salt:  /usr/bin/salt
        :upload_grains:  true

If your Smart Proxy uses SSL, then the certs and key configured in the YAML should be the same ones it uses to talk to Foreman. If you're already using Puppet in Foreman, consult `/etc/puppet/foreman.yaml` or `/etc/puppet/node.rb` for those settings.

  - Lastly, restart the `foreman-proxy` service

## 2.2 Foreman

Add the Smart Proxy to Foreman (under Infrastructure, Smart Proxies).  If it is an existing smart proxy, click 'Refresh Features'.  You should see it has the
Salt feature.

# 3. Features

## 3.1 Provisioning

When creating a new Host, you'll see a drop down to select the 'Salt Master'.

Hosts assigned a Salt Master will provision and register as minions automatically.  The default Foreman templates support this.  If you are installing on an existing Foreman installation, you may need to update your templates to the latest, perhaps by using the [templates plugin](https://github.com/theforeman/foreman_templates).

Provisioning works as follows on a host with a salt master defined:

  - When the host requests it's template, Foreman temporarily adds a record to Salt's autosign file
  - At the end of the provisioning process (e.g. kickstart %post)
       - salt-minion package is installed
       - `/etc/salt/minion` is configured
       - `salt-call --grains` is run in order to trigger key signing
  - When the host finishes the build, Foreman removes the autosign entry


## 3.2 States

Foreman provides an interface for adding Salt states to either a Foreman host group or a host. Salt will know to apply these states through the external node classification feature. This is done in addition to top.sls.

In the example below, the inherited states are coming from the host's host
group, and you may add additional states specifically to this new host:

![](/static/images/plugins/foreman_salt/states.png)

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

![](/static/images/plugins/foreman_salt/autosign.png)

### 3.3.2 Keys

The Salt Keys interface allows you to manually accept, reject, or delete keys.
This is useful for managing hosts outside of Foreman's orchestration.

![](/static/images/plugins/foreman_salt/key_management.png)

## 3.4 Highstate

"Run Salt" button on the hosts page will trigger a `state.highstate` run.

![](/static/images/plugins/foreman_salt/runsalt.png)

Results of a highstate run will show up in Monitor / Reports if using the upload-salt-reports feature of the Smart Proxy.

You can also review executed state.highstate runs with the jobs runner on the Salt Master:

    salt-run jobs.lookup_jid 20140921213537978546

## 3.5 Pillars

Foreman parameters are available inside Salt by setting ext_pillar in /etc/salt/master:

    ext_pillar:
      - puppet: /usr/bin/foreman-node

By default, Foreman pillars are sent to the top-level pillar namespace, but if you'd like them confined to their own namespace, change the Foreman setting called `salt_namespace_pillars` to true.  Currently, Foreman parameters are limited to String values only.

## 3.6 Grains

Cached grains are uploaded to Foreman when an external node classifier is run (e.g. when running state.highstate).  You can view them in Foreman's Fact browser.  Structured facts are navigable by clicking on the name and drilling down in child values.


![](/static/images/plugins/foreman_salt/grains.png)

## 3.7 Reporting

When running `state.highstate`, you can have Foreman process the results and show them in the UI.   These reports show statistics about what was done, how long it took, complete with pie charts and file diffs.

![](/static/images/plugins/foreman_salt/reports.gif)

By default, reports are uploaded to Foreman once every 10 minutes from the Salt master's job cache. You may modify the smart_proxy_salt cron job to customize this.

### 3.7.1 Scheduling

<div class="alert alert-info">
If you are using scheduling <a href="http://docs.saltstack.com/en/latest/topics/jobs/schedule.html">as per the Salt documentation</a>, this will NOT upload reports to Foreman as minions do not return locally called `state.highstate` runs to the job cache. This is being tracked as a feature request at <a href="https://github.com/saltstack/salt/issues/12653">https://github.com/saltstack/salt/issues/12653</a>.
</div>

If you want to schedule your minions to run Salt on a recurring basis, you could modify the cron job to execute something like this: 

    (salt '*' -b 1000 state.highstate && sleep 60 && /usr/sbin/upload-salt-reports) >> /var/log/foreman-proxy/salt-cron.log

<b>Why not use a returner?</b>

Support for a [custom returner](http://docs.saltstack.com/en/latest/ref/returners/) would make this cron on the master unnecessary, however, there are limitations on both the Salt and Foreman Proxy side that make this impossible to do securely (for now).

## 3.8 API

Foreman Salt extends v2 of the Foreman RESTful API with Salt-specific features.  See the Foreman manual for general info on the API, and view the full API documentation is available on your Foreman server: `http://foreman.example.com/apidoc/v2.html`.

Using Curl to get a list of keys from "smartproxy.example.com":

    curl -k -u admin:changeme -H "Accept: version=2,application/json" https://localhost/salt/api/v2/salt_keys/smartproxy.example.com

## 3.9 CLI

A [hammer](http://www.theforeman.org/manuals/latest/index.html#4.5CommandLineInterface) plugin for Salt is available, [follow the instructions for installing a plugin](http://www.theforeman.org/manuals/latest/index.html#6.1InstallaPlugin) to install hammer_cli_foreman_salt, and then see `hammer --help` for more information.

Examples:

  - Creating a Salt State:

<pre>
hammer salt-state create --name foo.bar
</pre>

  - Viewing info about a minion:

<pre>
hammer salt-minion info --name minion.example.com
</pre>

  - Adding states to a minion:

<pre>
hammer salt-minion update --name minion.example.com --salt-states foo.bar
</pre>

# 4 Help

## 4.1 Troubleshooting

If you find a bug, please file it in
[Redmine](http://projects.theforeman.org/projects/salt/issues/new).  You can
find us on libera.chat on #theforeman as well.

See the [troubleshooting section](http://theforeman.org/manuals/latest/index.html#7.2GettingHelp)
in the Foreman manual for more info.

## 4.2 Contributing

Follow the [same process as Foreman](http://theforeman.org/contribute.html#SubmitPatches)
for contributing.
