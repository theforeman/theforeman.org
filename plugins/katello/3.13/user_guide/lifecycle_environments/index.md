---
title: Lifecycle Environments
---

# Lifecycle Environments

What can a Lifecycle Environments be used for?
 * Hold content view versions.
 * To manage the lifecycle of Content Hosts.
 * Establish workflow containers and promote content views.

## Definitions

 * Lifecycle Environment - containers for content view versions which are consumed by content hosts.
 * Library - a special kind of Lifecycle Environment that does not have a parent. The library serves as the main container for synced content such as products, puppet modules, and published content views. Every organization has a library. Subsequent environments are derived from the library. The first node of an environment is the Library, all future environments are derived from the library and follow the library in promotion order.
 * Lifecycle Environment Path - Sequence of lifecycle environments that form the content promotion order.


## General Workflow

First create a lifecycle environment connected to the library life cycle environment and promote content views to the new lifecycle environment.
A [Content Host](/plugins/katello/{{ page.version }}/user_guide/content_hosts/index.html) can now register directly to the promoted content view in the promoted environment or library therein.  Updates will be available as soon as new content is synced and promoted.


## Viewing the list of lifecycle environments
From the web UI, navigate to:

Content -> Lifecycle Environments
![Environment Paths for a new Organization](/plugins/katello/{{ page.version }}/user_guide/lifecycle_environments/environment_with_library.png)

## Creating a lifecycle environment
Click on the + next to the Library or the prior environment to add a new path
![Create with a prior environment](/plugins/katello/{{ page.version }}/user_guide/lifecycle_environments/environment_create_with_prior.png)

## Creating a lifecycle environment path
Click on the New Environment Path
![Create new lifecycle environment path](/plugins/katello/{{ page.version }}/user_guide/lifecycle_environments/environment_path_new.png)
![Created lifecycle environment path](/plugins/katello/{{ page.version }}/user_guide/lifecycle_environments/environment_path_saved.png)

## View/Updating environment name
Click on the name of the environment.
![Viewing the details of the lifecycle environment](/plugins/katello/{{ page.version }}/user_guide/lifecycle_environments/environment_details.png)
