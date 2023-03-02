---
layout: post
title: Using Personal Access Tokens with Ansible
date: 2023-03-02 10:23:13
author: Evgeni Golov
tags:
- foreman
- ansible
---

When using Ansible to manage Foreman with the [Foreman Ansible Modules](https://github.com/theforeman/foreman-ansible-modules), we need to provide a username and a password for authentication.
But what happens if the user doesn't have a password in Foreman, because external authentication (like LDAP or Kerberos) is used?

<!--more-->

In the case of LDAP we still can provide the LDAP password to Ansible, and things will work.
However, providing the LDAP password to Ansible also means that Ansible is now in the possession of a credential that can be used in other contexts than Foreman, which is something nobody really wants to do.
Some LDAP servers even require a kind of 2FA authentication, by requiring the password to be transferred as `<password><token>` and thus the transferred password changes on each request.

Enter "[Personal Access Tokens](https://en.wikipedia.org/wiki/Personal_access_token)" (PAT)! Foreman [supports Personal Access Tokens since 1.17](https://projects.theforeman.org/issues/21394) and allows the use of PATs instead of the password when performing API requests. As Personal Access Tokens are stored and validated by Foreman, they can be used regardless of the requirements and constraints the "real" authentication method enforces.

To create a Personal Access Token, we go to the user's profile

![Foreman menu showing the links to the user's profile](/static/images/blog_images/2023-03-02-using-personal-access-tokens-with-ansible/01-my-profile.png)

Select the "Personal Access Tokens" tab

![Foreman user profile menu, Personal Access Tokens tab is selected](/static/images/blog_images/2023-03-02-using-personal-access-tokens-with-ansible/02-menu-pat.png)

Click "Add Personal Access Token"

![Personal Access Token page, Add Personal Access Token button is selected](/static/images/blog_images/2023-03-02-using-personal-access-tokens-with-ansible/03-add-pat.png)

Fill out the form, the name is something that the token can be later be identified by, say "ansible" and the expiration date is optional

![Personal Access Token creation form, the name is filed in as "ansible"](/static/images/blog_images/2023-03-02-using-personal-access-tokens-with-ansible/04-pat-form.png)

Once the form is submitted, the newly created token is shown and can be used

![Personal Access Token page, newly created token is shown](/static/images/blog_images/2023-03-02-using-personal-access-tokens-with-ansible/05-pat-success.png)

Now the token can be used as the password in any Ansible playbook:

```yaml
---
- hosts: localhost
  tasks:
    - name: set instance title
      theforeman.foreman.setting:
        server_url: https://foreman.example.com/
        username: admin
        password: hjYrjFXmRqi12uumRQPsbg
        name: instance_title
        value: the awesome and secure instance
```
