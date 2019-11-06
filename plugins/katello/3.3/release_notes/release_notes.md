---
robots: noindex
title: Release Notes
version: 3.3
---

# Katello 3.3 (Baltic Porter) Release Notes

For the full release notes, see the [Changelog](https://github.com/Katello/katello/blob/KATELLO-{{ page.version }}/CHANGELOG.md).

## Features

### Updated UI

Simplify UI by moving towards a single item view in accordance with patternfly best practices and in preparation for upcoming vertical navigation.

### Improved Manifest Import and Delete

Manifest import and delete actions have been refactored in anticipation of Candlepin 2.0. Now users are able to see a step-by-step breakdown of tasks for these actions in the Dynflow console.

### Username and Password for Repositories

Set the username and password on repositories that require authentication for access during synchronization.

### Package Applicability

See what packages need updating on your host. Previously only available via repositories with Errata, now you can see exactly what updates are available for each host and apply them directly.

### Content View Enhancements

 * Package Filtering by Architecture: Create package filters on yum content to either include or exclude packages based upon their architecture (e.g. noarch, x86_64, i386...etc).

 * Promote Version to Multiple Environments: Promote a content view version to multiple environments at once. Prior to 3.3, users could only promote a content view version to one environment at a time. This feature is currently only available via the API and CLI.

 * Publish "Latest" Version in Composite Content Views: When configuring a Composite Content View a specific version of each component is selected. Now you can simply select 'Latest' and at publish time the latest version will be calculated and used within the composite. 

 * Define and publish Composite Content Views Containing Overlapping Repositories: When configuring Composite Content Views, you can now select component views that were published from the same source repository.  Prior to Katello 3.3, if two component views were published using the same source repository (e.g. Centos7), they could not both be added to the same composite content view.

### Smart Proxy Content

Smart Proxies with content can now be configured with their own download policy. This allows the main server to synchronize the full contents of its configured repositories while the Smart Proxy can be configured to use an "On Demand" policy and only synchronize what is actually used by clients.

### Tracer Support

After updating packages on a host, a service will some times need to be restarted in order for the new version to take affect. Tracer is a utility to help detect these services and Katello 3.3 supports hosts reporting this information. To use this feature, simply update to the newest katello-agent and the reports will be sent whenever a package is updated. You can see what services need to be restarted and restart them via Remote Execution from the new Content Host Details Traces page.

## Deprecation Warnings

 * content view versions API deprecation warning: ("The parameter environment_id will be removed in Katello 3.4. Please update to use the environment_ids parameter.", https://github.com/Katello/katello/blob/master/app/controllers/katello/api/v2/content_view_versions_controller.rb#L257)

## Contributors

We’d like to thank the following people who contributed to the Katello 3.3 release:

Justin Sherrill
Brad Buckingham
Walden Raines
David Davis
Tom McKay
Partha Aji
Andrew Kofink
Chris Duryee
Daniel Lobato Garcia
Eric D. Helms
Ranjan Kumar
Stephen Benjamin
John Mitsch
Pavel Moravec
Bryan Kearney
Chris Roberts
Ondřej Pražák
Shimon Shtein
Swapnil Abnave
Tomer Brisker
Zach Huntington-Meath
Djebran Lezzoum
Amit Karsale
Ivan Nečas
June Zhang
Lukas Zapletal
Marek Hulan
Martin Bačovský
Sean O'Keeffe
Shlomi Zadok
kgaikwad
Thomas McKay
