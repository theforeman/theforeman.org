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

* Foreman OpenSCAP (foreman_openscap)
* Smart Proxy OpenSCAP (smart_proxy_openscap)
* foreman_scap_client
* puppet-foreman_scap_client.

### 2.1 Installing foreman_openscap

The easiest and recommended way is using foreman-installer. It's as easy as running this command

	> foreman-installer --enable-foreman-plugin-openscap

If you prefer the manual way, you can install it from package like this:

	> yum install tfm-rubygem-foreman_openscap
	> foreman-rake db:migrate
	> foreman-rake db:seed
	> service httpd reload

If your distribution does not provide openscap package recent enough, you can get it from https://copr.fedorainfracloud.org/coprs/isimluk/OpenSCAP/

Please refer to the Foreman plugin [manual]({{site.baseurl}}/manuals/latest/index.html#6.1InstallaPlugin) for more information about installing Foreman plugins.

### 2.2 Installing smart_proxy_openscap

The easiest and recommended way is using foreman-installer. It's as easy as running this command

	> foreman-installer --enable-foreman-proxy-plugin-openscap

If you run Smart-Proxy with Foreman on the same host you can combine it with --enable-foreman-plugin-openscap option.

If you prefer the manual way, install this package on the Smart-Proxy server:

    > yum install rubygem-smart_proxy_openscap

Edit ```/etc/foreman-proxy/settings.d/openscap.yml``` with the appropriate settings

    ---
    :enabled: true

    # Log file for the forwarding script.
    :openscap_send_log_file: /var/log/foreman-proxy/openscap-send.log

    # Directory where OpenSCAP audits are stored
    # before they are forwarded to Foreman
    :spooldir: /var/spool/foreman-proxy/openscap

    # Directory where OpenSCAP content XML are stored
    # So we will not request the XML from Foreman each time
    :contentdir: /var/lib/openscap/content

    # Directory where OpenSCAP report XML are stored
    # So Foreman can request arf xml reports
    :reportsdir: /usr/share/foreman-proxy/openscap/reports

    # Directory where OpenSCAP report XML are stored
    # In case sending to Foreman succeeded, yet failed to save to reportsdir
    :failed_dir: /usr/share/foreman-proxy/openscap/failed


### 2.3 Installing puppet-foreman_scap_client

    puppet module install isimluk-foreman_scap_client

This puppet module will automatically install foreman_scap_client (if not installed) and will configure the client's ```/etc/foreman_scap_client/config.yaml``` with parameters which are needed for the operation of foreman_scap_client. The module is used by Foreman to automate the configuration and triggering of foreman_openscap_client, so you should install it in all puppet environments that your hosts use.

# 3. Upgrading from 0.4.x

As with any Foreman plugin, the recommended upgrade path is done via `yum upgrade`. This will ensure that all of the packages are with the right version, dependencies
and data migrations.

__Note: ARF reports are not automatically migrated and need a manual step__

## 3.1 Migrating ARF reports from 0.4.x

ARF reports in 0.5.x and Foreman > 1.11 are now part of Foreman's reports (Reports STI), and the physical ARF report XML is now saved at the Smart-Proxy.

This requires a special migration, which needs both Foreman and Smart-Proxy up and running, with latest respective OpenSCAP plugins installed.
 
Since we cannot assure this during upgrade, migration of ARF reports has moved to a rake task which should be performed after upgrading.

To upgrade ARF reports from 0.4.x to 0.5.x:

* Upgrade foreman_openscap to version 0.5.x
* Upgrade smart_proxy_openscap to version 0.5.x
* Run `foreman-rake db:migrate` to ensure all other data has been migrated
* Restart Foreman and Smart-Proxy
* Run `foreman-rake foreman_openscap:migrate[<proxy_id>]` (Where `<proxy_id>` is the id of the Smart-Proxy with OpenSCAP feature).

__Notes:__ to find out your Smart-Proxy id you can either run `hammer proxy list` or pick the Smart-Proxy's id from the url in web UI. please note it should be inside the square brackets

__Process:__ During the ARF reports migration, the old ARF reports are fetched from the Foreman database, sent to the Smart-Proxy for re-processing and saving and are sent back to the Foreman in their new
format - while keeping their original data.

Once the old ARF report has successfully migrated, it is deleted from the old table.

# 4. Usage

This chapter covers features that you can use in terms of Foreman and OpenSCAP
integration. Everything described below assumes you've sucessfully installed
foreman_openscap, smart_proxy_openscap and puppet-foreman_scap_client is available on your Puppet master and Foreman.

*__Please note:__ smart_proxy_openscap is __required__ for the normal operation of foreman_openscap*

You would usually start with uploading SCAP contents, then create policies of those SCAP contents and assign the policy to hosts or hostgroups.
The puppet module will install ```foreman_scap_client``` and configure it with the needed policy information. The puppet module also adds a cron line,
which runs the SCAP client at the schedule select when creating the policy.

## 4.1 Creating SCAP content

### 4.1.1 Creating default SCAP content

When installing foreman_openscap from RPM, we also add default SCAP content provided by [scap-security-guide](https://fedorahosted.org/scap-security-guide/).

In previous versions, the default SCAP content was added via seed task.

In version >= 0.5.x, we are processing all of OpenSCAP content and reports in the Proxy.

And we are unsure if during installation the smart_proxy_openscap plugin is installed and enabled, so we can not seed the default SCAP content
 - hence the auto SCAP content generation is now obsolete.

Instead of auto-generating default SCAP content when installing foreman_openscap, you can now accomplish that with a rake task.

__Creating default SCAP content__

* Install smart_proxy_openscap on one (or more) of your proxies
* Refresh features of that proxy (so it will register with OpenSCAP feature on the Foreman)
* from terminal run `foreman-rake foreman_openscap:bulk_upload:default`

This will search for scap-security-guide SCAP contents and create SCAP content on the Foreman.

### 4.1.2 Uploading SCAP content

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
