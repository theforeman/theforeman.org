---
layout: plugin
title: Foreman Maintain 0.2 Manual
version: 0.2 
# uncomment for older versions than stable or nightly
#robots: noindex
---

# Foreman Maintain

For general information about Foreman Maintain, please check the [github repo](https://github.com/theforeman/foreman_maintain)

# Install

To install Foreman Maintain on Foreman instances, please run:
```
# yum install rubygem-foreman_maintain
```

Foreman Maintain is installed as a dependency in Katello 3.7 and up.

# Service management

Services can be managed using `foreman-maintain service`. For all options, run `foreman-maintain service --help`.

# Backup

### Supported systems
Backup and Restore in Foreman Maintain works on the following:
* Katello (>3.0)
* Foreman Proxy with Content (>3.0)

Backup and Restore support for standalone Foreman is currently in development.


### General
Note: We assume all the Foreman Maintain commands are run as a root user.

Backup utility in `foreman-maintain` offers three backup strategies
* Offline - The whole Katello instance will be turned off completely for the entire backup.
* Online - Backing up the repositories can take an extensive amount of time. You can perform a backup while online. In order for this procedure to succeed, you must not change or update the repositories database until the backup procedure is complete. Thus, you must avoid publishing, adding, or deleting content views, promoting content view versions, adding, changing, or deleting sync-plans, and adding, deleting, or syncing repositories during this time.
* Snapshot - The whole Katello instance will be turned off only for time necessary to create and mount logical volume snapshots. The backup is done from the snapshots after the instance is turned on again. This allows to minimize the maintenance window necessary for doing the backup.

### Incremental backup
Incremental backups can be used to only store the changes since the last backup:

First take a full backup (it is applicable for all strategies `offline` will be used in the examples):
```
foreman-maintain backup offline /tmp/backups
```
(This will create a new directory, /tmp/backups/katello-backup-YYYY-MM-DD-hh-mm-ss)

Take 1st incremental backup (this will create a new directory under /tmp/backups to house the new backup, just like the full backup directory):

```
foreman-maintain backup offline --incremental /tmp/backup/FULL_BACKUP_DIR /tmp/backups
```

Take 2nd incremental backup (again, this will create a new directory under /tmp/backups to house this second incremental backup):
```
foreman-maintain backup offline --incremental /tmp/backup/FIRST_INCREMENTAL_BACKUP_DIR /tmp/backups
```

#### Branching/rebasing incremental backups

If you would like to take a new incremental backup from the full backup, simply point the `--incremental` flag to the full backup directory. This newest backup directory will be incremental in relation to the full backup, not to the 2nd incremental backup. In other words, you don't always have to keep basing the incremental backups off the previous one, and you can have different "branches" of incremental backups.

```
foreman-maintain backup offline --incremental /tmp/backup/FULL_BACKUP_DIR /tmp/backups
```
An example script taking full backup on Sunday and incremental backup for all other weekdays would look like:

```bash
#!/bin/bash -e
DESTINATION=/var/backup
if [[ $(date +%w) == 0 ]]; then
  foreman-maintain backup offline $DESTINATION
else
  LAST=$(ls -td -- $DESTINATION/*/ | head -n 1)
  foreman-maintain backup offline --incremental "$LAST" $DESTINATION
fi
exit 0
```

### Skip Pulp repositories
There may be situations in which you want to backup a system without its repository information. You can skip backing up the Pulp database with the following option:
```
foreman-maintain backup <online|offline|snapshot> --skip-pulp-content /tmp/backup
```
`--skip-pulp-content` skips backing up /var/lib/pulp, this option is for debugging purposes or if you plan to copy /var/lib/pulp in other ways, such as rsync or shared storage. You will not have a complete backup if you use this option.

### Backup with remote databases
For local databases (PgSQL, MongoDB) we prefer to archive the whole database data directory when the service is down. With the databases located on remote servers it is not possible and we store a dump of the database instead. The dump is performed when all non-database related services are down and the server is in maintenance mode, so the data consistency is preserved.

For snapshot strategy, the dumps needs to be performed during the time when the services are down while the snapshots are created. The use of snapshotting will typically prolong the downtime necessary for a backup.

### Steps and skipping
In general every `foreman-maintain` command consists of one or more `steps`. Steps matching certain criteria becomes the execution scenario for the command. Certain steps can be explicitly excluded from the scenario using `--whitelist <comma-separated list of step labels>` option. E.g. lets do an online backup without metadata:

```
foreman-maintain backup online --whitelist backup-metadata  -y /tmp/some/dir
Starting backup: 2018-05-03 03:20:35 +0000
Running preparation steps required to run the next scenarios
================================================================================
Make sure Foreman DB is up: 
/ Checking connection to the Foreman DB                               [OK]      
--------------------------------------------------------------------------------
Make sure Mongo DB is up: 
- Checking connection to the Mongo DB                                 [OK]      
--------------------------------------------------------------------------------
Checks whether the tools for Mongo DB are installed:                  [OK]
--------------------------------------------------------------------------------
Make sure Candlepin DB is up: 
\ Checking connection to the Candlepin DB                             [OK]      
--------------------------------------------------------------------------------


Running Backup
================================================================================
Data consistency warning: 
*** WARNING: The online backup is intended for making a copy of the data
*** for debugging purposes only. The backup routine can not ensure 100% consistency while the
*** backup is taking place as there is a chance there may be data mismatch between
*** Mongo and Postgres databases while the services are live. If you wish to utilize the online backup
*** for production use you need to ensure that there are no modifications occurring during
*** your backup run.

                                                                      [OK]      
--------------------------------------------------------------------------------
Prepare backup Directory: 
Creating backup folder /tmp/some/dir/katello-backup-2018-05-03-03-20-35
                                                                      [OK]
--------------------------------------------------------------------------------
Check if the directory exists and is writable:                        [OK]
--------------------------------------------------------------------------------
Generate metadata:                                                    [SKIPPED]
--------------------------------------------------------------------------------
Backup config files: 
\ Collecting config files to backup                                   [OK]      
--------------------------------------------------------------------------------
Backup Pulp data: 
- Collecting Pulp data                                                [OK]      
--------------------------------------------------------------------------------
Backup Mongo online: 
| Getting dump of Mongo DB                                            [OK]      
--------------------------------------------------------------------------------
Backup Postgres global objects online:                                [OK]
--------------------------------------------------------------------------------
Backup Candlepin database online: 
\ Getting Candlepin DB dump                                           [OK]      
--------------------------------------------------------------------------------
Backup Foreman database online: 
- Getting Foreman DB dump                                             [OK]      
--------------------------------------------------------------------------------
Compress backup data to save space:                                   [OK]
--------------------------------------------------------------------------------

Done with backup: 2018-05-03 03:20:42 +0000
**** BACKUP Complete, contents can be found in: /tmp/some/dir/katello-backup-2018-05-03-03-20-35 ****
```
You can see the metadata step was skipped.

To see a list of available step labels use:
```
foreman-maintain advanced procedure run -h
``` 

In some cases it make sense to run one individual step, e.g. collect config files for debugging purposes:
```
# foreman-maintain advanced procedure run backup-config-files --backup-dir /tmp/backup
Running ForemanMaintain::Scenario
================================================================================
Backup config files: 
\ Collecting config files to backup                                   [OK]      
--------------------------------------------------------------------------------
```
 
### Directory names
By default the backup is stored in a subdirectory named `<katello|foreman|satellite|capsule>-backup-YYYY-MM-DD-hh-mm-ss` in a directory provided on a command line.

If you need to set the directory name yourself use switch `--preserve-directory` and the backup will be stored in the directory you provide on the command line. Be aware that user `postgres` needs write access to that directory if you have local PgSQL database.

```
foreman-maintain backup online -y --preserve-directory /tmp/my_backup_dir
Starting backup: 2018-05-03 04:03:22 +0000
Running preparation steps required to run the next scenarios
================================================================================
... LIST SHORTENED ...

Done with backup: 2018-05-03 04:03:41 +0000
**** BACKUP Complete, contents can be found in: /tmp/my_backup_dir ****
```
Note there was no subdirectory created. 

Also note that when using `--preserve-directory` no data is removed from the directory when the backup fails.

### Offline backup
Offline backup is the safe way to backup your server for later restoration. All the services are down during the backup and the instance is in a maintenance mode thus not accessible from outside. The instance is started normally after the backup completes.

Possible options are:
```
foreman-maintain backup offline -h
Usage:
    foreman-maintain backup offline [OPTIONS] BACKUP_DIR

Parameters:
    BACKUP_DIR                    Path to backup dir

Options:
    -y, --assumeyes               Automatically answer yes for all questions
    -w, --whitelist whitelist     Comma-separated list of labels of steps to be skipped
    -f, --force                   Force steps that would be skipped as they were already run
    -s, --skip-pulp-content       Do not backup Pulp content
    -p, --preserve-directory      Do not create a time-stamped subdirectory
    -t, --split-pulp-tar SPLIT_SIZE Split pulp data into files of a specified size, i.e. (100M, 50G). See '--tape-length' in 'info tar' for all sizes
    -i, --incremental PREVIOUS_BACKUP_DIR Backup changes since previous backup
    --features FEATURES           Foreman Proxy features to include in the backup. Valid features are tftp, dns, dhcp, openscap, and all. (comma-separated list)
    --include-db-dumps            Also dump full database schema before offline backup
    -h, --help                    print help
```
As the archives of Pulp data can be large it may be useful to split it into volumes using `--split-pulp-tar` options. 

There is also `--include-db-dumps` option to take extra dumps of the DBs and store them with the backup. Note the dumps are done with all the service running so the data integrity among DBs is not ensured. If you want to rely on the dumps during restore, make sure all the services but local DBs are down prior to running
the backup.

### Online backup
The online backup is intended for making a copy of the data for debugging purposes only.
The backup routine can not ensure 100% consistency while the backup is taking place as there is a chance there may be data mismatch between Mongo and Postgres databases while the services are live.

If you wish to utilize the online backup for production use you need to ensure that there are no modifications occurring during your backup run.

During this backup a dump of the underlying databases (PgSQL, Mongo) is done. While Pulp repositories are archived we check for changes in the data. When something changes, the backup is re-run automatically in order to make sure there no repo syncs, promotions, or other changes to the Pulp content performed during the backup. It is best to treat the server as read-only when an online backup is in process. The backup will run in perpetuity until consistent data is reached between the backup and file system.

Available options can be shown with the `--help` (`-h`) switch.
```
# foreman-maintain backup online -h                                                            
Usage:                                                                                                                                                                                               
    foreman-maintain backup online [OPTIONS] BACKUP_DIR                                                                                                                                              
                                                                                                                                                                                                     
Parameters:                                                                                                                                                                                          
    BACKUP_DIR                    Path to backup dir                                                                                                                                                 
                                                                                                                                                                                                     
Options:
    -y, --assumeyes               Automatically answer yes for all questions
    -w, --whitelist whitelist     Comma-separated list of labels of steps to be skipped
    -f, --force                   Force steps that would be skipped as they were already run
    -s, --skip-pulp-content       Do not backup Pulp content
    -p, --preserve-directory      Do not create a time-stamped subdirectory
    -t, --split-pulp-tar SPLIT_SIZE Split pulp data into files of a specified size, i.e. (100M, 50G). See '--tape-length' in 'info tar' for all sizes
    -i, --incremental PREVIOUS_BACKUP_DIR Backup changes since previous backup
    --features FEATURES           Foreman Proxy features to include in the backup. Valid features are tftp, dns, dhcp, openscap, and all. (comma-separated list)
    -h, --help                    print help
```
Sample run of online backup:

```
foreman-maintain backup online -y /tmp/some/dir        
Starting backup: 2018-04-30 20:20:45 +0000
Running preparation steps required to run the next scenarios
================================================================================
Make sure Foreman DB is up: 
/ Checking connection to the Foreman DB                               [OK]      
--------------------------------------------------------------------------------
Make sure Mongo DB is up: 
- Checking connection to the Mongo DB                                 [OK]      
--------------------------------------------------------------------------------
Checks whether the tools for Mongo DB are installed:                  [OK]
--------------------------------------------------------------------------------
Make sure Candlepin DB is up: 
| Checking connection to the Candlepin DB                             [OK]      
--------------------------------------------------------------------------------


Running Backup
================================================================================
Data consistency warning: 
*** WARNING: The online backup is intended for making a copy of the data
*** for debugging purposes only. The backup routine can not ensure 100% consistency while the
*** backup is taking place as there is a chance there may be data mismatch between
*** Mongo and Postgres databases while the services are live. If you wish to utilize the online backup
*** for production use you need to ensure that there are no modifications occurring during
*** your backup run.

                                                                      [OK]      
--------------------------------------------------------------------------------
Prepare backup Directory: 
Creating backup folder /tmp/some/dir/katello-backup-2018-04-30-20-20-45
                                                                      [OK]
--------------------------------------------------------------------------------
Check if the directory exists and is writable:                        [OK]
--------------------------------------------------------------------------------
Generate metadata: 
- Saving metadata to metadata.yml                                     [OK]      
--------------------------------------------------------------------------------
Backup config files: 
- Collecting config files to backup                                   [OK]      
--------------------------------------------------------------------------------
Backup Pulp data: 
\ Collecting Pulp data                                                [OK]      
--------------------------------------------------------------------------------
Backup Mongo online: 
/ Getting dump of Mongo DB                                            [OK]      
--------------------------------------------------------------------------------
Backup Postgres global objects online:                                [OK]
--------------------------------------------------------------------------------
Backup Candlepin database online: 
/ Getting Candlepin DB dump                                           [OK]      
--------------------------------------------------------------------------------
Backup Foreman database online: 
/ Getting Foreman DB dump                                             [OK]      
--------------------------------------------------------------------------------
Compress backup data to save space:                                   [OK]
--------------------------------------------------------------------------------

Done with backup: 2018-04-30 20:21:09 +0000
**** BACKUP Complete, contents can be found in: /tmp/some/dir/katello-backup-2018-04-30-20-20-45 ****
```

### Backup from snapshots
This kind of backup is similar to offline backup but it minimizes the down time necessary to perform the backup by doing the backup from disk snapshots. Taking the snapshots is the only time when the instance needs to be down while the rest of the backup can be performed with services up and accessible.

It is recommended to mount the snapshots to different logical volume than where the DBs are. Otherwise the snapshot size will be at least the size of the actual database. This is checked during the backup and warning is raised.

Possible options are:
```
# foreman-maintain backup snapshot -h
Usage:
    foreman-maintain backup snapshot [OPTIONS] BACKUP_DIR

Parameters:
    BACKUP_DIR                    Path to backup dir

Options:
    -y, --assumeyes               Automatically answer yes for all questions
    -w, --whitelist whitelist     Comma-separated list of labels of steps to be skipped
    -f, --force                   Force steps that would be skipped as they were already run
    -s, --skip-pulp-content       Do not backup Pulp content
    -p, --preserve-directory      Do not create a time-stamped subdirectory
    -t, --split-pulp-tar SPLIT_SIZE Split pulp data into files of a specified size, i.e. (100M, 50G). See '--tape-length' in 'info tar' for all sizes
    -i, --incremental PREVIOUS_BACKUP_DIR Backup changes since previous backup
    --features FEATURES           Foreman Proxy features to include in the backup. Valid features are tftp, dns, dhcp, openscap, and all. (comma-separated list)
    -d, --snapshot-mount-dir SNAPSHOT_MOUNT_DIR Override default directory ('/var/snap/') where the snapshots will be mounted (default: "/var/snap/")
    -b, --snapshot-block-size SNAPSHOT_BLOCK_SIZE Override default block size (2G) (default: "2G")
    -h, --help                    print help
```

### Backup security

A backup can contain sensitive information such as hostnames and ssh keys. We recommend that you store backups in a secure location or encrypt them.

Note: documentation based on [katello docs](https://theforeman.org/plugins/katello/nightly/user_guide/backup/index.html)

# Restore

Note: We assume all the Foreman Maintain commands are run as a root user.

`foreman-maintain restore` will restore any backup created using `foreman-maintain backup` or `katello-backup`. To restore your backup, run `foreman-maintain restore <BACKUP_DIR>`. All available options can be found with `foreman-maintain restore --help`.


### Important Warning

**Restore will drop databases and reset using foreman/satellite-installer.** After this, the databases are restored from backup. The command will display a yes/no prompt that can be bypassed using the `-y` flag. The warning looks like this:

```
WARNING: This script will drop and restore your database.
Your existing installation will be replaced with the backup database.
Once this operation is complete there is no going back.
Do you want to proceed?, [y(yes), q(quit)] y
```

### Backup Verification

The command will verify your backup has the correct files for the associated system present in the directory. This looks like the following (ran on katello system):

```
The given directory does not contain the required files or has too many files

All backup directories contain: config_files.tar.gz
An online or remote database backup directory contains: mongo_dump, candlepin.dump, foreman.dump
An offline backup directory contains: mongo_data.tar.gz, pgsql_data.tar.gz
A logical backup directory contains: mongo_dump, candlepin.dump, foreman.dump, mongo_data.tar.gz, pgsql_data.tar.gz
Including pulp_data.tar is optional and will restore pulp data to the filesystem if included.
```
### Restore Incremental Backups

You must restore incremental backups by first restoring the full backup, then the incremental backups in order sequentially starting with the oldest. i.e.

```
foreman-maintain restore /tmp/backups/FULL_BACKUP
foreman-maintain restore -i /tmp/backups/FIRST_INCREMENTAL
foreman-maintain restore -i /tmp/backups/SECOND_INCREMENTAL
```

In case you have multiple “branches” of incremental backups, you need to pick your full backup and each incremental one for the “branch” you wish to restore, in the order they were taken.

The previous incremental backup is kept in the backup's `metadata.yml` file under the `incremental` key. i.e:
```
incremental: /backup/offline-full/
```
Foreman-maintain will check for this key in metadata when restoring, `-i` is not needed for backups taken with foreman-maintain, but it is there to support older backups without that key present in the metadata.

### After Restore

Once the procedure is finished, all processes will be online, and all databases and system configuration will be reverted to the state and the time of the backup.

Check log files for errors, such as /var/log/foreman/production.log and /var/log/messages.

