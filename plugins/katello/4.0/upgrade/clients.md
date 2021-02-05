---
title: Client Upgrade
script: osmenu.js
---

# Client Upgrade

When upgrading clients there are 2 scenarios: manually added clients and provisioned clients.

## Step 1 - Update Repositories

### Manually Added Clients

Update the Katello client release packages:

<p>
  Select your Operating System:
  <select id="operatingSystems">
     <option value="el5">Enterprise Linux 5 (RHEL, CentOS, etc.)</option>
     <option value="el6">Enterprise Linux 6 (RHEL, CentOS, etc.)</option>
     <option value="el7">Enterprise Linux 7 (RHEL, CentOS, etc.)</option>
     <option value="f29">Fedora 29</option>
     <option value="sles11">Suse Enterprise Linux Server 11</option>
     <option value="sles12">Suse Enterprise Linux Server 12</option>
  </select>
</p>

<div id="el5" markdown="1">
{% highlight bash %}
yum update -y https://yum.theforeman.org/client/{{ page.foreman_version }}/el5/x86_64/foreman-client-release.rpm
{% endhighlight %}
</div>

<div id="el6" markdown="1">
{% highlight bash %}
yum update -y https://yum.theforeman.org/client/{{ page.foreman_version }}/el6/x86_64/foreman-client-release.rpm
{% endhighlight %}
</div>

<div id="el7" markdown="1">
{% highlight bash %}
yum update -y https://yum.theforeman.org/client/{{ page.foreman_version }}/el7/x86_64/foreman-client-release.rpm
{% endhighlight %}
</div>

<div id="f29" markdown="1">
{% highlight bash %}
yum update -y https://yum.theforeman.org/client/{{ page.foreman_version }}/fc29/x86_64/foreman-client-release.rpm
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

### Provisioned Clients

<div class="alert alert-danger">
Katello-agent is deprecated and will be removed in a future release.
</div>

If the katello-agent was setup during provisioning from a locally synced repository then you will need to go through some [initial setup](/plugins/katello/{{ page.version }}/installation/clients.html) to add the {{ page.version }} client repositories to your Katello for each version needed. After you create the new repositories, they will then need to be added to the relevant content view(s) and the older versions removed. At this point, a new version of the content view can be published and promoted to the appropriate environments. Once the new package is available the clients can be updated following the next steps.

## Step 2: Update Packages

Clean the yum cache

{% highlight bash %}
yum clean all
{% endhighlight %}

Update packages:

{% highlight bash %}
yum update katello-agent
{% endhighlight %}
