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
