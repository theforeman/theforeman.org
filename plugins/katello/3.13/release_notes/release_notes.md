---
layout: plugins/katello/documentation
title: Release Notes
version: 3.13
---

# Katello {{ page.version }} Release Notes

For the full release notes, see the [Changelog](https://github.com/Katello/katello/blob/master/CHANGELOG.md).

## Features

## Deprecation Warnings

* Katello used to use ElasticSearch, which was removed in Katello 3.0. After that the Installer would check and warn users if they would still have ElasticSearch installed. This check is now gone. If you still have ElasticSearch installed, please remove the RPMs (`ruby193-rubygem-tire tfm-rubygem-tire elasticsearch sigar-java sigar snappy-java lucene4-contrib lucene4`) and drop the database by deleting the `/var/lib/elasticsearch` folder.

## Contributors

