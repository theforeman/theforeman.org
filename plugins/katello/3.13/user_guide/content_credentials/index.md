---
title: Content Credentials
---

# Content Credentials

Content Credentials can be associated with Katello Products and Repositories. Two types of Content Credentials are supported, each having a distinct purpose:

### GPG Keys

GPG Keys are used by Content Hosts in order to verify the signature of packages that have been retrieved from a Repository and ensure they haven't been corrupted. For more information on GPG Keys see [The GNU Privacy Guard](https://www.gnupg.org/).

### SSL Certificates

SSL Certificates are used by the Katello server to sync content from upstream repositories that require client SSL authentication.

## Using Content Credentials

- [Create a Content Credential](/plugins/katello/{{ page.version }}/user_guide/content_credentials/index.html#create-a-content-credential)
- [Associate Content Credential with a Product](/plugins/katello/{{ page.version }}/user_guide/content_credentials/index.html#associate-content-credential-with-a-product)
- [View Associated Products](/plugins/katello/{{ page.version }}/user_guide/content_credentials/index.html#view-associated-products)
- [View Associated Repositories](/plugins/katello/{{ page.version }}/user_guide/content_credentials/index.html#view-associated-repositories)


## Create a Content Credential

To create a new Content Credential:

- navigate to Content > Content Credentials
- click **Create Content Credential**
- Enter a Name and select a Type
- You may either upload your Credential or paste its content into the text area.

When creating SSL Certificates for Products or Repositories that require them, a separate credential must be created for the CA, cert, and key respectively.

![Creating a Content Credential](/plugins/katello/{{ page.version }}/user_guide/content_credentials/content_credentials_create.png)

## Associate Content Credential with a Product

To add a Content Credential to a Product:

Note that adding a Credential to a Product adds it to all current and future repositories unless a repository already has a Credential assigned.
The Credential currently assigned to a Repository can be modified or overridden from the detail view of the repository.

- navigate to Content > Products
- select the desired Product from the list
- click **Details**
- click the edit icon on the GPG Key, SSL CA Cert, SSL Client Cert, or SSL Client Key field
- select the desired Content Credential

The steps for adding a Credential to a Repository are the same but performed from the repository's detail view.

![Associating a Content Credential with a Product](/plugins/katello/{{ page.version }}/user_guide/content_credentials/content_credentials_add_to_product.png)

## View Associated Products

To view all Products that have been assigned a Content Credential:

- navigate to Content > Content Credentials
- select the desired Credential from the list
- click **Products**

![Viewing Products assigned to a Content Credential](/plugins/katello/{{ page.version }}/user_guide/content_credentials/content_credentials_list_products.png)

## View Associated Repositories

To view all Repositories that have been assigned a Content Credential:

- navigate to Content > Content Credentials
- select the desired Credential from the list
- click **Repositories**

![Viewing Repositories assigned to a Content Credential](/plugins/katello/{{ page.version }}/user_guide/content_credentials/content_credentials_list_repositories.png)
