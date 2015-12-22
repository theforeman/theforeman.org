---
layout: manual
title: Foreman 1.10 Manual
version: "1.10"
---

# 1. {{ page.title }}
{% include manuals/1.10/1.1_architecture.md %}
{% include manuals/1.10/1.2_release_notes.md %}

# 2. Quickstart
{% include manuals/1.10/2_quickstart_guide.md %}
## 2.1 Installation
{% include manuals/1.10/2.1_quickstart_installation.md %}
## 2.2 Puppet Management
{% include manuals/1.10/2.2_quickstart_puppet.md %}

# 3. Installing Foreman
{% include manuals/1.10/3_installing_foreman.md %}
## 3.1 System Requirements
{% include manuals/1.10/3.1_system_requirements.md %}
### 3.1.1 Supported Platforms
{% include manuals/1.10/3.1.1_supported_platforms.md %}
### 3.1.2 Puppet Compatibility
{% include manuals/1.10/3.1.2_puppet_versions.md %}
### 3.1.3 Firewall Configuration
{% include manuals/1.10/3.1.3_firewall_configuration.md %}
## 3.2 Foreman Installer
{%include manuals/1.10/3.2_foreman_installer.md %}
### 3.2.1 Installation
{%include manuals/1.10/3.2.1_installation.md %}
### 3.2.2 Installer Options
{%include manuals/1.10/3.2.2_installer_options.md %}
### 3.2.3 Installation Scenarios
{%include manuals/1.10/3.2.3_installation_scenarios.md %}
## 3.3 Install From Packages
{%include manuals/1.10/3.3_install_from_packages.md %}
### 3.3.1 RPM Packages
{%include manuals/1.10/3.3.1_rpm_packages.md %}
### 3.3.2 Software Collections
{%include manuals/1.10/3.3.2_software_collections.md %}
### 3.3.3 Debian Packages
{%include manuals/1.10/3.3.3_debian_packages.md %}
## 3.4 Install From Source
{%include manuals/1.10/3.4_install_from_source.md %}
## 3.5 Configuration
{%include manuals/1.10/3.5_configuration.md %}
### 3.5.1 Initial Setup
{%include manuals/1.10/3.5.1_initial_setup.md %}
### 3.5.2 Configuration Options
{%include manuals/1.10/3.5.2_configuration_options.md %}
### 3.5.3 Database Setup
{%include manuals/1.10/3.5.3_database_setup.md %}
### 3.5.4 Puppet Reports
{%include manuals/1.10/3.5.4_puppet_reports.md %}
### 3.5.5 Facts and the ENC
{%include manuals/1.10/3.5.5_facts_and_the_enc.md %}
### 3.5.6 CLI
{%include manuals/1.10/3.5.6_cli.md %}
## 3.6 Upgrade
{%include manuals/1.10/3.6_upgrade.md %}

# 4. General Foreman
{%include manuals/1.10/4_general_foreman.md %}
## 4.1 Web Interface
### 4.1.1 LDAP Authentication
{%include manuals/1.10/4.1.1_authentication.md %}
### 4.1.2 Roles and Permissions
{%include manuals/1.10/4.1.2_roles_and_permissions.md %}
### 4.1.3 Trends
{%include manuals/1.10/4.1.3_trends.md %}
### 4.1.4 Auditing
{%include manuals/1.10/4.1.4_auditing.md %}
### 4.1.5 Searching
{%include manuals/1.10/4.1.5_searching.md %}

## 4.2 Managing Puppet
{%include manuals/1.10/4.2_managing_puppet.md %}
### 4.2.1 Environments
{%include manuals/1.10/4.2.1_puppet_envs.md %}
### 4.2.2 Classes
{%include manuals/1.10/4.2.2_puppet_classes.md %}
### 4.2.3 Parameters
{%include manuals/1.10/4.2.3_puppet_params.md %}
### 4.2.4 Smart Variables
{%include manuals/1.10/4.2.4_smart_vars.md %}
### 4.2.5 Parameterized Classes
{%include manuals/1.10/4.2.5_param_classes.md %}
### 4.2.6 Smart Matchers
{%include manuals/1.10/4.2.6_matchers.md %}

