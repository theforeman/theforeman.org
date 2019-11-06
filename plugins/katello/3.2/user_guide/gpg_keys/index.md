---
robots: noindex
title: GPG Keys
version: 3.2
---

# Managing Content Hosts using GPG Keys

GPG Keys provide a way to verify the integrity of packages found within a Repository and/or Product.
Once one or more GPG Keys have been created, they can be associated with a Product or Repository during creation or by editing an existing Product or Repository.  
 
For more information on GPG Keys see [The GNU Privacy Guard](https://www.gnupg.org/).

## General Features

The following is a high-level summary of GPG Key features:

- [Create a GPG Key](#create-a-gpg-key)
- [View Associated Products](#view-associated-products)
- [View Associated Repositories](#view-associated-repositories)
- [Assocate GPG Key with Product](#associate-gpg-key-with-product)


## Create a GPG Key

To create a new GPG Key:

- navigate to: Content > GPG Keys
- click **New GPG Key**

Note that you may either upload your GPG Key or simply paste in the contents. 

![Creating a GPG Key](/plugins/katello/{{ page.version }}/user_guide/gpg_keys/gpg_keys_create.png)

## View Associated Products

To view all Products that have been assigned a GPG Key:

- navigate to: Content > GPG Keys
- select the desired GPG Key from the list
- click **Products**

![Viewing Products assigned to a GPG Key](/plugins/katello/{{ page.version }}/user_guide/gpg_keys/gpg_keys_list_products.png)

## View Associated Repositories

To view all Repositories that have been assigned a GPG Key:

- navigate to: Content > GPG Keys
- select the desired GPG Key from the list
- click **Repositories**

![Viewing Repositories assigned to a GPG Key](/plugins/katello/{{ page.version }}/user_guide/gpg_keys/gpg_keys_list_repositories.png)

## Associate GPG Key with Product

To add a GPG to a Product:

Note that adding a GPG Key to a Product adds the GPG Key to all current and future repositories unless a repository already has a GPG Key assigned.
This can also be overriden by assignming a GPG Key to an individual repository afterward as well. 

- navigate to: Content > Products
- select the desired Product from the list
- click **Details**
- click the edit button on the GPG Key field
- select the desired GPG Key

![Associating a GPG Key with a Product](/plugins/katello/{{ page.version }}/user_guide/gpg_keys/gpg_keys_add_to_product.png)
