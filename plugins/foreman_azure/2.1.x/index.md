---
layout: plugin
title: Foreman AzureRm 2.1.x Manual
version: 2.1.x
# uncomment for older versions than stable or nightly
robots: noindex
---

# 1. Basics

Foreman AzureRm is the plugin for Azure v2 i.e. Azure Resource Manager API. It allows you to provision and manage your hosts in Azure Resource Manager cloud environment. Users do have restricted access within the Azure subscription (such that only they can create hosts) based on Resource Groups in AzureRm.

This plugin 2.1.x series has no dependency of foreman_azure 1.x as they refer to different Azure APIs. This 2.1.x should be compatible with Foreman 1.17 onwards, but it is recommended to use latest Foreman version.

# 2. Installation

See [the Foreman manual]({{site.baseurl}}plugins/#2.2Packageinstallation).

### Red Hat, CentOS, Scientific Linux (rpm)

Set up the repo as explained in the link above, then run

    # yum install tfm-rubygem-foreman_azure_rm

### Bundle (gem)

Add the following to bundler.d/Gemfile.local.rb in your Foreman installation directory (/usr/share/foreman by default)

    $ gem 'foreman_azure_rm'

Then run `bundle install` from the same directory

# 3. Configuration

Please refer to our documentation [Github](https://github.com/theforeman/foreman_azure_rm#foreman-azurerm-plugin)

# 4. Usage
* Creation of the Compute Resource requires using of four credentials: Client ID, Client Secret, Subscription ID and Tenant ID.

* A separate compute resource should be created per region. This means, after providing above credentials, you should click _Load Regions_ that loads all the regions available for your Azure subscription. A region must be specified from this list and the cloud instances will then be created based on the region selected for the compute resource.

* Once the compute resource with Azure Resource Manager provider is created, next step is Image creation. AzureRm now supports provisioning with marketplace, custom and shared gallery images.

* The only point to remember is while specifying the Image name it should be prefixed with the type of image. For marketplace, custom and gallery images, prefixes should be - _marketplace://_, _custom://_ and _gallery://_ respectively.

* You are now ready to create the Host. You have to select your Azure Resource Manger compute resource on the Hosts page and the relevant fields shall appear on the Virtual Machine tab.

* You can now fill in your resource group, size of the VM you want to provision, username and password or sshkey with which the user can login to the provisioned machine.

* Now, you can also select additional disks for the host. Note that the maximum number of these disks depends on the VM Size selected. Please refer to MSFT documentation for more details.

* In addition to that, you can provide any custom script or command to be executed during the VM creation process.

* In the Operating Systems tab, you must specify the Architecture, OS and the relevant Image that you have created under the compute resource. Although, setting up Root Password is not mandatory.

* Last specification is for the Network Interface. You should select a domain defined under Foreman and then select Azure subnet and Public or Private IP format. Now, you can also select multiple interfaces for your host. The maximum number of these interfaces depends on the VM Size selected. Please refer to MSFT documentation for more details.

* Upon clicking submit, provisioning should start and VM details will be available on successful provisioning.

# 5. Help

Please follow our [standard procedures and contacts]({{site.baseurl}}support.html).

## 5.1 Troubleshooting

Errors regarding the provisioning will show up on /var/log/foreman/production.log of your Foreman host.

If you find a bug, please file it in
[Redmine](https://projects.theforeman.org/projects/azurerm/issues).

See the [troubleshooting section]({{site.baseurl}}manuals/latest/index.html#7.2GettingHelp)
in the Foreman manual for more info.

## 5.2 Contributing

Follow the [same process as Foreman]({{site.baseurl}}contribute.html#SubmitPatches)
for contributing.

The source code for the plugin can be found  [github.com/theforeman/foreman_azure_rm](https://github.com/theforeman/foreman_azure_rm).


