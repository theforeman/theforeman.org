---
title: Release Notes
---

# Katello {{ page.version }} Release Notes

For the full release notes, see the [Changelog](https://github.com/Katello/katello/blob/KATELLO-3.16/CHANGELOG.md).

## Features

* Support for Pulpcore 3.4
* Pulp 2 to Pulp 3 File and Docker improvements
* Qpid replaced with ActiveMQ Artemis for messaging between Candlepin and Katello
* Subscription expiration notification emails
* Bulk Tracer remediation
* Installation of katello-host-tools-tracer from the Katello UI
* Validation Sync now available for Debian repositories

## Deprecations

* Puppet and OSTree repository types will no longer be available in Katello 4.0
* katello-agent will be removed in Katello 4.0
* Background download policy will be removed in Katello 4.0
* Pulp 3 will replace Pulp 2 in Katello 4.0
    * MongoDB will be removed in Katello 4.0
    * The Foreman installer MongoDB Storage Engine Migration Hook will be removed for Katello 4.0 

## Notes

* Katello 3.16 cannot be deployed on EL8 systems. Katello 4.0 will be deployable on EL8 systems.

## Bug Fixes

Katello 3.16 includes 103 bug fixes, which can be seen [here](https://projects.theforeman.org/projects/katello/issues?utf8=%E2%9C%93&set_filter=1&sort=id%3Adesc&f%5B%5D=status_id&op%5Bstatus_id%5D=c&f%5B%5D=fixed_version_id&op%5Bfixed_version_id%5D=%3D&v%5Bfixed_version_id%5D%5B%5D=1184&f%5B%5D=tracker_id&op%5Btracker_id%5D=%3D&v%5Btracker_id%5D%5B%5D=1&f%5B%5D=&c%5B%5D=tracker&c%5B%5D=status&c%5B%5D=priority&c%5B%5D=subject&c%5B%5D=author&c%5B%5D=assigned_to&c%5B%5D=updated_on&c%5B%5D=category&c%5B%5D=fixed_version&group_by=)

## Contributors

* Amir Fefer
* Avi Sharvit
* Bernhard Suttner
* Brad Buckingham
* Chris Roberts
* Dominik Matoulek
* Eric Helms
* Ewoud Kohl van Wijngaarden
* Ian Ballou
* James Jeffers
* Jeremy Lenz
* John Mitsch
* Jonathon Turel
* Justin Sherrill
* Marek Hulán
* Markus Bucher
* Michael Moll
* Oleh Fedorenko
* Ondřej Ezr
* Ondřej Pražák
* Partha Aji
* Samir Jha
* Shira Maximov
* Swetha Seelam Lakshmi Narayanan
* Tomer Brisker
* hao-yu
* kgaikwad
* loitho
