---
layout: default
title: Foreman Release Cycle
---

# Foreman Release Cycle

## Policy

New Foreman and Katello versions are released roughly every three months and the two latest released minors are supported.

NOTE: version numbers follow the MAJOR.MINOR.PATCH convention.

Eg. when MAJOR.3.PATCH is released, MAJOR.2.PATCH is still supported and MAJOR.1.PATCH goes EOL.

### Upgrades paths

Each minor version can be directly upgraded to any of the following patches released _for the same minor_.
Eg. both **MAJOR.MINOR.1 -> MAJOR.MINOR.2 -> MAJOR.MINOR.3** and **MAJOR.MINOR.1 -> MAJOR.MINOR.3** are valid upgrade paths.

Each minor version can only be upgraded to the next minor version (regardless of patches versions).
_Intermediate upgrades can not be skipped_.
Eg. both **MAJOR.1.0 -> MAJOR.2.0 -> MAJOR.3.0** and **MAJOR.1.0 -> MAJOR.2.2 -> MAJOR.3.1** are valid upgrade paths.

**It is not possible to directly upgrade MAJOR.1.0 -> MAJOR.3.0.**

<style>
table {
  border-collapse: collapse;
  table-layout: fixed;
  width: 30%;
}

th, td {
  border: 1px solid black;
  padding: 8px;
  text-align: center;
}
</style>

## Supported Versions

Actually these are supported, as the latest two released minors:

| Release | Status |
{% for release in site.foreman_latest_releases %}
|{{ release.minmaj }} | <span class="label label-success">Supported</span> |
{% endfor %}

### Corresponding Katello versions

After Foreman 5.0, Foreman and Katello versions will be in sync (see [Versioning Sync RFC](https://community.theforeman.org/t/rfc-sync-foreman-and-katello-versioning-and-reset-both-to-5-0-with-containerized-deployment/45758) for details).

Katello 5.0 will be based on Foreman 5.0, Katello 5.1 on Foreman 5.1 etc.

For previous versions there is a mismatch:

| Katello | Foreman | Status                                              |
| 4.21    | 3.19    | <span class="label label-success">Supported</span>  |
| 4.20    | 3.18    | <span class="label label-success">Supported</span>  |
| 4.19    | 3.17    | <span class="label label-danger">End Of Life</span> |

## EOL Versions

<!-- Liquid does not directly support initializing arrays, this is splitting an empty string into an (empty) array of substrings -->
{% assign ignored_versions = "" | split: "" %}
<!-- Append "nightly" to ignored versions -->
{% assign ignored_versions = ignored_versions | push: "nightly" %}
<!-- Append supported releases to ignored versions -->
{% for release in site.foreman_latest_releases %}
{% assign ignored_versions = ignored_versions | push: release.minmaj %}
{% endfor %}

These Foreman versions are End Of Life (unsupported), together with the corresponding Katello versions.

| Release | Status |
{% for version in site.foreman_versions %}
{% unless ignored_versions contains version %}
|{{ version }} | <span class="label label-danger">End Of Life</span> |
{% endunless %}
{% endfor %}

For the full history, check the [Releases category on Discourse](https://community.theforeman.org/c/release/20).