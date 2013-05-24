
The Foreman installer is a collection of Puppet modules that installs everything required for a full working Foreman setup.  It uses native OS packaging (e.g. RPM and .deb packages) and adds necessary configuration for the complete installation.

Components include the Foreman web UI, Smart Proxy, Passenger (for the puppet master and Foreman itself), and optionally TFTP, DNS and DHCP servers.  It is configurable and the Puppet modules can be read or run in "no-op" mode to see what changes it will make.

#### Supported platforms
* RHEL derivatives (CentOS), version 6 (EPEL required, plus subscribe to "optional" channel on RHEL 6)
* Debian 7 (Wheezy)
* Debian 6 (Squeeze) (update Puppet from backports)
* Ubuntu 12.04 (Precise)

The following platforms are currently unsupported, but will be supported in the final release:

* Fedora 17, 18
* RHEL derivatives (CentOS), version 5

Other operating systems will need to use alternative installation methods (see the manual).

### Installation
[The Foreman installer](https://github.com/theforeman/foreman-installer) uses Puppet to install Foreman. This guide assumes that you've already installed Puppet (without a master), but the installer will setup Foreman and the puppet master with Passenger and the [Smart Proxy](https://github.com/theforeman/smart-proxy) by default.

#### Downloading the installer

For **Red Hat variants**, run this (replace both instances of 'el6' with 'el5', 'f17' or 'f18' as appropriate):

{% highlight bash %}
yum -y install
http://yum.theforeman.org/rc/el6/x86_64/foreman-release-1.2.0-0.2.RC1.el6.noarch.rpm
yum -y install foreman-installer
{% endhighlight %}

For **Debian variants**, run this (replace 'wheezy' with 'precise' if on Ubuntu 12.04, or 'squeeze' for Debian 6):

{% highlight bash %}
echo "deb http://deb.theforeman.org/ wheezy rc" > /etc/apt/sources.list.d/foreman.list
wget -q http://deb.theforeman.org/foreman.asc -O- | apt-key add -
apt-get update && apt-get install foreman-installer
{% endhighlight %}

#### Running the installer

The procedure is initially interactive, allowing changes to the configuration and then the option is given to run Puppet to perform the installation:

{% highlight bash %}
ruby /usr/share/foreman-installer/generate_answers.rb
{% endhighlight %}

After Puppet runs, Foreman will be accessible at `https://fqdn/` with a default username/password of "admin" and "changeme".  To complete the installation, click on More, Configuration, Smart Proxies and add a new proxy with the URL `https://fqdn:8443/`.
