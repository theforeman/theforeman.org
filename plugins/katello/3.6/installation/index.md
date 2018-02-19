---
layout: plugins/katello/documentation
title: Katello Installation
version: 3.6
foreman_version: 1.17
latest: 3.6
script: osmenu.js
---

# Katello {{ page.version }} Installation

{% if page.version == 'nightly' %}
  <div class="alert alert-danger">
    These are the instructions for installing the unstable nightly release of katello!
  </div>
{% elsif page.version != page.latest %}
  <div class="alert alert-danger">
    These instructions are for installing Katello {{ page.version }}, but the latest stable is <a href="/plugins/katello/{{ page.latest }}/installation/index.html">{{ page.latest }}</a>.
  </div>
{% endif %}

Note: After installation of Katello, be sure to trust Katello's CA certificate
on your system.  This is required for the encrypted NoVNC connections. You
will find `katello-server-ca.crt` in the `/pub` directory of your Katello
server (e.g. `http://katello.example.com/pub/katello-server-ca.crt`).

## Important Note for Existing Installations

Katello does not currently support installation on existing Foreman deployments. **DO NOT attempt to install Katello on an existing Foreman deployment**, unless you are a Foreman developer and willing to debug the broken configuration that will result from attempting an install on existing system.

## Hardware Requirements

Katello may be installed onto a baremetal host or on a virtual guest.  The minimum requirements are:

* Two Logical CPUs
* 8 GB of memory (12 GB highly recommended)
* The filesystem holding /var/lib/pulp needs to be large, but may vary depending on how many different Operating Systems you wish to syncronize:
  * Allocate 30 GB of space for each operating system.  Even though an operating system may not take up this much space now, this allows space for future updates that will be syncronized later.
* The path /var/spool/squid/ is used as a temporary location for some types of repository syncs and may grow to consume 10s of GB of space before the files are migrated to /var/lib/pulp.  You may wish to put this on the same partition as /var/lib/pulp.
* The filesystem holding /var/lib/mongodb needs at least 4 GB to install, but will vary depending on how many different Operating Systems you wish to syncronize:
  * Allocate around 40% of the capacity that has been given to the /var/lib/pulp filesystem
* The root filesystem needs at least 20 GB of Disk Space

## Required Ports

The following ports need to be open to external connections:

* 80 TCP - HTTP, used for provisioning purposes
* 443 TCP - HTTPS, used for web access and api communication
* 5647 TCP - qdrouterd - used for client and Smart Proxy actions
* 9090 TCP - HTTPS - used for communication with the Smart Proxy

## Production

Katello provides a puppet based installer for deploying production installations. Production installations are supported on the following OSes:

<div class="row">
  <div class="col-sm-3">
    <table class="table table-bordered table-condensed">
      <thead>
        <tr>
          <th>OS</th>
          <th></th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>CentOS 7</td>
          <td>X</td>
        </tr>
        <tr>
          <td>RHEL 7</td>
          <td>X</td>
        </tr>
      </tbody>
    </table>
  </div>
</div>

Katello can only run on an x86_64 operating systems.

Installation may be done manually or via our recommended approach of using [forklift](/plugins/katello/{{ page.version }}/installation/index.html#forklift).

## Required Repositories

<p>Select your Operating System: <select id="operatingSystems">
   <option value="rhel7">Red Hat Enterprise Linux 7</option>
   <option value="el7">Enterprise Linux 7 (CentOS, etc.)</option>
   </select>
</p>

<div id="rhel7" markdown="1">
{% highlight bash %}
yum install -y yum-utils
yum-config-manager --disable "*"
yum-config-manager --enable rhel-7-server-rpms
yum-config-manager --enable rhel-7-server-optional-rpms
yum-config-manager --enable rhel-7-server-extras-rpms
{% endhighlight %}
</div>

<div id="el7" markdown="1">
{% highlight bash %}
yum -y localinstall http://fedorapeople.org/groups/katello/releases/yum/{{ page.version }}/katello/el7/x86_64/katello-repos-latest.rpm
yum -y localinstall http://yum.theforeman.org/releases/{{ page.foreman_version }}/el7/x86_64/foreman-release.rpm
yum -y localinstall https://yum.puppetlabs.com/puppetlabs-release-pc1-el-7.noarch.rpm
yum -y localinstall http://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
yum -y install foreman-release-scl python-django
{% endhighlight %}
</div>

## Installation
After setting up the appropriate repositories, update your system:

{% highlight bash %}
yum -y update
{% endhighlight %}

Then install Katello:

{% highlight bash %}
yum -y install katello
{% endhighlight %}

At this point the `foreman-installer` should be available to setup the server. The installation may be customized, to see a list of options:

{% highlight bash %}
foreman-installer --scenario katello --help
{% endhighlight %}

<div class="alert alert-info" markdown="1">
**Note**

Prior to running the installer, the machine should be set up with a time service such as ntpd or chrony, since several Katello features will not function well if there is minor clock skew.
</div>


These may be set as command line options or in the answer file (/etc/foreman-installer/scenarios.d/katello-answers.yaml). Now run the options:

{% highlight bash %}
foreman-installer --scenario katello <options>
{% endhighlight %}

## Forklift

Foreman provides a git repository designed to streamline setup by setting up all the proper repositories. Forklift provides the ability to deploy a virtual machine instance via Vagrant or direct deployment on an already provisioned machine. For details on how to install using forklift, please see the [README](https://github.com/theforeman/forklift/blob/master/README.md).
