---
layout: plugins/katello/documentation
version: 2.4
title: Capsules
---

# Capsules

## What are Capsules?

The Capsule server is a Katello component that provides federated services to discover, provision, control, and configure hosts. Each Katello server includes a Default Capsule, and you may deploy additional Capsules to remote data centers. A Capsule server provides the following features:

  * Content features, including:
    * Repository synchronization
    * Content delivery
    * Host action delivery (package installation updates, etc)
    * Subscription management proxy (RHSM)
  * Foreman Smart Proxy features, including:
    * DHCP, including ISC DHCP servers
    * DNS, including Bind and MS DNS servers
    * Realm, including FreeIPA
    * Any UNIX-based TFTP server
    * Puppet Master servers
    * Puppet CA to manage certificate signing and cleaning
    * Baseboard Management Controller (BMC) for power management
    * Provisioning template proxy

The Katello Capsule server is a means to scale out the Katello installation. Organizations can create various capsules in different geographical locations. These are centrally managed through the Katello server. When a Katello user promotes content to a particular environment, the Katello server will push the content to each of the Capsule servers subscribed to that environment. Hosts pull content and configuration from the Katello Capsule servers in their location and not from the central server.

In a fully configured capsule, communication is completely isolated between hosts and the Katello server.

## How do Capsules differ from Smart Proxies?

A Katello Capsule is a Foreman Smart Proxy with the addition of content-related services.

## Deployment

In the simplest use case, a user may only want to use the Default Capsule. Larger deployments would have a single Katello server with multiple Capsules attached, with these remote Capsules deployed to various datacenters. Capsules can also be used to scale the number of hosts attached to a single Katello server.

## Installation

See [Capsule Installation](/plugins/katello/{{ page.version }}/installation/capsule.html)

## Removal

To stop all services and remove all Katello and Foreman related packages, run the following command as root on the capsule:

  `capsule-remove`

# Capsule Isolation

The goal of Capsule Isolation is to provide a single endpoint for all of a client's communication, so that in remote network segments, you need only open Firewall ports to the Capsule itself. The following section details the communication clients need to have with a Capsule. The installation options mentioned are the default starting with Katello 2.2.

![Diagram of Communication](/plugins/katello/{{ page.version }}/user_guide/capsules/isolation.png)

## Content and Configuration Services

There are five primary areas that require client communication:

### 1 - Content Delivery

That is, yum. Katello Capsules by default have the Pulp feature, which mirrors content for the selected Lifecycle Environments.

Install Option:

  * `--pulp=true`

Required Connectivity:

  * Clients need to be able to communicate with the Capsule on port 443/tcp.

### 2 - Katello Agent

The Katello agent is a goferd plugin which allows you to schedule remote actions on hosts such as package installation, updates, etc. A capsule must be running the Qpid Dispatch Router service for this feature to work.

Install Option:

  * `--qpid-router=true`

Required Connectivity:

  * Clients need to be able to communicate with the Capsule on port 5647/tcp

### 3 - Puppet & Puppet CA

By default, the Puppet CA feature on the Capsule is an independent CA which will manage the certificates for all the clients registered against the Capsule. Simply select the Puppetmaster and Puppet CA to be the Capsule when creating a host.

Install Option:

  * `--puppet=true --puppetca=true`.

Required Connectivity:

  * Clients need to communicate with the Capsule on port 8140/tcp.

### 4 - Subscription Management

Content Hosts utilize [Subscription Manager](/plugins/katello/{{ page.version }}/user_guide/content_hosts/index.html) for registration to Katello and enabling/disabling specific repositories.

Install Option:

  * `--reverse-proxy=true`

Required Connectivity:

  * Clients need to talk to the Capsule on port 8443/tcp.

### 5 - Provisioning Services

When provisioning a host using DHCP/PXE, you will need, at a minimum, the TFTP feature enabled on the capsule, and a DHCP server available. While not required, the Capsule can provide the DHCP service. In order for the installer to obtain its kickstart template from the Capsule, you should enable the templates feature.

If a TFTP proxy has the Templates feature as well, Foreman will automatically make the communication isolated. Your clients need to talk to the Capsule on port 67/udp and 68/udp for DHCP, 69/udp for TFTP, and 8000/tcp for Templates.

Consult the installer's `--help` for the full range of provisioning options.


