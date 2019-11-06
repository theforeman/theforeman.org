---
robots: noindex
title: Capsule Upgrade
version: 3.2
foreman_version: 1.13
---

# Capsule Upgrade

## Step 1 - Operating System

Ensure your operating system is fully up-to-date:

{% highlight bash %}
yum -y update
{% endhighlight %}

**NOTE**: If kernel packages are updated here (e.g. upgrading el 6.6 to 6.7), you must reboot and ensure the new kernel and SELinux policy is loaded before upgrading Katello.

## Step 2 - Repositories

Update the Foreman and Katello release packages:

  * RHEL6 / CentOS 6 **Foreman packages are not available yet**:

{% highlight bash %}
  yum update -y https://fedorapeople.org/groups/katello/releases/yum/{{ page.version }}/katello/el6/x86_64/katello-repos-latest.rpm
  yum update -y https://fedorapeople.org/groups/katello/releases/yum/foreman/{{ page.foreman_version }}/el6/x86_64/foreman-release.rpm
{% endhighlight %}

  * RHEL7 / CentOS 7:

{% highlight bash %}
  yum update -y https://fedorapeople.org/groups/katello/releases/yum/{{ page.version }}/katello/el7/x86_64/katello-repos-latest.rpm
  yum update -y https://yum.theforeman.org/releases/{{ page.foreman_version }}/el7/x86_64/foreman-release.rpm
{% endhighlight %}

## Step 3 - Update Packages

Clean the yum cache

{% highlight bash %}
yum clean all
{% endhighlight %}

Update packages:

{% highlight bash %}
yum update -y
{% endhighlight %}

{% highlight bash %}
yum install katello-capsule
{% endhighlight %}

## Step 4 - Regenerate Certificates

On the Katello server, regenerate the certificates tarball for your capsule:

{% highlight bash %}
capsule-certs-generate --capsule-fqdn "mycapsule.example.com"\
                       --certs-tar    "~/mycapsule.example.com-certs.tar"
{% endhighlight %}

And copy them to your capsule:

{% highlight bash %}
scp ~/mycapsule.example.com-certs.tar mycapsule.example.com:
{% endhighlight %}

## Step 5 - Run Installer

The installer with the --upgrade flag will run the right database migrations for all component services, as well as adjusting the configuration to reflect what's new in Katello {{ page.version }}

{% highlight bash %}
foreman-installer --scenario capsule --upgrade\
                  --capsule-certs-tar ~/mycapsule.example.com-certs.tar\
                  --certs-update-all --certs-regenerate --deploy
{% endhighlight %}

**Congratulations! You have now successfully upgraded your Capsule to {% if page.version %}{{ page.version }} For a rundown of what was added, please see [release notes](/plugins/katello/{{ page.version }}/release_notes/release_notes.html).{% else %}the latest nightly{% endif %}!**

If for any reason, the above steps failed, please review /var/log/foreman-installer/capsule.log -- if any of the "Upgrade step" tasks failed, you may try to run them manaully below to aid in troubleshooting.
