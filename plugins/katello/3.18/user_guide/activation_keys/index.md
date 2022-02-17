---
title: Activation Keys
---

# Activation Keys

Activation Keys provide a mechanism to define properties that may be applied to Content Hosts during registration.  This includes properties such as:

- Lifecycle Environment
- Content View
- Subscriptions
- Repository Enablement
- Host Collections
- System Purpose

## Definitions

- [Content Host](/plugins/katello/{{ page.version }}/user_guide/content_hosts/index.html#what-are-content-hosts)
- Host Collection - A statically defined group of Content Hosts.
- Subscription - The right to receive the associated content from Katello.
- System Purpose - Helps auto-attach find a subscription that satisfies the intended use of the system

## General Features

The following is a high-level summary of the Activation Key features:

- [Create an Activation Key](/plugins/katello/{{ page.version }}/user_guide/activation_keys/index.html#create-an-activation-key)
- [Add subscriptions to an Activation Key](/plugins/katello/{{ page.version }}/user_guide/activation_keys/index.html#add-subscriptions-to-an-activation-key)
- [Change repository enablement for an Activation Key](/plugins/katello/{{ page.version }}/user_guide/activation_keys/index.html#change-repository-enablement-for-an-activation-key)
- [Add Host Collections to an Activation Key](/plugins/katello/{{ page.version }}/user_guide/activation_keys/index.html#add-host-collections-to-an-activation-key)
- [Add System Purpose details to an Activation Key](/plugins/katello/{{page.version}}/user_guide/activation_keys/index.html#add-system-purpose-details-to-an-activation-key)
- [Register a Content Host using an Activation Key](/plugins/katello/{{ page.version }}/user_guide/activation_keys/index.html#register-a-content-host-using-an-activation-key)
- [View Content Hosts registered with an Activation Key](/plugins/katello/{{ page.version }}/user_guide/activation_keys/index.html#view-content-hosts-registered-with-an-activation-key)

## Create an Activation Key

To create a new key,

- navigate to: Content > Activation Keys
- click **New Activation Key**

![Creating a Host Collection](/plugins/katello/{{ page.version }}/user_guide/activation_keys/activation_key_create.png)

- *Name*: This required option is used to identify the activation key to command line tools, such as *subscription-manager*.

- *Content Host Limit*: This option will control how many Content Hosts may be registered using the key. An "unlimited" value will not place any limits on usage. Specifying a quantity will limit the number of registered content hosts. Registering with an activation key consumes one of the available limit quantity, while unregistering makes it available again. (i.e. this quantity is not a usage counter but a limit of actively registered content hosts)

- *Description*: A free form text field that can be used to store a description of the key for later reference or for pseudo-tagging that can be used to search.

- *Environment* and *Content View*: Although optional, at least one activation key used during registration must specify a content view. Activation keys are used in the order specified to *subscription-manager* meaning the last activation key with a content view takes precedence.

The following example would use CV_B's content view:

```
subscription-manager register --org Default_Organization --activationkey NO_CV --activationkey CV_A --activationkey CV_B
```

Or equivalently:

```
subscription-manager register --org Default_Organization --activationkey NO_CV,CV_A,CV_B
```

For registration to succeed, at least one activation key must be successfully applied. For an activation key to succeed, at least one of the listed subscriptions must be successfully attached to the registering content host.

## Add Subscriptions to an Activation Key

To add subscriptions to a key:

- navigate to: Content > Activation Keys
- select the desired key from the list
- click **Subscriptions**
- click **Add**
- select the Subscriptions you would like to add
- click **Add Selected**

The **Auto-Attach** setting controls how the group of subscriptions are processed during registration.

When 'Auto-Attach' is enabled but no subscriptions are added to the activation key, subscriptions will be automatically added to cover the installed products. This is equivalent to passing the '--auto-attach' flag to the subscription-manager command:

```
subscription-manager register --org=Default_Organization --auto-attach
```

When 'Auto-Attach' is enabled and subscriptions are listed for the activation key, two things will happen. First all subscriptions for custom products will be attached to the registering content host. Second, the group of Red Hat subscriptions will be attached as needed to cover the content host's installed Red Hat products. This is most commonly used when there is a group of similar subscriptions (eg. several Red Hat Enterprise Linux from different contracts, or guest subscriptions from different hypervisors) and which one used is not important. Katello's subscription tooling, [Candlepin](https://www.candlepinproject.org), will automatically choose the minimal proper subscriptions from the group.

Finally, when 'Auto-Attach' is disabled, all subscriptions on the activation key will attached to the registering content host, regardless of whether needed to cover an installed product or not. For example, adding an OpenStack Platform subscription would then allow that product to be installed after registration.

![Adding subscriptions to an Activation Key](/plugins/katello/{{ page.version }}/user_guide/activation_keys/activation_key_add_subscriptions.png)

## Change Repository Enablement for an Activation Key

To change repository enablement settings using a key:

- navigate to: Content > Activation Keys
- select the key you want from the list
- click **Repository Sets**
- select the repository you want to modify
- select the value you want to change from the **Select Action** menu('Override to Enabled', 'Override to Disable', 'Reset to Default')

View and change settings:

![Activation key repository sets](/plugins/katello/{{ page.version }}/user_guide/activation_keys/activation_key_repository_sets.png)

## Add Host Collections to an Activation Key

To add Host Collections to a key:

- navigate to: Content > Activation Keys
- select the key you want from the list
- click **Host Collections**
- click **Add**
- select the Host Collections you would like to add
- click **Add Selected**

![Adding Host Collections to an Activation Key](/plugins/katello/{{ page.version }}/user_guide/activation_keys/activation_key_add_host_collections.png)

## Add System Purpose details to an Activation Key

To add System Purpose to a key:

- navigate to: Content > Activation Keys
- select the key you want from the list
- There is a section for System Purpose where you can set the Service Level, Usage Type, Role, and Add-ons for a system. 

![Adding System Purpose to an Activation Key](/plugins/katello/{{ page.version }}/user_guide/activation_keys/activation_key_system_purpose.png)

## View Content Hosts registered with the Activation Key

To view Content Hosts registered with a particular Activation Key:

- navigate to: Content > Activation Keys
- select the key you want from the list
- select **Content Hosts** under **Associations**

![View Content Hosts registered with an Activation Key](/plugins/katello/{{ page.version }}/user_guide/activation_keys/activation_key_associations_content_host.png)

## Register a Content Host using an Activation Key

The simplest form of registering a content host with an activation key is this:

```
subscription-manager register --org=Default_Organization --activationkey=$KEY_NAME
```

[Click here for more information](/plugins/katello/{{ page.version }}/user_guide/content_hosts/index.html#how-is-a-content-host-registered)

Note that modifying an activation key does not change anything on content hosts previously registered with the key.
