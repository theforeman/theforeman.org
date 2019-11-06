---
title: Source RPMs
---

# Source RPMs

## Listing source RPMs with Hammer CLI

* SRPM info can be retrieved in a few ways: `hammer srpm list` and `hammer srpm info`.

* The `hammer srpm list` command lists source RPMS by default across the entire Katello server. This can be filtered down by organization, product, repository, content-view and lifecycle environment.

* The `hammer srpm info` command gathers information about a source RPM. Returning ID, Name, Version, Architecture, Epoch, Release, Filename, and Description.

## Uploading SRPMs with Hammer CLI

### Create a product and repository

First we want to create a product:

```bash
# hammer product create --name Zoo --organization-id 1

Product created.
```

Next we want to grab our product id for the repository creation step:

```bash
# hammer product list --organization-id 1

---|------|-------------|----------------------|--------------|-----------
ID | NAME | DESCRIPTION | ORGANIZATION         | REPOSITORIES | SYNC STATE
---|------|-------------|----------------------|--------------|-----------
1  | Zoo  |             | Default Organization | 0            |
---|------|-------------|----------------------|--------------|-----------
```

Next we will create our repo:

```bash
# hammer repository create --product-id 1 --organization-id 1 --content-type yum --name source_rpms --publish-via-http yes

Repository created.
```

Now we want to grab our repo id for the upload step:

```bash
# hammer repository list

---|-------------|---------|--------------|----
ID | NAME        | PRODUCT | CONTENT TYPE | URL
---|-------------|---------|--------------|----
1  | source_rpms | Zoo     | yum          |
---|-------------|---------|--------------|----
```

### Upload a source RPM into a repository

Now that we have our repository, we will upload a source RPM using the following command:

```bash
hammer repository upload-content --content-type srpm --id 1 --product-id 1 --path /root/garmindev-0.3.4-9.el7.src.rpm

Successfully uploaded file 'garmindev-0.3.4-9.el7.src.rpm'
```

Retrieving the repository info will show that the SRPM was uploaded. Note the content counts.

```bash
# hammer repository info --id 1

ID:                 1
Name:               source_rpms
Label:              source_rpms
Organization:       Default Organization
Red Hat Repository: no
Content Type:       yum
Mirror on Sync:     yes
URL:
Publish Via HTTP:   yes
Published At:       http://centos7-katello-nightly.area51.example.com/pulp/repos/Default_Organization/Library/custom/Zoo/source_rpms/
Relative Path:      Default_Organization/Library/custom/Zoo/source_rpms
Download Policy:    immediate
Product:
    ID:   1
    Name: Zoo
GPG Key:

Sync:
    Status: Not Synced
Created:            2019/08/21 15:37:14
Updated:            2019/08/21 15:37:16
Content Counts:
    Packages:       0
    Source RPMS:    1
    Package Groups: 0
    Errata:         0
    Module Streams: 0
```

### Listing source RPMS

To list source rpms across the entire Katello server run this command:

```bash
# hammer srpm list

---|-----------|------------------------------
ID | NAME      | FILENAME
---|-----------|------------------------------
1  | garmindev | garmindev-0.3.4-9.el7.src.rpm
---|-----------|------------------------------
```

* Filter down by organization, product, repository, content-view and lifecycle environment by passing in the appropriate flags.

### Getting information on a source RPM

To grab information on a source RPM run this command:

```bash
# hammer srpm info --id 1

ID:           1
Name:         garmindev
Version:      0.3.4
Architecture: src
Epoch:        0
Release:      9.el7
Filename:     garmindev-0.3.4-9.el7.src.rpm
Description:  Drivers for communication with Garmin GPS devices
```

{% if page.version != 'nightly' %}

## Uploading SRPMs with the Repositories API

To upload source RPMs with the content_type parameter to the `import_uploads` [API endpoint](https://theforeman.org/plugins/katello/{{page.version}}/api/apidoc/v2/repositories/import_uploads.html)

To see all of the available options to use with the new [Source RPM API](https://theforeman.org/plugins/katello/{{page.version}}/api/apidoc/v2/srpms.html)
{% endif %}
