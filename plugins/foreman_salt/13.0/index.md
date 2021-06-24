---
layout: plugin
title: Foreman Salt 13.0 Manual
version: 13.0
---

# 1. {{ page.title }}

Salt support in Foreman is implemented through two plugins, smart_proxy_salt and foreman_salt. These plugins enable Foreman to manage Salt minions, including provisioning, keys, states, pillars, and grains, as well as providing advanced reporting features. Since foreman_salt version 11.0 you can schedule salt jobs and let them run recurrently.

The core plugin major version will increment with the specific Foreman release, as shown in the table below.  Proxy releases tend to be compatible for longer, as the Foreman Proxy plugin API changes less frequently.

<table class="table table-bordered table-condensed">
  <tr>
    <th>Foreman</th>
    <th>foreman_salt</th>
    <th>smart_proxy_salt</th>
    <th>smart_proxy_salt_core</th>
  </tr>
  <tr>
    <td>1.13.x</td>
    <td>7.x</td>
    <td>2.x</td>
    <td>-</td>
  </tr>
  <tr>
    <td>1.14.x</td>
    <td>8.x</td>
    <td>2.x</td>
    <td>-</td>
  </tr>
  <tr>
    <td>1.15.x</td>
    <td>10.x</td>
    <td>2.x</td>
    <td>-</td>
  </tr>
  <tr>
    <td>&gt;= 1.21.x</td>
    <td>11.0.x</td>
    <td>2.x</td>
    <td>0.0.1</td>
  </tr>
  <tr>
    <td>&gt;= 1.24.x</td>
    <td>13.0.x</td>
    <td>3.x</td>
    <td>0.0.3</td>
  </tr>
</table>

## 1.1 Release Notes

### 1.1.1 Foreman plugin

- **13.0**:
  - Adding Salt Variables
  - Adding salt environment to pillar as saltenv
  - Translations

- **12.0**:
  - Use Salt as a Remote Execution provider

