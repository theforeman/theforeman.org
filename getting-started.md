---
layout: default
title: Getting Started
---
# Summary
The "Foreman installer" is a collection of Puppet modules that installs
different components needed to get a full working Foreman setup. These
include the [smart proxy](https://github.com/theforeman/smart-proxy),
Passenger (for the Puppet master and Foreman itself), and an optional
TFTP server.

# Installation
## Downloading the installer
**Download the modules:**
{% highlight bash %} 
export MODULE_PATH="/etc/puppet/modules/common" 
mkdir -p $MODULE_PATH
for mod in apache foreman foreman_proxy git passenger puppet tftp xinetd; do
  mkdir -p $MODULE_PATH/$mod
  wget http://github.com/theforeman/puppet-$mod/tarball/master -O - | tar xzvf - -C $MODULE_PATH/$mod --strip-components=1
done;
echo include puppet, puppet::server, foreman, foreman_proxy | puppet apply --modulepath $MODULE_PATH
{% endhighlight %}

**To install Foreman and proxy:**
{% highlight bash %}
echo include foreman, foreman_proxy | puppet --modulepath /etc/puppet/modules/common
{% endhighlight %}


## Additional reading...
* [Managing a datacenter with Foreman and Puppet](http://engineering.yakaz.com/managing-an-infrastructure-datacenter-with-foreman-and-puppet.html)
* [EC2 provisioning using Foreman](http://blog.theforeman.org/2012/05/ec2-provisioning-using-foreman.html)
* [Creating a new host using the Foreman API](http://blog.theforeman.org/2012/01/creating-new-host-using-foreman-api.html)
* [Re-provisioning without PXE](http://blog.theforeman.org/2012/01/re-provision-host-without-pxeboot.html)
