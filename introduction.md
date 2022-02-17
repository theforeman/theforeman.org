---
layout: introduction
title: Introduction
---

# Introduction

## What is Foreman?

Foreman is an open source project that helps system administrators manage
servers throughout their lifecycle, from provisioning and configuration to
orchestration and monitoring. Provisioning support gives you easy control of
setting up new servers, and using configuration management (Puppet, Ansible,
Chef and Salt are supported), you can easily automate repetitive tasks. With
Foreman, you can quickly deploy applications, and proactively manage change,
both on-premise with VMs and bare-metal or in the cloud. Foreman scales well to
multiple locations (offices, data centres, etc) and multiple organisations,
allowing you to grow without losing your single source of infrastructure truth.

Foreman, provides comprehensive, interaction facilities including a web
frontend, CLI and RESTful API which enables you to build higher level business
logic on top of a solid foundation. It is deployed in many organizations,
managing from 10s to 10,000s of servers. Several commercial products are based
on Foreman.

## High-level overview

* Discover, provision and upgrade your entire bare-metal infrastructure
* Create and manage instances in virtualization environment and across private and public clouds
* Install operating systems via PXE, local media or from templates or images
* Control and gather reports from your configuration management software
* Group your hosts and manage them in bulk, regardless of location
* Review historical changes for auditing or troubleshooting
* Web user interface, JSON REST API and CLI for Linux
* Extend as needed via a robust plugin architecture

## Notable features

**Installation and usability**

* **Easy POC installation**: With a dedicated one-command installer with answer file support and automation, Foreman can be easily evaluated or customized as required.
* **Plugin architecture**: Most Foreman features are provided as plugins for either Foreman Core application or Foreman Proxy service.
* **Web User Interface**: Powerful web UI built on modern technologies.
* **API/CLI**: Powerful API, whole infrastructure can be managed via external tools.
* **Community powered**: Foreman ships with many configuration and remote execution templates maintained by the community.

**Inventory**

* **Hosts inventory**: Inventory of managed servers (nodes).
* **Host groups**: Host grouping with common options, parameters and support for field inheritance.
* **NIC discovery**: Automatic creation of network interfaces (regular, bond, bridge, VLAN), Operating System and Architecture (according to facts reported by hosts).
* **Common search**: Powerful search across whole application with smart completion.
* **Bookmarks**: Saved common search queries as bookmarks for repetitive use.
* **Subnet & Domain inventory**: Manage any number of networks via Foreman Proxy DHCP & DNS modules (including VLANs).
* **IPAM**: Manage DHCP reservations on various providers like ISC DHCP, MS DHCP or Infoblox, free IP addresses can be allocated on the fly or via Foreman database.
* **DNS and identity management**: DNS or realm entries can be automatically created for each host in Foreman inventory.

**Provisioning**

* **Manage PXE**: Foreman provides full management of PXE configuration of PXELinux, Grub, Grub2 and iPXE for maximum network boot flexibility.
* **Install OS**: Initiate unattended provisioning of various Operating Systems via extensive set of templates and snippets maintained by the community.
* **Build VMs**: Integrate with hypervisors like VMWare vCenter, Red Hat Enterprise Virtualization, oVirt or libvirt to create instances directly from Foreman UI/API/CLI either from images or via PXE.
* **Create cloud instances**: Integrate with clouds like OpenStack, Rackspace, Amazon EC2 or Google Compute Engine directly from Foreman UI/API/CLI.
* **Host network configuration**: Provisioning templates which create network configuration for installed hosts including bonding, bridging and VLAN trunk support.
* **Configuration management bootstrap**: Template snippets for bootstrapping initial configuration of configuration management software including signing client keys with CA.
* **IPv6**: Foreman can manage IPv6 addresses on non-provisioning interfaces (PXE provisioning on IPv6 is [work in progress](link to redmine bug goes here))
* **Templating engine**: Templates based on ERB for OS installation recipes (Kickstart, Preseed), jobs (SSH scripts, Ansible jobs), partitioning schemes and other types.
* **Compute Resources**: Modules or plugins for integration with hypervisors and cloud infrastructure.
* **Compute Profiles**: Common compute profiles across multiple clouds or virtualization (e.g. xxsmall, large, medium).

**Server discovery**

* **Host discovery**: Boot unknown hardware from network or via local media (USB stick) and let it register to Foreman for automated or on-demand provisioning.
* **Provisioning of discovered nodes**: Automatic, semi-automatic or fully manual provisioning of discovered hardware via WebUI/CLI/API.

**Large teams support**

* **Host parameters**: Flexible parameters engine for hosts and associated objects (subnets, domains, host groups) with dynamically generated hierarchical Key/Value maps called Smart Variables/Class Parameters.
* **Foreman proxies**: Components running inside data centres, subnets or remote sites providing connection to managed nodes and services using REST HTTPS API.
* **Authentication**: Username and password authentication with brute-force protection, POSIX LDAP, FreeIPA and MSAD authentication integration.
* **Authorization**: Fine-grained role-based access controls (RBAC) for users, roles, LDAP mapping
* **Authorization filters**: Ability to assign authorization permissions to filtered objects (e.g. hostnames starting with 'test-').
* **Multitenancy**: Most resources in Foreman can be assigned to Organizations and Locations as a flexible authorization mechanism for multiple organizations or sites.
* **Kerberos**: Foreman supports automatically creating FreeIPA Realm entries for new hosts.
* **HTTP Proxy**: For some communication of managed nodes or Foreman itself.

