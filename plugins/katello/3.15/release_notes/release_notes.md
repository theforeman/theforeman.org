---
title: Release Notes
---

# Katello {{ page.version }} Release Notes

For the full release notes, see the [Changelog](https://github.com/Katello/katello/blob/KATELLO-3.15/CHANGELOG.md).

## Features

* Improved experience for Simple Content Access users with clarified messaging and UI tweaks
* Errata can be searched by their issued date
* hammer gpg has been renamed to hammer content-credentials to match the UI
* Host updates will no longer use Dynflow for increased performance
* Repository support for pulpcore rpm content types.
* Improved visibility of pulp2 and pulpcore service responsibility in smart proxy service details
* Improved performance of Subscriptions list API
* Content count information is now stored on Content View Versions directly for increased performance

## Deprecations

* Puppet and OSTree repository types will no longer be available in Katello 3.16
* katello-agent will be removed in Katello 3.16

## Bug Fixes


Katello 3.15 includes 77 bug fixes, which can be seen [here](https://projects.theforeman.org/projects/katello/issues?utf8=%E2%9C%93&set_filter=1&sort=id%3Adesc&f%5B%5D=status_id&op%5Bstatus_id%5D=c&f%5B%5D=fixed_version_id&op%5Bfixed_version_id%5D=%3D&v%5Bfixed_version_id%5D%5B%5D=1131&f%5B%5D=tracker_id&op%5Btracker_id%5D=%3D&v%5Btracker_id%5D%5B%5D=1&f%5B%5D=&c%5B%5D=tracker&c%5B%5D=status&c%5B%5D=priority&c%5B%5D=subject&c%5B%5D=author&c%5B%5D=assigned_to&c%5B%5D=updated_on&c%5B%5D=category&c%5B%5D=fixed_version&group_by=)

## Contributors

* Avi Sharvit
* Brad Buckingham
* Chris Roberts
* Dhananjay Gupte
* Eric Helms
* Ian Ballou
* James Jeffers
* Jeremy Lenz
* John Mitsch
* Jonathon Turel
* Justin Sherrill
* Marek Hulán
* Michael Moll
* Partha Aji
* Ranjan Kumar
* Ron Lavi
* Samir Jha
* Shimon Shtein
* Shira Maximov
* Swetha Seelam Lakshmi Narayanan
* Walden Raines

