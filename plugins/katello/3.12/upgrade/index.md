---
title: Katello Upgrade
version: '3.12'
foreman_version: 1.22
---

# Katello Upgrade

Katello supports upgrades from the previous two versions only. Upgrades should be performed sequentially without skipping versions in between.

# Pre-upgrade

Before upgrading, run the upgrade check script that will check for any active tasks:

{% highlight bash %}
foreman-rake katello:upgrade_check
{% endhighlight %}

## Step 1 - Backup

If Katello is running on a virtual machine, we recommend to take a snapshot prior to upgrading. Otherwise, take a backup of the relevant databases by following the [instructions here](/plugins/katello/{{ page.version }}/user_guide/backup/).

## Step 2 - Operating System

Ensure your operating system is fully up-to-date:

{% highlight bash %}
yum -y update
{% endhighlight %}

## Step 3 - Repositories

Update the Foreman and Katello release packages:

  * RHEL7 / CentOS 7:

{% highlight bash %}
  yum update -y https://fedorapeople.org/groups/katello/releases/yum/{{ page.version }}/katello/el7/x86_64/katello-repos-latest.rpm
  yum update -y https://yum.theforeman.org/releases/{{ page.foreman_version }}/el7/x86_64/foreman-release.rpm
  yum update -y foreman-release-scl
{% endhighlight %}

## Step 4 - Update Packages

Clean the yum cache

{% highlight bash %}
yum clean all
{% endhighlight %}

Update the required packages:

{% highlight bash %}
yum -y update
{% endhighlight %}

## Step 5 - Run Installer

The installer with the --upgrade flag will run the right database migrations for all component services, as well as adjust the configuration to reflect what's new in Katello {{ page.version }}.

{% highlight bash %}
foreman-installer --scenario katello --upgrade
{% endhighlight %}

## Step 6 - Reboot if necessary
If kernel packages are updated during Step 2 the system must be rebooted to ensure the new kernel and SELinux policy are loaded. If there are no kernel or selinux updates
then this step can be omitted.

## Congratulations!
You have now successfully upgraded your Katello to {{ page.version }}.

{% if page.version != "nightly" %}
For a rundown of what was added, please see the [release notes](/plugins/katello/{{ page.version }}/release_notes/release_notes.html).
{% endif %}

If the above steps failed, please review /var/log/foreman-installer/katello.log and [let us know about it](https://community.theforeman.org/c/support) if unable to resolve.
