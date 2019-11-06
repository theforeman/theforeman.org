---
robots: noindex
title: Client Installation
version: 3.1
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
     <option value="f22">Fedora 22</option>
     <option value="f23">Fedora 23</option>
  </select>
</p>

<div id="el5" markdown="1">
{% highlight bash %}
yum install -y https://fedorapeople.org/groups/katello/releases/yum/{{ page.version }}/client/el5/x86_64/katello-client-repos-latest.rpm
yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-5.noarch.rpm
{% endhighlight %}
</div>

<div id="el6" style="display:none;" markdown="1">
{% highlight bash %}
wget https://copr.fedoraproject.org/coprs/dgoodwin/subscription-manager/repo/epel-6/dgoodwin-subscription-manager-epel-6.repo -O /etc/yum.repos.d/dgoodwin-subscription-manager-epel-6.repo
yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-6.noarch.rpm
yum install -y https://fedorapeople.org/groups/katello/releases/yum/{{ page.version }}/client/el6/x86_64/katello-client-repos-latest.rpm
{% endhighlight %}
</div>

<div id="el7" style="display:none;" markdown="1">
{% highlight bash %}
yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
yum install -y https://fedorapeople.org/groups/katello/releases/yum/{{ page.version }}/client/el7/x86_64/katello-client-repos-latest.rpm
{% endhighlight %}
</div>

<div id="f22" style="display:none;" markdown="1">
{% highlight bash %}
yum install -y https://fedorapeople.org/groups/katello/releases/yum/{{ page.version }}/client/f22/x86_64/katello-client-repos-latest.rpm
{% endhighlight %}
</div>

<div id="f23" style="display:none;" markdown="1">
{% highlight bash %}
yum install -y https://fedorapeople.org/groups/katello/releases/yum/{{ page.version }}/client/f23/x86_64/katello-client-repos-latest.rpm
{% endhighlight %}
</div>

Now you are ready to install the katello-agent:

{% highlight bash %}
yum install katello-agent
{% endhighlight %}

## Provisioned

In order to install the katello-agent package on a host you are provisioning, you will need to make the appropriate client repository available within your Katello. The first step is to either create a new product or add to an existing product, the appropriate client repository from the dropdown in the [manual](#manual) section above. After you create the new repositories, they will need to be synced locally. Next, you will then need to add them to the relevant content view(s) for the hosts you are wanting to provision. At this point, a new version of the content view can be published and promoted to the appropriate environments that you are wanting to provision a host into. At this point, you can go provision a host and the host will install the katello-agent package during setup.
