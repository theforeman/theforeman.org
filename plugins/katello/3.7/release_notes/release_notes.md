---
layout: plugins/katello/documentation
title: Release Notes
version: 3.7
---

# Katello 3.6 (Imperial IPA) Release Notes

For the full release notes, see the [Changelog](https://github.com/Katello/katello/blob/KATELLO-3.6/CHANGELOG.md).

## Warning

A disclaimer, we are aware of a bug in 3.6 where you cannot delete an organization that has a host. Before deleting an organization manually delete any host attached to that organization. [Issue on Redmine](http://projects.theforeman.org/issues/23262)

## Features

### Content View Optimizations

Performance improvements across the board have brought up to a 50% improvement in Content View Publishes, 95% improvement in Promotions, and a 95% improvement in Composite Content View publishes.

## Deprecation Warnings

#### File Repository Paths on Upgrade

Up until now file repositories were not able to be synced out to a proxy due to the URL path that the published file repositories were generated at. Katello 3.6 modifies the published path to mirror paths similar to how yum and puppet modules are published. This allows proper HTTPS serving of files repositories and syncing them out to proxy along with a more obvious and readable path. The downside of this needed change is that all file repositories are republished to a new path rendering all previous paths incorrect for any changes to the file repositories from the point of upgrade forward. The original file repository paths are left in tact, snapshotted at the point of the upgrade. This will allow a small window to update any infrastructure that relies on those file paths.

Old file repositories can be cleaned up at a user's discretion to reclaim disk space by running:

```bash
foreman-rake katello:cleanup_old_file_repos
```

## Contributors
 - Adam Ruzicka
 - Andrew Kofink
 - Brad Buckingham
 - Bryan Kearney
 - Chris Duryee
 - Christine Fouant
 - Dan Seethaler
 - Daniel Lobato Garcia
 - Daniel Lobato García
 - Eric D. Helms
 - Evgeni Golov
 - Ewoud Kohl van Wijngaarden
 - Himanshu
 - Ivan Nečas
 - John Mitsch
 - Jonathon Turel
 - Justin Sherrill
 - Klaas Demter
 - Lukas Zapletal
 - Marek Hulan
 - Masatake YAMATO
 - Matthias Dellweg
 - Michael Moll
 - Nagoor Shaik
 - Ondrej Prazak
 - Partha Aji
 - Paul Donohue
 - Ranjan Kumar
 - Sean O\'Keeffe
 - Sebastian Gräßl
 - Shimon Shtein
 - Shira Maximov
 - Stephen Benjamin
 - Tom McKay
 - Tomas Strachota
 - Tomer Brisker
 - Walden Raines
 - Zjhuntin
 - aagrawal
 - kgaikwad

