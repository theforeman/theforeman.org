---
layout: post
title: Migrating Foreman from MySQL to Postgresql
date: 2017-10-31 11:55:05
author: Timo Goebel
tags:
- foreman
---

<div class='alert alert-warning'><h2>
The <a href='/manuals/1.24/index.html#3.7MigratingtoPostgreSQL'>official Foreman manual</a> now contains the up to date and recommended migration procedure, please follow the instructions there.</h2>
</div>

While Foreman supports both MySQL and Postgresql as a database management system, Katello requires Postgresql. If you want to add the Katello plugin on an existing Foreman setup with MySQL, you need to migrate your database. But there are other reasons why you might want to switch your database management system. This blog post describes what steps are required to migrate your data.


While this blog post describes the required steps to migrate from MySQL to Postgresql, it can easily be adapted to migrate from Postgresql to MySQL.

## Be careful

First of all, a word of caution: This is not for the faint-hearted. And even fearless sysadmins should take backups before starting with this task. There is no guarantee, this will work. These steps have been tested with Foreman 1.15 but should work with other versions as well.

## Motivation

Postgresql and MySQL are both battle-tested open source database management systems. They have specific advantages and disadvantages. The most important reason to prefer one over the other is the available know-how in your organization. If you have a dedicated MySQL team that can provide a database for you, then you should by all means prefer that.
If you do not have anybody who can provide you with a database on either MySQL or Postgresql, I'd tend to the latter as Postgresql seems a little more robust.

## Prerequisites

This blog post assumes that you already have the source and target databases set up. Make sure to setup the Postgresql database with UTF-8 enabled.

First of all, you need to install support for either Postgresql or MySQL to Foreman. One of them will be missing. `yum install -y foreman-postgresql` adds support for Postgresql, `yum install -y foreman-mysql2` does the same for MySQL.

Next, stop all your foreman instances and make sure, they stay stopped for good. On RedHat systems, you need to stop the `httpd` and (if applicable) `foreman-tasks` service. Make sure that neither Puppet nor a monitoring system automatically starts these services again.

You can issue the MySQL command `SHOW FULL PROCESSLIST;` to show you all active connections to your MySQL database. Make sure, there are none.

If you are using the foreman-tasks plugin, you need to patch the script we are using to migrate the data. If you are not sure, wether you use this plugin, check if you have an entry `Tasks` in Foreman's Monitor menu. If you are still not sure, it is safe to apply the patch in any case.

```sh
wget -O /tmp/convert-tasks-patch.diff https://gist.githubusercontent.com/timogoebel/cd29e5206678ca0e0d78222af70583ec/raw/bbe998624098c1c3e656fe2582d33b0d9f9285aa/0001-convert-skip-foreman-tasks-tables.patch
yum install patch -y
cd /usr/share/foreman

patch -p1 < /tmp/convert-tasks-patch.diff
```

The foreman user that has access to your Postgresql database and is used for the conversion temporarily needs super user privileges.

```bash
## postgres@postgres:~  $ su - postgres
## postgres@postgres:~  $ psql
psql (9.6.2)
Type "help" for help.

postgres=# ALTER USER foreman WITH SUPERUSER;
ALTER ROLE
postgres=#
```

## Migrating

To migrate the data from one database to the other, we will use a rake task. You might already be familiar to this task from upgrading Foreman to a newer version.

`foreman-rake -T` lists all available tasks. We will be using `foreman-rake db:convert:prod2dev` to migrate the data.

Foreman internally uses a development framework called Rails. In Rails, you can have a specific configuration for e.g. a development and a production environment. Our prod2dev rake task assumes, that the source database is configured as the production database and the new target database is configured as the development database. All data in the development database will be overwritten.

You can configure the new database as Foreman's new development database by adding a new connection in `/etc/foreman/database.yml`.

It may look like this:

```yaml
# The new target database
development:
  adapter: postgresql
  host: postgres.example.com
  port: 5432
  database: foreman
  username: foreman
  password: "foreman"
  pool: 25

# The old source database
production:
  adapter: mysql2
  host: mysql.example.com
  port: 3306
  database: foreman
  username: foreman
  password: "foreman"
  pool: 25
```

The new database needs to be set up with all the tables required for Foreman to operate, so in order to prepare the new database to receive the actual data, we need to run all of Foreman's database migrations.

```sh
forman-rake db:migrate RAILS_ENV=development
```

Next, we can finally migrate all the data. This will take a long time depending on the size of your database. It is highly recommended to run this in a screen or tmux session.

```sh
forman-rake db:convert:prod2dev
```

## Wrapping up

Postgresql uses sequences in order to store the next free primary key id for a table. These sequences do not get updated by the rake tasks and have to be adjusted manually. On MySQL, this is not needed as the concept of sequences is not known there.

The Postgresql Wiki has a [script to repair the sequences](https://wiki.postgresql.org/wiki/Fixing_Sequences). Copy the script and save it to a file, e.g. `sequences.sql`. Then run it like this:

```sh
su - postgres
vim sequences.sql
# Paste the script and save the file
psql foreman -Atq -f reset.sql -o temp
psql -f temp --username postgres foreman
rm temp
```

Then, make sure to resore the original permissions of your foreman database user. This can be done on Postgresql by issuing this SQL command.

```sql
ALTER ROLE "foreman" NOSUPERUSER;
```

To switch your Foreman instance to the new database, you need to change the production database configuration in `/etc/foreman/database.yml` to point to the development installation we configured earlier. You can either do this manually or re-run foreman-installer with the new parameters for Postgresql.

Then you can finally start Foreman's services again.

```sh
systemctl start httpd.service
systemctl start foreman-tasks.service
```

## Conclusion

This blog post showed, how you can change your database management system and migrate Foreman's data. This can be one step of adding Katello on top of an existing Foreman setup or changing to a database management system you feel more comfortable with. We have noticed a small speed improvement with Postgresql over MySQL. But we changed from synchronous multi-master replication across datacenters to asynchronous replication, so the comparison is not fair. In addition, we did not tune the Postgresql cluster at all. Setting up a Postgresql cluster with synchronous replication was harder to do then a MySQL cluster with synchronous galera replication. The latter just works, the former requires you to take care of binary log files and does not offer an automatic failover. Although MySQL was easier to operate, Postgresql still feels more stable and robust in production.
