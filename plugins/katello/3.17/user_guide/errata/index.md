---
title: Errata
---

# Errata

Errata are updates between major releases.  An Erratum is metadata about a group of packages that explains the importance of the package updates.  Errata may be released individually on an as-needed basis or aggregated as a minor release.  There are three main types of errata:

- Enhancement:  the new packages contain one or more added features
- Bugfix: the new packages contain one or more bug fixes
- Security:  the new packages fix one or more security vulnerabilities

With regard to Content Hosts, Errata is divided into two distinct classifications depending on whether or not the Errata is present in the Content Host's Lifecycle Environment and Content View:

- Applicable: the errata applies to one or more Content Hosts
- Installable: the errata applies to one or more Content Hosts and is present in the Content Host's Lifecycle Environment and Content View

## Definitions

- [Content Host](/plugins/katello/{{ page.version }}/user_guide/content_hosts/index.html#what-are-content-hosts)
- [Content View](/plugins/katello/{{ page.version }}/user_guide/content_views/content_views.html)
- [Lifecycle Environment](/plugins/katello/{{ page.version }}/user_guide/lifecycle_environments/index.html)

## General Features

The following is a high-level summary of the Errata features:

- [View List of Errata](/plugins/katello/{{ page.version }}/user_guide/errata/index.html#view-list-of-errata)
- [View Errata Details](/plugins/katello/{{ page.version }}/user_guide/errata/index.html#view-errata-details)
- [View Affected Content Hosts](/plugins/katello/{{ page.version }}/user_guide/errata/index.html#view-affected-content-hosts)
- [View Repositories Containing Errata](/plugins/katello/{{ page.version }}/user_guide/errata/index.html#view-repositories-containing-errata)
- [Applying Errata](/plugins/katello/{{ page.version }}/user_guide/errata/index.html#applying-errata)

## View List of Errata

To view the list of Errata in the Organization:

- navigate to: Content > Errata

![View List of Errata](/plugins/katello/{{ page.version }}/user_guide/errata/errata_list.png)

## View Errata Details

To view the details of an Errata:

- navigate to: Content > Errata
- Click on an Errata ID

![View Errata Details](/plugins/katello/{{ page.version }}/user_guide/errata/errata_details.png)

## View Affected Content Hosts

To view the Affected Content Hosts of an Errata:

- navigate to: Content > Errata
- Click on an Errata ID
- Click on the Content Hosts Tab

Note the following option:

- Checking the box limits the display of Content Hosts to those which already have the Errata available in their Lifecycle Environment and Content View.

![View Affected Content Hosts](/plugins/katello/{{ page.version }}/user_guide/errata/errata_content_hosts.png)

## View Repositories Containing Errata

To view the Repositories Containing an Errata:

- navigate to: Content > Errata
- Click on an Errata ID
- Click on the Repositories Tab

Note that you can filter by Lifecycle Environment and Content View.

![View Repositories Containing Errata](/plugins/katello/{{ page.version }}/user_guide/errata/errata_repositories.png)

## Applying Errata

How Errata is applied to a Content Host(s) depends on whether the Errata is installable.

- If the Errata is already installable then the Errata is applied to the Content Host(s).
- If the Errata is not installable then an Incremental Update is generated.  An Incremental Update creates a point release of the Content View with the Errata included.  The Errata can also be applied to the Content Host(s) as part of this process.

There are two ways to apply Errata:

- A single Errata can be applied to one or more Content Hosts
- Several Errata can be applied to one or more Content Hosts via a bulk operation

### Applying a Single Errata

To apply a single Errata:

- Navigate to: Content > Errata
- Click on an Errata ID
- Click on the Content Host tab
- Select the desired Content Hosts
- Click "Apply to Hosts"
- Confirm the action

![Select Content Hosts to Apply](/plugins/katello/{{ page.version }}/user_guide/errata/single_errata_select_content_hosts.png)
![Errata Incremental Update](/plugins/katello/{{ page.version }}/user_guide/errata/single_errata_incremental_update.png)

### Applying Several Errata

To apply several Errata:

- Navigate to: Content > Errata
- Select the desired Errata
- Click "Apply Errata"
- Select the intended Content Hosts
- Click "Next"
- Confirm the action

![Select Errata to Apply](/plugins/katello/{{ page.version }}/user_guide/errata/bulk_errata_select.png)
![Select Content Hosts to Apply](/plugins/katello/{{ page.version }}/user_guide/errata/bulk_errata_select_content_hosts.png)
![Errata Incremental Update](/plugins/katello/{{ page.version }}/user_guide/errata/bulk_errata_incremental_update.png)
