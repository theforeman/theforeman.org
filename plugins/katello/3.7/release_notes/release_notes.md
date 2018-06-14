---
layout: plugins/katello/documentation
title: Release Notes
version: 3.7
---

# Katello 3.7 (Blonde Ale) Release Notes

For the full release notes, see the [Changelog](https://github.com/Katello/katello/blob/KATELLO-3.7/CHANGELOG.md).

## Known RC1 Issues
Upgrades from 3.6 to 3.7 are not fully functional due to a [failing database migration](http://projects.theforeman.org/issues/23942).


## Features


### New Red Hat Repositories Page
Completely redesigned with an eye toward usability and functionality.

### New Upstream Subscriptions API
For users with Red Hat content we now provide an API for managing subscriptions against existing manifests. Check the API documentation for details.

### Content Views
Composite content views can be configured to auto-publish when one of its components is changed.

### Client Tooling
Zypper and DNF plugins have been added to support errata applicability similar to Yum clients

### Backup and Restore Utilities
We are beginning to adopt [Foreman Maintain](https://theforeman.org/plugins/foreman_maintain/0.2/index.html) for Katello. Our first endeavor has been to utilize it for backup and restore capabilities.

The primary goals of this change are to:
* Centralize system operations in a single tool
* Support remote databases
* Support new Mongo versions (3.4)

**katello-backup and katello-restore are completely removed so please be sure to update any cron jobs or scripts using them.**

## Contributors
- agrawal
- Adam Ruzicka
- Andrew Kofink
- Bernhard Suttner
- Bryan Kearney
- Chris Duryee
- Chris Hale
- Christine Fouant
- Daniel Lobato Garcia
- Dan Seethaler
- Dmitri Dolguikh
- Eric D. Helms
- Evgeni Golov
- Ido Kanner
- Ivan Nečas
- John Mitsch
- Jonathon Turel
- Justin Sherrill
- kgaikwad
- ldjebran
- Lukas Zapletal
- Marek Hulan
- Masatake YAMATO
- Matthias Dellweg
- Michael Johnson
- Michael Moll
- Ondrej Prazak
- Partha Aji
- Paul Donohue
- Quirin Pamp
- Ranjan Kumar
- Samir Jha
- Sean O'Keeffe
- Sebastian Gräßl
- Shimon Shtein
- Stephen Benjamin
- Tomas Strachota
- Tom McKay
- Walden Raines
- Zach Huntington-Meath
