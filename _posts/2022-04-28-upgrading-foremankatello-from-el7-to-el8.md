---
layout: post
title: 'Upgrading Foreman/Katello from EL7 to EL8'
date: 2022-04-28 10:24:54
author: Evgeni Golov
tags:
- foreman
- katello
- leapp
---

We've been [promising](https://community.theforeman.org/t/deprecation-plans-for-foreman-on-el7-debian-10-and-ubuntu-18-04/25008) [you](https://fosdem.org/2022/schedule/event/foreman_katello_leapp_elevate/) to publish how you can upgrade your Foreman and Katello installations from EL7 to EL8, but didn't deliver so far. We're very sorry about this, but the good news is, as you're reading this, we have a guide for you!

<!--more-->

## Prerequisites

* Foreman 3.2 / Katello 4.4 running on CentOS 7
    * This won't work on RHEL. You'd need a RHEL compatible LEAPP build for that.
* Internet access
    * Or a local repository server mirroring all required repositories and some editing of the instructions.
* No outstanding updates.
    * Things very well might work without that, but the suggested package cleanup below would totally fail.
* Ideally, you should have tried upgrading a plain CentOS7 system, before trying to do Foreman.

## Helpful links

Please have a look at these.

* [Upgrading from RHEL 7 to RHEL 8](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/8/html/upgrading_from_rhel_7_to_rhel_8/index)
* [ELevate Quickstart Guide](https://wiki.almalinux.org/elevate/ELevate-quickstart-guide.html)
* [ELevate project](https://wiki.almalinux.org/elevate/)

## Procedure

1. Configure the [`@theforeman/leapp` COPR Repository](https://copr.fedorainfracloud.org/coprs/g/theforeman/leapp/), which contains newer LEAPP packages than the ones shipped by AlmaLinux/ELevate and support upgrading Foreman/Katello:
   ```console
   # curl -o /etc/yum.repos.d/theforeman-leapp.repo https://copr.fedorainfracloud.org/coprs/g/theforeman/leapp/repo/epel-7/group_theforeman-leapp-epel-7.repo
   ```
2. Install required packages:
   ```console
   # yum install leapp leapp-repository leapp-data-centos
   ```
3. Add Foreman/Katello specific repositories to `/etc/leapp/files/leapp_upgrade_repositories.repo`.
   ```ini
   [leapp-foreman]
   name=Foreman 3.2
   baseurl=https://yum.theforeman.org/releases/3.2/el8/$basearch
   enabled=1
   gpgcheck=1
   gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-foreman
   module_hotfixes=1

   [leapp-foreman-plugins]
   name=Foreman plugins 3.2
   baseurl=https://yum.theforeman.org/plugins/3.2/el8/$basearch
   enabled=1
   gpgcheck=0
   gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-foreman
   module_hotfixes=1

   [leapp-foreman-client]
   name=Foreman client 3.2
   baseurl=https://yum.theforeman.org/client/3.2/el8/$basearch
   enabled=1
   gpgcheck=1
   gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-foreman-client

   [leapp-puppet7]
   name=Puppet 7 Repository el 8 - $basearch
   baseurl=http://yum.puppetlabs.com/puppet7/el/8/$basearch
   gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-puppet7-release
          file:///etc/pki/rpm-gpg/RPM-GPG-KEY-2025-04-06-puppet7-release
   enabled=1
   gpgcheck=1

   [leapp-katello]
   name=Katello 4.4
   baseurl=https://yum.theforeman.org/katello/4.4/katello/el8/$basearch/
   gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-foreman
   enabled=1
   gpgcheck=1
   module_hotfixes=1

   [leapp-katello-candlepin]
   name=Candlepin: an open source entitlement management system.
   baseurl=https://yum.theforeman.org/katello/4.4/candlepin/el8/$basearch/
   gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-foreman
   enabled=1
   gpgcheck=1
   module_hotfixes=1

   [leapp-pulpcore]
   name=pulpcore: Fetch, Upload, Organize, and Distribute Software Packages.
   baseurl=https://yum.theforeman.org/pulpcore/3.16/el8/$basearch/
   gpgkey=https://yum.theforeman.org/pulpcore/3.16/GPG-RPM-KEY-pulpcore
   enabled=1
   gpgcheck=1
   module_hotfixes=1
   ```

   * If you're not using Katello, you can leave out `leapp-katello`, `leapp-katello-candlepin` and `leapp-pulpcore`.
   * If you don't have the `foreman-client` repository enabled today, you can leave out `leapp-foreman-client`.
   * If you're using Puppet 6 instead of Puppet 7, adjust the `leapp-puppet7` entry accordingly (replacing `7` with `6` should work).
   * You need a Puppet repository, even if you don't use the Puppet Server functionality, for the Puppet Agent that the installer is using.
4. Remove `epel-release` as we don't support EL8 installations with EPEL8 enabled:
   ```console
   # yum remove epel-release
   ```
5. Remove `centos-release-scl` and `centos-release-scl-rh` repositories, as we don't need them anymore on EL8:
   ```console
   # yum remove centos-release-scl centos-release-scl-rh
   ```
6. Let LEAPP analyze your system:
   ```console
   # leapp preupgrade
   ```
   It is expected for the first run not to succeed but report issues/inhibitors, continue to the next step for remediations.
7. Fix issues found by LEAPP (most probably the following, check `/var/log/leapp/leapp-report.txt` for details):
   ```console
   # rmmod pata_acpi
   # echo PermitRootLogin yes | tee -a /etc/ssh/sshd_config
   # leapp answer --section remove_pam_pkcs11_module_check.confirm=True
   ```
   * If `preupgrade` aborts with a dependency resolution error (like `package rubygem-fx-0.5.0-2.el8.noarch requires rubygem(railties) >= 4.0.0, but none of the providers can be installed` or `package rubygem-railties-6.0.4.7-1.el8.noarch requires rubygem(thor) < 2.0, but none of the providers can be installed`), try:
     * removing packages that are not available from any repository anymore: `dnf remove $(dnf repoquery --extras --exclude '*katello*' --exclude '*pulp*' --exclude '*localhost*' --exclude "*$HOSTNAME*" --exclude libmodulemd)` -- check the output if it doesn't contain any of your own local packages. And yes, this command uses `dnf` on EL7, as it can clean up things better than `yum`.
     * removing `rubygem-thor` explicitly: `yum remove rubygem-thor`
7. Ensure `leapp preupgrade` is happy now
8. Run the upgrade:
   `leapp upgrade`
10. Reboot
11. After the reboot, a live system is booted that does the upgrade, followed by a reboot to fix SELinux labels, followed by a reboot into the final EL8 system
12. Once the system is booted, LEAPP will finish the upgrade, watch it with:
   `journalctl -u leapp_resume -f`
13. Done


## Known issues

* If you've installed the system and had to use `--disable-system-checks`, the very last step of the upgrade will fail, and you'll have to call `foreman-installer --disable-system-checks` manually once the system is booted up. We have a PR open ([#875](https://github.com/oamg/leapp-repository/pull/875)), but it hasn't been merged yet.
