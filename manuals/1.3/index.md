---
layout: manual
title: Foreman 1.3 Manual
version: 1.3
---

# 1. {{ page.title }}
{% include manuals/1.3/1.1_architecture.md %}
{% include manuals/1.3/1.2_release_notes.md %}

# 2. Quickstart
{% include manuals/1.3/2_quickstart_guide.md %}
## 2.1 Installation
{% include manuals/1.3/2.1_quickstart_installation.md %}
## 2.2 Puppet Management
{% include manuals/1.3/2.2_quickstart_puppet.md %}

# 3. Installing Foreman
{% include manuals/1.3/3_installing_foreman.md %}
## 3.1 Supported Platforms
{% include manuals/1.3/3.1_platforms.md %}
## 3.2 Foreman Installer
{%include manuals/1.3/3.2_foreman_installer.md %}
### 3.2.1 Installation
{%include manuals/1.3/3.2.1_installation.md %}
### 3.2.2 Installer Options
{%include manuals/1.3/3.2.2_installer_options.md %}
### 3.2.3 Installation Scenarios
{%include manuals/1.3/3.2.3_installation_scenarios.md %}
## 3.3 Install From Packages
{%include manuals/1.3/3.3_install_from_packages.md %}
### 3.3.1 RPM Packages
{%include manuals/1.3/3.3.1_rpm_packages.md %}
### 3.3.2 Software Collections
{%include manuals/1.3/3.3.2_software_collections.md %}
### 3.3.3 Debian Packages
{%include manuals/1.3/3.3.3_debian_packages.md %}
## 3.4 Install From Source
{%include manuals/1.3/3.4_install_from_source.md %}
## 3.5 Configuration
{%include manuals/1.3/3.5_configuration.md %}
### 3.5.1 Initial Setup
{%include manuals/1.3/3.5.1_initial_setup.md %}
### 3.5.2 Configuration Options
{%include manuals/1.3/3.5.2_configuration_options.md %}
### 3.5.3 Database Setup
{%include manuals/1.3/3.5.3_database_setup.md %}
### 3.5.4 Puppet Reports
{%include manuals/1.3/3.5.4_puppet_reports.md %}
### 3.5.5 Facts and the ENC
{%include manuals/1.3/3.5.5_facts_and_the_enc.md %}
## 3.6 Upgrade
{%include manuals/1.3/3.6_upgrade.md %}

# 4. General Foreman
{%include manuals/1.3/4_general_foreman.md %}
## 4.1 Web Interface
### 4.1.2 LDAP Authentication
{%include manuals/1.3/4.1.1_authentication.md %}
### 4.1.2 Roles and Permissions
{%include manuals/1.3/4.1.2_roles_and_permissions.md %}
### 4.1.3 Trends
{%include manuals/1.3/4.1.3_trends.md %}
### 4.1.4 Auditing
{%include manuals/1.3/4.1.4_auditing.md %}

## 4.2 Managing Puppet
{%include manuals/1.3/4.2_managing_puppet.md %}
### 4.2.1 Environments
{%include manuals/1.3/4.2.1_puppet_envs.md %}
### 4.2.2 Classes
{%include manuals/1.3/4.2.2_puppet_classes.md %}
### 4.2.3 Parameters
{%include manuals/1.3/4.2.3_puppet_params.md %}
### 4.2.4 Smart Variables
{%include manuals/1.3/4.2.4_smart_vars.md %}
### 4.2.5 Parameterized Classes
{%include manuals/1.3/4.2.5_param_classes.md %}

## 4.3 Smart Proxies
{%include manuals/1.3/4.3_smartproxy.md %}
### 4.3.1 Smart Proxy Installation
{%include manuals/1.3/4.3.1_smartproxy_installation.md %}
### 4.3.2 Smart Proxy Settings
{%include manuals/1.3/4.3.2_smartproxy_settings.md %}
### 4.3.3 ISC DHCP
{%include manuals/1.3/4.3.3_isc_dhcp.md %}
### 4.3.4 MS DHCP
{%include manuals/1.3/4.3.4_ms_dhcp.md %}
### 4.3.5 BIND
{%include manuals/1.3/4.3.5_bind.md %}
### 4.3.6 GSS-TSIG DNS
{%include manuals/1.3/4.3.6_gsstsig.md %}
### 4.3.7 SSL
{%include manuals/1.3/4.3.7_smartproxy_ssl.md %}
### 4.3.8 TFTP
{%include manuals/1.3/4.3.8_smartproxy_tftp.md %}

## 4.4 Provisioning
{%include manuals/1.3/4.4_provisioning.md %}
### 4.4.1 Operating Systems
{%include manuals/1.3/4.4.1_prov_os.md %}
### 4.4.2 Installation Media
{%include manuals/1.3/4.4.2_prov_media.md %}
### 4.4.3 Provisioning Templates
{%include manuals/1.3/4.4.3_prov_templates.md %}
### 4.4.4 Partition Tables
{%include manuals/1.3/4.4.4_prov_ptables.md %}
### 4.4.5 Architectures
{%include manuals/1.3/4.4.4_prov_archs.md %}

#5. Advanced Foreman
{%include manuals/1.3/missing.html %}
## 5.1 API
{%include manuals/1.3/missing.html %}

## 5.2 Compute Resources
{%include manuals/1.3/5.2_compute_resources.md %}
### 5.2.1 Using Compute Resources
{%include manuals/1.3/5.2.1_cr_using.md %}
### 5.2.2 EC2 Notes
{%include manuals/1.3/5.2.2_cr_ec2.md %}
### 5.2.3 Libvirt Notes
{%include manuals/1.3/5.2.3_cr_libvirt.md %}
### 5.2.4 OpenStack Notes
{%include manuals/1.3/5.2.4_cr_openstack.md %}
### 5.2.5 oVirt / RHEV Notes
{%include manuals/1.3/5.2.5_cr_ovirt.md %}
### 5.2.6 Rackspace Notes
{%include manuals/1.3/5.2.6_cr_rackspace.md %}
### 5.2.7 VMware Notes
{%include manuals/1.3/5.2.7_cr_vmware.md %}

## 5.3 Install Locations
{%include manuals/1.3/missing.html %}
## 5.4 Securing Communications with SSL
{%include manuals/1.3/5.4_communications.md %}
## 5.4.1 Securing Puppet Master Requests
{%include manuals/1.3/5.4.1_comms_puppetmaster.md %}
## 5.4.2 Securing Smart Proxy Requests
{%include manuals/1.3/5.4.2_comms_proxy.md %}
## 5.5 Backup, Recovery and Migration
{%include manuals/1.3/5.5_backup_and_recovery.md %}
## 5.5.1 Backup
{%include manuals/1.3/5.5.1_backup.md %}
## 5.5.2 Recovery
{%include manuals/1.3/5.5.2_recovery.md %}

# 6. Troubleshooting
{%include manuals/1.3/6_troubleshooting.md %}
