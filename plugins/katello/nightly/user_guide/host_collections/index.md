---
title: Host Collections
---

# Managing Content Hosts using Host Collections

Host Collections provide a mechanism to statically group multiple Content Hosts.  This enables administrators to group Content Hosts based on the needs of their organization.  For example, Content Hosts could be grouped by function, department or business unit.

Once a Host Collection is created, it can be used to perform various actions on the Content Hosts contained within it.  This includes actions such as the following:

- Package installation, removal and update
- Errata installation
- Changing of assigned Lifecycle Environment or Content View

## Definitions

- [Content Host](/plugins/katello/{{ page.version }}/user_guide/content_hosts/index.html#what-are-content-hosts)

## General Features

The following is a high-level summary of the Host Collection features:

- [Create a Host Collection](/plugins/katello/{{ page.version }}/user_guide/host_collections/index.html#create-a-host-collection)
- [Add Content Hosts to a Host Collection](/plugins/katello/{{ page.version }}/user_guide/host_collections/index.html#add-content-hosts-to-a-host-collection)
- [Copy a Host Collection](/plugins/katello/{{ page.version }}/user_guide/host_collections/index.html#copy-a-host-collection)
- [Perform actions on a Host Collection](/plugins/katello/{{ page.version }}/user_guide/host_collections/index.html#perform-actions-on-a-host-collection)

## Create a Host Collection

To create a new collection,

- navigate to: Hosts > Host Collections
- click **New Host Collection**

Note the following option:

- *Content Host Limit*: This option will control how many Content Hosts are allowed to be added to the collection.

![Creating a Host Collection](/plugins/katello/{{ page.version }}/user_guide/host_collections/host_collection_create.png)

## Add Content Hosts to a Host Collection

To add Content Hosts to a collection:

- navigate to: Hosts > Host Collections
- select the desired collection from the list
- click **Content Hosts**
- click **Add**
- select the Content Hosts you would like to add
- click **Add Selected**

![Adding Content Hosts to a Host Collection](/plugins/katello/{{ page.version }}/user_guide/host_collections/host_collection_add_hosts.png)

## Copy a Host Collection

Copying a Host Collection allows a user to quickly create a new collection that is a copy of an existing one.

To copy a Host Collection:

- navigate to: Hosts > Host Collections
- select the desired collection from the list
- click **Copy Collection**
- enter a name for the new collection
- click **Create**

![Copy a Host Collection](/plugins/katello/{{ page.version }}/user_guide/host_collections/host_collection_copy.png)

## Perform Actions on a Host Collection

To perform an action on Content Hosts within a collection:

- navigate to: Hosts > Host Collections
- select the desired collection from the list
- click **Collection Actions**
- click on the action that you would like to perform

![Host collection actions](/plugins/katello/{{ page.version }}/user_guide/host_collections/host_collection_actions.png)

Note: clicking on an action will take the user to the appropriate Content Hosts Bulk Actions page, where all Content Hosts associated with the collection have been selected.  [Click here, for more information on performing Content Host Bulk Actions](/plugins/katello/{{ page.version }}/user_guide/content_hosts/index.html#bulk-actions)
