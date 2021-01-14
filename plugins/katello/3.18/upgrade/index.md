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

<p>Select your Operating System: <select id="operatingSystems">
   <option value="rhel7">Red Hat Enterprise Linux 7</option>
   <option value="el7">Enterprise Linux 7 (CentOS, etc.)</option>
   </select>
</p>

<div id="rhel7" markdown="1">
{% highlight bash %}
  yum update -y https://fedorapeople.org/groups/katello/releases/yum/{{ page.version }}/katello/el7/x86_64/katello-repos-latest.rpm
  yum update -y https://yum.theforeman.org/releases/{{ page.foreman_version }}/el7/x86_64/foreman-release.rpm
  subscription-manager repos --enable=rhel-server-rhscl-7-rpms
{% endhighlight %}
</div>

<div id="el7" markdown="1">
{% highlight bash %}
  yum update -y https://fedorapeople.org/groups/katello/releases/yum/{{ page.version }}/katello/el7/x86_64/katello-repos-latest.rpm
  yum update -y https://yum.theforeman.org/releases/{{ page.foreman_version }}/el7/x86_64/foreman-release.rpm
  yum install -y centos-release-scl-rh
{% endhighlight %}
</div>

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

The installer will run the right database migrations for all component services, as well as adjust the configuration to reflect what's new in Katello {{ page.version }}.

{% highlight bash %}
foreman-installer
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

Katello 3.18 supports migrations of Content to Pulp 3 for container, yum, and file content.  Depending on how much content is present, this can take a very long time.  The largest part of the process can be run without downtime.  This full process will need to be complete before upgrading to Katello 4.0.

### File system requirements

Upgrading to Pulp 3 does require some additional space, although the bulk of the content is not duplicated.  Ensure you have:

1.  80% of the space /var/lib/mongodb/ consumes available in /var/opt/rh/rh-postgresql12/lib/pgsql/.  (If /var/lib/mongodb is 100GB, then 80GB needs to be free for postgresql).
2.  200% of the space /var/lib/pulp/published/ consumes available within /var/lib/pulp/ (If /var/lib/pulp/published is taking 10GB, 20GB needs to be free in /var/lib/pulp/)

### Migration Steps


1.  Correct pulp 2 content permissions:

Due to a bug in Pulp 2.21.3 and earlier, content permissions need to be changed before migrating content.  If you are fully updated to pulp-rpm-plugins-2.21.4, this only needs to be done once before migrating:

{% highlight bash %}
chmod -R g+rwX /var/lib/pulp/content
find /var/lib/pulp/content -type d -perm -g-s -exec sudo chmod g+s {} \;
chgrp -R pulp /var/lib/pulp/content
{% endhighlight %}

These commands can be run without outage, but may take a long time depending on the amount of content and the latency of the filesystem.

2.  Check migration status:

To see how much content is left to be migrated and get a time estimate, you can run:

{% highlight bash %}
foreman-maintain content migration-stats
{% endhighlight %}

This can be run between migrations to see how much has changed since the last migration.

3.  Migrate the content:

{% highlight bash %}
foreman-maintain content prepare
{% endhighlight %}

Note that this is run without downtime, while content and repositories are migrated in the background.  This can be run multiple times.

4. Perform the switchover to pulp3:

{% highlight bash %}
foreman-maintain content switchover
{% endhighlight %}

This will require some downtime to do the final switchover, but this will:

* Perform one last content migration
* Perform a check to verify everything that is needed has been migrated
* Re-run the installer to 'switch' over to pulp3 for yum, docker, and file content.

If you run into any issues with this process, please file a [support issue](https://community.theforeman.org/c/support/10) with '[ContentMigration]' in the subject.

