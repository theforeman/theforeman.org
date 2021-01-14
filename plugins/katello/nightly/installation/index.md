---
title: Katello Installation
latest: nightly
script: osmenu.js
---

# Katello {{ page.version }} Installation

{% if page.version == 'nightly' %}
  <div class="alert alert-danger">
    These are the instructions for installing the unstable nightly release of Katello!
  </div>
{% elsif page.version.to_s != page.latest.to_s %}
  <div class="alert alert-danger">
    These instructions are for installing Katello {{ page.version }}, but the latest stable is <a href="/plugins/katello/{{ page.latest }}/installation/index.html">{{ page.latest }}</a>.
  </div>
{% endif %}

<div class="alert alert-info" markdown="1">
After installation of Katello, navigate to the `/pub` directory and trust Katello's CA certificate for identifying web sites (e.g. `http://katello.example.com/pub/katello-server-ca.crt`).
</div>

## Important Note for Existing Installations

Katello does not currently support installation on existing Foreman deployments. **DO NOT attempt to install Katello on an existing Foreman deployment**, unless you are a Foreman developer and willing to debug the broken configuration that will result from attempting an install on existing system.

## Hardware Requirements

Katello may be installed onto a baremetal host or on a virtual guest.  The minimum requirements are:

* Two Logical CPUs
* 12 GB of memory (16 GB or greater may be required depending on the amount of managed content)
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
* 5646 TCP - qdrouterd - used for Qpid Dispatch Router on a Smart Proxy to communicate with Qpid Dispatch Router on Foreman server
* 5647 TCP - qdrouterd - used for client and Smart Proxy actions
* 9090 TCP - HTTPS - used for communication with the Smart Proxy

## Production

Katello provides a Puppet based installer for deploying production installations. Production installations are supported on the following operating systems:

* CentOS 7 (x86_64)
* Red Hat Enterprise Linux 7 (x86_64)

