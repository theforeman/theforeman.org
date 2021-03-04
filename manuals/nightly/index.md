---
layout: manual
title: Foreman Nightly Manual
version: "nightly"
previous_version: "2.4"
---

# 1. {{ page.title }}
{% include manuals/{{ page.version }}/1.1_architecture.md %}
{% include manuals/{{ page.version }}/1.2_release_notes.md %}

# 2. Quickstart
{% include manuals/{{ page.version }}/2_quickstart_guide.md %}
## 2.1 Installation
{% include manuals/{{ page.version }}/2.1_quickstart_installation.md %}
## 2.2 Puppet Management
{% include manuals/{{ page.version }}/2.2_quickstart_puppet.md %}

# 3. Installing Foreman
{% include manuals/{{ page.version }}/3_installing_foreman.md %}
## 3.1 System Requirements
{% include manuals/{{ page.version }}/3.1_system_requirements.md %}
### 3.1.1 Supported Platforms
{% include manuals/{{ page.version }}/3.1.1_supported_platforms.md %}
### 3.1.2 Hardware Requirements
{% include manuals/{{ page.version }}/3.1.2_hardware_requirements.md %}
### 3.1.3 Puppet Compatibility
{% include manuals/{{ page.version }}/3.1.3_puppet_versions.md %}
### 3.1.4 Browser Compatibility
{% include manuals/{{ page.version }}/3.1.4_browser_compatibility.md %}
### 3.1.5 Firewall Configuration
{% include manuals/{{ page.version }}/3.1.5_firewall_configuration.md %}
## 3.2 Foreman Installer
{%include manuals/{{ page.version }}/3.2_foreman_installer.md %}
### 3.2.1 Installation
{%include manuals/{{ page.version }}/3.2.1_installation.md %}
### 3.2.2 Installer Options
{%include manuals/{{ page.version }}/3.2.2_installer_options.md %}
### 3.2.3 Installation Scenarios
{%include manuals/{{ page.version }}/3.2.3_installation_scenarios.md %}
## 3.3 Install From Packages
{%include manuals/{{ page.version }}/3.3_install_from_packages.md %}
### 3.3.1 RPM Packages
{%include manuals/{{ page.version }}/3.3.1_rpm_packages.md %}
### 3.3.2 Software Collections
{%include manuals/{{ page.version }}/3.3.2_software_collections.md %}
### 3.3.3 Debian Packages
{%include manuals/{{ page.version }}/3.3.3_debian_packages.md %}
## 3.4 Install From Source
{%include manuals/{{ page.version }}/3.4_install_from_source.md %}
## 3.5 Configuration
{%include manuals/{{ page.version }}/3.5_configuration.md %}
### 3.5.1 Initial Setup
{%include manuals/{{ page.version }}/3.5.1_initial_setup.md %}
### 3.5.2 Configuration Options
{%include manuals/{{ page.version }}/3.5.2_configuration_options.md %}
### 3.5.3 Database Setup
{%include manuals/{{ page.version }}/3.5.3_database_setup.md %}
### 3.5.4 Puppet Reports
{%include manuals/{{ page.version }}/3.5.4_puppet_reports.md %}
### 3.5.5 Facts and the ENC
{%include manuals/{{ page.version }}/3.5.5_facts_and_the_enc.md %}
### 3.5.6 CLI
{%include manuals/{{ page.version }}/3.5.6_cli.md %}
## 3.6 Upgrade to {{ page.version }}
{%include manuals/{{ page.version }}/3.6_upgrade.md %}

# 4. General Foreman
{%include manuals/{{ page.version }}/4_general_foreman.md %}
## 4.1 Web Interface

### 4.1.1 LDAP Authentication
{%include manuals/{{ page.version }}/4.1.1_authentication.md %}
### 4.1.2 Roles and Permissions
{%include manuals/{{ page.version }}/4.1.2_roles_and_permissions.md %}
### 4.1.3 Trends
{%include manuals/{{ page.version }}/4.1.3_trends.md %}
### 4.1.4 Auditing
{%include manuals/{{ page.version }}/4.1.4_auditing.md %}
### 4.1.5 Searching
{%include manuals/{{ page.version }}/4.1.5_searching.md %}
### 4.1.6 User Management
{%include manuals/{{ page.version }}/4.1.6_user_management.md %}