- **11.0**:
  - Compatible with Foreman 1.21 / 1.22
  - Use foreman remote execution to run salt `state.highstate` and other Salt functions
  - Config Report and Facts should show Salt as origin
  - Translations for german available (Help us to add more translations, see [Transifex Foreman](https://www.transifex.com/projects/p/foreman)
  - Added bulk actions to change Salt Master and Salt Environment on the host overview page
  - Show Salt Actions in Smart Proxy
  - Bug fixes and more test automation

- **10.0**:
  - Foreman 1.15 compatibility

- **8.0**:
  - Foreman 1.14 compatibility

- **7.0**:
  - Foreman 1.13 compatibility

- **6.0**:
  - Foreman 1.12 compatibility

- **5.0**:
  - Foreman 1.11 and Rails 4 compatibility

- **4.0**:
  - Foreman 1.10 compatibility

- **3.0**:
  - Foreman 1.9 compatibility
  - Fixed foreman_salt to work with discovery plugin
  - Updated to work with latest foreman-tasks

### 1.1.2 Smart Proxy plugin

- **2.1.2**:
  - Support for Salt 2015.05 report structure

- **2.1.1**:
  - Fixes for Ruby 1.8.7 support

- **2.1.0**:
  - Support for using salt-api
  - API endpoints for environments and state lists


## 1.2 Contributors

We'd like to thank the following people who contributed to Foreman Salt:

Arnold Bechtoldt, Daniel Lobato, Dominic Cleal, Marek Hulán, Michael Moll, Sherif Nagy, Lukáš Zapletal, Stephen Benjamin


# 2. Installation

You will need to install the Smart Proxy plugin, `smart_proxy_salt`, as well as the Foreman plugin, `foreman_salt`. RPM and DEB packages are available in the official Foreman repositories.

If using the Foreman installer, install the core and smart proxy plugins with:

```
foreman-installer --enable-foreman-plugin-salt --enable-foreman-proxy-plugin-salt
```

For manual installation, see the [plugin manual](/plugins/#2.Installation) for more info.


## 2.1 Smart Proxy

Install the Salt Smart Proxy package for your operating system (see above). The Salt smart proxy needs to run on the same server as your Salt master, and the foreman-proxy user needs to be able to run the 'salt' and 'salt-key' commands via sudo.

### 2.1.1 System Configuration

  - Add this to /etc/sudoers:

        Cmnd_Alias SALT = /usr/bin/salt, /usr/bin/salt-key
        foreman-proxy ALL = (ALL) NOPASSWD: SALT
        Defaults:foreman-proxy !requiretty

   - For the salt-api, ensure the salt-api package is installed, and a supported server such as python-cherrypy is installed.

### 2.1.2 Salt Master Configuration

In `/etc/salt/master`, make the following changes:

  - Configure Salt to use the Foreman external node classifier:

        master_tops:
          ext_nodes: /usr/bin/foreman-node

  - In order to enable pillar data as well:

        ext_pillar:
          - puppet: /usr/bin/foreman-node

  - Enable the autosign file, which the Smart Proxy will manage:

        autosign_file: /etc/salt/autosign.conf

Set group ownership to foreman-proxy and allow group writing:

    touch /etc/salt/autosign.conf
    chgrp foreman-proxy /etc/salt/autosign.conf
    chmod 660 /etc/salt/autosign.conf

In `/etc/salt/foreman.yaml`, make the following changes:

    :proto: https
    :host: foreman.example.com
    :port: 443
    :ssl_ca: "/etc/puppetlabs/puppet/ssl/ssl_ca.pem"
    :ssl_cert: "/etc/puppetlabs/puppet/ssl/client_cert.pem"
    :ssl_key: "/etc/puppetlabs/puppet/ssl/client_key.pem"
    :timeout:  10
    :salt:  /usr/bin/salt
    :upload_grains:  true

If your Smart Proxy uses SSL, then the certs and key configured in the YAML should be the same ones it uses to talk to Foreman. If you're already using Puppet in Foreman, consult `/etc/puppet/foreman.yaml` or `/etc/puppet/node.rb` for those settings.

### 2.1.3 Salt API Configuration

To support state and environment importing, configure salt-api as per the [Salt documentation](https://docs.saltstack.com/en/latest/ref/netapi/all/salt.netapi.rest_cherrypy.html).  The user for the Smart Proxy requires a minimum of the `@runner` permission. An example for CherryPy is below, using the Puppet certificates for SSL.


Create a system user for the API to use (in this case 'saltuser'):

    adduser --no-create-home -s /bin/false -d / saltuser
    passwd saltuser
    # enter "saltpassword" twice

<div class="alert alert-info">
“adduser saltuser -p saltpassword” WILL NOT WORK. You will not be able to import the Salt states.
</div>


Add the following section to your /etc/salt/master, and specify the system user you have just created (in this case 'saltuser'):

    external_auth:
      pam:
        saltuser:
          - '@runner'

    rest_cherrypy:
      port: 9191
      host: 0.0.0.0
      ssl_key: /etc/puppetlabs/puppet/ssl/private_keys/foreman.example.com.pem
      ssl_crt: /etc/puppetlabs/puppet/ssl/certs/foreman.example.com.pem


Edit `/etc/foreman-proxy/settings.d/salt.yml`, and configure the API-related settings:

    :use_api: true
    :api_auth: pam
    :api_url: https://saltmaster.bitbin.de:9191
    :api_username: saltuser
    :api_password: saltpassword

Then restart the services mentioned in the next section for the changes to take effect.

#### 2.1.3 Salt API Non-SSL fallback

If you're struggling to get SSL to work between the Salt API and the Foreman Proxy, you can disable SSL on the Salt API. Obviously this would be for troubleshooting or sandbox environments, not production installs. You can configure it like this:

    rest_cherrypy:
      port: 9191
      host: 127.0.0.1
      disable_ssl: true

You'll also need to change the URL in the Foreman Proxy config to `http` (the rest of the config remains as above):

    ...
    :api_url: http://saltmaster.bitbin.de:9191
    ....

### 2.1.4 Final Configuration

Restart the `foreman`, `foreman-proxy`, `salt-master`, `salt-api`, and `foreman-tasks` services.

## 2.2 Foreman

Add the Smart Proxy to Foreman (under Infrastructure, Smart Proxies).  If it is an existing smart proxy, click 'Refresh Features'.  You should see it has the
Salt feature.

# 3. Upgrade

Ensure you have the latest stable foreman-release package, and follow the [Foreman upgrade instructions](/manuals/latest/index.html#3.6Upgrade), including backing up your database.

To support state and environment importing, configure salt-api as per the [Salt documentation](https://docs.saltstack.com/en/latest/ref/netapi/all/salt.netapi.rest_cherrypy.html), and ensure the service is started on boot.  See the [Smart Proxy installation section]({{ page.url }}#2.1.3SaltAPIConfiguration) for an example of how to configure the API.

Restart the `foreman`, `foreman-proxy`, `salt-master`, `salt-api`, and `foreman-tasks` services.


# 4. Features

## 4.1 Provisioning

When creating a new Host, you'll see a drop down to select the 'Salt Master'.

Hosts assigned a Salt Master will provision and register as minions automatically.  The default Foreman templates support this.  If you are installing on an existing Foreman installation, you may need to update your templates to the latest, perhaps by using the [templates plugin](https://github.com/theforeman/foreman_templates).

Provisioning works as follows on a host with a salt master defined:

  - When the host requests it's template, Foreman temporarily adds a record to Salt's autosign file
  - At the end of the provisioning process (e.g. kickstart %post)
       - salt-minion package is installed
       - `/etc/salt/minion` is configured
       - `salt-call --grains` is run in order to trigger key signing
  - When the host finishes the build, Foreman removes the autosign entry

## 4.2 States

From the States index page, you have an overview of all the states from your Salt master, and the environments they are available in.  To refresh this data, use the Import button on the top right of the screen.

![](/static/images/plugins/foreman_salt/states_index.png)

Foreman provides an interface for adding Salt states to either a Foreman host group or a host. Salt will know to apply these states through the external node classification feature. This is done in addition to top.sls.

In the example below, the inherited states are coming from the host's host group, and you may add additional states specifically to this new host:

![](/static/images/plugins/foreman_salt/states.png)

## 4.3 Key Management

This plugin provides a UI interface to both Salt Keys and the Autosign entries.  Navigate to the Smart Proxy's page, and click on 'Salt Keys' or 'Salt Autosign' next to the Smart Proxy in the action buttons.

### 4.3.1 Autosign

Foreman manages the lifecycle of a salt minion's keys.  When the minion provisions, the autosign record will be added automatically, and when the build finishes it is removed.  You may also manually enter an autosign entry, for example, to support automatically signing an entire domain managed outside foreman (e.g. '\*.example.com').

![](/static/images/plugins/foreman_salt/autosign.png)

### 4.3.2 Keys

The Salt Keys interface allows you to manually accept, reject, or delete keys.  This is useful for managing hosts outside of Foreman's orchestration.

![](/static/images/plugins/foreman_salt/key_management.png)

## 4.4 Highstate

There are two ways to trigger `state.highstate` on Foreman:

  - use the "Run Salt" button (old behavior) which will use the shell command 'salt' on the smart proxy
  - use Schedule Remote Job / Run Salt via Foreman Remote Execution (Foreman Remote Execution Plugin needs to be installed)

Results of a highstate run will show up in Monitor / Reports if using the upload-salt-reports feature of the Smart Proxy.

You can also review executed state.highstate runs with the jobs runner on the Salt Master:

    salt-run jobs.lookup_jid 20140921213537978546

### 4.4.1 Via Schedule Remote Job / Run Salt

In case the foreman_remote_execution plugin is installed, the Salt `state.highstate` can be started via Schedule Remote Job / Run Salt.

![](/static/images/plugins/foreman_salt/rex.png)

The "Run Salt" button wouldn't be visible in this case on a newly deployed Foreman. 
Disabling the "Administer / Settings / Salt" setting `salt_hide_run_salt_button` would activate the "Run Salt" button again. 

### 4.4.2 Via Run Salt button

"Run Salt" button on the hosts page will trigger a `state.highstate` run.

![](/static/images/plugins/foreman_salt/runsalt.png)

## 4.5 Salt with Foreman Remote Execution Plugin

Currenly, there are 2 ways to run salt via the remote execution plugin:

  - Via a SSH tunnel: in this case SSH authentication to the host needs to work. After connection to the host via SSH, 'salt-call' is used to run the salt command.
  - Via salt provider: salt will be used itself to connect to the host and run the salt command.

### 4.5.1 Salt with REX using SSH provider

Use the foreman_remote_execution plugin via SSH to 

  - run salt `state.highstate` on one host / multiple hosts
  - schedule a `state.highstate` run and let it run recurrently
  - execute a test run of `state.highstate` or whatever other salt function
  - call whatever salt function on one host / multiple hosts, like "cmd.run 'df -h'"

For more information regarding Foreman Remote Execution Plugin, have a look at the [Foreman Remote Execution](plugins/foreman_remote_execution) documentation.

The job templates to run a job via ssh provider and to execute a salt function exists and can be used: 'Salt Run state.highstate - SSH default'

![](/static/images/plugins/foreman_salt/rex_details.png)

### 4.5.2 Salt with REX using salt provider

Starting with version 12.0, Salt can be used as a Remote Execution provider. This means Salt can be used to drive Remote Execution without having to rely on SSH at all. In order for this mode to work, the master's publisher access control list needs to be modified:

    publisher_acl:
      foreman-proxy:
        - state.template_str

To run apply.highstate use the following job template: 'Salt Run state.highstate - Salt default'

## 4.6 Pillars

Foreman parameters (e.g. Global Parameters, Hostgroup Parameters, ...) are available inside Salt by setting ext_pillar in /etc/salt/master:

    ext_pillar:
      - puppet: /usr/bin/foreman-node

By default, Foreman pillars are sent to the top-level pillar namespace, but if you'd like them confined to their own namespace, change the Foreman setting called `salt_namespace_pillars` to true.  Currently, Foreman parameters are limited to String values only. To access the pillars in your Salt states, use e.g.: `salt['pillar.get']('brandname', 'foreman')`

## 4.7 Grains

Cached grains are uploaded to Foreman when an external node classifier is run (e.g. when running state.highstate).  You can view them in Foreman's Fact browser.  Structured facts are navigable by clicking on the name and drilling down in child values.

![](/static/images/plugins/foreman_salt/grains.png)

## 4.8 Reporting

When running `state.highstate`, you can have Foreman process the results and show them in the UI. These reports show statistics about what was done, how long it took, complete with pie charts and file diffs.

![](/static/images/plugins/foreman_salt/reports.gif)

Uploading the salt reports is done by `/usr/sbin/upload-salt-reports` and is scheduled by a cron job running on the smart proxy.  By default, reports are uploaded to Foreman once every 10 minutes from the Salt master's job cache. You may modify the smart_proxy_salt cron job to customize this by editing `/etc/cron.d/smart_proxy_salt`.

<b>Why not use a returner?</b>

Support for a [custom returner](http://docs.saltstack.com/en/latest/ref/returners/) would make this cron on the master unnecessary, however, there are limitations on both the Salt and Foreman Proxy side that make this impossible to do securely (for now).

### 4.8.1 Scheduling

You can schedule your salt jobs like it is described in [Salt Job Management](https://docs.saltstack.com/en/latest/topics/jobs/). E.g. add the following to the /etc/salt/minion configuration file on your minions:

    schedule:
      highstate:
        function: state.highstate
        minutes: 5

If foreman_remote_execution is installed, you can add a Scheduled / Recurring Job to run Salt `state.highstate` or any other Salt function.

## 4.9 API

Foreman Salt extends v2 of the Foreman RESTful API with Salt-specific features.  See the Foreman manual for general info on the API, and view the full API documentation is available on your Foreman server: `http://foreman.example.com/apidoc/v2.html`.

Using Curl to get a list of keys from "smartproxy.example.com":

    curl -k -u admin:changeme -H "Accept: version=2,application/json" https://localhost/salt/api/v2/salt_keys/smartproxy.example.com

## 4.10 CLI

A [hammer](/manuals/latest/index.html#4.5CommandLineInterface) plugin for Salt is available, [follow the instructions for installing a plugin](/plugins/#2.Installation) to install hammer_cli_foreman_salt, and then see `hammer --help` for more information.

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


# 5 Help

## 5.1 Troubleshooting

If you find a bug, please file it in [Redmine](https://projects.theforeman.org/projects/salt/issues/new).  You can find us on libera.chat on #theforeman as well.

See the [troubleshooting section](/manuals/latest/index.html#7.3GettingHelp) in the Foreman manual for more info.

## 5.2 Contributing & Translations

Follow the [same process as Foreman](/contribute.html) for contributing.

Sources at [github.com/theforeman/foreman_salt](https://github.com/theforeman/foreman_salt)

Help us to translate Foreman, the Foreman Salt Plugin and other Foreman Plugins. See [Translation guide](/contribute.html#Translations).
