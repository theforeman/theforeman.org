---
title: Release Notes
---

# Katello {{ page.version }} Release Notes

For the full release notes, see the [Changelog](https://github.com/Katello/katello/blob/KATELLO-3.18/CHANGELOG.md).

## Features
* Pulp 3 updated to 3.7
* Debian content can now be managed with Pulp 3
* System Purpose can now be set in bulk from the Content Hosts list
* Repositories within custom products can now be associated with an OS version for better control over default enablement on Content Hosts (currently Red Hat Enterprise Linux only)
* Content host Traces can now be resolved with Hammer CLI
 * hammer host traces resolve --help
* The ability to export content to disconnected environments has been added to support Pulp 3 repos. See the API documentation and these new Hammer commands:
  * hammer content-export full library --help
  * hammer content-export full version --help
  * hammer content-export incremental library --help
  * hammer content-export incremental version --help
  * **These commands do not support Pulp 2 repositories**

## Deprecations
* katello-agent will be removed in a future Katello release. Consider migrating to use the Remote Execution plugin for managing content on your hosts
* Puppet and OSTree repository types will no longer be available in Katello 4.0
* Background download policy will be removed in Katello 4.0
* Pulp 3 will replace Pulp 2 in Katello 4.0
  * MongoDB will be removed in Katello 4.0
  * The Foreman installer MongoDB Storage Engine Migration Hook will be removed for Katello 4.0 

## Notes

* Katello 3.18 cannot be deployed on EL8 systems.

## Bug Fixes

Over 30 bugs fixed in this release! Check out the [release tracker](https://projects.theforeman.org/projects/katello/issues?c%5B%5D=tracker&c%5B%5D=status&c%5B%5D=priority&c%5B%5D=subject&c%5B%5D=author&c%5B%5D=assigned_to&c%5B%5D=updated_on&c%5B%5D=category&c%5B%5D=fixed_version&f%5B%5D=status_id&f%5B%5D=fixed_version_id&f%5B%5D=tracker_id&f%5B%5D=&group_by=&op%5Bfixed_version_id%5D=%3D&op%5Bstatus_id%5D=c&op%5Btracker_id%5D=%3D&page=1&set_filter=1&sort=id%3Adesc&utf8=%E2%9C%93&v%5Bfixed_version_id%5D%5B%5D=1272&v%5Btracker_id%5D%5B%5D=1).

## Contributors
* Adam Růžička
* Amir Fefer
* Bernhard Suttner
* Chris Roberts
* Ian Ballou
* James Jeffers
* Jan Bundesmann
* Jeremy Lenz
* John Mitsch
* Jonathon Turel
* Justin Sherrill
* Leos Stejskal
* Markus Bucher
* Ondrej Prazak
* Ondřej Ezr
* Partha Aji
* Ranjan Kumar
* Samir Jha