## 4.2 Managing Puppet
{%include manuals/{{ page.version }}/4.2_managing_puppet.md %}
### 4.2.1 Environments
{%include manuals/{{ page.version }}/4.2.1_puppet_envs.md %}
### 4.2.2 Classes
{%include manuals/{{ page.version }}/4.2.2_puppet_classes.md %}
### 4.2.3 Parameters
{%include manuals/{{ page.version }}/4.2.3_puppet_params.md %}
### 4.2.4 Parameterized Classes
{%include manuals/{{ page.version }}/4.2.4_param_classes.md %}
### 4.2.5 Smart Matchers
{%include manuals/{{ page.version }}/4.2.5_matchers.md %}

## 4.3 Smart Proxies
{%include manuals/{{ page.version }}/4.3_smartproxy.md %}
### 4.3.1 Smart Proxy Installation
{%include manuals/{{ page.version }}/4.3.1_smartproxy_installation.md %}
### 4.3.2 Smart Proxy Settings
{%include manuals/{{ page.version }}/4.3.2_smartproxy_settings.md %}

### 4.3.3 BMC
{%include manuals/{{ page.version }}/4.3.3_smartproxy_bmc.md %}
#### 4.3.3.1 SSH BMC
{%include manuals/{{ page.version }}/4.3.3.1_smartproxy_bmc_ssh.md %}

### 4.3.4 DHCP

#### 4.3.4.1 dhcp.yml
{%include manuals/{{ page.version }}/4.3.4_smartproxy_dhcp.md %}
#### 4.3.4.2 ISC DHCP
{%include manuals/{{ page.version }}/4.3.4.2_isc_dhcp.md %}
#### 4.3.4.3 MS DHCP
{%include manuals/{{ page.version }}/4.3.4.3_ms_dhcp.md %}

### 4.3.5 DNS

#### 4.3.5.1 dns.yml
{%include manuals/{{ page.version }}/4.3.5_smartproxy_dns.md %}
#### 4.3.5.2 BIND
{%include manuals/{{ page.version }}/4.3.5.2_bind.md %}
#### 4.3.5.3 GSS-TSIG DNS
{%include manuals/{{ page.version }}/4.3.5.3_gsstsig.md %}

### 4.3.6 Puppet
{%include manuals/{{ page.version }}/4.3.6_smartproxy_puppet.md %}
### 4.3.7 Puppet CA
{%include manuals/{{ page.version }}/4.3.7_smartproxy_puppetca.md %}

### 4.3.8 Realm

#### 4.3.8.1 realm.yml
{%include manuals/{{ page.version }}/4.3.8_smartproxy_realm.md %}
#### 4.3.8.2 FreeIPA Realm
{%include manuals/{{ page.version }}/4.3.8.2_freeipa_realm.md %}

### 4.3.9 TFTP
{%include manuals/{{ page.version }}/4.3.9_smartproxy_tftp.md %}
### 4.3.10 SSL
{%include manuals/{{ page.version }}/4.3.10_smartproxy_ssl.md %}
### 4.3.11 Libvirt
{%include manuals/{{ page.version }}/4.3.11_smartproxy_libvirt.md %}
### 4.3.12 Templates
{%include manuals/{{ page.version }}/4.3.12_smartproxy_templates.md %}
### 4.3.13 Logs
{%include manuals/{{ page.version }}/4.3.13_smartproxy_logs.md %}

## 4.4 Provisioning
{%include manuals/{{ page.version }}/4.4_provisioning.md %}
### 4.4.1 Operating Systems
{%include manuals/{{ page.version }}/4.4.1_prov_os.md %}
### 4.4.2 Installation Media
{%include manuals/{{ page.version }}/4.4.2_prov_media.md %}
### 4.4.3 Provisioning Templates
{%include manuals/{{ page.version }}/4.4.3_prov_templates.md %}
### 4.4.4 Partition Tables
{%include manuals/{{ page.version }}/4.4.4_prov_ptables.md %}
### 4.4.5 Architectures
{%include manuals/{{ page.version }}/4.4.4_prov_archs.md %}
### 4.4.6 Workflow
{%include manuals/{{ page.version }}/4.4.6_prov_workflow.md %}
### 4.4.7 Networking
{%include manuals/{{ page.version }}/4.4.7_prov_networking.md %}
### 4.4.8 OS Specific Notes
{%include manuals/{{ page.version }}/4.4.8_prov_os_notes.md %}
### 4.4.8.1 FreeBSD
{%include manuals/{{ page.version }}/4.4.8.1_prov_freebsd.md %}
### 4.4.8.2 SLES
{%include manuals/{{ page.version }}/4.4.8.2_prov_sles.md %}
### 4.4.8.3 Windows
{%include manuals/{{ page.version }}/4.4.8.3_prov_windows.md %}

