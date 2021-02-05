---
title: SUSE Content
---

# SUSE Content

Katello can be used to manage content associated with SUSE products.  This includes content such as RPMs, errata.

There are two different ways to use Katello to get manage SUSE products / repositories:
1. Use [foreman_scc_manager](https://github.com/ATIX-AG/foreman_scc_manager)
2. Use the smt tool

## Definitions
- Repository - Collection of content (either rpm).
- Product - Collection of repositories (content hosts attach to a product).
- Library - The initial lifecycle environment where repositories are created.  Content that is synced or uploaded lands in the library.

## Manage SUSE Content using the foreman_scc_manager

To manage SUSE Content witht the foreman_scc_manager you need to have an SUSE SCC account

### General Workflow

- Install the foreman_scc_manager
- Set up the connection to your SCC account.
- Synchronize the list of available SUSE products.
- Select the products and sub-products which you want to add to Katello (Content > Products). This creates the products and all associated repositories.
- Synchronize the created repositories in Content > Products

### Installation

The installation of the foreman_scc_manager can be started with the following command. This will restart your Foreman!

```
    yum install tfm-rubygem-foreman_scc_manager
```

### Usage

First of all, you need to add your SUSE SCC account. Use the button "Add SCC account" on the page "Content > SUSE Subscriptions" and configure your account. Verify that your account is configured correctly and the SUSE SCC portal is reachable with "Test Connection".

![SCC page](/plugins/katello/{{ page.version }}/user_guide/suse_content/add_scc_account_window.png)

The next step is to select the action "Sync" in the "Actions" drop down list. This will start the process to synchronize all available products for your SCC account. 

![SCC page](/plugins/katello/{{ page.version }}/user_guide/suse_content/suse_subscriptions_page.png)


Select the products which you want to include to Katello by the selecting the "Select products" in the "Actions" drop down list.
This action will take some time as it will create a product and all repositories of each selected SUSE product. 

![SCC page](/plugins/katello/{{ page.version }}/user_guide/suse_content/scc_product_selection_window.png)

After the synchronization task (see Monitor > Tasks) is complete, you will see the list of selected products and its repositories in "Content > Products".
Please keep in mind, that you need to sync the repositories before you can actually use them. 
Feel free to remove repositories of certain products which you don't need.

## Manage SUSE Content via the smt tool

### General Workflow

The following is a high-level summary of the workflow:
- Set up SUSE account and smt server
- Set up the smt mirroring and Content
- Create Products and Repositories

### Set up SUSE account and SMT server

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

### Create Products and Repositories
- Follow the steps listed [here](/plugins/katello/{{ page.version }}/user_guide/content/index.html) to create Products and Repositories
- Follow the steps listed on the same link as above to create a yum repository with the repository url pointing to the appropriate location. For example `http://<fqdn>/repo/SUSE/Products/SLE-SERVER/12-SP3/x86_64/product/`
