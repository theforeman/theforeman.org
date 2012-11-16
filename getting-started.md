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


# Downloading the installer
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
