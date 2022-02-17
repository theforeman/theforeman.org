---
title: Release Notes
---

# Katello {{ page.version }} Release Notes

For the full release notes, see the [Changelog](https://github.com/Katello/katello/blob/KATELLO-3.17/CHANGELOG.md).

## Features
* Improved speed on activation key page
* Improved errata status messaging
* Added messaging on content host details when changing content view
* Added deb package CLI support
* Hammer repository info now shows repo description

## Deprecations

* Puppet and OSTree repository types will no longer be available in Katello 4.0
* katello-agent will be removed in a future Katello release. Consider migrating to use the Remote Execution plugin for managing content on your hosts
* Background download policy will be removed in Katello 4.0
* Pulp 3 will replace Pulp 2 in Katello 4.0
    * MongoDB will be removed in Katello 4.0
    * The Foreman installer MongoDB Storage Engine Migration Hook will be removed for Katello 4.0 

## Notes

* Katello 3.17 cannot be deployed on EL8 systems.

## Bug Fixes

Katello 3.17 includes 40 bug fixes, which can be seen [here](https://projects.theforeman.org/projects/katello/issues?c%5B%5D=tracker&c%5B%5D=status&c%5B%5D=priority&c%5B%5D=subject&c%5B%5D=author&c%5B%5D=assigned_to&c%5B%5D=updated_on&c%5B%5D=category&c%5B%5D=fixed_version&f%5B%5D=status_id&f%5B%5D=fixed_version_id&f%5B%5D=tracker_id&f%5B%5D=&group_by=&op%5Bfixed_version_id%5D=%3D&op%5Bstatus_id%5D=c&op%5Btracker_id%5D=%3D&per_page=50&set_filter=1&sort=id%3Adesc&utf8=✓&v%5Bfixed_version_id%5D%5B%5D=1282&v%5Btracker_id%5D%5B%5D=1)

## Contributors

* Bernhard Suttner
* Chris Roberts
* Eric Helms
* Ewoud Kohl van Wijngaarden
* Ian Ballou
* James Jeffers
* Jan Bundesmann
* Jeremy Lenz
* John Mitsch
* Jonathon Turel
* Justin Sherrill
* Markus Bucher
* Oleh Fedorenko
* Ondřej Ezr
* Ondřej Pražák
* Partha Aji
* Piyush Tiwari
* Samir Jha
* Hao Yu