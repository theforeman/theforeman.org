---
layout: default
title: Foreman Quickstart Guide
---

# Summary
The "Foreman installer" is a collection of Puppet modules that installs different components needed to get a full working Foreman setup. These include the [smart proxy](https://github.com/theforeman/smart-proxy), Passenger (for the Puppet master and Foreman itself), and an optional TFTP server.

# Installation
[The Foreman installer](https://github.com/theforeman/foreman-installer) uses Puppet to install Foreman. This guide assumes that you've already installed Puppet itself, but the installer will setup Foreman and the Puppet master with Passenger, the [smart proxy](https://github.com/theforeman/smart-proxy), git, xinetd (on EL/Fedora systems), and a TFTP server.


## Downloading the installer
**Download the modules:**
{% highlight bash %} 
export MODULE_PATH="/etc/puppet/modules/common" 
mkdir -p $MODULE_PATH
for mod in apache foreman foreman_proxy git passenger puppet tftp xinetd; do
  mkdir -p $MODULE_PATH/$mod
  wget https://github.com/theforeman/puppet-$mod/tarball/master -O - | tar xzvf - -C $MODULE_PATH/$mod --strip-components=1
done;
{% endhighlight %}

**To install Foreman and proxy:**
{% highlight bash %}
echo include foreman, foreman_proxy | puppet apply --modulepath /etc/puppet/modules/common
{% endhighlight %}


## Additional reading...
* [Managing a datacenter with Foreman and Puppet](http://engineering.yakaz.com/managing-an-infrastructure-datacenter-with-foreman-and-puppet.html)
* [EC2 provisioning using Foreman](/2012/05/ec2-provisioning-using-foreman.html)
* [Creating a new host using the Foreman API](/2012/01/creating-new-host-using-foreman-api.html)
* [Re-provisioning without PXE](/2012/01/re-provision-host-without-pxeboot.html)
