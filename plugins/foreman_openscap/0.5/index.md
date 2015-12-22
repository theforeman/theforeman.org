---
layout: plugin
title: Foreman OpenSCAP manual
images: /plugins/foreman_openscap/0.5
version: 0.4.1
---

# 1. {{ page.title }}

This plugin enables Foreman to receive automated vulnerability assessment and security compliance audits from Foreman hosts.
You can upload SCAP compliance contents, create compliance policies out of them and assign the policies to hosts or hostgroups.
foreman_openscap plugin provides three default SCAP contents, so you could start testing security compliance on RHEL6/7 and Fedora.

OpenSCAP reports (aka ARF reports) will help you find vulnerabilities on your hosts and also suggest remediation plan to fix those vulnerabilities.
![OpenScap report]({{page.images}}/report_info_details.png)

Foreman OpenSCAP plugin is made of 5 components:

* [foreman_openscap](https://github.com/theforeman/foreman_openscap) - Foreman plugin which creates and persists SCAP content, compliance policy and ARF report objects.
* [smart_proxy_openscap](https://github.com/theforeman/smart_proxy_openscap) - Smart-Proxy plugin which validates SCAP content from Foreman, distributes SCAP content to clients and posts ARF reports from client hosts to Foreman
* [foreman_scap_client](https://github.com/theforeman/foreman_scap_client) - A client script which runs OpenSCAP scan and uploads the scan report to the Smart-Proxy
* [puppet-foreman_scap_client](https://github.com/theforeman/puppet-foreman_scap_client) - A puppet module which configures foreman_scap_client

## 1.1 OpenSCAP basic concepts

There are three basic concepts (entities) in OpenSCAP plug-in: SCAP Contents, Compliance Policies and ARF Reports.

__SCAP Content__ represents SCAP DataStream XML file as defined by SCAP 1.2 standard. DataStream file contains implementation of compliance,
configuration or security baselines. Users are advised to acquire examplary baseline by installing scap-security-guide package.
DataStream file usualy contains multiple XCCDF Profiles. Each for different security target. The content of DataStream file can be inspected by oscap tool from openscap-scanner package.
(XCCDF = Extensible Configuration Checklist Description Format, XCCDF profile = A checklist which audit specific security target)

__Compliance Policy__ is high level concept of a baseline applied to the infrastructure. Compliance policy is defined by user on web interface. Users may assign following information to the policy:

* SCAP Content
* XCCDF Profile from particular SCAP Content
* Hostgroups that should comply with the policy
* Schedule - the period in which the audit shall occur

__ARF Report__ is XML output of single scan occurrence per single host. Asset Reporting File format is defined by SCAP 1.2 standard. Foreman plug-in stores the ARF Reports in database for later inspections.


## 1.2 Release notes
foreman_openscap has two versions: 0.4.x for 1.8+, 0.5.x for 1.11+

Both versions' functionality is the same, the changes only affect to the way it communicates with Foreman and Smart-Proxy APIs

<table class="table table-bordered table-condensed">
  <tr>
    <th>Foreman version</th>
    <th>Plugin version</th>
    <th>Proxy version</th>
    <th>Client version</th>
  </tr>
  <tr>
    <td>= 1.7</td>
    <td>0.3.4</td>
    <td>0.3.1</td>
    <td>0.1.1</td>
  </tr>
  <tr>
    <td>>= 1.8</td>
    <td>0.4.1</td>
    <td>0.4.0</td>
    <td>0.1.1</td>
  </tr>
  <tr>
    <td>>= 1.11</td>
    <td>0.5.0</td>
    <td>0.5.0</td>
    <td>0.1.2</td>
  </tr>
</table>

# 2. Installation

There are a few components to install:

Foreman OpenSCAP (foreman_openscap), Smart Proxy OpenSCAP (smart_proxy_openscap), foreman_scap_client and puppet-foreman_scap_client.

### 2.1 Installing foreman_openscap

On the Foreman server:

	> yum install ruby193-rubygem-foreman_openscap
	> service httpd reload

Please refer to the Foreman plugin [manual]({{site.baseurl}}/manuals/latest/index.html#6.1InstallaPlugin) for more information about installing Foreman plugins.

### 2.2 Installing smart_proxy_openscap

On the Smart-Proxy server:


    > yum install rubygem-smart_proxy_openscap

Edit ```/etc/foreman-proxy/settings.d/openscap.yml``` with the appropriate settings

    ---
    :enabled: true
    :reportsdir: /path/to/saved/arf_reports/
    :spooldir: /path/to/arf_reports/which/failed/to/post/to/foreman


### 2.3 Installing puppet-foreman_scap_client

    puppet module install isimluk-foreman_scap_client

This puppet module will automatically install foreman_scap_client (if not installed) and will configure the client's ```/etc/foreman_scap_client/config.yaml``` with parameters which are needed for the operation of foreman_scap_client.

# 4. Usage

This chapter covers features that you can use in terms of Foreman and OpenSCAP
integration. Everything described below assumes you've sucessfully installed
foreman_openscap, smart_proxy_openscap and puppet-foreman_scap_client is available on your Puppet master and Foreman.

*__Please note:__ smart_proxy_openscap is __required__ for the normal operation of foreman_openscap*

You would usually start with uploading SCAP contents, then create policies of those SCAP contents and assign the policy to hosts or hostgroups.
The puppet module will install ```foreman_scap_client``` and configure it with the needed policy information. The puppet module also adds a cron line,
which runs the SCAP client at the schedule select when creating the policy.

## 4.1 Creating SCAP content

foreman_openscap comes with default SCAP content provided by [scap-security-guide](https://fedorahosted.org/scap-security-guide/).

The default SCAP content is available for RHEL 6, RHEL 7 and Fedora.

Besides the default SCAP content, you can also upload your own SCAP content.

__Access SCAP contents__ - Hosts -> Compliance -> SCAP Contents

__Create SCAP Content__ - You can upload any valid OpenSCAP DataStream file

(After upload, SCAP content is validated at the Smart-Proxy and SCAP profiles are extracted)
![New SCAP Content]({{page.images}}/create_new_scap_content.png)


## 4.2 Creating policy wizard

* Name your policy
* Choose which SCAP content & SCAP profile to apply
* Choose schedule when to run this policy
* Select which locations / organizations this policy belongs to, if enabled
* Choose which hostgroups you wish apply this policy

![Policy Wizard]({{page.images}}/policy_wizard.png)
## 4.3 Assigning policy to host

You can assign a policy in two ways:

* By assigning a policy to hostgroup(s) when creating / editing a policy. All hosts which belong to that hostgroup will automatically be assigned to the policy.
* By assigning a policy to host(s) via hosts index: In the hosts index, choose the hosts you wish to assign a policy. Click on 'Select Action' and choose: "Assign Compliance Policy" and choose which policy to assign to the selected hosts.

![Assign Hosts]({{page.images}}/assign_hosts.png)

## 4.4 ARF Reports
You can access the generated reports via Hosts -> Compliance -> Reports
![ARF reports index]({{page.images}}/arf_index.png)
Clicking on "View Report" will lead you to the actual security audit report, with detailed information on the host's security check and suggested remediation.
![ARF report]({{page.images}}/arf_report.png)

# 5. Advanced topics

## 5.1 Distributing SCAP content with Foreman & Proxy

* Exposes a url on Foreman for downloading the scap file for the policy (```/api/compliance/policies/\<policy_id\>/content```)
* OpenSCAP plugin on Proxy serves as a (dumb) proxy to the above url (meaning, calling something like: ```https://\<proxy_url\>/compliance/policies/\<policy_id\>/content``` will fetch the xml from ```https://\<foreman_url\>/api/compliance/policies/\<policy_id\>/content```)
* When foreman_scap_client starts running, it checks if the file configured by puppet exists. If it exists, it will resume operation. If it doesn’t exist, it will download the file from the Proxy and resume its operation.

![Distribute SCAP Content]({{page.images}}/scap_design.png)


## 5.2 Validating SCAP content on the proxy

* When uploading an SCAP content to Foreman it sends the file for validation at the Smart-Proxy:
  * The Smart-Proxy validates that the SCAP xml file is a valid OpenSCAP file, and returns the errors if not.
  * Once the SCAP content is validated, the Smart-Proxy is extracting the SCAP profiles for later use when creating a policy.
  
## 5.3 Arf Report retrieval process
* The client host is running oscap test and uploads ARF report to the Smart-Proxy as an XML file.
* The Smart-Proxy parses the XML and generates a JSON report. 
* Once the JSON report has been successfully posted to the Foreman, the XML file is saved on the Smart-Proxy's filesystem for later use from the Foreman
* (If the post to the Foreman fails the file is saved for later retry)
* On the Foreman side: 
  * The ARF report receives the JSON formatter report from the proxy and generates the report, its logs and messages.
  * The complete report can be downloaded from the Smart-Proxy as a compressed XML, or viewed in OpenSCAP style HTML.  

![Upload ARF Reports]({{page.images}}/reports_design.png)
  
# 6. Help

Please follow our [standard procedures and
contacts]({{site.baseurl}}support.html).

# 7. Getting involved

## 7.1 Troubleshooting

If you find a bug, please file it in
[Redmine](http://projects.theforeman.org/projects/foreman_openscap/issues/new).

See the [troubleshooting section](/manuals/latest/index.html#7.2GettingHelp)
in the Foreman manual for more info.


## 7.2 Contributing

Follow the [same process as Foreman](/contribute.html#SubmitPatches)
for contributing.

# 8. Links

* foreman_openscap plugin [https://github.com/OpenSCAP/foreman_openscap](https://github.com/OpenSCAP/foreman_openscap)
* smart_proxy_openscap plugin [https://github.com/OpenSCAP/smart_proxy_openscap](https://github.com/OpenSCAP/smart_proxy_openscap)
* foreman_scap_client [https://github.com/OpenSCAP/foreman_scap_client](https://github.com/OpenSCAP/foreman_scap_client)
* puppet-foreman_scap_client [https://github.com/OpenSCAP/puppet-foreman_scap_client](https://github.com/OpenSCAP/puppet-foreman_scap_client)
* Issue tracker [http://projects.theforeman.org/projects/foreman_openscap/issues](http://projects.theforeman.org/projects/foreman_openscap/issues)
