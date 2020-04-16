---
title: Katello Upgrade
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


## Pulp3 Migration

Katello 3.15 introduces Pulp 3 alongside Pulp 2.  For this release only Docker and File content types can be migrated to Pulp 3 via the migration process.  This process is optional for this release, but will need to be done by a future release.  Depending on how much File and Docker content is present, this can take a very long time.  The largest part of the process can be run without downtime.

1.  Migrate the content:

{% highlight bash %}
foreman-maintain advanced procedure run content-prepare
{% endhighlight %}

Note that this is run without downtime, while content and repositories are migrated in the background.  This can be run multiple times.

2. Perform the switchover to pulp3:

{% highlight bash %}
foreman-maintain advanced procedure run content-switchover
{% endhighlight %}

This will require some downtime to do the final switchover, but this will:

* Perform one last content migration
* Perform a check to verify everything that is needed has been migrated
* Re-run the installer to 'switch' over to pulp3

If you run into any issues with this process, please file a [support issue](https://community.theforeman.org/c/support/10) with '[ContentMigration]' in the subject.