**Reporting and monitoring**

* **Dashboard**: Fully configurable dashboard with widgets and statistics.
* **Facts**: Inventory of facts reported by configuration management agents (Facter, Ansible, Salt grains).
* **Trends**: Track changes in Foreman infrastructure over time, including key Foreman resources or facts.
* **Audit**: Detailed audit trail with per-field granularity and `diff` feature for config templates and reports.
* **Report templates**: Thanks to report templates you can generate custom text reports based on data that are available in Foreman. The output can be csv, yaml, json. Templates can contain additional logic and the report can be customized when it's generated.

**Remote execution (plugin)**

* **Job invocations**: Running arbitrary commands or scripts on remote hosts using different providers, such as SSH or Ansible. This includes scheduling future runs, recurring execution, concurrency control, watching the progress and output live.

**Puppet integration**

* **Puppet classes**: Ability to import and parse Puppet source code base and recognize class parameters for deep mapping integration through the application.
* **Puppet CA**: Integration with puppet CA for automatic, semi-automatic or fully automatic client cert sign process.
* **Puppet ENC**: Puppet node classifier (source of input) for Puppet Master.
* **Configuration reports**: Inventory of reports from configuration management systems with diff feature and runtime statistics and graphs.

**Ansible integration (plugin)**

* **Ansible roles**: Ability to import and parse Ansible source code for deeper integration. In combination with remote execution, provides configuration management like user experience with Ansible. User assign roles to hosts/hostgroups and then enforces the policy defined by these roles on a host. Every such Ansible run updates host facts and generates new configuration report. Roles behaviour can be customized by Foreman parametrization that is passed to the Ansible inventory.
* **Ansible inventory**: Source inventory for Ansible.
* **Configuration reports**: Inventory of reports from configuration management systems with diff feature and runtime statistics and graphs.

**Compliance management (plugin)**

* **Compliance management**: Define a compliance policy using OpenSCAP standards and tooling, and then enforce it in infrastructure. Supports existing XCCDF profiles and tailoring of them according to user needs.

**Content management (plugin)**

* **Yum, deb, and Puppet Repositories**: Create, organize, and manage local yum, deb, and puppet repositories. Sync remote repositories or upload content directly to build a library of content that serves as the basis for building custom builds of your content.
* **Content snapshots**: Take your local content and filter out packages, errata and puppet modules to create custom builds into units called Content Views. Make your custom builds available to your hosts by moving it through environment paths that mimic traditional development workflows (Dev → QE → Stage → Production).
* **Package and Errata Updates**: Use your locally managed content to install package and errata updates to a host or group of hosts.
* **Host collections**: A mechanism to statically group multiple Content Hosts. This enables administrators to group Content Hosts based on the needs of their organization. For example, Content Hosts could be grouped by function, department or business unit.
* **Standard Operating Environment**: Create and maintain a Standard Operating Environment (SOE).

The following operating systems are known to install successfully from Foreman:

 ![](static/images/os/Redhat.png) Red Hat Enterprise Linux ![](static/images/os/Centos.png) CentOS ![](static/images/os/Fedora.png) Fedora
 ![](static/images/os/Ubuntu.png) Ubuntu ![](static/images/os/Debian.png) Debian ![](static/images/os/Solaris.png) Solaris 8, 10

 ![](static/images/os/Suse.png) OpenSUSE ![](static/images/os/Suse.png) SLES ![](static/images/os/Oracle.png) Oracle Linux
 ![](static/images/os/CoreOS.png) CoreOS ![](static/images/os/FreeBSD.png) FreeBSD ![](static/images/os/Junos.png) Junos

Foreman can provision on bare metal as well as the following cloud providers:

 ![](static/images/clouds/amazonaws.png) Amazon EC2  ![](static/images/clouds/google-compute-engine.png) Google Compute Engine
 ![](static/images/clouds/libvirt.png) Libvirt  ![](static/images/clouds/openstack.png) OpenStack
 ![](static/images/clouds/ovirt.png) oVirt and RHEV  ![](static/images/clouds/rackspace.png) Rackspace
 ![](static/images/clouds/vsphere.png) VMware

----------------------

<div class='row'>
  <div class='col-md-4 center'>
  <a href="/manuals/latest/index.html" class="btn-doc btn">
    <h2 class='doc-icon'><i class="fa fa-newspaper-o"></i></h2>
    documentation
  </a>
  </div>
  <div class='col-md-4 center'>
  <a href="media.html" class="btn-doc btn">
    <h2 class='doc-icon'><i class="fa fa-video-camera"></i></h2>
    videos
  </a>
  </div>
  <div class='col-md-4 center'>
  <a href="support.html" class="btn-doc btn">
    <h2 class='doc-icon'><i class="fa fa-question-circle"></i></h2>
    support
  </a>
  </div>
</div>


------------------

<div class='row'>
  <div class='center'>
    <iframe src="//www.slideshare.net/slideshow/embed_code/key/sm5T1slNQrceDs" width="850" height="710" frameborder="0" marginwidth="0" marginheight="0" scrolling="no" style="border:1px solid #CCC; border-width:1px; margin-bottom:5px; max-width: 100%;" allowfullscreen> </iframe>
  </div>
</div>

-----------------
