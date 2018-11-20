---
layout: plugins/katello/documentation
title: Release Notes
version: 3.9
---

# Katello 3.9 (New England IPA) Release Notes

For the full release notes, see the [Changelog](https://github.com/Katello/katello/blob/KATELLO-3.9/CHANGELOG.md).

## Features

### Modularity Support
Katello 3.9 adds support for operations module streams which include. Syncing module stream information from module streams. Associating module streams to content view environments. Enable/Disable/Install module stream on hosts, including bulk actions and host group actions.

### System Purpose Support
For Red Hat Customers we've introduced a new feature called System Purpose to improve the subscription auto-attach functionality. This adds several new attributes that can be set on Content Hosts in addition to Service Level which is now under the System Purpose umbrella. The new attributes are: Role, Usage, and Add Ons. The values for these will come from your Red Hat subscription manifest and can be set on content hosts from the UI or from the new 'syspurpose' command-line interface. Settings these attributes is also possible through the provisioning UI. System Purpose ensures that the best possible subscriptions are attached to your hosts if you are using auto-attach.

### Content View Import/Export
Katello 3.9 ships with a new content view version import/export feature. This feature is meant to replace the inter-server synchronization feature. It allows users to export and import content view versions along with associated yum content. Please see the [instructions](https://www.theforeman.org/plugins/katello/nightly/user_guide/content_view_import_export/index.html) for more details.

### Katello Client Repo Changes
Katello client repos have been removed in favor of the Foreman client repo, which can be found [here](http://yum.theforeman.org/client/1.20/). Please see [install](https://theforeman.org/plugins/katello/3.9/installation/clients.html) and [upgrade](https://theforeman.org/plugins/katello/3.9/upgrade/clients.html) instructions to switch your clients.

## Bug Fixes

This release also inclue 140 bug fixes, which can be seen [here](https://projects.theforeman.org/projects/katello/issues?fixed_version_id=899&set_filter=1&status_id=%2A&tracker_id=1).

## Contributors
Adam Ruzicka
Amir Fefer
Amit Karsale
Andrew Kofink
Avi Sharvit
Bernhard Suttner
Chris Brown
Chris Duryee
Chris Hale
Chris Roberts
Christine Fouant
Daniel Lobato Garcia
Eric D. Helms
Ido Kanner
Ivan Nečas
John Mitsch
Jonathon Turel
Justin Sherrill
Lukas Zapletal
Marek Hulan
Martin Bačovský
Matthias Dellweg
Michael Johnson
Mike McCune
Oleh Fedorenko
Ondrej Prazak
Partha Aji
Samir Jha
Sean O'Keeffe
Shimon Shtein
Stephen Benjamin
Tim Kächele
Timo Goebel
Tom McKay
Tomas Strachota
Walden Raines
Zach Huntington-Meath
kgaikwad
ldjebran
lizagilman
omkar khatavkar