## 4.3 Smart Proxies
{%include manuals/1.10/4.3_smartproxy.md %}
### 4.3.1 Smart Proxy Installation
{%include manuals/1.10/4.3.1_smartproxy_installation.md %}
### 4.3.2 Smart Proxy Settings
{%include manuals/1.10/4.3.2_smartproxy_settings.md %}
### 4.3.3 BMC
{%include manuals/1.10/4.3.3_smartproxy_bmc.md %}
### 4.3.4 DHCP
#### 4.3.4.1 dhcp.yml
{%include manuals/1.10/4.3.4_smartproxy_dhcp.md %}
#### 4.3.4.2 ISC DHCP
{%include manuals/1.10/4.3.4.2_isc_dhcp.md %}
#### 4.3.4.3 MS DHCP
{%include manuals/1.10/4.3.4.3_ms_dhcp.md %}
### 4.3.5 DNS
#### 4.3.5.1 dns.yml
{%include manuals/1.10/4.3.5_smartproxy_dns.md %}
#### 4.3.5.2 BIND
{%include manuals/1.10/4.3.5.2_bind.md %}
#### 4.3.5.3 GSS-TSIG DNS
{%include manuals/1.10/4.3.5.3_gsstsig.md %}
### 4.3.6 Puppet
{%include manuals/1.10/4.3.6_smartproxy_puppet.md %}
### 4.3.7 Puppet CA
{%include manuals/1.10/4.3.7_smartproxy_puppetca.md %}
### 4.3.8 Realm
#### 4.3.8.1 realm.yml
{%include manuals/1.10/4.3.8_smartproxy_realm.md %}
#### 4.3.8.2 FreeIPA Realm
{%include manuals/1.10/4.3.8.2_freeipa_realm.md %}
### 4.3.9 TFTP
{%include manuals/1.10/4.3.9_smartproxy_tftp.md %}
### 4.3.10 SSL
{%include manuals/1.10/4.3.10_smartproxy_ssl.md %}
### 4.3.11 Libvirt
{%include manuals/1.10/4.3.11_smartproxy_libvirt.md %}
### 4.3.12 Templates
{%include manuals/1.10/4.3.12_smartproxy_templates.md %}

## 4.4 Provisioning
{%include manuals/1.10/4.4_provisioning.md %}
### 4.4.1 Operating Systems
{%include manuals/1.10/4.4.1_prov_os.md %}
### 4.4.2 Installation Media
{%include manuals/1.10/4.4.2_prov_media.md %}
### 4.4.3 Provisioning Templates
{%include manuals/1.10/4.4.3_prov_templates.md %}
### 4.4.4 Partition Tables
{%include manuals/1.10/4.4.4_prov_ptables.md %}
### 4.4.5 Architectures
{%include manuals/1.10/4.4.4_prov_archs.md %}
### 4.4.6 Workflow
{%include manuals/1.10/4.4.6_prov_workflow.md %}
### 4.4.7 Networking
{%include manuals/1.10/4.4.7_prov_networking.md %}
### 4.4.8 OS Specific Notes
{%include manuals/1.10/4.4.8_prov_os_notes.md %}
### 4.4.8.1 FreeBSD
{%include manuals/1.10/4.4.8.1_prov_freebsd.md %}
### 4.4.8.2 SLES
{%include manuals/1.10/4.4.8.2_prov_sles.md %}
### 4.4.8.3 Windows
{%include manuals/1.10/4.4.8.3_prov_windows.md %}

## 4.5 Command Line Interface
{%include manuals/1.10/4.5_cli.md %}
### 4.5.1 Usage Examples
{%include manuals/1.10/4.5.1_cli_examples.md %}
### 4.5.2 Success Story
{%include manuals/1.10/4.5.2_cli_success.md %}

## 4.6 Email Management
{%include manuals/1.10/4.6_email.md %}
### 4.6.1 Email Preferences
{%include manuals/1.10/4.6.1_email_preferences.md %}
### 4.6.2 Account Notifications
{%include manuals/1.10/4.6.2_email_account.md %}
### 4.6.3 Host Notifications
{%include manuals/1.10/4.6.3_email_host.md %}
### 4.6.4 Scheduled Emails
{%include manuals/1.10/4.6.4_email_scheduled.md %}

## 4.7 Managing Salt
{%include manuals/1.10/4.7_managing_salt.md %}

