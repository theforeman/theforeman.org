---
title: Simple Content Access
---

# Simple Content Access

This is a feature to simplify subscription management.  When an organization has Simple Content Access enabled, content hosts don't need to subscribe to a product in order to access product content.

Currently this feature is only relevant for Red Hat customers who import subscription manifests, but will be available to all Katello users in a future version.

## Enabling or disabling Simple Content Access from Katello

To turn Simple Content Access on or off, navigate to either of the following places:

* Administer > Organizations > (your organization) > Details
  - Check or uncheck the _Simple Content Access_ checkbox, then click Submit.
* Content > Subscriptions > Manage Manifest
  - Toggle the _Simple Content Access_ toggle switch.

If the checkbox is not present, or the toggle switch is disabled, it could be for one of the following reasons:
* There is no manifest imported for the organization
* The organization administrator has disabled Simple Content Access for the organization

Note that toggling Simple Content Access will cause a manifest refresh.  When the task is complete, you'll get a notification in the notification drawer.

If Simple Content Access is turned on or off from Katello, changes will be reflected immediately in the Red Hat Customer Portal.

If Simple Content Access is turned on or off from outside Katello (e.g. the Red Hat Customer Portal), the changes will be reflected in Katello upon the next manifest refresh.

## Viewing Simple Content Access status

To see if Simple Content Access is enabled for an organization, look at one of the following places:
* Administer > Organizations - Look for a check mark in the Simple Content Access column for each organization.
* Content > Subscriptions > Manage Manifest - The toggle switch indicates current status.
* In addition, banners will be present on the Subscriptions and Content hosts page. (Note that these banners will be removed in a future version)

## Workflow changes compared to manual subscription management

Using Simple Content Access simplifies the workflow in several places in Katello:

* On the content host details page, the Subscriptions tab is not available.  Attaching subscriptions to content hosts is neither required nor allowed.
* On the content host details page, the Subscription Status shows "Simple Content Access."
* On the activation key details page, the Subscriptions tab is not available.  Attaching subscriptions to activation keys is neither required nor allowed.
* On the activation key details page, the Repository list does not have a 'Show All' checkbox; rather, all repositories are always shown.
* On the dashboard, subscription-related widgets are not available.
* New 'Restrict to OS Version' feature is available for custom repositories.

## Restrict to OS Version

When using content relevant only to certain OS versions (such as EPEL), previously it was common to create different custom products for each OS version.  Content hosts using that OS version could then subscribe to that product, and thus only have access to the relevant content.  However, since custom products are always enabled and Simple Content Access allows all content hosts to access all products, this workflow is not possible with Simple Content Access enabled.

Instead, you can use the Restrict to OS Version feature.  This will allow content to only be available on content hosts with the selected operating system.

### To restrict content to a certain OS version

1. Create or edit a repository within a custom product.
2. Set Content Type to 'yum'. (This feature only works with yum repositories.)
2. Set the 'Restrict to OS Version' field.  Select 'No restriction' to make the repository available regardless of OS version, or select one of the other options to restrict the content.
3. The change will take effect on the next checkin.  Or, to force the change immediately, run `subscription-manager refresh` on the content host to regenerate the entitlement certificates.
4. To confirm that the feature is working, run `subscription-manager repos` on the content host, and note that the repository is listed or not listed as appropriate.  (Note that the product enabled/disabled status will not change in the Repository Sets details or anywhere else in the web UI.)

__Note:__ Currently this feature works only with Red Hat Enterprise Linux, and is not supported on RHEL 6.9 and older.  
