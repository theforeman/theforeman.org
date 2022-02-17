---
layout: plugin
title: Foreman Virt Who Configure 0.5 Manual
version: 0.5    
# uncomment for older versions than stable or nightly
#robots: noindex
---

# 1. {{ page.title }}

This plugin makes [virt-who](https://github.com/virt-who/virt-who) configuration easy. It provides a simple UI for obtaining required information about the desired virt-who configuration, such as hypervisor credentials, checkin interval and similar. After the information is gathered, it provides a configuration script that is used to install and configure the virt-who instance. All incoming reports from such virt-who instance are tracked and monitored by the plugin.

## 1.2 Supported Hypervisors:

* oVirt
* Libvirt
* VMware
* Hyper-V
* Kubevirt
* Nutanix AHV

# 2. Installation

This plugin requires [Katello](https://theforeman.org/plugins/katello/index.html) to be installed in your Foreman instance. If you have it, simply install a package with the plugin (rpm only), run the database migrations and seed by running:

    yum install rubygem-foreman_virt_who_configure
    foreman-rake db:migrate
    foreman-rake db:seed

The plugin package lives at [Katello repositories](http://yum.theforeman.org/plugins/).

If Foreman was installed from git, you can simply add the foreman-virt_who_configure gem as one of the dependencies. Don't forget to run the database migrations and seed afterwards and restart the Foreman services. You still need to have Katello installed.

Note for Satellite users: The plugin is installed out of the box and no extra action is required.

# 3. Usage (features description)

The plugin adds a new link __Virt-who configurations__ under the __Infrastructure__ menu. This page lists all virt-who configurations that were created in Foreman. 

To create a new configuration, click the __Create Config__ button. Once you provide all the information, the configuration is registered and you can deploy it. Each configuration provides a configuration script that you will find after clicking on its name. The configuration script should be run on a host where you want to deploy the virt-who instance at, e.g. the same host where Foreman runs. 

Existing virt-who configurations can be deleted when no longer required. The Plugin also provides a monitoring widget for the dashboard. Please see chapters below for more details on every feature.
 
## 3.1 Creating

In order to create a new virt-who configuration, navigate to __Infrastructure__ -> __Virt-who configurations__ and click the __Create Config__ button. This takes you to a form which guides you through what we need to know in order to successfully configure virt-who. Most of the fields provide some inline help, please click the help icon for more information.

Note that every virt-who configuration must be assigned to an organization. If you haven't selected any organization, you'll see an Owner field in the form where you will need to choose an Organization. If you already are in some organization context, the Owner field is not displayed and the virt-who configuration will be automatically created in this Organization scope.
  
Values which are prefilled are default recommended values, which usually don't need any changes. This applies to especially to Interval, Hypervisor ID and Foreman server FQDN. The Foreman server FQDN is where the virt-who instance will send reports to so make sure this FQDN is reachable from the host, where the virt-who instance will run. The default value is determined based on what setting `foreman_url` is configured to.

Once you submit all the information, the configuration script is rendered and displayed on the screen. The script in general contains commands to install virt-who, create its configuration under `/etc/virt-who.d/` and start the service.

## 3.2 Deploying

To find the configuration script for a virt-who configuration, click its name on virt-who configurations list page. You will see the page with some brief information about how to deploy the configuration script and then the script itself.
 
There are multiple ways to do the deployment. Only recent versions of virt-who are supported. The script does the check and prints a warning if any unsupported versions are detected. Note for RHEL users: The supported version is always in the Foreman Client Tools repository; make sure the host where you run the script has access to it or you have a supported virt-who version available.

### 3.2.1 Copy and paste

You can simply copy and paste the content of the script to some file on the host where you want to deploy it. Make sure the file is only readable by root, as it contains sensitive information. Also, make sure you clean the clipboard afterwards. Then simply run the script e.g. like this:

```sh
bash /root/my_script
```

### 3.2.2 Downloading the script

You can download the script using "Download the script" button. If you're running this on some workstation, make sure you store it at a secure location and transfer it to the target host by secure transport layer (e.g. ssh). The script contains sensitive information. After you copy it to secure location on the target host, run the script. You might need to make it executable first. The following commands illustrate the process:

```sh
scp /home/user/deploy_virt_who_config_4.sh root@satellite.example.com:/root/
ssh root@satellite.example.com
chmod u+x /root/deploy_virt_who_config_4.sh
/root/deploy_virt_who_config_4.sh
```

### 3.2.3 Using the API

The plugin comes with a REST API that can be used. You can use the API endpoint for downloading the script directly on the host, where you want to deploy the virt-who. The following curl command would download it. Make sure you keep it in a secure place.

```sh
curl -u admin:changeme  https://foreman.example.tst/foreman_virt_who_configure/api/v2//configs/4/deploy_script.sh > /root/deploy_script.sh
chmod u+x /root/deploy_script.sh
/root/deploy_script.sh
```

Replace `admin:changeme` with your own credentials. The virt-who configuration id is also part of the url, 4 in this case.

### 3.2.4 Using Hammer (recommended)

[Hammer CLI](https://theforeman.org/manuals/latest/#3.5.6CLI) can be used to download and/or deploy the configuration script. Note that Hammer CLI can be installed on the target host and configured to run commands against your Foreman instance. We provide a plugin for Hammer CLI that must be installed in order for this to work. 

All functionality that is provided in the WebUI can be achieved using this plugin. To see how to use the Hammer CLI plugin command, see

```sh
hammer virt-who-config -h
```

#### Listing configs

```sh
$ hammer virt-who-config list
---|--------|---------------|--------|--------------------
ID | NAME   | INTERVAL      | STATUS | LAST REPORT AT     
---|--------|---------------|--------|--------------------
2  | RHV    | every 4 hours | OK     | 2021/10/12 20:13:54
1  | VMware | every 4 hours | OK     | 2021/10/14 16:14:09
---|--------|---------------|--------|--------------------
```

#### Deploying a configuration
 
```sh
hammer virt-who-config deploy --id 4
```

This will download the script for configuration with id 4 to a secure location, run the script and it prints the result to STDOUT. You can also use the name of the configuration to identify which virt-who configuration you want to deploy:
 
```sh
hammer virt-who-config deploy --name example_config
```

If you wish to review the script first, you can download it by the following Hammer CLI command:

```sh
hammer virt-who-config fetch --id 4
hammer virt-who-config fetch --id 4 --output /root/script.sh
```

The first example prints the configuration script on STDOUT; the second stores it into the specified path. Hammer CLI also checks that the file does not exist previously to avoid a race condition security risk. It also configures permissions properly so only the current user can read and execute it. In both cases, `--name` could be used instead of `--id`.

#### Viewing a config

```sh
$ hammer virt-who-config info --id 1

General information: 
    Id:                  1
    Name:                VMware
    Hypervisor type:     esx
    Hypervisor server:   vcenter.example.com
    Hypervisor username: username
    Status:              OK
Schedule:            
    Interval:       every 4 hours
    Last Report At: 2021/10/14 16:14:09
Connection:          
    Satellite server:     foreman.example.com
    Hypervisor ID:        hostname
    Filtering:            Unlimited
    Filter host parents:  
    Exclude host parents: 
    Debug mode:           no
    Ignore proxy:
```

#### Creating a config

```sh
hammer virt-who-config create --name="gCBHwsVPFZ" --debug="1" --interval="60" --hypervisor-id="hostname" --hypervisor-type="esx" --organization-id="1" --filtering-mode="none" --satellite-url="foreman.example.com" --hypervisor-server="esxi.example.com" --hypervisor-username="admin" --hypervisor-password="password"

Virt Who configuration [gCBHwsVPFZ] created
```

#### Updating a config

```sh
$ hammer virt-who-config update --id 5 --hypervisor-password="changeme"

Virt Who configuration [gCBHwsVPFZ] updated
```

#### Deleting a config

```sh
$ hammer virt-who-config delete --id 5

Virt Who configuration deleted
```

## 3.3 Monitoring

Once the virt-who configuration is successfully deployed, the virt-who daemon runs and periodically sends reports about what VMs it found on the hypervisors. Every report upload updates the configuration in Foreman, so you can monitor the configuration status. If you navigate to the virt-who configurations list page, one of the table columns is called __Status__. Each configuration can have one of the following statuses:  

* **No Report Yet** - This means no virt-who report was recieved by Foreman yet. Either the configuration was not deployed yet, or there was some error during the deployment, or virt-who can't connect to Foreman.
* **OK** - Foreman received the report within the scheduled interval.
* **No Change** - Virt-who does not send any report when it does not find any change on hypervisor. If Foreman doesn't receive any report during the scheduled interval, the configuration is considered unchanged. This could also happen if virt-who fails to upload reports for whatever reason. If you know there was a new VM added on the hypervisor but you see the configuration in __No Change__ state, check that virt-who is running and its logs.
 
There's also a dashboard widget that you can watch. It contains a table with a number of configurations per state. If you click on the status name, you'll see all configurations in this state. The widget also lists the last three configurations in __No Change__ state as this might or might not be problematic.
 
On the configurations lists page you can also search based on the state. The search syntax can be used

```
status = unknown
status = out_of_date
status = ok
status = ok or status = out_of_date
```

## 3.4 Redeploying

If there's some change you need to do to existing virt-who configuration, simply edit it via the same form that was used during creation. To edit a configuration, click the __Edit__ button in the configuration table on a particular row. After you submit the new values, the configuration script reflects it. You can simply run the new version of the script and it will reconfigure the virt-who according to the new values. It also restarts the service for you. You can run the script repeatedly.   

## 3.5 Authentication and authorization

The plugin creates a few roles that can be useful even without using the configuration functionality.

* **Virt-who Manager** - This role contains all permissions to manage virt-who configurations. The user needs this role to create/delete/update configurations.
* **Virt-who Reporter** - This is a role that contains minimal set of permissions for virt-who to upload the report. It can be used if you configure virt-who manually and want to use a user that has a restricted account.
* **Virt-who Viewer** - This user can see all configurations including their configuration scripts, which means viewers could still deploy the virt-who instances for existing virt-who configurations. 

Every virt-who configuration creates a service user which is used for virt-who instance authentication. This means every virt-who configuration uses a different account. The service user login is __virt_who_reporter_$id__ and has a randomly generated password. The user account is assigned __Virt-who Reporter__ role. The service user can't login to Foreman and can only be used for virt-who reporting. 

# 4. API

All functionality that is provided by the WebUI can be also achieved by the REST API. 

The following API endpoints are available:
```
* :GET, 'foreman_virt_who_configure/api/v2/configs', N_("List of virt-who configurations")

* :GET, "foreman_virt_who_configure/api/v2/configs/:id/", N_("Show a virt-who configuration")

* :GET, "foreman_virt_who_configure/api/v2/configs/:id/deploy_script/", N_("Renders a deploy script for the specified virt-who configuration")

* :POST, 'foreman_virt_who_configure/api/v2/configs', N_("Create a virt-who configuration")

* :PUT, 'foreman_virt_who_configure/api/v2/configs/:id', N_("Update a virt-who configuration")

* :DELETE, 'foreman_virt_who_configure/api/v2/configs/:id', N_("Delete a virt-who configuration")
```
To find more information about how to use the available API endpoints, visit `your.foreman.com/apidoc`.

# 5. Migration from existing virt-who setups

If virt-who was already configured manually and sending reports correctly, there's no reason to migrate to this plugin as it mainly helps with the setup. On the other hand, to monitor incoming reports for multiple virt-who instances at one place, the migration can be useful. To minimize the virt-who downtime, we suggest you check for the minimal required virt-who version before you start the migration. The migration consists of the following steps:
  
* Create a virt-who configuration with all parameters from manual setup.
* Remove the old virt-who configuration file.
* Deploy the new virt-who configuration from the plugin.

Removing the old configuration is pretty straightforward. We suggest making a backup of the config file which is to be removed or modified just in case something goes wrong.

Deploying is described in [chapter 3.2](/plugins/foreman_virt_who_configure/{{ page.version }}/index.html#3.2Deploying).
 
# 6. Help

Please follow our [standard procedures and contacts]({{site.baseurl}}support.html).

# 7. Getting involved

## 7.1 Troubleshooting

If you find a bug, please file it in
[Redmine](http://projects.theforeman.org/projects/virt-who-configure/issues/new).

See the [troubleshooting section](/manuals/latest/index.html#7.2GettingHelp)
in the Foreman manual for more info.


## 7.2 Contributing

Follow the [same process as Foreman](/contribute.html#SubmitPatches)
for contributing.

# 8. Links

* foreman_virt_who_configure plugin [https://github.com/theforeman/foreman_virt_who_configure](https://github.com/theforeman/foreman_virt_who_configure)
* issue tracker [http://projects.theforeman.org/projects/virt-who-configure/issues](http://projects.theforeman.org/projects/virt-who-configure/issues)
* foreman_virt_who_configure hammer cli plugin [https://github.com/theforeman/hammer-cli-foreman-virt-who-configure](https://github.com/theforeman/hammer-cli-foreman-virt-who-configure)
