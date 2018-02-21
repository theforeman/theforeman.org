---
layout: post
title: Running Foreman with PostgreSQL 9.6 from Software Collections
date: 2018-02-16 11:25:10
author: Evgeni Golov
tags:
- foreman
- postgresql
---

When deploying Foreman on CentOS 7, you by default get PostgreSQL 9.2 as packaged in CentOS (and RHEL).
However PostgreSQL 9.2 is [officially EOL upstream](https://www.postgresql.org/support/versioning/) and newer versions bring various performance improvements which might benefit the Foreman installation.
This post will show how to deploy Foreman with PostgreSQL 9.6 from [SoftwareCollections.org](https://www.softwarecollections.org).

<!--more-->

Given the Foreman Installer will setup everything for us, we really only have to tell the Installer that we want a different version of PostgreSQL, where to find it and how it should be configured.

As the Installer does not have any command line options to configure PostgreSQL, we will have to create a `custom-hiera.yaml` with the required values.

Under the hood, the Installer is using the [puppetlabs-postgresql](https://github.com/puppetlabs/puppetlabs-postgresql/) Puppet module, so that is the source for our customization.
Initially I wanted to override the `postgresql::server::*` and `postgresql::client::*` values, as documented in the `README.md`, however doing so would require overriding *many* values, as the module generates many variables in `postgresql::params` based on the values from `postgresql::globals`.
Instead we will override the values directly in `postgresql::globals` and let all the other classes inherit our definitions.

Given that packages from [SoftwareCollections.org](https://www.softwarecollections.org) always come with a prefix for almost everything, we'll have to override the package names, systemd unit names and the data folder.

Luckily, the [PostgreSQL 9.6](https://www.softwarecollections.org/en/scls/rhscl/rh-postgresql96/) software collection also contains `syspaths` packages (`rh-postgresql96-postgresql-syspaths`, `rh-postgresql96-postgresql-server-syspaths`, etc), so that we won't have to worry about scripts expecting `/usr/bin/psql` or similar to exist ("normal" SCL packages don't touch `/usr/bin` and require a `scl enable NAME` to add the SCL-specific `bin` folder to your `PATH`). It also provides a `postgresql.service`, which is an alias for `rh-postgresql96-postgresql.service`.

Looking at [`postgresql::globals`](https://github.com/puppetlabs/puppetlabs-postgresql/blob/master/manifests/globals.pp) and [`postgresql::params`](https://github.com/puppetlabs/puppetlabs-postgresql/blob/master/manifests/params.pp), we come up with the following settings:

```yaml
postgresql::globals::version: '9.6'
postgresql::globals::client_package_name: rh-postgresql96-postgresql-syspaths
postgresql::globals::server_package_name: rh-postgresql96-postgresql-server-syspaths
postgresql::globals::contrib_package_name: rh-postgresql96-postgresql-contrib-syspaths
postgresql::globals::service_name: postgresql
postgresql::globals::datadir: /var/opt/rh/rh-postgresql96/lib/pgsql/data
postgresql::globals::confdir: /var/opt/rh/rh-postgresql96/lib/pgsql/data
postgresql::globals::bindir: /usr/bin
```

Just add these lines to `/etc/foreman-installer/custom-hiera.yaml` before running `foreman-installer` and we end up with Foreman running against a PostgreSQL 9.6.

There is one small issue with this setup, though. Probably because of [PUP-2169](https://tickets.puppetlabs.com/browse/PUP-2169) `/var/opt/rh/rh-postgresql96/lib/pgsql/data/postgresql.conf` is not getting the correct SELinux context when created by Puppet, and thus PostgreSQL fails to start. To fix that you'd need to either run the Installer in permissive mode and relabel the file afterwards (`restorecon -Rv /var/opt/rh/rh-postgresql96/lib/pgsql/data/postgresql.conf`), or expect the failure, relabel and re-run the installier a second time.

Don't worry that we see also PostgreSQL 9.2 packages in `rpm -qa`:

```
# rpm -qa |grep postgresql
foreman-postgresql-1.16.0-1.el7.noarch
rh-postgresql96-postgresql-9.6.5-1.el7.x86_64
rh-postgresql96-postgresql-libs-9.6.5-1.el7.x86_64
rh-postgresql96-postgresql-syspaths-9.6.5-1.el7.x86_64
rh-postgresql96-postgresql-server-syspaths-9.6.5-1.el7.x86_64
postgresql-libs-9.2.23-3.el7_4.x86_64
rh-postgresql96-runtime-3.0-10.el7.x86_64
rh-postgresql96-postgresql-server-9.6.5-1.el7.x86_64
```

`foreman-postgresql` requires `tfm-rubygem-pg` which is compiled against `postgresql-libs`, and that's totally fine, as this is only the client parts for Ruby that are running with an older `libpq`.

## quick setup with forklift

If you just want to try it out, and love [`forklift`](https://github.com/theforeman/forklift/) as I do, just get a version of `forklift` with my [`custom-hiera.yaml` PR](https://github.com/theforeman/forklift/pull/613) merged and create a box like this:

```
$ cat boxes.d/99-local.yaml
---
centos7-foreman-1.16-psql96:
  box: centos7
  ansible:
    playbook: playbooks/foreman.yml
    variables:
      foreman_repositories_version: 1.16
      puppet_repositories_version: 5
      selinux_state: permissive
      foreman_installer_custom_hiera: |
        postgresql::globals::version: '9.6'
        postgresql::globals::client_package_name: rh-postgresql96-postgresql-syspaths
        postgresql::globals::server_package_name: rh-postgresql96-postgresql-server-syspaths
        postgresql::globals::contrib_package_name: rh-postgresql96-postgresql-contrib-syspaths
        postgresql::globals::service_name: postgresql
        postgresql::globals::datadir: /var/opt/rh/rh-postgresql96/lib/pgsql/data
        postgresql::globals::confdir: /var/opt/rh/rh-postgresql96/lib/pgsql/data
        postgresql::globals::bindir: /usr/bin
```

and after a `vagrant up centos7-foreman-1.16-psql96` you should have it up and running.

Enjoy!
