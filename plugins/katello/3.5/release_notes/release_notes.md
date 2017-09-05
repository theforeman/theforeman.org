---
layout: plugins/katello/documentation
title: Release Notes
version: 3.5
---

# Katello 3.5 (Schwarzbier) Release Notes

For the full release notes, see the [Changelog](https://github.com/Katello/katello/blob/KATELLO-3.5/CHANGELOG.md).

## Features

#### Additional Supported Database Deployment Options

Users may now specify full database options for candlepin and foreman databases.
This allows use of remote databases. The following installer options are now available:

```
--foreman-db-manage                     if enabled, will install and configure the database server on this host
--reset-foreman-db-manage               Reset db_manage to the default value
--foreman-db-type                       Database 'production' type
--reset-foreman-db-type                 Reset db_type to the default value
--foreman-db-adapter                    Database 'production' adapter
--reset-foreman-db-adapter              Reset db_adapter to the default value
--foreman-db-database                   Database 'production' database
--reset-foreman-db-database             Reset db_database to the default value
--foreman-db-host                       Database 'production' host
--reset-foreman-db-host                 Reset db_host to the default value
--foreman-db-manage-rake                if enabled, will run rake jobs, which depend on the database
--reset-foreman-db-manage-rake          Reset db_manage_rake to the default value
--foreman-db-password                   Database 'production' password, default is randomly generated
--reset-foreman-db-password             Reset db_password to the default value
--foreman-db-pool                       Database 'production' size of connection pool
--reset-foreman-db-pool                 Reset db_pool to the default value
--foreman-db-port                       Database 'production' port
--reset-foreman-db-port                 Reset db_port to the default value
--foreman-db-root-cert                  Root cert used to verify SSL connection to postgres
--reset-foreman-db-root-cert            Reset db_root_cert to the default value
--foreman-db-sslmode                    Database 'production' ssl mode
--reset-foreman-db-sslmode              Reset db_sslmode to the default value
--foreman-db-username                   Database 'production' user
--reset-foreman-db-username             Reset db_username to the default value
--katello-candlepin-db-host             Host with Candlepin DB
--reset-katello-candlepin-db-host       Reset candlepin_db_host to the default value
--katello-candlepin-db-name             Name of the Candlepin DB
--reset-katello-candlepin-db-name       Reset candlepin_db_name to the default value
--katello-candlepin-db-password         Candlepin DB password
--reset-katello-candlepin-db-password   Reset candlepin_db_password to the default value
--katello-candlepin-db-port             Port accepting connections to Candlepin DB
--reset-katello-candlepin-db-port       Reset candlepin_db_port to the default value
--katello-candlepin-db-ssl              Boolean indicating if the connection to the database should be over
--reset-katello-candlepin-db-ssl        Reset candlepin_db_ssl to the default value
--katello-candlepin-db-ssl-verify       Boolean indicating if the SSL connection to the database should be verified
--reset-katello-candlepin-db-ssl-verify Reset candlepin_db_ssl_verify to the default value
--katello-candlepin-db-user             Candlepin DB user
--reset-katello-candlepin-db-user       Reset candlepin_db_user to the default value
```

#### Composite Content View Versions

Content view and composite content view versions along with their publication dates are now provided to the clients as a structured fact.

If you want a sample of why this might be useful: These facts are suitable for use in /etc/motd to provide end user feedback on the content accessible on a given host.

## Deprecation Warnings

## Contributors

 - Justin Sherrill
 - Walden Raines
 - Partha Aji
 - Brad Buckingham
 - Samir Jha
 - Andrew Kofink
 - John Mitsch
 - Jonathon Turel
 - Tom McKay
 - Daniel Lobato Garcia
 - Eric D. Helms
 - Marek Hulan
 - Dan Seethaler
 - Shimon Shtein
 - aagrawal
 - Chris Duryee
 - Nagoor Shaik
 - Ashish Humbe
 - Bryan Kearney
 - Ivan Nečas
 - Klaas Demter
 - Lukas Zapletal
 - Sean O\'Keeffe
 - Tomer Brisker
 - Chris Roberts
 - Christine Fouant
 - David Davis
 - Matthias Dellweg
 - Ondrej Prazak
 - Pat Riehecky
 - Ranjan Kumar
 - Sebastian Gräßl
