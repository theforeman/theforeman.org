---
title: Disconnected
---

# Katello Inter-Server Sync

NOTE: This feature has been deprecated and will be removed in a future release
of Katello. Please consider using Content View Import/Export instead.

NOTE: This feature is intended to replace the 'katello-disconnected' script.

## Intro

If you are working in an air-gapped network environment where some of your
Katello servers do not have Internet connectivity, you may be interested in
using the Katello Inter-Server Sync (ISS) feature. This allows you to export
repos, including repos in content views, on your "upstream" Katello server, and
then import said repos into your "downstream" server that does not have
connectivity. Individual repos can be exported, or all of the repos in a
content view.

List of currently supported repo content types:

 * yum

Future releases will enable support for additional content types.

![ISS Workflow](/plugins/katello/{{ page.version }}/user_guide/disconnected/ISS.png)

The diagram above shows an example scenario where a user wants to export all
Yum content in a content view and then import to another Katello server. The
ISO file is burned to media and then walked across the air-gap in the network.

## Detailed Operation

### Exporting

The ISS feature allows users to move Yum content from one Katello server to
another, in a way that is compatible with air-gapped networks. Typically users
will set up an upstream server that is connected to the Internet, and then
create a content view that contains Yum content that they would like to present
to the downstream server (step 1).

Content is exported via either `hammer repository export` or `hammer
content-view version export` (step 2). It is exported to the location set in
"pulp_export_destination" in the Settings page, under the Katello tab. This
defaults to `/var/lib/pulp/katello_export`.  Please be aware that the location
needs to be readable and writable by the `foreman` user. SELinux permissions
also need to be set on the export location with the type
`httpd_sys_rw_content_t` as well as `foreman` user and group ownership.

You can select to either export as a plain set of directories, or as a set of
ISO files. The "iso_size_mb" parameter sets how large you would like each ISO
file to be. It defaults to 4380 MB, which is the size of a single-side,
single-layer DVD.

### Importing

Importing (step 3) can be done in one of two ways. The first way is to make the
export available via HTTP to the importing Katello instance. Simply put the
export in `/var/www/html/pub/export`, either via copy or symlink. After that,
edit your CDN location from the manifest import page to point to
"http://<hostname>/export/path/to/export" and the Red Hat Repos page will then
work as expected, using your exported data. Please be sure to use 'http' and
not 'https' when altering the CDN url. Katello by default only supports the CA
certificate for `cdn.redhat.com`. This is a [known
limitation](http://projects.theforeman.org/issues/16392) that will be addressed
in a future version.

The second way is to perform a repository sync via hammer, specifiying the
source location. Please see the `hammer repository sync` command for more
information. This method is the only way to import custom content, and is the
only way to import incremental content.
