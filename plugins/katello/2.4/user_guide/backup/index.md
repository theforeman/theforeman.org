---
robots: noindex
version: 2.4
title: Backup
---

# Backup

## Prepare Backup

In the following sections we will be using /backup directory as our targed directory that will hold backup archives. Let's prepare it now.

All the following commands are executed under root system account.

```
export BDIR=/backup
umask 0027
mkdir -p $BDIR
chgrp postgres $BDIR
chmod 770 $BDIR
cd $BDIR
```

## Backup system files

It is necessary to backup configuration files and important data files. Being in the $BDIR execute:

```
tar --selinux -czvf config_files.tar.gz \
/etc/katello-installer \
/etc/foreman \
/etc/elasticsearch \
/etc/candlepin \
/etc/pulp \
/etc/pki/katello \
/etc/pki/pulp \
/etc/gofer \
/etc/qpid \
/etc/qpidc.conf \
/etc/qpidd.conf \
/etc/sysconfig/katello \
/etc/sysconfig/foreman \
/etc/sysconfig/elasticsearch \
/root/ssl-build \
/var/www/html/pub \
/usr/share/katello/candlepin-cert.crt

tar --selinux -czvf elastic_data.tar.gz /var/lib/elasticsearch
```

Please note some of these directories are created after katello-installer is executed for the first time.

## Repositories

For backing up Pulp repositories we will not use compression program, because RPM files have usually low compression ration and depending on the instance size the pulp_data.tar archive can be quite big.

### Option One: Online repositories backup

There are two options to backup repositories. First one is to do checksum of all timestamps, do the backup and do the checksum again. If both checksums match, the online backup is correct and can be used. Otherwise you need to start over. Pulp does not support online repositories backup.

```
find /var/lib/pulp -printf '%T@\n' | md5sum
tar --selinux -cvf pulp_data.tar /var/lib/pulp /var/www/pub
find /var/lib/pulp -printf '%T@\n' | md5sum
```

Tip: Use rsync for speeding up file copying so checksums are likely to match.

Option Two: Offline repositories backup

The second option is to bring Pulp server down and do the backup, then to start it up. Please note yum clients and Katello won't be able to connect and all actions with repositories will fail.

```
katello-service stop
tar --selinux -cvf pulp_data.tar /var/lib/pulp /var/www/pub
katello-service start
```


## Backup PostgreSQL

In this section we are going to backup Katello PostgreSQL database. pg_dump performs on-line database backups, therefore it is not necessary to stop PostgreSQL or Katello and this process does not block logged users, but it can take minutes to finish depending on size of databases.

```
su postgres -c "pg_dump -Fc foreman > $BDIR/foreman.dump"
su postgres -c "pg_dump -Fc candlepin > $BDIR/candlepin.dump"
```

## Backup MongoDB

To backup pulp database (MongoDB) on-line tool can be used while the database is running. In the $BDIR execute the following command:

```
mongodump --host localhost --out $BDIR/mongo_dump
```

Please note the tool should create $BDIR/mongo_dump/pulp_database directory with a bunch of json files. You can optionally compress the data - the ratio should be quite good. For more information consult mongodump man page or visit http://www.mongodb.org/display/DOCS/Backups


### Optional: Offline Database Backup

We have backed up databases with on-line tools in the next paragraphs, but you can also backup data offline files using the following commands. Please note whole Katello instance must be turned off completely. We recommended to do this optional backup from time to time during your maintanance windows.

```
tar --selinux -czvf mongo_data.tar.gz /var/lib/mongodb
tar --selinux -czvf pgsql_data.tar.gz /var/lib/pgsql/data/
```

## Final check-up

```
ls $BDIR
candlepin.dump
config_files.tar.gz
elastic_data.tar.gz
katello.dump
mongo_dump/
pulp_data.tar
```

If you did offline database backups, you will see additional two files:

```
mongo_data.tar.gz
pgsql_data.tar.gz
```

Katello instance should be up and running. Next chapter is dedicated to restoring a backup.

# Restore

## Prepare restore

Before starting restore process, make sure you have the system in the same configuration, it is recommended to make sure the very same package versions and errata is applied as it was on the original system. Also make sure SELinux contexts are correct:

```
restorecon -Rnv /
```

We are assuming restore is going to happen on the same server the instance from the backup was installed on. All services must be stopped prior restoring the data (if installed):

```
katello-service stop
```

If the original system is not avaiable it is necessary to reinstall the same version of Katello, restore the files, and then run katello-installer.  **The hostname must rename the same, otherwise you will need to regenerate all SSL certificates.**

```
yum -y install katello
tar --selinux -xzvf config_files.tar.gz -C /tmp
katello-installer
```

Please note the following process describes full Katello backup restore and it deletes all data that are still loaded. Make sure you are restoring the correct instance. All commands are executed as root in the directory with backup archives created in the Backup chapter above.

```
export BDIR=/backup
chgrp postgres -R $BDIR
cd $BDIR
```

## Restore system files

Note: It is a good idea to make additional backup of configuration files before they gets overwritten from the backup. You can do this executing command from Step 2 from the Backup section (Backup the configuration and data files), so the files can be extracted and examined with a GNU diff tool if a problem occurs.

System files restore must be done as root as well. Please double check you are extracting on the correct host. To restore all system files the following commands must be executed from the $BDIR directory:

```
tar --selinux -xzvf config_files.tar.gz -C /
tar --selinux -xzvf elastic_data.tar.gz -C /
tar --selinux -xvf pulp_data.tar -C /
```

## Restore PostgreSQL databases

First of all we need to drop existing database, if there is any. Make sure PostgreSQL is running and drop all databases we are going to restore.

```
service postgresql start
su postgres -c "dropdb foreman"
su postgres -c "dropdb candlepin"
```

If you get an error "database xxx is being accessed by other users" during database drop step, make sure all processes are stopped by running:

```
katello-service stop
```

To restore Katello and Candlepin PostgreSQL databases use the following commands.

```
su postgres -c "pg_restore -C -d postgres $BDIR/foreman.dump"
su postgres -c "pg_restore -C -d postgres $BDIR/candlepin.dump"
```

For more info about PostgreSQL backups consult pg_restore manual page or visit http://www.postgresql.org/docs/8.4/static/backup.html

## Restore MongoDB database

First make sure MongoDB is running:

```
service mongod start
```

To recover the MongoDB database, make sure the old data are deleted:

```
echo 'db.dropDatabase();' | mongo pulp_database
```

You will need to provide --username and --password when In the directory with backup archives execute the following command:

```
mongorestore --host localhost mongo_dump/pulp_database/
```

For more information consult mongorestore man page or visit http://www.mongodb.org/display/DOCS/Backups

## Finish restore

Now it's the time to start all processes.

```
katello-service start
```

Check log files for errors, such as /var/log/foreman/production.log and /var/log/messages.
