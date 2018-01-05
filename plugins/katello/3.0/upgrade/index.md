---
layout: plugins/katello/documentation
version: 3.0
foreman_version: 1.11
title: Katello Upgrade
---

# Katello Upgrade

Katello supports upgrades from version 2.0.  For users transitioning from 1.4, please see - [Transition Guide](/plugins/katello/{{ page.version }}/installation/2.0-transition.html).


# Pre-upgrade considerations

Katello 3.0 unifies Host and Conent Host objects to provide a more unified experience.  As a result, it is no longer allowed to have more than one Content Host with the same FQDN.  This matches the requirement that is already imposed on the Foreman Host object.  Upon upgrade to Katello 3.0 any Hosts that violate one of three rules will be deleted:

* More than one Content Host cannot exist with the same FQDN (all but the most recently registered will be deleted upon upgrade)
* Content Hosts must have a reported FQDN
* If a Host and a Content Host exist with the same FQDN, they must be within the same Organization.

Before upgrading if you would like to see a report of which Content Hosts will be deleted, a script is available as part of Katello 2.4.2.  To run the report run:

{% highlight bash %}
foreman-rake katello:preupgrade_content_host_check
{% endhighlight %}

The command will print the number of Content Hosts that will be deleted upon upgrade and generate a csv with the full list including the uuid, name, last checkin date, and a reason for their deletion.

# Upgrade Caveat

The upgrade of Pulp has the potential to take a lengthy amount of time. This is not an error, the migrations Pulp is performing are moving data and symlinks around which, depending on the amount of synced content and content views (thus symlinks) can result in long upgrade times. So if the upgrade Pulp step is taking a long time, please be patient. We advise users to plan their outage windows for upgrade around this potential. Some examples from the community of upgrade times:

~18 hours for 1.5TB /var/lib/pulp
~6 hours for 176GB /var/lib/pulp
~2 hours for 290GB /var/lib/pulp
~2-3 hours for 270GB /var/lib/pulp

## Step 1 - Backup

If Katello is running on a Virtual Machine, we recommend to take a snapshot prior to upgrading. Otherwise, take a backup of the relevant databases by following the [instructions here](/plugins/katello/{{ page.version }}/user_guide/backup/).

## Step 2 - Operating System

Ensure your operating system is fully up-to-date:

{% highlight bash %}
yum -y update
{% endhighlight %}

**NOTE**: If kernel packages are updated here (e.g. upgrading el 6.6 to 6.7), you must reboot and ensure the new kernel and SELinux policy is loaded before upgrading Katello.

## Step 3 - Repositories

Update the Foreman and Katello release packages:

  * RHEL6 / CentOS 6:

{% highlight bash %}
  yum update -y https://fedorapeople.org/groups/katello/releases/yum/{{ page.version }}/katello/el6/x86_64/katello-repos-latest.rpm
  yum update -y https://yum.theforeman.org/releases/{{ page.foreman_version }}/el6/x86_64/foreman-release.rpm
{% endhighlight %}

  * RHEL7 / CentOS 7:

{% highlight bash %}
  yum update -y https://fedorapeople.org/groups/katello/releases/yum/{{ page.version }}/katello/el7/x86_64/katello-repos-latest.rpm
  yum update -y https://yum.theforeman.org/releases/{{ page.foreman_version }}/el7/x86_64/foreman-release.rpm
{% endhighlight %}

## Step 4 - Update Packages

Clean the yum cache

{% highlight bash %}
yum clean all
{% endhighlight %}

Update the required packages:

{% highlight bash %}
yum update -y foreman-release-scl
yum -y update
{% endhighlight %}

## Step 5 - Run Installer

The installer with the --upgrade flag will run the right database migrations for all component services, as well as adjusting the configuration to reflect what's new in Katello {{ page.version }}

{% highlight bash %}
foreman-installer --scenario katello --upgrade
{% endhighlight %}

**Congratulations! You have now successfully upgraded your Katello to {% if page.version %}{{ page.version }} For a rundown of what was added, please see [release notes](/plugins/katello/{{ page.version }}/release_notes/release_notes.html).{% else %}the latest nightly{% endif %}!**


If for any reason, the above steps failed, please review /var/log/foreman-installer/katello.log -- if any of the "Upgrade step" tasks failed, you may try to run them manaully below to aid in troubleshooting.
