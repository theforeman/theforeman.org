---
layout: plugins/katello/documentation
title: Release Notes
version: 3.13
---

# Katello {{ page.version }} Release Notes

For the full release notes, see the [Changelog](https://github.com/Katello/katello/blob/KATELLO-3.13/CHANGELOG.md).

## Features

### System Purpose Support

Katello 3.13 provides setting System Purpose attributes on Activation Keys in the UI. Additionally, the Hammer CLI supports setting System Purpose attrbutes on Activation Keys and Content Hosts.

### HTTP Proxy Support

Katello 3.13 introduces support for HTTP proxies for content syncing. Repositories may be assigned an HTTP proxy policy: a global default, no proxy, or specify a proxy. HTTP proxy policies can be applied through bulk actions at the product level.

### Content Views

Content View descriptions may now be updated via the Hammer CLI.

### SRPM Support

Katello 3.13 provides the ability to upload SRPMs via the API and through Hammer and Katello to correctly identify the content as a source RPM.

## Bug Fixes

Katello 3.13 includes 77 bug fixes, which can be seen [here](https://projects.theforeman.org/projects/katello/issues?utf8=%E2%9C%93&set_filter=1&sort=id%3Adesc&f%5B%5D=status_id&op%5Bstatus_id%5D=c&f%5B%5D=tracker_id&op%5Btracker_id%5D=%3D&v%5Btracker_id%5D%5B%5D=1&f%5B%5D=fixed_version_id&op%5Bfixed_version_id%5D=%3D&v%5Bfixed_version_id%5D%5B%5D=1021&f%5B%5D=&c%5B%5D=tracker&c%5B%5D=status&c%5B%5D=priority&c%5B%5D=subject&c%5B%5D=author&c%5B%5D=assigned_to&c%5B%5D=updated_on&c%5B%5D=category&c%5B%5D=fixed_version&group_by=)

## Contributors

*	Amir Fefer
*	Avi Sharvit
*	Bernhard Suttner
*	Chris Roberts
*	Evgeni Golov
*	Ewoud Kohl van Wijngaarden
*	Gilad Lekner
*	Hao Yu
*	James Jeffers
*	Jeremy Lenz
*	John Mitsch
*	Jonathon Turel
*	Justin Sherrill
*	Lukas Zapletal
*	Marek Hulan
*	Markus Bucher
*	Matthias Dellweg
*	Michael Moll
*	Mike McCune
*	Oleh Fedorenko
*	Partha Aji
*	Pavel Moravec
*	Samir Jha
*	Tomer Brisker
*	Walden Raines
*	William Bradford Clark
*	William Clark
*	aagrawal
*	ianballou
*	kgaikwad
*	laviro
*	sjha4
*	swetha
