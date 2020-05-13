---
title: Content View Import/Export
---

# Content View Import/Export

Content view import/export is one of the new features in Katello 3.9. This feature is for users who want the *exact* same content view version on one Katello instance to be available on another Katello instance. The other Katello instances may or may not have Internet access.

System administrators the ability to have fine-grained control over their content view versions, and they can have the same content view on two or more Katello instances. Additional APIs now exist to allow for this, as well as new commands to the hammer CLI tool.

This new feature works differently than the old export/import feature. The old feature is still available but has been deprecated.

  * In earlier versions of Katello, you could only export yum repositories. You could export an entire content view version, but this simply exported each yum repository in the version without any additional metadata.

## API additions

Katello 3.9 allows users to publish content view versions with a list of packages. This overrides any filters already set on the content view. It is meant for users who want to say "give me exactly what I want in this content view, with these exact RPMs that cannot be substituted". Errata will be pulled in based on the RPM list. For example, if you include "walrus-0.71.noarch.rpm" and there is an errata that includes that exact package, the errata will be pulled in.

Here is an example. You would POST this to `/katello/api/v2/content_views/<id>/publish` as the `repos_units` parameter:

```jsonld=
[
    {
        "label": "zoo",
        "rpm_filenames": [
            "walrus-5.21-1.noarch.rpm",
            "gorilla-0.62-1.noarch.rpm"
        ]
    },
    {
        "label": "a_longer_label",
        "rpm_filenames": [
            "facter-2.4.6-3.el7sat.x86_64.rpm",
            "pulp-rpm-handlers-2.13.4.9-1.el7sat.noarch.rpm"
        ]
    }
]
```

* You can also set the `major` and `minor` versions when publishing. For example, if you called the `/publish` API with `major=55` and `minor=4`, the content view would be version `55.4`.

* Using `major`, `minor`, and `repos_units`, you can create a content view version that exactly matches the content on another Katello, with the same version number.

<div class="alert alert-info" markdown="1">
**Note**

If you call **_/publish_** with the **_repos_units_** parameter set and also have content view filters set, the **_repos_units_** will override any filters. This is intentional. A message will be logged to **_/var/log/foreman/production.log_** if the filter is overriden by the **_repos_units_** parameter.
</div>

## Hammer additions

* The Hammer CLI tool has two new commands: `hammer content-view version export` and `hammer content-view version import`.

### Hammer export

* The `hammer content-view version export` command gathers information about a content view version, and then creates a tar file with that information. It will first create a json file with information about the content view. Here is an example:

```jsonld=
{
  "name": "my-cv",
  "major": 1,
  "minor": 0,
  "repositories": [
    {
      "id": 2,
      "label": "zoo",
      "content_type": "yum",
      "backend_identifier": "1-my-cv-v1_0-da3c4462-7343-4e30-bbd8-a802aa64be63",
      "relative_path": "Default_Organization/content_views/my-cv/1.0/custom/test/zoo",
      "on_disk_path": "/var/lib/pulp/published/yum/https/repos/Default_Organization/content_views/my-cv/1.0/custom/test/zoo",
      "rpm_filenames": [
        "bear-4.1-1.noarch.rpm",
        "camel-0.1-1.noarch.rpm",
        "cat-1.0-1.noarch.rpm",
        "cheetah-1.25.3-5.noarch.rpm",
        "chimpanzee-0.21-1.noarch.rpm",
        "cockateel-3.1-1.noarch.rpm",
        "cow-2.2-3.noarch.rpm",
        "crow-0.8-1.noarch.rpm",
        "dog-4.23-1.noarch.rpm",
        "dolphin-3.10.232-1.noarch.rpm",
        "duck-0.6-1.noarch.rpm",
        "elephant-8.3-1.noarch.rpm",
        "fox-1.1-2.noarch.rpm",
        "frog-0.1-1.noarch.rpm",
        "giraffe-0.67-2.noarch.rpm",
        "gorilla-0.62-1.noarch.rpm",
        "horse-0.22-2.noarch.rpm",
        "kangaroo-0.2-1.noarch.rpm",
        "lion-0.4-1.noarch.rpm",
        "mouse-0.1.12-1.noarch.rpm"
      ],
      "errata_ids": [
        "RHEA-2012:0003",
        "RHEA-2012:0001",
        "RHEA-2012:0004",
        "RHEA-2012:0002"
      ]
    }
  ]
}


```
<div class="alert alert-danger" markdown="1">
**Important**

The **_errata_ids_** field is informational only. **ALL** errata in the repository are exported. A process during the import will then clean up errata that are not used.
</div>

The hammer command will also create a tar file that contains all of the repositories listed. The final result of the command is a tar file that contains two files: the json, and an inner tar file with all of the repositories. This tar file can be copied to a USB key and used for the `import` command.

<div class="alert alert-info" markdown="1">
**Note**

Older versions of Katello relied on the Pulp **_export_distributor_** and **_group_export_distributor_** to create an ISO image with the yum repositories. Katello would start a server-side task, create an ISO, and then copy the ISO to **_/var/lib/pulp/katello-export_**. This process could take many hours and hundreds of GB of disk space for temporary files. Users can now use hammer to create the tar file. This lets us avoid creating temporary copies of extremely large files.
</div>

### Hammer import

The `hammer content-view version import` command uses the tar file created from the `export` command to create a content view version with the same data. It will create a content view version with the same major and minor version numbers, and the same repositories with the same packages and errata.

Before you run the `import` command for the first time, you will need to create the same products on the importing Katello that you had on the exporting Katello. This is a step you will only need to do once. You will also need to create the same content view, with same label. Again, you will only need to do this once.

The `import` command will synchronize the packages from the export tar file into Library. It will then call the `/publish` API and create a new content view version using those packages.

<div class="alert alert-danger" markdown="1">
**Important**

You will need to make sure Katello and Pulp can both read the tar file. If it cannot, you may get an error. The error will be logged in **/var/log/foreman/production.log** for Katello, or in **/var/log/messages** for Pulp. Ownership of the directory and files should be **_Apache_** with **_system_u:object_r:httpd_sys_rw_content_t:s0_** as the SELinux context.
</div>

<div class="alert alert-info" markdown="1">
**Note**

The import process will import all errata from an export. It will then purge any errata that are not associated with packages. This is the same process that is used today when copying RPMs between repositories.
</div>

## Import/Export Best Practices

The intent of import/export is to capture a content view version on one Katello, and then re-create it on another Katello. The feature does *not* replicate a standard operating environment (SOE) from one Katello to another. A standard operating environment includes a manifest file, content view definitions, products, repositories, activation keys, host groups, and other information.

Please use [foreman-ansible-modules](https://github.com/theforeman/foreman-ansible-modules) or Hammer scripts to define your SOE in a reproducible way. Once you have a reproducible SOE, you can then use import/export to keep your Katello updated.

<div class="alert alert-info" markdown="1">
**Note**

To ensure proper SELinux contexts on the importing tar and files, use the `/var/lib/pulp/katello-export` directory on the importing Katello. This directory already has the correct permissions and correct SELinux labels, and was created specifically as a landing place for files not created by Pulp that Pulp needs to read or write. If choosing to use a different directory please see the alert at the end of the import section for proper permissions and SELinux context settings.
</div>