---
layout: plugin
title: Foreman AzureRm 2.2.x Manual
version: 2.2.x
# uncomment for older versions than stable or nightly
#robots: noindex
---

# 1. Basics

Foreman AzureRm is the plugin for Azure v2 i.e. Azure Resource Manager API. It allows you to provision and manage your hosts in Azure Resource Manager cloud environment. Users do have restricted access within the Azure subscription (such that only they can create hosts) based on Resource Groups in AzureRm.

This plugin 2.2.x series has no dependency on foreman_azure 1.x as they refer to different Azure APIs. This 2.2.x should be compatible with Foreman 2.0 onwards, but it is recommended to use the latest Foreman version.

# 2. Installation

See [the Foreman manual]({{site.baseurl}}plugins/#2.2Packageinstallation).

### Red Hat, CentOS, Scientific Linux (rpm)

Set up the repo as explained in the link above, then run

    # yum install tfm-rubygem-foreman_azure_rm

### Bundle (gem)

Add the following to `bundler.d/Gemfile.local.rb` in your Foreman installation directory `/usr/share/foreman`

    $ gem 'foreman_azure_rm'

Then run `bundle install` from the same directory

# 3. Configuration

Please refer to our documentation [Github](https://github.com/theforeman/foreman_azure_rm#foreman-azurerm-plugin)

# 4. Usage
* Creation of the Compute Resource requires using four credentials: Client ID, Client Secret, Subscription ID and Tenant ID.

* By default the Cloud is set to Public/Standard, if you are using the Azure Government Cloud then the following regions are supported in the dropdown:
  - US Goverment
  - China
  - Germany

<br />
* A separate Compute Resource should be created per region. This means, after providing the above credentials, you should click _Load Regions_ that loads all the regions available for your Azure subscription. A region must be specified from this list and the cloud instances will then be created based on the region selected for the Compute Resource.

* Once the Compute Resource with Azure Resource Manager provider is created, next step is the Image creation. AzureRm now supports provisioning with Marketplace, Custom and Shared gallery images.

* The only point to remember is while specifying the Image name it should be prefixed with the type of Image. For Marketplace, Custom and Gallery images, prefixes should be - _marketplace://_, _custom://_ and _gallery://_ respectively.

* You are now ready to create the Host. You have to select your Azure Resource Manger Compute Resource on the Hosts page and the relevant fields shall appear on the Virtual Machine tab.

* You can now fill in the Resource Group, size of the VM you want to provision, username and password or sshkey with which the user can login to the provisioned machine.

* If you want to add an NVIDIA Driver or CUDA you can as well. Please refer to the Microsoft documentation links below for more details.
  - [Linux](https://docs.microsoft.com/fr-fr/azure/virtual-machines/extensions/hpccompute-gpu-linux)
  - [Windows](https://docs.microsoft.com/fr-fr/azure/virtual-machines/extensions/hpccompute-gpu-windows)

<br />

* Now, you can also select additional disks for the Host. Note that the maximum number of these disks depends on the VM Size selected. Please refer to the Microsoft documentation links below for more details.
  - [General Purpose](https://docs.microsoft.com/en-us/azure/virtual-machines/sizes-general)
  - [Compute Optimized](https://docs.microsoft.com/en-us/azure/virtual-machines/sizes-compute)
  - [Memory Optimized](https://docs.microsoft.com/en-us/azure/virtual-machines/sizes-memory)
  - [Storage Optimized](https://docs.microsoft.com/en-us/azure/virtual-machines/sizes-storage)
  - [GPU Optimized](https://docs.microsoft.com/en-us/azure/virtual-machines/sizes-gpu)
  - [High Performance](https://docs.microsoft.com/en-us/azure/virtual-machines/sizes-hpc)

<br />
* In addition to that, you can provide any custom script or command to be executed during the VM creation process.

* In the Operating Systems tab, you must specify the Architecture, OS and the relevant Image that you have created under the Compute Resource. Although, setting up the Root Password is not mandatory.

* Last specification is for the Network Interface. You should select a domain defined under Foreman and then select Azure subnet and Public or Private IP format. Now, you can also select multiple interfaces for your Host. The maximum number of these interfaces depends on the VM Size selected. Please refer to the Microsoft documentation links below for more details.
  - [General Purpose](https://docs.microsoft.com/en-us/azure/virtual-machines/sizes-general)
  - [Compute Optimized](https://docs.microsoft.com/en-us/azure/virtual-machines/sizes-compute)
  - [Memory Optimized](https://docs.microsoft.com/en-us/azure/virtual-machines/sizes-memory)
  - [Storage Optimized](https://docs.microsoft.com/en-us/azure/virtual-machines/sizes-storage)
  - [GPU Optimized](https://docs.microsoft.com/en-us/azure/virtual-machines/sizes-gpu)
  - [High Performance](https://docs.microsoft.com/en-us/azure/virtual-machines/sizes-hpc)

<br />
* Upon clicking submit, provisioning should start and VM details will be available upon successful provisioning.

# 5. Help

Please follow our [standard procedures and contacts]({{site.baseurl}}support.html).

## 5.1 Troubleshooting

Errors regarding the provisioning will show up in `/var/log/foreman/production.log` of your Foreman host.

If you find a bug, please file it in
[Redmine](https://projects.theforeman.org/projects/azurerm/issues).

See the [troubleshooting section]({{site.baseurl}}manuals/latest/index.html#7.2GettingHelp)
in the Foreman manual for more info.

## 5.2 Contributing

Follow the [same process as Foreman]({{site.baseurl}}contribute.html#SubmitPatches)
for contributing.

The source code for the plugin can be found at [github.com/theforeman/foreman_azure_rm](https://github.com/theforeman/foreman_azure_rm).

The source code for the CLI plugin can be found at [github.com/theforeman/hammer_cli_foreman_azure_rm](https://github.com/theforeman/hammer_cli_foreman_azure_rm).