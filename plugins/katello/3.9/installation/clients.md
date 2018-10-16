---
layout: plugins/katello/documentation
title: Client Installation
version: 3.9
script: osmenu.js
---

# Client Installation

Client machines can be added in one of two ways: manually or via a provisioned host.

## Manual

Install the appropriate Katello client release packages.  For CentOS 6, you will also need to enable the COPR repository for subscription-manager.

<p>
  Select your Operating System:
  <select id="operatingSystems">
     <option value="el5">Enterprise Linux 5 (CentOS, etc.)</option>
     <option value="el6">Enterprise Linux 6 (CentOS, etc.)</option>
     <option value="el7">Enterprise Linux 7 (CentOS, etc.)</option>
     <option value="f27">Fedora 27</option>
     <option value="sles11">Suse Enterprise Linux Server 11</option>
     <option value="sles12">Suse Enterprise Linux Server 12</option>
  </select>
</p>

<div id="el5" markdown="1">
{% highlight bash %}
yum install -y http://fedorapeople.org/groups/katello/releases/yum/{{ page.version }}/client/el5/x86_64/katello-client-repos-latest.rpm
yum -y install http://dl.fedoraproject.org/pub/epel/epel-release-latest-5.noarch.rpm
{% endhighlight %}
</div>

<div id="el6" style="display:none;" markdown="1">
{% highlight bash %}
wget https://copr.fedoraproject.org/coprs/dgoodwin/subscription-manager/repo/epel-6/dgoodwin-subscription-manager-epel-6.repo -O /etc/yum.repos.d/dgoodwin-subscription-manager-epel-6.repo
yum -y install http://dl.fedoraproject.org/pub/epel/epel-release-latest-6.noarch.rpm
yum install -y http://fedorapeople.org/groups/katello/releases/yum/{{ page.version }}/client/el6/x86_64/katello-client-repos-latest.rpm
{% endhighlight %}
</div>

<div id="el7" style="display:none;" markdown="1">
{% highlight bash %}
yum install -y http://fedorapeople.org/groups/katello/releases/yum/{{ page.version }}/client/el7/x86_64/katello-client-repos-latest.rpm
yum -y install http://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
{% endhighlight %}
</div>

<div id="f27" style="display:none;" markdown="1">
{% highlight bash %}
yum install -y http://fedorapeople.org/groups/katello/releases/yum/{{ page.version }}/client/f27/x86_64/katello-client-repos-latest.rpm
{% endhighlight %}
</div>

<div id="sles12" style="display:none;" markdown="1">
{% highlight bash %}
rpm -Uvh https://fedorapeople.org/groups/katello/releases/yum/{{ page.version }}/client/sles12/x86_64/katello-client-repos-latest.rpm
{% endhighlight %}
</div>

<div id="sles11" style="display:none;" markdown="1">
{% highlight bash %}
# For python-datetime dependency, ensure that the SDK addon product is enabled see: https://www.suse.com/support/kb/doc/?id=70153.8
zypper modifyrepo -e nu_novell_com:SLES11-Extras
rpm -Uvh https://fedorapeople.org/groups/katello/releases/yum/{{ page.version }}/client/sles11/x86_64/katello-client-repos-latest.rpm
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

When provisioning new clients that should use Puppet 4, set a parameter called 'enable-puppet4' to 'true', so the templates know which package to install and where to place the configuration.  This parameter can be placed at the host, host group, or another appropriate level of the hierarchy.
