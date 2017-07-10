---
layout: plugin
title: Foreman Virt Who Configure 0.1 Manual
version: 0.1
---

# 1. {{ page.title }}

This plugin make [virt-who](https://github.com/virt-who/virt-who) configuration easy. It provides simple UI for obtaining required information about the desired virt-who configuration, such as hypervisor credentials, check interval and similar. After the information is gathered, it provides a configuration script that is used to install and configure the virt-who instance. All incoming reports from such virt-who instance are tracked and monitored by the plugin.  

# 2. Installation

This plugins requires [Katello](https://theforeman.org/plugins/katello/index.html) to be installed in your Foreman instance. If you have it, simply install a package with the plugin (rpm only), run migrations and seed by running

    yum install rubygem-foreman_virt_who_configure
    foreman-rake db:migrate
    foreman-rake db:seed

Plugin package lives in [Katello repositories](https://fedorapeople.org/groups/katello/releases/yum/).

If installed foreman from git, you can simply add foreman-virt_who_configure gem as one of the dependencies. Don't forget to run migrations and seed afterwards and obviously restart the Foreman. You still need to have Katello installed.

Note for Satellite 6 users, the plugin is installed out of the box and no extra action is required.  

# 3. Configuration

There's nothing to configure for this plugin yet. See the next chapter.

# 4. Usage (features description)

The plugin adds a new link "Virt-who configurations" under Infrastructure menu. This page lists all virt-who configurations that were created in Foreman. To create a new configuration, click Create Config button. Once you provide all information, the configuration is registered and you can deploy it. Each configuration provides a configuration script that you find after clicking on its name. The configuration script should be run on a host where you want to deploy virt-who instance at, e.g. the same host where Foreman runs. Existing virt-who configurations can be deleted when no longer required. Plugin also provides monitoring widget for dashboard. Please see chapters below for more details on every feature.
 
## 4.1 Creating

In order to create new virt-who configuration, navigate to Insrastructure -> Virt-who configurations and click Create Config button. This takes you to form which guides you through what we need to know in order to successfully configure virt-who. Most of fields provide some inline help, please click the help icon for more information.

Note that every virt-who configuration must exist in an organization. If you haven't selected any organization, you'll see Owner field in the form where you need to choose an Organization. If you already are in some organization context, the Owner field is not displayed and the virt-who configuration will be automatically created in this Organization scope.
  
Default values which are prefilled are recommended values which are usually not needed to be changed. This applies to especially to Interval, Hypervisor ID and Satellite server FQDN. The Satellite server FQDN is where the virt-who instance will send reports to so make sure this FQDN is reachable from the host, where the virt-who instance will run. The default value is determined based on what Setting foreman_url is configured to.

Once you submit all information, the configuration script is rendered and displayed on the screen. The script in general contains commands to install virt-who, create it's configuration under /etc/virt-who.d/ and starting the service.

## 4.2 Deploying

To find the configuration script for a virt-who configuration, click it's name on virt-who configurations list page. You will see the page with brief information about how to deploy the configuration script and then the script itself.
 
There are multiple ways to do the deployment. Only recent version of virt-who is supported. The scripts does the check and prints warning if unsupported version is detected. Note for RHEL users, the supported version is always in Satellite Tools repository, make sure the host where you run the script has access to it or you have supported virt-who version available.

### 4.2.1 Copy and paste

You can simply copy and paste the content of the script to some file on host where you want to deploy it. Make sure the file is only readable by root, it contains sensitive information. Also make sure, you clean clipboard afterwards. Then simply run the script e.g. like this

```sh
bash /root/my_script
```

### 4.2.2 Downloading the script

You can download the script using "Download the script" button. If you're running this on some workstation, make sure you store it on secured location and transfer it to target host by secure transport layer (e.g. ssh). The script contains sensitive information. After you copy it to secure location on target, run the script. You might need to make it executable first. Following commands illustrate the process.

```sh
scp /home/user/deploy_virt_who_config_4.sh root@satellite.example.com:/root/
ssh root@satellite.example.com
chmod u+x /root/deploy_virt_who_config_4.sh
/root/deploy_virt_who_config_4.sh
```

### 4.2.3 Using API

The plugin comes with a REST API that can be used. You can use the API endpoint for downloading the script directly on the host, where you want to deploy the virt-who. Following curl command would download it. Make sure you keep it in secure place.

```sh
curl -u admin:changeme  https://foreman.example.tst/foreman_virt_who_configure/api/v2/configs/4/deploy_script.sh > /root/deploy_script.sh
chmod u+x /root/deploy_script.sh
/root/deploy_script.sh
```

Obviously you need to change admin/changeme credentials according to your setup. The virt-who configuration id is also part of the url, 4 in this case.

### 4.2.4 Using hammer (recommended)

[Hammer CLI](https://theforeman.org/manuals/latest/#3.5.6CLI) can be used to download and/or deploy the configuration script. Note that hammer can be installed on the target host and configured to run commands against your Foreman instance. We provide a plugin for Hammer that must be installed in order for this to work. See Hammer chapter below for more details. Once you have Hammer configured, you can run following command to deploy the configuration:
 
```sh
hammer virt-who-config deploy --id 4
```

This will download the script for configuration with id 4 to secure location, run the script and prints the result to STDOUT. You can also use name of configuration to identify which virt-who configuration you want to deploy:
 
```sh
hammer virt-who-config deploy --name example_config
```

If you wish to review the script first, you can download it by following hammer command

```sh
hammer virt-who-config fetch --id 4
hammer virt-who-config fetch --id 4 --output /root/script.sh
```

The first example prints the configuration script on STDOUT, second stores it into specified path. Hammer also checks that the file does not exist previously to avoid race condition security risk. It also configures permissions properly so only current user can read and execute it. In both cases, `--name` could be used instead of `--id` 

## 4.3 Monitoring

Once the virt-who configuration is successfully deployed, virt-who daemon runs and periodically send reports about what VMs it found on hypervisor. Every report upload updates the configuration in Foreman, so you can monitor the configuration status. If you navigate to virt-who configurations list page, one of the table columns is called __Status__. Each configuration can have one of the following status:  

* **No Report Yet** - this means, no virt-who report was recieved by Foreman yet, either the configuration was not deployed yet or there was some error during the deployment or virt-who can't connect to Foreman
* **OK** - we received the report within the scheduled interval, everything is OK
* **No Change** - virt-who does not send any report when it does not find any change on hypervisor, if we don't receive any report during the scheduled interval, we consider the configuration as unchanged. This could also happen if virt-who fails to upload reports for whatever reason, if you know there was new VM added on the hypervisor but you see the configuration in __No Change__ state, check that virt-who is running and its logs.
 
There's also a dasboard widget that you can watch. It contains a table with number of configurations per each state. If you click on status name, you'll see all configurations in this state. The widget also lists last three configurations in __No Change__ state as this might or might not be problematic.
 
On the configurations lists page you can also search based on the state. The search syntax can be used

```
status = unknown
status = out_of_date
status = ok
status = ok or status = out_of_date
```

## 4.4 Redeploying

If there's some change you need to do to existing virt-who configuration, simply edit it via the same form that was used during creation. To edit a configuration, click _Edit_ button in configuration table on a particular row. After you submit new values, the configuration script reflects it. You can simply run the new version of the script and it will reconfigure the virt-who according to new values. It also restart the service for you. You can run the script repeatedly.   

## 4.5 Authentication and authorization

Plugin creates few roles that can be useful even without using the configuration functionality.

* **Virt-who Manager** - this role contains all permission to manage virt-who configurations, user needs this role to create/delete/update configurations.
* **Virt-who Reporter** - this is a role that contains minimal set of permissions for virt-who to upload the report, it can be used if you configure virt-who manually and want to use user that has locked down account
* **Virt-who Viewer** - this user can see all configurations including their configuration scripts, which means viewers could still deploy the virt-who instances for existing virt-who configurations. 

Every virt-who configuration create a service user which is used for virt-who instance authentication. This means every virt-who configuration uses a different account. The service user login is _virt_who_reporter_$id_ and has randomly generated password. The user account is assigned _Virt-who Reporter_ role. The service user can't login to Foreman and can only be used for virt-who reporting. 

# 5. API

All functionality that is provided by WebUI can be also achieved by REST API. To find information about the available API endpoints, visit `your.foreman.com/apidoc`. In addition to common seven routes for managing virt-who configurations, we have one endpoint for generating the configuration script. 

# 6. Hammer

The Hammer plugin is available too. To install it, install the Hammer plugin package from katello repostories. Note for Satellite 6 users, you don't need to take any action, as long as you have satellite-cli package installed, the plugin is configured automatically. 

All functionality that is provided in WebUI can be achieved using this plugin. To see how to use command, see

```sh
hammer virt-who-config -h
```

# 7. Migration from existing virt-who setups

If virt-who was already configured manually and send reports correctly, there's no reason to migrate to this plugin as it mainly helps with the setup. On the other hand, to monitor incoming reports for multiple virt-who instances at one place, the migration can be useful. To minimize the virt-who downtime, we suggest you check for minimal required virt-who version before you start migration though. The migration consists of following steps.
  
* create a virt-who configuration with all parameters from manual setup
* removing the old virt-who configuration file
* deploying the new virt-who configuration from the plugin

Be extra careful about the first step. E.g. changing the Hypervisor ID could easily result in having duplicated content host records. Make sure all fields in form are matching values from existing manual setup.

Removing the old configuration is pretty straightforward, we suggest making a backup of config file which is to be removed or modified just in case something goes wrong.

Deploying is described in [chapter 4.2](/plugins/foreman_virt_who_configure/{{ page.version }}/index.html#4.2Deploying).
 
# 8. Help

Please follow our [standard procedures and contacts]({{site.baseurl}}support.html).

# 9. Getting involved

## 9.1 Troubleshooting

If you find a bug, please file it in
[Redmine](http://projects.theforeman.org/projects/virt-who-configure/issues/new).

See the [troubleshooting section](/manuals/latest/index.html#7.2GettingHelp)
in the Foreman manual for more info.


## 9.2 Contributing

Follow the [same process as Foreman](/contribute.html#SubmitPatches)
for contributing.

# 10. Links

* foreman_virt_who_configure plugin [https://github.com/theforeman/foreman_virt_who_configure](https://github.com/theforeman/foreman_virt_who_configure)
* issue tracker [http://projects.theforeman.org/projects/virt-who-configure/issues](http://projects.theforeman.org/projects/virt-who-configure/issues)
