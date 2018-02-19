---
layout: plugins/katello/documentation
title: Release Notes
version: 3.6
---

# Katello 3.6-RC1 (Imperial IPA) Release Notes

For the full release notes, see the [Changelog](https://github.com/Katello/katello/blob/KATELLO-3.6/CHANGELOG.md).

## Features

### RC-1 Notes

We have not compiled a complete list of major changes yet, but we will update this with a more complete list with the GA version of 3.6. Thanks for your paitence, if you're looking for more information please feel free to contact us or look at the changelog above.

## Deprecation Warnings

#### File Repository Paths on Upgrade

Up until now file repositories were not able to be synced out to a proxy due to the URL path that the published file repositories were generated at. Katello 3.6 modifies the published path to mirror paths similar to how yum and puppet modules are published. This allows proper HTTPS serving of files repositories and syncing them out to proxy along with a more obvious and readable path. The downside of this needed change is that all file repositories are republished to a new path rendering all previous paths incorrect for any changes to the file repositories from the point of upgrade forward. The original file repository paths are left in tact, snapshotted at the point of the upgrade. This will allow a small window to update any infrastructure that relies on those file paths.

Old file repositories can be cleaned up at a user's discretion to reclaim disk space by running:

```bash
foreman-rake katello:cleanup_old_file_repos
```

## Contributors
