---
title: Release Notes
version: '3.12'
---

# Katello {{ page.version }} Release Notes

## Features

### Errata Management
 * Load errata applications should allow filtering by date and result ([#26479](https://projects.theforeman.org/issues/26479), [ecb75c3c](https://github.com/Katello/katello.git/commit/ecb75c3c387f84ce6e0b0b748dd5bb7f6e9836cf))

### Tooling
 * Set license metadata ([#26385](https://projects.theforeman.org/issues/26385), [bb6a59c3](https://github.com/Katello/katello.git/commit/bb6a59c32ef614ae1ae95a12c523c5ba852ec052))

### Content Views
 * Dependency Resolution within content views + associated UI constructs. ([#26206](https://projects.theforeman.org/issues/26206), [7474c9d7](https://github.com/Katello/katello.git/commit/7474c9d72928d3d539c2e0f5cd85a06017c465c2))

### Hosts
 * Generate report for success/failed patching of content hosts between date ranges ([#25973](https://projects.theforeman.org/issues/25973), [76ca4f85](https://github.com/Katello/katello.git/commit/76ca4f85f2dddabcedabef8b5528c3f5ca75ef00))

### Repositories
 * Add Red Hat Satellite Maintenance 6 in recommended repositories ([#25920](https://projects.theforeman.org/issues/25920), [c5fe7210](https://github.com/Katello/katello.git/commit/c5fe7210a12df9103a980edb9ed3902f5d94743d))

### Other
 * Don't duplicate host record when hypervisor_id changes in virt-who report ([#26600](https://projects.theforeman.org/issues/26600), [86c91f89](https://github.com/Katello/katello.git/commit/86c91f89eaffed8f8b8ce2fe56fdeb0c9571d583), [1d0d2370](https://github.com/Katello/katello.git/commit/1d0d2370cf51c02439eb092d9a59073180437e70))

## Bug Fixes

### Errata Management
 * Errata counts aren't similar between the content-hosts view and the export csv ([#26678](https://projects.theforeman.org/issues/26678), [6696f876](https://github.com/Katello/katello.git/commit/6696f8768431b7f14ce8739665f629c1efd4487b))

### Puppet
 * Puppet environments are not synced to the capsules ([#26596](https://projects.theforeman.org/issues/26596), [f50741cd](https://github.com/Katello/katello.git/commit/f50741cd34a38310c30246c6aa0e39ddc770c0c5))
 * undefined method `backend_service' for nil:NilClass when publishing a CV with Puppet content ([#26410](https://projects.theforeman.org/issues/26410), [97c0da15](https://github.com/Katello/katello.git/commit/97c0da150c9ab08951e06d13bc585f09a1df708c))

### Hosts
 * Registering a system fails randomly (409 Conflict) ([#26191](https://projects.theforeman.org/issues/26191), [94fdc445](https://github.com/Katello/katello.git/commit/94fdc4456bffe91590be2294e90cad548f8dae24), [7f880082](https://github.com/Katello/katello.git/commit/7f8800822c7d43414347d3e33e3d3ab704afa48e), [40f4927b](https://github.com/Katello/katello.git/commit/40f4927bf53ee6b42fb6c1517e1961adf48d86f1))

### Content Views
 * Unable to promote content view version ([#26515](https://projects.theforeman.org/issues/26515), [7abd0cfc](https://github.com/Katello/katello.git/commit/7abd0cfc38aaa2796996aec20fc5626ca7c20518))

### Repositories
 * Recommended repositories page listing some non-relevant repositories ([#26303](https://projects.theforeman.org/issues/26303), [0f54fcaa](https://github.com/Katello/katello.git/commit/0f54fcaa4245e3c6ec1db41241e88cf32fa32f0d))
 * Red Hat Repositories does not show enabled repositories list with search criteria 'Enabled/Both' ([#25946](https://projects.theforeman.org/issues/25946), [9e770370](https://github.com/Katello/katello.git/commit/9e7703705eabd7809c9f0019d8934f0b667f129c))
 * Repo filtering is inconsistent ([#25875](https://projects.theforeman.org/issues/25875), [7d6135a6](https://github.com/Katello/katello.git/commit/7d6135a62437c49fba10b8ace9ebb8a59a6f794c))

### Hammer
 * hammer content-view update fails on --repositories ([#26091](https://projects.theforeman.org/issues/26091), [90e8f98a](https://github.com/Katello/hammer-cli-katello.git/commit/90e8f98af445e218d82f3d90a766d931c5cd8b00))

### GPG Keys
 * Satellite gpg key import removes newline ([#26463](https://projects.theforeman.org/issues/26463), [3249b27a](https://github.com/Katello/katello.git/commit/3249b27a9043bec01263a1a3a659f9499778e278))

### Subscriptions
 * Unable to add same subscription more than once in Satellite ([#25115](https://projects.theforeman.org/issues/25115))
 * Error when uploading a manifest file on the disconnected Server ([#25834](https://projects.theforeman.org/issues/25834), [8fb1cc5d](https://github.com/Katello/katello.git/commit/8fb1cc5d7bf8ed1372777acca48635169451d2fd))
 * manifest upload duplicate key value violates unique constraint ([#26412](https://projects.theforeman.org/issues/26412), [c71a605e](https://github.com/Katello/katello.git/commit/c71a605e4cd3f0d9b0abbe7ff3e7bf94ffde137b))


For the full release notes, see the [Changelog](https://github.com/Katello/katello/blob/KATELLO-3.12/CHANGELOG.md).