## 4.8 Managing Chef
{%include manuals/1.10/4.8_managing_chef.md %}

#5. Advanced Foreman

## 5.1 API
{%include manuals/1.10/5.1_api.md %}
### 5.1.1 CRUD Request Examples
{%include manuals/1.10/5.1.1_request_examples.md %}
### 5.1.2 JSON Response Format for Collections
{%include manuals/1.10/5.1.2_api_json_collections.md %}
### 5.1.3 JSON Response Format for Single Objects
{%include manuals/1.10/5.1.3_api_json_single_objects.md %}
### 5.1.4 Customize JSON Responses
{%include manuals/1.10/5.1.4_api_customize.md %}
### 5.1.5 Nested API routes
{%include manuals/1.10/5.1.5_nested_api_routes.md %}
### 5.1.6 API Versioning
{%include manuals/1.10/5.1.6_versioning.md %}
### 5.1.7 Handling Associations
{%include manuals/1.10/5.1.7_associations.md %}

## 5.2 Compute Resources
{%include manuals/1.10/5.2_compute_resources.md %}
### 5.2.1 Using Compute Resources
{%include manuals/1.10/5.2.1_cr_using.md %}
### 5.2.2 Using Compute Profiles
{%include manuals/1.10/5.2.2_cr_profiles.md %}
### 5.2.3 EC2 Notes
{%include manuals/1.10/5.2.3_cr_ec2.md %}
### 5.2.4 Google Compute Engine Notes
{%include manuals/1.10/5.2.4_cr_gce.md %}
### 5.2.5 Libvirt Notes
{%include manuals/1.10/5.2.5_cr_libvirt.md %}
### 5.2.6 OpenStack Notes
{%include manuals/1.10/5.2.6_cr_openstack.md %}
### 5.2.7 oVirt / RHEV Notes
{%include manuals/1.10/5.2.7_cr_ovirt.md %}
### 5.2.8 Rackspace Notes
{%include manuals/1.10/5.2.8_cr_rackspace.md %}
### 5.2.9 VMware Notes
{%include manuals/1.10/5.2.9_cr_vmware.md %}
### 5.2.10 Password Encryption
{%include manuals/1.10/5.2.10_cr_encryption_key.md %}

## 5.3 Install Locations
{%include manuals/1.10/missing.html %}
## 5.4 Securing Communications with SSL
{%include manuals/1.10/5.4_communications.md %}
### 5.4.1 Securing Puppet Master Requests
{%include manuals/1.10/5.4.1_comms_puppetmaster.md %}
### 5.4.2 Securing Smart Proxy Requests
{%include manuals/1.10/5.4.2_comms_proxy.md %}
## 5.5 Backup, Recovery and Migration
{%include manuals/1.10/5.5_backup_and_recovery.md %}
### 5.5.1 Backup
{%include manuals/1.10/5.5.1_backup.md %}
### 5.5.2 Recovery
{%include manuals/1.10/5.5.2_recovery.md %}

## 5.6 Rails Console
{%include manuals/1.10/5.6_rails_console.md %}

<a name="5.7SPNEGOauthentication"></a>
## 5.7 External Authentication
{%include manuals/1.10/5.7_external_authentication.md %}
### 5.7.1 Configuration via Foreman installer
{%include manuals/1.10/5.7.1_quick_configuration.md %}
### 5.7.2 HBAC configuration
{%include manuals/1.10/5.7.2_HBAC_rules.md %}
### 5.7.3 Kerberos Single Sign-On
{%include manuals/1.10/5.7.3_kerberos.md %}
### 5.7.4 PAM Authentication
{%include manuals/1.10/5.7.4_pam_authentication.md %}
### 5.7.5 Populate users and attributes
{%include manuals/1.10/5.7.5_populate_users_attributes_groups.md %}
### 5.7.6 Namespace separation
{%include manuals/1.10/5.7.6_namespace_separation.md %}

# 6. Plugins
{%include manuals/1.10/6_plugins.md %}

# 7. Troubleshooting

## 7.1 NoVNC
{%include manuals/1.10/7.1_novnc.md %}

## 7.2 Debugging
{%include manuals/1.10/7.2_debugging.md %}

## 7.3 Getting Help
{%include manuals/1.10/7.3_getting_help.md %}
