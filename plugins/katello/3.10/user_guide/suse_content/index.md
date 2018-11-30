---
layout: plugins/katello/documentation
title: SUSE Content
version: '3.10'
---

# SUSE Content

Katello can be used to manage content associated with SUSE products based upon contents mirrored via the smt tool.  This includes content such as RPMs, errata.

## Definitions
- Repository - Collection of content (either rpm).
- Product - Collection of repositories (content hosts attach to a product).
- Library - The initial lifecycle environment where repositories are created.  Content that is synced or uploaded lands in the library.

## General Workflow

The following is a high-level summary of the workflow:
- Set up SUSE account and smt server
- Set up the smt mirroring and Content
- Create Products and Repositories

## Set up SUSE account and SMT server

Assuming you have an SCC account, setup the SMT server, [click here](https://www.suse.com/documentation/sles-12/book_smt/data/smt_server.html) for more documentation.

- Install smt
```
   # zypper install smt
   # yast smt-server
```
- A TUI will pop up and you are going to have to [add credentials from your account](https://www.suse.com/documentation/sles-12/book_smt/data/smt_mirroring_getcredentials.html), found in scc.suse.com, as shown in screenshot below
![SUSE SCC page](/plugins/katello/{{ page.version }}/user_guide/suse_content/scc.png)
- Click ok and proceed with the steps provided, it will finish up and exit

## Set up the SMT Content and mirroring

On a SLES 12 Box
- Sync repo data
```
  # smt-sync
```
- List  Repositories
```
  # smt-repos
```
- Install the repositories you need to mirror via the smt-repos -e flag. For example to mirror SLES12-SP3-Pool
```
  # smt-repos -e SLES12-SP3-Pool
```
- Check the enabled repos
```
  # smt-repos -o
```
- Mirror the repositories
```
  # smt-mirror
```
- This should install an apache2 on that host
```
  # service apache2 restart
```
You should be able to navigate to the mirror by browsing to `http://<fqdn>/repo/`

## Create Products and Repositories
- Follow the steps listed [here](/plugins/katello/{{ page.version }}/user_guide/content/index.html) to create Products and Repositories
- Follow the steps listed on the same link as above to create a yum repository with the repository url pointing to the appropriate location. For example `http://<fqdn>/repo/SUSE/Products/SLE-SERVER/12-SP3/x86_64/product/`