## 4.5 Command Line Interface
{%include manuals/{{ page.version }}/4.5_cli.md %}
### 4.5.1 Usage Examples
{%include manuals/{{ page.version }}/4.5.1_cli_examples.md %}
### 4.5.2 Success Story
{%include manuals/{{ page.version }}/4.5.2_cli_success.md %}

## 4.6 Email Management
{%include manuals/{{ page.version }}/4.6_email.md %}
### 4.6.1 Email Preferences
{%include manuals/{{ page.version }}/4.6.1_email_preferences.md %}
### 4.6.2 Account Notifications
{%include manuals/{{ page.version }}/4.6.2_email_account.md %}
### 4.6.3 Host Notifications
{%include manuals/{{ page.version }}/4.6.3_email_host.md %}
### 4.6.4 Scheduled Emails
{%include manuals/{{ page.version }}/4.6.4_email_scheduled.md %}

## 4.7 Managing Ansible
{%include manuals/{{ page.version }}/4.7_managing_ansible.md %}

## 4.8 Managing Chef
{%include manuals/{{ page.version }}/4.8_managing_chef.md %}

## 4.9 Managing Salt
{%include manuals/{{ page.version }}/4.9_managing_salt.md %}

## 4.10 Monitoring
{%include manuals/{{ page.version }}/4.10_monitoring.md %}
### 4.10.1 Global status
{%include manuals/{{ page.version }}/4.10.1_global_status.md %}
### 4.10.2 Sub-statuses
{%include manuals/{{ page.version }}/4.10.2_substatuses.md %}
### 4.10.3 Searching by statuses
{%include manuals/{{ page.version }}/4.10.3_searching_by_statuses.md %}

## 4.11 Reports
{%include manuals/{{ page.version }}/4.11_reports.md %}
### 4.11.1 Report Templates
{%include manuals/{{ page.version }}/4.11.1_report_templates.md %}
### 4.11.2 Macros
{%include manuals/{{ page.version }}/4.11.2_macros.md %}

# 5. Advanced Foreman

## 5.1 API
{%include manuals/{{ page.version }}/5.1_api.md %}
### 5.1.1 CRUD Request Examples
{%include manuals/{{ page.version }}/5.1.1_request_examples.md %}
### 5.1.2 JSON Response Format for Collections
{%include manuals/{{ page.version }}/5.1.2_api_json_collections.md %}
### 5.1.3 JSON Response Format for Single Objects
{%include manuals/{{ page.version }}/5.1.3_api_json_single_objects.md %}
### 5.1.4 Customize JSON Responses
{%include manuals/{{ page.version }}/5.1.4_api_customize.md %}
### 5.1.5 Nested API routes
{%include manuals/{{ page.version }}/5.1.5_nested_api_routes.md %}
### 5.1.6 API Versioning
{%include manuals/{{ page.version }}/5.1.6_versioning.md %}
### 5.1.7 Handling Associations
{%include manuals/{{ page.version }}/5.1.7_associations.md %}
### 5.1.8 Authentication
{%include manuals/{{ page.version }}/5.1.8_authentication.md %}
### 5.1.9 Using OAuth
{%include manuals/{{ page.version }}/5.1.9_oauth.md %}
### 5.1.10 Using Apipie-Bindings
{%include manuals/{{ page.version }}/5.1.10_apipie-bindings.md %}
### 5.1.11 Using Graphql
{%include manuals/{{ page.version }}/5.1.11_graphql.md %}
### 5.1.12 Dynflow scaling
{%include manuals/{{ page.version }}/5.1.12_dynflow_scaling.md %}

