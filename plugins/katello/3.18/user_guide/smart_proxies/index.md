---
title: Smart Proxies
---

# Smart Proxies

## What are Smart Proxies?

The Smart Proxy server is a Katello component that provides federated services to discover, provision, control, and configure hosts. Each Katello server includes a Default Smart Proxy, and you may deploy additional Smart Proxies to remote data centers. A Smart Proxy server provides the following features:

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

The Katello Smart Proxy server is a means to scale out the Katello installation. Organizations can create various Smart Proxies in different geographical locations. These are centrally managed through the Katello server. When a Katello user promotes content to a particular environment, the Katello server will push the content to each of the Smart Proxy servers subscribed to that environment. Hosts pull content and configuration from the Katello Smart Proxy servers in their location and not from the central server.

In a fully configured Smart Proxy, communication is completely isolated between hosts and the Katello server.

## What is a Foreman Proxy with Content?

A Katello Smart Proxy is a Foreman Smart Proxy with the addition of content-related services.

## Deployment

In the simplest use case, a user may only want to use the Default Smart Proxy. Larger deployments would have a single Katello server with multiple Smart Proxies attached, with these remote Smart Proxies deployed to various datacenters. Smart Proxies can also be used to scale the number of hosts attached to a single Katello server.

## Installation

See [Smart Proxy Installation](/plugins/katello/{{ page.version }}/installation/smart_proxy.html)

## Removal

To stop all services and remove all Katello and Foreman related packages, run the following command as root on the Smart Proxy:

  `katello-remove`

# Smart Proxy Isolation

The goal of Smart Proxy Isolation is to provide a single endpoint for all of a client's communication, so that in remote network segments, you need only open Firewall ports to the Smart Proxy itself. The following section details the communication clients need to have with a Smart Proxy. The installation options mentioned are the default starting with Katello 2.2.

![Diagram of Communication](/plugins/katello/{{ page.version }}/user_guide/smart_proxies/isolation.png)

## Content and Configuration Services

There are five primary areas that require client communication:

### 1 - Content Delivery

That is, yum. Katello Smart Proxies by default have the Pulp feature, which mirrors content for the selected Lifecycle Environments.

Install Option:

  * `--pulp=true`

Required Connectivity:

  * Clients need to be able to communicate with the Smart Proxy on port 443/tcp.

### 2 - Katello Agent

<div class="alert alert-danger">
Katello-agent is deprecated and will be removed in a future release.
</div>

The Katello agent is a goferd plugin which allows you to schedule remote actions on hosts such as package installation, updates, etc. A Smart Proxy must be running the Qpid Dispatch Router service for this feature to work.

Install Option:

  * `--qpid-router=true`

Required Connectivity:

  * Clients need to be able to communicate with the Smart Proxy on port 5647/tcp

### 3 - Puppet & Puppet CA

By default, the Puppet CA feature on the Smart Proxy is an independent CA which will manage the certificates for all the clients registered against the Smart Proxy. Simply select the Puppetmaster and Puppet CA to be the Smart Proxy when creating a host.

Install Option:

  * `--puppet=true --puppetca=true`.

Required Connectivity:

  * Clients need to communicate with the Smart Proxy on port 8140/tcp.

### 4 - Subscription Management

Content Hosts utilize [Subscription Manager](/plugins/katello/{{ page.version }}/user_guide/content_hosts/index.html#how-is-a-content-host-registered) for registration to Katello and enabling/disabling specific repositories.

Install Option:

  * `--reverse-proxy=true`

Required Connectivity:

  * Clients need to talk to the Smart Proxy on port 8443/tcp.

### 5 - Provisioning Services

When provisioning a host using DHCP/PXE, you will need, at a minimum, the TFTP feature enabled on the Smart Proxy, and a DHCP server available. While not required, the Smart Proxy can provide the DHCP service. In order for the installer to obtain its kickstart template from the Smart Proxy, you should enable the templates feature.

If a TFTP proxy has the Templates feature as well, Foreman will automatically make the communication isolated. Your clients need to talk to the Smart Proxy on port 67/udp and 68/udp for DHCP, 69/udp for TFTP, and 8000/tcp for Templates.

Consult the installer's `--help` for the full range of provisioning options.


