---
title: Client Installation
script: osmenu.js
---

# Client Installation

Client machines can be added in one of two ways: manually or via a provisioned host.

## Manual

Install the appropriate Katello client release packages.

<p>
  Select your Operating System:
  <select id="operatingSystems">
     <option value="el6">Enterprise Linux 6 (CentOS, etc.)</option>
     <option value="el7" selected="selected">Enterprise Linux 7 (CentOS, etc.)</option>
     <option value="el8">Enterprise Linux 8 (CentOS, etc.)</option>
     <option value="sles11">Suse Enterprise Linux Server 11</option>
     <option value="sles12">Suse Enterprise Linux Server 12</option>
  </select>
</p>

<div id="el6" markdown="1">
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

<div id="el8" markdown="1">
{% highlight bash %}
yum install -y https://yum.theforeman.org/client/{{ page.foreman_version }}/el8/x86_64/foreman-client-release.rpm
{% endhighlight %}
</div>

<div id="sles12" markdown="1">
{% highlight bash %}
rpm -Uvh https://yum.theforeman.org/client/{{ page.foreman_version }}/sles12/x86_64/foreman-client-release.rpm
{% endhighlight %}
</div>

<div id="sles11" markdown="1">
{% highlight bash %}
# For python-datetime dependency, ensure that the SDK addon product is enabled see: https://www.suse.com/support/kb/doc/?id=7015337
zypper modifyrepo -e nu_novell_com:SLES11-Extras
rpm -Uvh https://yum.theforeman.org/client/{{ page.foreman_version }}/sles11/x86_64/foreman-client-release.rpm
{% endhighlight %}
</div>

Now you are ready to install the client package:

The `katello-host-tools` package reports errata & package profile information, but does not allow you to run remote actions on the clients.

<div class="el6 el7 el8">
{% highlight bash %}
yum install katello-host-tools
{% endhighlight %}
</div>

<div class="el6 el7">
<div class="alert alert-danger">
Katello-agent is deprecated and will be removed in a future release.
</div>
We generally recommend using Foreman Remote Execution or Ansible for remote actions, but we also offer a messaging bus based client that does have some limitations when used with a large number of clients.

{% highlight bash %}
yum install katello-agent
{% endhighlight %}
</div>

<div class="el7 el8">
Optionally you can also install `katello-host-tools-tracer` and the client will report processes that need restarting after an update back to the Katello server.

{% highlight bash %}
yum install katello-host-tools-tracer
{% endhighlight %}
</div>

<div class="sles11 sles12" markdown="1">
For Suse Clients, only `katello-host-tools` is supported:

{% highlight bash %}
zypper install katello-host-tools
{% endhighlight %}
</div>

## Provisioned

<div class="alert alert-danger">
Katello-agent is deprecated and will be removed in a future release.
</div>

In order to install the katello-agent package on a host you are provisioning, you will need to make the appropriate client repository available within your Katello. The first step is to either create a new product or add to an existing product, the appropriate client repository from the dropdown in the [manual](/plugins/katello/{{ page.version }}/installation/clients.html#manual) section above. After you create the new repositories, they will need to be synced locally. Next, you will then need to add them to the relevant content view(s) for the hosts you are wanting to provision. At this point, a new version of the content view can be published and promoted to the appropriate environments that you are wanting to provision a host into. At this point, you can go provision a host and the host will install the katello-agent package during setup.

When provisioning new clients that should use Puppet 5, set a parameter called 'enable-puppet5' to 'true', so the templates know which package to install and where to place the configuration.  This parameter can be placed at the host, host group, or another appropriate level of the hierarchy.