## 5.2 Compute Resources
{%include manuals/{{ page.version }}/5.2_compute_resources.md %}
### 5.2.1 Using Compute Resources
{%include manuals/{{ page.version }}/5.2.1_cr_using.md %}
### 5.2.2 Using Compute Profiles
{%include manuals/{{ page.version }}/5.2.2_cr_profiles.md %}
### 5.2.3 EC2 Notes
{%include manuals/{{ page.version }}/5.2.3_cr_ec2.md %}
### 5.2.4 Google Compute Engine Notes
{%include manuals/{{ page.version }}/5.2.4_cr_gce.md %}
### 5.2.5 Libvirt Notes
{%include manuals/{{ page.version }}/5.2.5_cr_libvirt.md %}
### 5.2.6 OpenStack Notes
{%include manuals/{{ page.version }}/5.2.6_cr_openstack.md %}
### 5.2.7 oVirt / RHEV Notes
{%include manuals/{{ page.version }}/5.2.7_cr_ovirt.md %}
### 5.2.8 VMware Notes
{%include manuals/{{ page.version }}/5.2.8_cr_vmware.md %}
### 5.2.9 Password Encryption
{%include manuals/{{ page.version }}/5.2.9_cr_encryption_key.md %}

## 5.3 Install Locations
{%include manuals/{{ page.version }}/missing.html %}
-

## 5.4 Securing Communications with SSL
{%include manuals/{{ page.version }}/5.4_communications.md %}
### 5.4.1 Securing Puppet Server Requests
{%include manuals/{{ page.version }}/5.4.1_comms_puppetserver.md %}
### 5.4.2 Securing Smart Proxy Requests
{%include manuals/{{ page.version }}/5.4.2_comms_proxy.md %}
## 5.5 Backup, Recovery and Migration
{%include manuals/{{ page.version }}/5.5_backup_and_recovery.md %}
### 5.5.1 Backup
{%include manuals/{{ page.version }}/5.5.1_backup.md %}
### 5.5.2 Recovery
{%include manuals/{{ page.version }}/5.5.2_recovery.md %}

## 5.6 Rails Console
{%include manuals/{{ page.version }}/5.6_rails_console.md %}

<a id="5.7SPNEGOauthentication"></a>

## 5.7 External Authentication
{%include manuals/{{ page.version }}/5.7_external_authentication.md %}
### 5.7.1 Configuration via Foreman installer
{%include manuals/{{ page.version }}/5.7.1_quick_configuration.md %}
### 5.7.2 HBAC configuration
{%include manuals/{{ page.version }}/5.7.2_HBAC_rules.md %}
### 5.7.3 Kerberos Single Sign-On
{%include manuals/{{ page.version }}/5.7.3_kerberos.md %}
### 5.7.4 PAM Authentication
{%include manuals/{{ page.version }}/5.7.4_pam_authentication.md %}
### 5.7.5 Populate users and attributes
{%include manuals/{{ page.version }}/5.7.5_populate_users_attributes_groups.md %}
### 5.7.6 Namespace separation
{%include manuals/{{ page.version }}/5.7.6_namespace_separation.md %}
### 5.7.7 Single Sign-on for Foreman using OpenID Connect protocol
{%include manuals/{{ page.version }}/5.7.7_openid_sso.md %}

## 5.8 Multiple Foreman instances
{%include manuals/{{ page.version }}/5.8_multiple_foremen.md %}
### 5.8.1 Sharing the database
{%include manuals/{{ page.version }}/5.8.1_database.md %}
### 5.8.2 Encrypting passwords
{%include manuals/{{ page.version }}/5.8.2_encryption_rb.md %}
### 5.8.3 Signing cookies
{%include manuals/{{ page.version }}/5.8.3_secret_token.md %}
### 5.8.4 Other considerations
{%include manuals/{{ page.version }}/5.8.4_other_considerations.md %}

## 5.9 HTTP(S) Proxy
{%include manuals/{{ page.version }}/5.9_http_proxy.md %}

# 6. Plugins
{%include manuals/{{ page.version }}/6_plugins.md %}

# 7. Troubleshooting

## 7.1 NoVNC
{%include manuals/{{ page.version }}/7.1_novnc.md %}

## 7.2 Debugging
{%include manuals/{{ page.version }}/7.2_debugging.md %}

## 7.3 Getting Help
{%include manuals/{{ page.version }}/7.3_getting_help.md %}
