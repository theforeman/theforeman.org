---
layout: plugins/katello/documentation
version: 3.0
title: Release Notes
---

# Katello 3.0 (Saison) Release Notes

{% if page.version and page.version != 'nightly' %}
For the full release notes, see the [Changelog](https://github.com/Katello/katello/blob/KATELLO-{{ page.version }}/CHANGELOG.md).
{% else %}
For the full release notes, see the [Changelog](https://github.com/Katello/katello/blob/master/CHANGELOG.md).
{% endif %}

## Features

### Scenario Installer

The installer has been updated to use the foreman-installer with a new feature known as scenarios. Scenarios provide a way to capture a precise set of installation options that can be re-used to install anything from a bare Foreman, to Katello to a Capsule. The initial scenarios being released are: Foreman, Katello and Caspule. For more information and examples, see the installation instructions.

### Host Unification

Prior to Katello 2.0, Hosts were represented by two objects, Hosts and Content Hosts. Under some circumstances these two objects would be linked together but under other workflows they were not. In addition only one Host could exist with a given hostname but many Content Hosts could be registered with the same hostname. As part of Katello 3.0 we have attempted to unify hosts and content hosts into a single object. The "Content Hosts" page still exists but eventually everything there would be integrated into a unified Hosts ui.

As a result of Host Unification there are many subtle changes:

 * Registering a host using subscription-manager now creates a host object if one does not exist
 * The "All Hosts" page and the "Content Hosts" page show the same list of host objects
 * The "Content Hosts" page provides the same scoped search auto-completion as "All Hosts"
 * Registering a host using subscription-manager will automatically reuse an existing host with the same hostname
 * Content Host pages dealing with subscriptions and content actions will show an appropriate error if you visit them for a Host that had not been registered with subscription-manager
 * Most 'hammer content-host' commands have moved to 'hammer host subscription' and 'hammer host content'

### OSTree Content

Users can now manage OSTree content through Katello in the same ways that RPM content can be managed. This includes creating OSTree repositories, syncing those repositories and adding them to content views. Similar to RPM content, Atomic machines can be provisioned from local OSTree content. 

### Lazy Sync

A new field has been added to repositories called download policy. With it, users can speed up repository synchronization by downloading only the repository's metadata and deferring the download of content until later. The three values for download policy are immediate, on demand, and background. For on demand synchronization, only the metadata is downloaded during sync and packages are fetched and stored on the filesystem when clients request them. For background syncs, a background task will download all packages after the initial sync. The immediate option is what Katello currently provides where all metadata and packages are downloaded during sync. Currently, lazy sync is only available for yum repositories.

### Docker V2

The management of Docker content has been upgraded to support Docker v2. This continues to involve the management of Docker content with repositories, syncing those repositories from an upstream registry and then publishing and promoting them through life cycle environments using content views. Docker v2 does, however, provide some fundamental differences with Docker v1. For example, rather than syncing Docker images and tags, the content synced will include manifests, tags and blobs. In addition, with Docker v2, there is no longer the ability to upload Docker content to a repository; therefore, repository syncing is the means to get that content in to Katello.

### Mirror On Sync

Repositories now have the option to be used in a "mirror on sync" state where the state of the repository mirrors that of the upstream repository at sync time. This results in packages no longer in the upstream repository being removed.

### Remote Execution Integration

It is possible now to use Foreman remote execution plugin to execute the content actions
(install package, errata etc.). This acts as an alternative to the current katello-agent capabilities
and allows to execute the actions over SSH (or other providers that will by the remote execution
plugin later). It also allows to customize the script to be run when executing the content action
as well as some advanced execution options (delayed run, recurring, splay time etc.).
See http://theforeman.org/plugins/foreman_remote_execution/ for more details on the remote execution plugin.

### Capsule Status on Proxy

Proxy detail page was extended to provide statistics about synchronized content grouped by lifecycle environments, usage of pulp storage to warn users when the capsule is running out of disc space and information about synchronization status. The latter displays progress of current tasks when the synchronization is running. It also allows for starting and cancelling the synchronization process.

The ability to cancel synchronizations as well as showing the content counts are now reflected in the cli. You can find it in commands hammer capsule content cancel-synchronization and hammer capsule content info. Please note that the command capsule has became an alias to proxy and they share the same subcommands.

### Inter-Server Sync

Users may now perform exports and imports of yum repositories to disk, either as a series of directories or as ISO files. This is especially useful for users in "air-gapped" network environments, where a Katello server might not have access to the Internet. Note that Inter-Server Sync (ISS) replaces the katello-disconnected tool. Additional information is available at (http://www.katello.org/plugins/katello/user_guide/disconnected/)[http://www.katello.org/plugins/katello/user_guide/disconnected/].

### 

## Deprecation Warnings

 * Katello 3.0 is a major update which means all deprecation warnings in 2.4 have been removed entirely.
 * The katello-installer has been deprecated in favor of the foreman-installer with scenarios. Please see the installation instructions.
 * Docker V1 has been removed from Katello 3.0 due to fundamental changes that are required to support Docker V2. Any repositories containing Docker V1 content will be removed when upgrading to 3.0.

## Contributors

Adam Price <komidore64@gmail.com>
Adam Ruzicka
Brad Buckingham <bbuckingham@redhat.com>
Bryan Kearney <bkearney@redhat.com>
Chris Duryee <cduryee@redhat.com>
Chris Peters <chrispeters.psu@gmail.com>
Christine Fouant <cfouant@redhat.com>
Daniel Lobato García <elobatocs@gmail.com>
David Davis <daviddavis@redhat.com>
Eric D Helms <ericdhelms@gmail.com>
Ivan Nečas <inecas@redhat.com>
John Mitsch <jomitsch@redhat.com>
Justin Sherrill <jsherril@redhat.com>
Kazuo Moriwaka
Marek Hulan
Martin Bačovský <martin.bacovsky@gmail.com>
Neil Miao <nmiao@redhat.com>
Ondrej Prazak <oprazak@redhat.com>
Partha Aji <paji@redhat.com>
Pavel Moravec <pmoravec@redhat.com>
Ranjan Kumar
Roman Plevka <rplevka@redhat.com>
Shlomi Zadok <shlomi@ben-hanna.com>
Stephen Benjamin <stbenjam@redhat.com>
Tom McKay <thomasmckay@redhat.com>
Tomas Strachota <tstrachota@redhat.com>
Walden Raines <walden@redhat.com>
Zach Huntington-Meath
thomasmckay <thomasmckay@redhat.com>
