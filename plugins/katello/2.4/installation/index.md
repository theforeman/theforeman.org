---
layout: plugins/katello/documentation
robots: noindex
title: Katello Installation
version: 2.4
foreman_version: "1.10"
script: osmenu.js
latest: '3.12'
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

For Katello 1.4 users looking for information on how to transition to 2.0, please see - [Transition Guide](/plugins/katello/2.4/installation/2.0-transition.html).

Note: After installation of Katello, be sure to trust Katello's CA certificate on your system.  This is required for the encrypted NoVNC connections. You will find `katello-default-ca.crt` in the `/pub` directory of your Katello server (e.g. `http://katello.example.com/pub/katello-default-ca.crt`).

## Hardware Requirements

Katello may be installed onto a baremetal host or on a virtual guest.  The minimum requirements are:

* Two Logical CPUs
* 4 GB of memory (8 GB highly recommended)
* The filesystem holding /var/lib/pulp needs to be large, but may vary depending on how many different Operating Systems you wish to syncronize:
  * Allocate 30 GB of space for each operating system.  Even though an operating system may not take up this much space now, this allows space for future updates that will be syncronized later.
* The filesystem holding /var/lib/mongodb needs at least 4 GB to install, but will vary depending on how many different Operating Systems you wish to syncronize:
  * Allocate around 40% of the capacity that has been given to the /var/lib/pulp filesystem
* The root filesystem needs at least 20 GB of Disk Space

## Required Ports

The following ports need to be open to external connections:

* 80 TCP - HTTP, used for provisioning purposes
* 443 TCP - HTTPS, used for web access and api communication
* 5647 TCP - qdrouterd - used for client and capsule actions
* 9090 TCP - HTTPS - used for communication with the smart proxy

## Production

Katello provides a puppet based installer for deploying production installations. Production installations are supported on the following OSes:

```
|-----------+-----|
| OS        |     |
|-----------|-----|
| CentOS 6  |  X  |
| CentOS 7  |  X  |
| RHEL 6    |  X  |
| RHEL 7    |  X  |
|-----------+-----|
```

Katello can only run on an x86_64 operating systems.

Installation may be done manually or via our recommended approach of using [forklift](#forklift).

## Required Repositories

<p>Select your Operating System: <select id="operatingSystems">
   <option value="rhel6">Red Hat Enterprise Linux 6</option>
   <option value="rhel7">Red Hat Enterprise Linux 7</option>
   <option value="el6">Enterprise Linux 6 (CentOS, etc.)</option>
   <option value="el7">Enterprise Linux 7 (CentOS, etc.)</option>
   </select>
</p>
<div id="rhel6" markdown="1">
```bash
yum -y  --disablerepo="*" --enablerepo=rhel-6-server-rpms install yum-utils wget
yum-config-manager --disable "*"
yum-config-manager --enable rhel-6-server-rpms epel
yum-config-manager --enable rhel-6-server-optional-rpms
```
</div>

<div id="el6" markdown="1">
```bash
yum -y localinstall https://fedorapeople.org/groups/katello/releases/yum/{{ page.version }}/katello/RHEL/6Server/x86_64/katello-repos-latest.rpm
yum -y localinstall https://yum.theforeman.org/releases/{{ page.foreman_version }}/el6/x86_64/foreman-release.rpm
yum -y localinstall https://yum.puppetlabs.com/puppetlabs-release-el-6.noarch.rpm
yum -y localinstall https://dl.fedoraproject.org/pub/epel/epel-release-latest-6.noarch.rpm
yum -y install foreman-release-scl
```
</div>

<div id="rhel7" style="display: none;" markdown="1">
```bash
yum -y  --disablerepo="*" --enablerepo=rhel-7-server-rpms install yum-utils wget
yum-config-manager --disable "*"
yum-config-manager --enable rhel-7-server-rpms
yum-config-manager --enable rhel-7-server-optional-rpms
yum-config-manager --enable rhel-7-server-extras-rpms
```
</div>

<div id="el7" style="display: none;" markdown="1">
```bash
yum -y localinstall https://fedorapeople.org/groups/katello/releases/yum/{{ page.version }}/katello/RHEL/7Server/x86_64/katello-repos-latest.rpm
yum -y localinstall https://yum.theforeman.org/releases/{{ page.foreman_version }}/el7/x86_64/foreman-release.rpm
yum -y localinstall https://yum.puppetlabs.com/puppetlabs-release-el-7.noarch.rpm
yum -y localinstall https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
yum -y install foreman-release-scl
```
</div>

## Installation

After setting up the appropriate repositories, install Katello:

```bash
yum -y install katello
```

At this point the `katello-installer` should be available to setup the server. The installation may be customized, to see a list of options:

```bash
katello-installer --help
```

<div class="alert alert-info" markdown="1">
**Note**

Prior to running the installer, the machine should be set up with a time service such as ntpd or chrony, since several Katello features will not function well if there is minor clock skew.
</div>


These may be set as command line options or in the answer file (/etc/katello-installer/answers.katello-installer.yaml). Now run the options:

```bash
katello-installer <options>
```

## Forklift

Foreman provides a git repository designed to streamline setup by setting up all the proper repositories. Forklift provides the ability to deploy a virtual machine instance via Vagrant or direct deployment on an already provisioned machine. For details on how to install using forklift, please see the [README](https://github.com/theforeman/forklift/blob/master/README.md).


