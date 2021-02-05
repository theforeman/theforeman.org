---
title: Use Foreman with Remote Databases
---

# Setup Remote Databases in Foreman with Katello Plugin Installed

Foreman with Katello plugin can be installed with remote databases for both postgresql and mongo. These instructions are for a Foreman with Katello plugin server, where remote databases are currently supported. This guide will refer to the server as "Foreman", with the assumption that the Katello plugin is installed.

## High level
There are two ways to deploy Foreman with remote databases:

1. [Fresh install](plugins/katello/{{ page.version }}/user_guide/remote_databases/index.html#fresh-install)
    * prepare Postgres server with databases for Foreman and Candlepin and dedicated users owning them
    * prepare Mongo DB with user owning the pulp_database
    * prepare box where the Foreman will be installed and make sure the databases are accessible from the box
    * run foreman-installer with right parameters pointing to the databases

2. [Migration of existing Foreman installation](plugins/katello/{{ page.version }}/user_guide/remote_databases/index.html#migration-of-existing-foreman)
    * prepare Postgres server with databases for Foreman a Candlepin and dedicated users owning them
    * prepare Mongo DB with user owning the pulp_databse
    * make sure the databases are accessible from the box where Foreman is installed
    * shut down the services except the dbs you want to move (mongod, postgresql)
    * dump the DBs
    * restore the DBs on remote servers
    * run foreman-installer with right parameters pointing to the databases. It re-configures the databases and start all the services with new DB locations

### Important notes:

* Pulpcore installs a separate PostgreSQL database. Databases should be upgraded to avoid conflicts.

In either scenario, both of the databases don't have to be remote. You can opt to use only a remote mongo database or only a remote postgresql database. Both postgresql and mongo databases can be on the same host, but this isn't recommended due to the amount of resources mongo can use.

## Prepare remote Postgres
GOAL: To use remote Postgres database with Foreman we have to:
* be able to access the databases from foreman box
* the database user we use to connect to the database needs to own the database, i.e. it can create, alter and delete the tables, indexes and constraints. Note it is not required to be able to create the database itself.

### Install Postgres
Warning: This is just minimal testing setup which is not suitable for production, please adjust the settings to your environment as needed.

Assume our postgres server has hostname `postgres.example.com`.

First, we install postgresql.

```
yum install -y postgresql-server postgresql-contrib
postgresql-setup initdb
systemctl enable --now postgresql
```

Now we need to make Postgres listen to inbound connections, please adjust these parameters to your own networking and security requirements. 

Edit `/var/lib/pgsql/data/postgresql.conf`. Uncomment `listen_address` and modify its value to look like: 
```
listen_address = "*"
```

The next step we need to take is to add a proper client authentication for remote client to our postgres server. To achieve the same, edit `/var/lib/pgsql/data/pg_hba.conf`.
Append the following line at the end of the file
```
host          all          all          <katello.example.com ip>/24              md5
```

Now restart the postgres service for changes to take effect
```
systemctl restart postgresql
```

### Create the databases
Switch the user role to postgres and start postgres client
```
su - postgres -c psql
```

Once inside the client, we need to create two databases and dedicated roles, one for foreman and one for candlepin.
```sql
CREATE USER "foreman" WITH PASSWORD '<FOREMAN_PASSWORD>';
CREATE USER "candlepin" WITH PASSWORD '<CANDLEPIN_PASSWORD>';
CREATE DATABASE foreman OWNER foreman;
CREATE DATABASE candlepin OWNER candlepin;
```

### Test it works
From `katello.example.com` test the DB is accessible:
```
PGPASSWORD='<FOREMAN_PASSWORD>' psql -h postgres.example.com  -p 5432 -U foreman -d foreman -c "SELECT 1 as ping"
```
```
PGPASSWORD='<CANDLEPIN_PASSWORD>' psql -h postgres.example.com  -p 5432 -U candlepin -d candlepin -c "SELECT 1 as ping"
```
If there are no errors we are done with database preparation. 

## Prepare remote Mongo
GOAL: To use remote Mongo database with Foreman we have to:
* be able to access the databases from foreman box
* the database user we use to connect to the database needs to own the database

### Install Mongo DB
Warning: This is just minimal testing setup which is not suitable for production.

Assume our Mongo server has hostname `mongo.example.com`.
Install and enable Mongo server
``` 
yum install -y centos-release-scl
yum install -y rh-mongodb34-syspaths
```
Enable authentication in `/etc/mongod.conf`
```
auth=true
```

Enable and start the service
```
systemctl enable --now mongod
```

### Create Pulp user and database 
```
mongo admin -u admin -p admin --eval "db.createUser({user:'pulp',pwd:'<PULP_PASSWORD>',roles:[{role:'dbOwner', db:'pulp_database'},{ role: 'readWrite', db: 'pulp_database'}]})"

```

### Test it works
From `katello.example.com` test the mongo DB is accessible:
```
mongo --host mongo.example.com -u pulp -p <PULP_PASSWORD> --port 27017 --eval 'ping:1' pulp_database
```
If there are no errors we are done with database preparation. 

## Fresh install

### Install katello package
We assume the box where the Foreman server will be installed has hostname `katello.example.com`.

Follow the [documentation](plugins/katello/{{ page.version }}/installation/index.html) to install the `katello` package and **do not run foreman-installer.** We need to use the remote database flags with the installer. Use the following steps once the katello rpm is installed.


### Prepare remote databases
Follow the instructions to [prepare remote mongo](plugins/katello/{{ page.version }}/user_guide/remote_databases/index.html#prepare-remote-mongo) and [prepare remote postgres](plugins/katello/{{ page.version }}/user_guide/remote_databases/index.html#prepare-remote-postgres) to make the remote database servers ready for installation.

### Run the installer
To install and configure Foreman we just need to run 
```
foreman-installer --scenario katello \
  --foreman-db-host postgres.example.com \ 
  --foreman-db-password <FOREMAN_PASSWORD> \
  --foreman-db-database foreman \
  --foreman-db-manage false
  --katello-candlepin-db-host postgres.example.com \
  --katello-candlepin-db-name candlepin \
  --katello-candlepin-db-password <CANDLEPIN_PASSWORD> \
  --katello-candlepin-manage-db false \
  --katello-pulp-db-username pulp \ 
  --katello-pulp-db-password <PULP_PASSWORD> \ 
  --katello-pulp-db-seeds “mongo.example.com:27017” \
  --katello-pulp-db-name pulp_database
  --katello-pulp-manage-db false
```

Note: for more related options and tips on SSL configuration see [Full list of options](plugins/katello/{{ page.version }}/user_guide/remote_databases/index.html#full-list-of-remote-database-related-options-in-the-installer)

## Migration of existing Foreman
Migrating an existing installation to remote databases can take time, so plan for some outage time (length depending on database size) while a backup is taken and the databases are migrated.

In this example, we assume that Foreman was installed and is running on `katello.example.com`.

### Prepare remote databases
Follow the instructions to [prepare remote mongo](plugins/katello/{{ page.version }}/user_guide/remote_databases/index.html#prepare-remote-mongo) and [prepare remote postgres](plugins/katello/{{ page.version }}/user_guide/remote_databases/index.html#prepare-remote-postgres) to make the remote database servers ready for migration.

### Stop the Foreman server
Stop the Foreman related services to minimize risk of the data changes during the migration
```
foreman-maintain service stop --exclude postgresql,rh-mongodb34-mongod
```

### Dump databases
Dump the local databases
```
foreman-maintain backup online --skip-pulp-content --preserve-directory -y /tmp/migration_backup
```

### Restore data in remote databases
You can restore the SQL dumps to the remote databases from the foreman system.

```
PGPASSWORD='<FOREMAN_PASSWORD>' pg_restore -h postgres.example.com -U foreman -d foreman < /tmp/migration_backup/foreman.dump
PGPASSWORD='<CANDLEPIN_PASSWORD>' pg_restore -h postgres.example.com -U candlepin -d candlepin < /tmp/migration_backup/candlepin.dump
mongorestore --host mongo.example.com --db pulp_database --username pulp --password <PULP_PASSWORD> /tmp/migration_backup/mongo_dump
```
Now the copy of the local database is also at the remote locations.

### Update the configuration
To update existing configuration of Foreman we just need to run 
```
foreman-installer --scenario katello \
  --foreman-db-host postgres.example.com \ 
  --foreman-db-password <FOREMAN_PASSWORD> \
  --foreman-db-database foreman \
  --foreman-db-manage false \
  --katello-candlepin-db-host postgres.example.com \
  --katello-candlepin-db-name candlepin \
  --katello-candlepin-db-password <CANDLEPN_PASSWORD> \
  --katello-candlepin-manage-db false \
  --katello-pulp-db-username pulp \ 
  --katello-pulp-db-password <PULP_PASSWORD> \ 
  --katello-pulp-db-seeds “mongo.example.com:27017” \
  --katello-pulp-db-name pulp_database \
  --katello-pulp-manage-db false
```
The installer start services aside from the database related services. Everything should be up and ready at this point, and you can clean up the local databases if you would like.

## Full list of remote database related options in the installer

Use `foreman-installer --full-help` for all up-to-date installer options

Foreman database related:
```
--foreman-db-manage           if enabled, will install and configure the database server on this host
--foreman-db-database         Database 'production' database (e.g. foreman)
--foreman-db-host             Database 'production' host
--foreman-db-password         Database 'production' password, default is randomly generated
--foreman-db-pool             Database 'production' size of connection pool (current: 5)
--foreman-db-port             Database 'production' port
--foreman-db-root-cert        Root cert used to verify SSL connection to postgres
--foreman-db-sslmode          Database 'production' ssl mode (disable|allow|prefer|require|verify-full)
--foreman-db-username         Database 'production' user (e.g. foreman)
```

Candlepin database related:
```
--katello-candlepin-db-host   Host with Candlepin DB
--katello-candlepin-db-name   Name of the Candlepin DB
--katello-candlepin-db-password  Candlepin DB password
--katello-candlepin-db-port   Port accepting connections to Candlepin DB
--katello-candlepin-db-ssl    Boolean indicating if the connection to the database should be over
--katello-candlepin-db-ssl-verify  Boolean indicating if the SSL connection to the database should be verified
--katello-candlepin-db-user   Candlepin DB user
--katello-candlepin-manage-db  Boolean indicating whether a database should be installed, this includes db creation and user
```

Mongo database related:
```
--katello-pulp-db-ca-path     The ca_certs file contains a set of concatenated "certification authority" certificates,
--katello-pulp-db-name        Name of the database to use
--katello-pulp-db-password    The password to use for authenticating to the MongoDB server
--katello-pulp-db-replica-set  The name of replica set configured in MongoDB, if one is in use
--katello-pulp-db-seeds       Comma-separated list of hostname:port of database replica seed hosts
--katello-pulp-db-ssl         Whether to connect to the database server using SSL.
--katello-pulp-db-ssl-certfile  The certificate file used to identify the local connection against mongod.)
--katello-pulp-db-ssl-keyfile  A path to the private keyfile used to identify the local connection against mongod. If
--katello-pulp-db-unsafe-autoretry  If true, retry commands to the database if there is a connection error.
--katello-pulp-db-username    The user name to use for authenticating to the MongoDB server
--katello-pulp-db-verify-ssl  Specifies whether a certificate is required from the other side of the connection, and
--katello-pulp-db-write-concern  Write concern of 'majority' or 'all'. When 'all' is specified, 'w' is set to number of
```

Pulpcore database related:
```
--foreman-proxy-content-pulpcore-manage-postgresql  Manage the Pulpcore PostgreSQL database.
--foreman-proxy-content-pulpcore-postgresql-db-name  Name of the Pulpcore database in PostgreSQL.
--foreman-proxy-content-pulpcore-postgresql-host  Host of the Pulpcore PostgreSQL database. Must be specified if external/unmanaged.
--foreman-proxy-content-pulpcore-postgresql-password  Password of the Pulpcore PostgreSQL database.
--foreman-proxy-content-pulpcore-postgresql-port  Port of the Pulpcore PostgreSQL database.
--foreman-proxy-content-pulpcore-postgresql-ssl  Enable SSL connection to the Pulpcore PostgreSQL database. Only meaningful for external/unmanaged DB.
--foreman-proxy-content-pulpcore-postgresql-ssl-cert  Path to SSL certificate to use for Pulpcore connection to PostgreSQL database.
--foreman-proxy-content-pulpcore-postgresql-ssl-key  Path to key file to use for Pulpcore connection to PostgreSQL database.
--foreman-proxy-content-pulpcore-postgresql-ssl-require  Configure Pulpcore to require an encrypted connection to the PostgreSQL database.
--foreman-proxy-content-pulpcore-postgresql-ssl-root-ca  Path to the root certificate authority to validate the certificate supplied by the PostgreSQL database server.
--foreman-proxy-content-pulpcore-postgresql-user  User of the Pulpcore PostgreSQL database.
```

The actual option names may vary between versions. Check the actual naming with foreman-installer --full-help.
The actual option names may vary between versions. Check the actual naming with foreman-installer --full-help.

### SSL configuration
Here is sample installer command that sets up Postgres databases with SSL verification. The Postgres server has its own CA. The CA cert used by Candlepin needs to be stored in system trust (`/etc/pki/java/cacerts`) as there is no other way to pass it to Candlepin

```
foreman-installer -S katello \
  --foreman-admin-password changeme \
  --foreman-db-host postgres.example.com \
  --foreman-db-password foreman \
  --foreman-db-database foreman_2 \
  --foreman-db-root-cert /etc/pki/ca-trust/source/anchors/ca-chain.cert.pem \
  --foreman-db-sslmode verify-full \
  --katello-candlepin-db-host postgres.example.com \
  --katello-candlepin-db-name candlepin_2 \
  --katello-candlepin-db-password candlepin \
  --katello-candlepin-db-ssl true \
  --katello-candlepin-manage-db false
```
