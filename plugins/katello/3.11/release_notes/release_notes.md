---
layout: plugins/katello/documentation
robots: noindex
title: Release Notes
version: '3.11'
---

# Katello 3.11 (Beautiful Disaster) Release Notes

## Bug Fixes

This release contains a substantial set of bug fixes. Some notable ones include:
- `hammer erratum list` showing errata across Organizations when --organization-id is specified
- Vague errors given when publishing a Content View when Docker repositories have conflicting container names
- Capsule sync not being triggered when uploading a packing to a custom repository in Library
- Potential race condition when creating multiple repositories on the same Product
- Subscription Status widget showing incorrect information on the Dashboard

For the full release notes see the [Changelog](https://github.com/Katello/katello/blob/KATELLO-3.11/CHANGELOG.md).
