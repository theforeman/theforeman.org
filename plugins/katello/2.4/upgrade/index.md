---
layout: plugins/katello/documentation
version: 2.4
foreman_version: "1.10"
title: Katello Upgrade
---

# Katello Upgrade

Katello supports upgrades from version 2.0.  For users transitioning from 1.4, please see - [Transition Guide](/plugins/katello/{{ page.version }}/installation/2.0-transition.html).

## Step 1 - Backup

If Katello is running on a Virtual Machine, we reccomend to take a snapshot prior to upgrading. Otherwise, take a backup of the relevant databases by following the [instructions here](/plugins/katello/{{ page.version }}/user_guide/backup/).

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
  yum update -y http://fedorapeople.org/groups/katello/releases/yum/{{ page.version }}/katello/RHEL/6Server/x86_64/katello-repos-latest.rpm
  yum update -y http://yum.theforeman.org/releases/{{ page.foreman_version }}/el6/x86_64/foreman-release.rpm
{% endhighlight %}

  * RHEL7 / CentOS 7:

{% highlight bash %}
  yum update -y http://fedorapeople.org/groups/katello/releases/yum/{{ page.version }}/katello/RHEL/7Server/x86_64/katello-repos-latest.rpm
  yum update -y http://yum.theforeman.org/releases/{{ page.foreman_version }}/el7/x86_64/foreman-release.rpm
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

The installer with the --upgrade flag will run the right database migrations for all component services, as well as adjusting the configuration to reflect what's new in Katello {{ page.version }}

{% highlight bash %}
katello-installer --upgrade
{% endhighlight %}

**Congratulations! You have now successfully upgraded your Katello to {% if page.version %}{{ page.version }} For a rundown of what was added, please see [release notes](/plugins/katello/{{ page.version }}/release_notes/release_notes.html).{% else %}the latest nightly{% endif %}!**


If for any reason, the above steps failed, please review /var/log/katello-installer/katello-installer.log -- if any of the "Upgrade step" tasks failed, you may try to run them manaully below to aid in troubleshooting.

## Manual Steps

**Candlepin**

The database password is stored in /var/lib/puppet/foreman_cache_data/candlepin_db_password.

{% highlight bash %}
/usr/share/candlepin/cpdb --update --password <PASSWORD>
{% endhighlight %}

**Pulp**

{% highlight bash %}
sudo -u apache pulp-manage-db
{% endhighlight %}

**Foreman**

{% highlight bash %}
foreman-rake db:migrate
katello-service restart
foreman-rake db:seed
{% endhighlight %}

**Errata import**

{% highlight bash %}
foreman-rake katello:upgrades:2.1:import_errata
{% endhighlight %}
