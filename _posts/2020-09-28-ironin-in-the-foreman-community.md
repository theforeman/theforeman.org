---
layout: post
title: iRonin in the Foreman Community
date: 2020-09-29 08:00:06
author: Monika Szutko
tags:
- foreman
---

As outlined in [Adding a vendor list to theforeman.org site](https://community.theforeman.org/t/adding-a-vendor-list-to-theforeman-org-site/20581?u=mcorr), over the next few weeks, we will host some guest posts from different companies and consultants who offer professional services based on or extending Foreman for their customers. In this post, we hear from [iRonin.IT](https://www.ironin.it/foreman-development-services.html?utm_source=mailing&utm_medium=email&utm_campaign=foreman&utm_term=october ) and how they've interacted with the Foreman community to date. If you want to contribute to this series, please contact [@mcorr](https://community.theforeman.org/u/mcorr/).

<!--more-->


**_iRonin.IT’s experts became involved with Foreman development at the request of one of our clients. They needed to tailor Foreman to their needs in several areas, particularly for automation, security and external integrations. Let’s take a trip down memory lane and see what we’ve accomplished so far._**

## Creating a GraphQL API for Foreman

Our client needed an interface for building hosts (virtual machines) more easily. Foreman’s old API wasn’t the best tool for dealing with complex requests for data - often, multiple requests were needed. This slowed down work and redirected focus from where it was needed more. But GraphQL can handle complex requests with a number of conditions - and provides one, complex response to them.

Initially, we built this new API as a plugin, but the client found it so useful that they chose to make the code open source. It became a core feature of Foreman and can now be found in Foreman’s main repository. It’s an easy-to-use solution that helps sysadmins create standard hosts quickly and without a hassle.

## An engine for rendering scripts based on Foreman templates

We needed to rewrite an existing rendering system to make it extendable through Foreman plugins. The client also wanted to clean up the code, allowing for easier maintenance. In this way, further development of the engine would go more smoothly, and extending it to fit the needs of specific customers would become possible.

The client asked us to rewrite the rendering engine because Foreman’s default is to store templates in the database. The new version would allow using templates from other sources, such as a Git repository. This would give our client more options and flexibility, as well as an easier way of storing and sharing templates.

The new renderer was divided into the source object and the scope object. The source object is responsible for delivering the content of the template, with little regard for where the content comes from. The scope object contains all variables and macros available within a given template. By using the helper method, we join source and scope together, rendering a template. We included support for extending renderer classes with new macros that can be defined in separate Foreman plugins, and then support for extending renderer classes with additional context details (e.g. scope variables). This makes the entire solution scalable and easy to tailor to a project’s needs.

## A support tool for using Hashicorp Vault credentials

The code for this feature was developed as a separate Foreman plugin. We added support for the `vault_url` attribute in the Host model and created a service to fetch credentials from Hashicorp Vault. As a result, credentials can be fetched from `vault_url` in the rendering by using a dedicated macro. This is a significant security improvement. All secret data can be protected by an encrypted storage, such as HashiCorp Vault.

## Being part of a wonderful community

Members of [iRonin.IT](https://www.ironin.it/foreman-development-services.html?utm_source=mailing&utm_medium=email&utm_campaign=foreman&utm_term=october )’s team have greatly enjoyed working on Foreman. The experience was not only interesting thanks to its technical challenges and puzzles, but we also loved participating in a fantastic community effort to build a useful, beloved tool for sysops experts. We hope to continue contributing.