Installation may be done manually or via our recommended approach of using [forklift](/plugins/katello/{{ page.version }}/installation/index.html#forklift).

## Required Repositories

<p>Select your Operating System: <select id="operatingSystems">
   <option value="rhel7">Red Hat Enterprise Linux 7</option>
   <option value="el7">Enterprise Linux 7 (CentOS, etc.)</option>
   </select>
</p>

<div id="rhel7" markdown="1">
{% highlight bash %}
subscription-manager repos --disable "*"
subscription-manager repos --enable rhel-7-server-rpms
subscription-manager repos --enable rhel-7-server-optional-rpms
subscription-manager repos --enable rhel-7-server-extras-rpms
subscription-manager repos --enable rhel-server-rhscl-7-rpms
yum install -y yum-utils
{% endhighlight %}
</div>

<div id="el7" markdown="1">
{% highlight bash %}
yum -y localinstall https://yum.theforeman.org/releases/{{ page.foreman_version }}/el7/x86_64/foreman-release.rpm
yum -y localinstall https://fedorapeople.org/groups/katello/releases/yum/{{ page.version }}/katello/el7/x86_64/katello-repos-latest.rpm
yum -y localinstall https://yum.puppet.com/puppet6-release-el-7.noarch.rpm
yum -y install epel-release centos-release-scl-rh
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

## Multiple subnets and domains

The installer only supports one subnet and one DNS domain via command line
arguments. Multiple entries can be entered via
/etc/foreman-installer/custom-hiera.yaml file:

    dhcp::pools:
     isolated.lan:
       network: 192.168.99.0
       mask: 255.255.255.0
       gateway: 192.168.99.1
       range: 192.168.99.5 192.168.99.49
    dns::zones:
      # creates @ SOA $::fqdn root.example.com.
      # creates $::fqdn A $::ipaddress
      example.com: {}

      # creates @ SOA test.example.net. hostmaster.example.com.
      # creates test.example.net A 192.0.2.100
      example.net:
        soa: test.example.net
        soaip: 192.0.2.100
        contact: hostmaster.example.com.

      # creates @ SOA $::fqdn root.example.org.
      # does NOT create an A record
      example.org:
        reverse: true

      # creates @ SOA $::fqdn hostmaster.example.com.
      2.0.192.in-addr.arpa:
        reverse: true
        contact: hostmaster.example.com.

## Tuning options
The Foreman installer supports automatic tuning of your environment using predefined tuning profiles.  These tuning profiles are the result of a culmination of extensive learning from Foreman environments deployed at scale in large user environments.

When the foreman-installer is run, it is deployed with a `default` predefined tuning profile. Other than the default tuned profile, foreman-installer supports 4 different tuning profiles:

  * medium
  * large
  * extra-large
  * extra-extra-large

Based on your environment needs, use one of the tuning profiles (`medium`, `large`, `extra-large`, `extra-extra-large`) in the installer.  For example, `medium` profile can be applied like:

```bash
foreman-installer --tuning medium
```

To reset to the default profile:

```bash
foreman-installer --tuning default
```

Use `foreman-installer --help | grep tuning` to identify the current tuning level.

Sample output for `medium` tuning:

```bash
foreman-installer --help | grep tuning
    --tuning INSTALLATION_SIZE    Tune for an installation size. Choices: default, medium, large, extra-large, extra-extra-large (default: "medium")
```

Sample output for `default` tuning:

```bash
foreman-installer --help | grep tuning
    --tuning INSTALLATION_SIZE    Tune for an installation size. Choices: default, medium, large, extra-large, extra-extra-large (default: "default")
```

**Note**

- Definitions of various tuning profiles can be found in this directory `/usr/share/foreman-installer/config/foreman.hiera/tuning/sizes/`.  Note that `common.yaml` is always applied and the selected tuning profile (e.g., `medium`) is applied on top and takes precedence.
- Using the `--tuning` option does not update `/etc/foreman-installer/custom-hiera.yml`, instead it directly updates the required configuration as specified in the corresponding tuning profile. You can still use `custom-hiera.yml` to override any configuration if really needed.
- If you had already used `custom-hiera.yml` and starting to use the tuned profiles, you may want to review the definition of tuned profiles (`/usr/share/foreman-installer/config/foreman.hiera/tuning/common.yaml` and `/usr/share/foreman-installer/config/foreman.hiera/tuning/sizes/`) and remove the duplicated configuration entries from your `custom-hiera.yml`.
- You can also optionally use `foreman-installer --tuning <profile> --noop` to run the installer in a test mode and identify what configurations will be changed before actually running the installer.

### Which tuning profile should you choose?

It is difficult to find the exact tuning profile for a specific environment in the first attempt because it depends on various factors like the number of managed hosts, the features used in scale (E.g., Remote Execution), the bulk actions on hosts, the total amount of content, amount of host traffic to foreman, etc.  Our recommendation is that you start with the tuning profile guidance as shown in the below table based on the number of managed hosts and scale up your environment as needed.

**Note**

- The information in the table below is just a guidance.  It is strongly recommended that you monitor the foreman environment regularly and tune up as required.
- The RAM and CPU Cores check is also integrated into the foreman-installer now. Use `disable-system-checks` if you like to skip this check in the installer.

{:class="table table-bordered table-condensed"}
| Tuned profile     |    Number of Managed hosts  |  Minimum Recommended RAM | Minimum Recommended CPU Cores |
|:------------------|:---------------------------:|:------------------------:|------------------------------:|
| default           |          up-to 5000         |            20G           |                4              |
| medium            |        5000 - 10000         |            32G           |                8              |
| large             |       10000 - 20000         |            64G           |               16              |
| extra-large       |       20000 - 60000         |           128G           |               32              |
| extra-extra-large |       20000 - 60000         |           256G           |               48              |

## Forklift

Foreman provides a git repository designed to streamline setup by setting up all the proper repositories. Forklift provides the ability to deploy a virtual machine instance via Vagrant or direct deployment on an already provisioned machine. For details on how to install using forklift, please see the [README](https://github.com/theforeman/forklift/blob/master/README.md).
