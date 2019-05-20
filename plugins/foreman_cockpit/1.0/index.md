---
layout: plugin
title: Foreman Cockpit 1.0 manual
version: 1.0
# uncomment for older versions than stable or nightly
#robots: noindex
---

# 1. {{ page.title }}

[Foreman Cockpit](https://github.com/theforeman/foreman_cockpit) allows you to see a host's Cockpit in Foreman.

[Cockpit](http://cockpit-project.org/) is a lightweight service that runs
in your hosts, and allows you to perform sysadmin tasks through a web UI.

Integration between Cockpit and Foreman is seamless. Foreman automatically
detects which of your hosts are running Cockpit.

![gif demoing foreman_cockpit](https://camo.githubusercontent.com/dd327f958993d60ecefbe4e1fc26bc45ad63cf9c/687474703a2f2f692e696d6775722e636f6d2f527a64735239622e676966)

# 2. Installation

### 2.1.1 Installer (recommended)

As of Foreman 1.11+, the foreman-installer is able to automatically install the
package and proceed with all necessary steps. To do this, re-run the installer
with the following option:

    # foreman-installer --enable-foreman-plugin-cockpit

Important note: Executing foreman-installer will re-deploy all foreman-related
configuration files. In case changes have been made, proceed with manual
installation.

### 2.1.2 Manual installation

If this is the first plugin you're installing, please see the [plugin
repository section]({{site.baseurl}}plugins/#2.2Packageinstallation) to set up the repository
first.

To install Foreman Cockpit, run the following:

* Red Hat based (RHEL, CentOS...)

      # yum install tfm-rubygem-foreman_cockpit

* Fedora

      # yum install rubygem-foreman_cockpit

* Debian based (Debian, Ubuntu...)

      # apt-get install ruby-foreman-cockpit

Restarting Foreman might be needed after installing the package.

# 3. Usage

Using Foreman Cockpit is incredibly easy. It requires no configuration after
installing the package, so just click on a host where Cockpit is enabled, and
you will see a Cockpit button on the top bar.

![top bar with cockpit](/static/images/plugins/foreman_cockpit/topbar.png)

Only hosts associated with an operating system of the Fedora, Red Hat,
Archlinux, and Ubuntu families are compatible with Foreman Cockpit, because
Cockpit can only be installed in these systems for the moment.

Any user in Foreman that has the 'Host/managed' 'console_hosts' permission in
any of its roles, will be able to see it.

If you need help installing or running Cockpit in the host, please visit the
[Cockpit project installation guide](http://cockpit-project.org/running.html).

**You should make sure the Foreman host can contact the host at
'http://$HOSTFQDN:9090'**, which is Cockpit's service. Please make sure your
firewall allows incoming connections from the Foreman host in the target host,
and outgoing connections from Foreman to the target host.

# 4. Help

Please follow our [standard procedures and contacts]({{site.baseurl}}support.html).

## 4.1 Troubleshooting

If you find a bug, please file it in
[Redmine](http://projects.theforeman.org/projects/foreman_cockpit/issues/new).

See the [troubleshooting section]({{site.baseurl}}manuals/latest/index.html#7.2GettingHelp)
in the Foreman manual for more info.

## 4.2 Contributing

Follow the [same process as Foreman]({{site.baseurl}}contribute.html#SubmitPatches)
for contributing. Sources at [github.com/theforeman/foreman_cockpit](https://github.com/theforeman/foreman_cockpit)
