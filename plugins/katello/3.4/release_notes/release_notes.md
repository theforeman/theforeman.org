---
layout: plugins/katello/documentation
robots: noindex
title: Release Notes
version: 3.4
---

# Katello 3.4 (Oud Bruin) Release Notes

For the full release notes, see the [Changelog](https://github.com/Katello/katello/blob/KATELLO-3.4/CHANGELOG.md).

## Features

#### File Repository Additions

The file repository has been enhanced with the addition of a top level page for seeing all file content for a given organization. As well, file content can now be managed per repository by seeing a list of files in a given repository and removing individual files.

#### Repository Force Sync

Two new options are now present when syncing to help alleviate two issues that users occasionally encounter. These options are available under the 'Advanced Sync' option under the repository details page and via Bulk Product selection. These issues are:

  1. I do not see content locally that is in the upstream repo and resyncing shows nothing new to sync (Complete Sync)
  2. Some rpm has become corrupt or been deleted locally and i need to force them to be resynced (Validate Content Sync)

#### Content View Force Republish

On a Content View Version publish or promotion, we were previously regenerating the metadata in the base Library version of the repository. This would happen even if nothing had changed in the repo, and caused pulp to perform extra steps during a Smart Proxy w/ Content sync as the revision number in the repomd.xml file had changed. Now we default to not regenerating the metadata if nothing has changed in the repo. The main benefit of this is that it speeds up Smart Proxy w/ Content syncs.

#### UI Overhaul

Katello 3.4 comes with UI improvements and over all changes to pages in Katello. The main pages no longer feature the master-detail view and are now single pages with transitions between using breadcrumbs.

#### Candlepin 2.0 Support

The addition of Candlepin 2.0 brings performance improvements for subscriptions and client actions that need to interact with the Candlepin API.
