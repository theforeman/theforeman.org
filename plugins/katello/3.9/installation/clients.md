---
layout: plugins/katello/documentation
title: Client Installation
version: 3.9
foreman_version: '1.20'
script: osmenu.js
---

# Client Installation

Client machines can be added in one of two ways: manually or via a provisioned host.

## Manual

Install the appropriate Katello client release packages.

<p>
  Select your Operating System:
  <select id="operatingSystems">
     <option value="el5">Enterprise Linux 5 (CentOS, etc.)</option>
     <option value="el6">Enterprise Linux 6 (CentOS, etc.)</option>
     <option value="el7" selected="selected">Enterprise Linux 7 (CentOS, etc.)</option>
     <option value="f27">Fedora 27</option>
     <option value="f28">Fedora 28</option>
     <option value="sles11">Suse Enterprise Linux Server 11</option>
     <option value="sles12">Suse Enterprise Linux Server 12</option>
  </select>
</p>

<div id="el5" style="display:none;" markdown="1">
{% highlight bash %}
yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-5.noarch.rpm
yum install -y https://yum.theforeman.org/client/{{ page.foreman_version }}/el5/x86_64/foreman-client-release.rpm
{% endhighlight %}
</div>

<div id="el6" style="display:none;" markdown="1">
{% highlight bash %}
yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-6.noarch.rpm
yum install -y https://yum.theforeman.org/client/{{ page.foreman_version }}/el6/x86_64/foreman-client-release.rpm
{% endhighlight %}
</div>

<div id="el7" markdown="1">
{% highlight bash %}
yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
yum install -y https://yum.theforeman.org/client/{{ page.foreman_version }}/el7/x86_64/foreman-client-release.rpm
{% endhighlight %}
</div>

<div id="f27" style="display:none;" markdown="1">
{% highlight bash %}
yum install -y https://yum.theforeman.org/client/{{ page.foreman_version }}/fc27/x86_64/foreman-client-release.rpm
{% endhighlight %}
</div>

<div id="f28" style="display:none;" markdown="1">
{% highlight bash %}
yum install -y https://yum.theforeman.org/client/{{ page.foreman_version }}/fc28/x86_64/foreman-client-release.rpm
{% endhighlight %}
</div>

<div id="sles12" style="display:none;" markdown="1">
{% highlight bash %}
rpm -Uvh https://yum.theforeman.org/client/{{ page.foreman_version }}/sles12/x86_64/foreman-client-release.rpm
{% endhighlight %}
</div>

<div id="sles11" style="display:none;" markdown="1">
{% highlight bash %}
# For python-datetime dependency, ensure that the SDK addon product is enabled see: https://www.suse.com/support/kb/doc/?id=7015337
zypper modifyrepo -e nu_novell_com:SLES11-Extras
rpm -Uvh https://yum.theforeman.org/client/{{ page.foreman_version }}/sles11/x86_64/foreman-client-release.rpm
{% endhighlight %}
</div>

Now you are ready to install the client package:

The `katello-host-tools` package reports errata & package profile information, but does not allow you to run remote actions on the clients.

{% highlight bash %}
yum install katello-host-tools
{% endhighlight %}

We generally recommend using Foreman Remote Execution or Ansible for remote actions, but we also offer a messaging bus based client that does have some limitations when used with a large number of clients.

{% highlight bash %}
yum install katello-agent
{% endhighlight %}

Optionally you can also install `katello-host-tools-tracer` and the client will report processes that need restarting after an update back to the Katello server.

{% highlight bash %}
yum install katello-host-tools-tracer
{% endhighlight %}

For Suse Clients, only katello-host-tools is supported:

{% highlight bash %}
zypper install katello-host-tools
{% endhighlight %}

## Provisioned

In order to install the katello-agent package on a host you are provisioning, you will need to make the appropriate client repository available within your Katello. The first step is to either create a new product or add to an existing product, the appropriate client repository from the dropdown in the [manual](/plugins/katello/{{ page.version }}/installation/clients.html#manual) section above. After you create the new repositories, they will need to be synced locally. Next, you will then need to add them to the relevant content view(s) for the hosts you are wanting to provision. At this point, a new version of the content view can be published and promoted to the appropriate environments that you are wanting to provision a host into. At this point, you can go provision a host and the host will install the katello-agent package during setup.

When provisioning new clients that should use Puppet 5, set a parameter called 'enable-puppet5' to 'true', so the templates know which package to install and where to place the configuration.  This parameter can be placed at the host, host group, or another appropriate level of the hierarchy.
