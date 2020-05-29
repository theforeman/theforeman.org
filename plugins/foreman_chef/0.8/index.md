---
layout: plugin
pluginname: foreman_chef
title: Foreman Chef 0.8 Manual
version: 0.8
# uncomment to show warning box for an old release
#warning: old
# uncomment to show development version warning
#warning: unreleased
# uncomment for older versions than stable or nightly
#robots: noindex
---

# 1. {{ page.title }}

This plugin enables using Foreman with Chef. Main features include receiving
chef-run reports, node attributes from chef clients and use these data for regular
Foreman features such as displaying status of your infrastructure on dashboard,
monitoring based on convergence reports, etc.

It's also possible to automate bootstrapping of chef-client during the host provisioning.
This plugin also makes active communication with chef server possible so we can 
manipulate the node run list and environment. In the same way we can delete nodes and
clients from chef-server upon host deletion in Foreman. Foreman can also be used as
another source for node attributes. You can combine Foreman parametrization system
with chef-server attribute store.

All communication between Foreman and Chef goes through Foreman Proxy which is running
as a [separate plugin](https://github.com/theforeman/smart_proxy_chef) and has
direct access to the Chef server using chef-api gem. Therefore Foreman instance and
all Chef clients must be able to connect to Foreman Proxy. Foreman Proxy also needs to
be able to open the connection to Foreman. It's recommended to install the Foreman Proxy
in your datacenter near your Chef server. It's also fine to run Foreman Proxy on the same
host where you run the Foreman, especially if you're using Hosted Chef.

The upload of reports and attributes is triggered at the end of each chef client run,
which is handled by [third plugin](https://github.com/theforeman/chef-handler-foreman),
a form of chef handler, which is also provided by Foreman developers.

![Infrastructure overview](/plugins/foreman_chef/{{ page.version }}/infrastructure_schema.png)

## 1.1 Supported platforms

Components are explained below, here's just a list of what platforms you
can use for each of them.

ForemanChef plugin depends on ForemanTasks which works only in Ruby 1.9. This is
OK with all Foreman supported platforms, since Foreman runs on software collection
if needed. Version >= 0.6 requires Foreman 1.15+.

SmartProxyChef plugin also requires Ruby 1.9 because of chef-api gem that
we use to communicate with chef server. Smart proxy does not run in software
collection so the support is limited to platforms where system ruby is 1.9+.
Therefore you can use following (and newer) platforms RHEL 7, CentOS 7,
Debian Wheezy, Ubuntu Trusty.

Chef handler Foreman should run on Ruby 1.8+ so you can use it on most
platforms. Since 0.1.0 you can use it also on Windows.

# 2. Installation

There are two different components to install: Foreman Chef plugin and
Foreman Proxy Chef plugin (aka Smart Proxy Chef). Since Foreman 1.8 the
installer supports both and it's fairly easy to set them up. Supposing
you added Foreman repositories and installed the foreman-installer package you
can start the Foreman installation using this command

    # to install Foreman with foreman_chef plugin
    foreman-installer --enable-foreman-plugin-chef --enable-foreman-plugin-tasks

Note that it will also install foreman_tasks plugin which is dependency of chef
plugin.

To install Foreman proxy chef plugin you can use this command

    # to install Foreman proxy with smart_proxy_chef plugin
    foreman-installer --enable-foreman-proxy-plugin-chef

If you're running Foreman and Foreman proxy on the same host, you may combine
both in single command. Also note that smart_proxy_chef has more options that
you can (and some of them should) use.

<table class="table table-bordered table-condensed">
  <tr>
    <th>Argument</th>
    <th>Description</th>
  </tr>
  <tr>
    <td>--foreman-proxy-plugin-chef-client-name</td>
    <td>chef client name used for authentication of other client requests and other communication from Foreman proxy to Chef</td>
  </tr>
  <tr>
    <td>--foreman-proxy-plugin-chef-enabled</td>
    <td>enables/disables the plugin</td>
  </tr>
  <tr>
    <td>--foreman-proxy-plugin-chef-group</td>
    <td>group owner of the configuration file</td>
  </tr>
  <tr>
    <td>--foreman-proxy-plugin-chef-listen-on</td>
    <td>Proxy feature listens on http, https, or both</td>
  </tr>
  <tr>
    <td>--foreman-proxy-plugin-chef-private-key</td>
    <td>path to file containing private key for $client_name client</td>
  </tr>
  <tr>
    <td>--foreman-proxy-plugin-chef-server-url</td>
    <td>chef server url</td>
  </tr>
  <tr>
    <td>--foreman-proxy-plugin-chef-ssl-verify</td>
    <td>should we perform chef server ssl cert verification? this requires CA certificate installed and trusted</td>
  </tr>
  <tr>
    <td>--foreman-proxy-plugin-chef-ssl-pem-file</td>
    <td>if $ssl_verify is true you can specify a path to a file which contains certificate and related private key if the certificate is not globally trusted</td>
  </tr>
  <tr>
    <td>--foreman-proxy-plugin-chef-version</td>
    <td>plugin package version, it's passed to ensure parameter of package resource can be set to specific version number, 'latest', 'present' etc.</td>
  </tr>
</table>
      
As you might have guessed, you'll need to provide this plugin the chef
client name and private key so it can communicate with chef server. Also
note that this client must be an org admin (Chef 12) or should have the admin
flag (Chef <= 11) or set of corresponding privileges, so it can read other
clients' public keys and carry out any other action you want Foreman to do for
you (e.g. delete nodes or clients). In a multi org environment you can either
use the pivotal key.

If you want to achieve multi-tenant setup, the recommended setup is to have one
Foreman Proxy per organization. Each proxy should be configured to use specific
Chef organization and its admin client key.

You must also provide chef server url (including organization name) and if you're
using self signed cert for your chef server, you'll have to specify the file
with this cert and its private key. The private key should not be technically
required, but chef-api fails on parsing the PEM file if it's missing.

Example running all of that could look similar to this

    foreman-installer \
      --enable-foreman-plugin-chef \
      --enable-foreman-plugin-tasks \
      --enable-foreman-proxy-plugin-chef \
      --foreman-proxy-plugin-chef-server-url="https://chef.example.com/organizations/default" \
      --foreman-proxy-plugin-chef-client-name="pivotal" \
      --foreman-proxy-plugin-chef-private-key="/etc/opscode/pivotal.pem" \
      --no-enable-puppet \
      --foreman-server-ssl-crl=""

This example configures Foreman and Proxy for use with "default" Chef organization.
The last two arguments disables the puppet installation, which is allowed by default.

## 2.1 Upgrade

To upgrade any of components described in installation chapter,
use your favorite packaging tool to install new version and then
run foreman-installer again. That will make sure that you database
is up to date. Foreman Chef plugin provides default configuration
templates that are being updated this way. Note that you don't have
to use the exact same parameters for the installer as the installer
remembers them from previous run. In fact they are stored in answer
file at `/etc/foreman/foreman-installer-answers.yaml`.

# 3. Configuration

At this moment, reports and attributes import should already work for
hosts that are provisioned by Foreman. If you want to setup this for
existing chef clients, you need to update your clients. See the chapter
below for brown field deployments.

Bootstrapping chef-client during provisioning will need more simple
manual steps. Also we'll go over available settings that you can use
to modify Foreman Chef behaviour.

## 3.1 Bootstrapping chef-client during provisioning

Bootstrapping chef-client is natural part of host provisioning. If
you're not familiar with how to setup Foreman provisioning, check
out the manual - [provisioning section](/manuals/latest/index.html#4.4Provisioning). Foreman uses [provisioning templates](/manuals/latest/index.html#4.4.3ProvisioningTemplates), that allows
easy customization of the whole process. Don't worry, we provide
working default versions for you, just keep in mind that you can
change the entire chef-client bootstrapping.

As said before, Foreman Chef plugin provide default chef-client bootstrap
strategies in form of provisioning templates. These are only snippets
that can be reused as a part of any provisioning template, such as kickstart
or preseed file. We automatically include the bootstrap strategy in default
`Kickstart default` and `Preseed default` provision templates if you choose
chef proxy for the host.

Complete chef-client bootstrap strategy name is in format "chef-client $name bootstrap",
currently you can find two of such name - **gem** and **omnibus**. Another snippet
provided by the plugin is called "chef-client bootstrap" which is
a shared part for all strategies mentioned before. The last snippet that wraps
everything is called "chef-client". It's job is to select the bootstrap
method. This is used as single entry point in all provisioning templates
that support chef bootstrapping.

![Bootstrap templates](/plugins/foreman_chef/{{ page.version }}/templates.png)

Note that all of the snippets are locked which means they should not
be modified directly. If you want to change them, you should clone them
and make all modifications to the clones. The reason is that newer version
of Foreman Chef plugin can make changes to snippets.

### 3.2 The actual bootstrap

Now let's have a closer look to how these strategies work. Both gem and
omnibus first installs a chef-client.

The **gem** strategy relies on system rubygems to install chef and
chef_handler_foreman gems.

The **omnibus** is using curl to download install.sh from [https://www.chef.io/chef](https://www.chef.io/chef)
which installs the chef-client using omnibus installer. Then it installs 
chef_handler_foreman gem using bundled rubygems.

Both methods installs last chef-client version by default. If you prefer to
install specific version, you can configure it using `chef_bootstrap_version`
paramenter. See below for more information about how.

The rest is shared for both strategies. It either creates `/etc/chef/validation.pem`,
that you must provide (more on this later) or it deploys private.key for the client,
based on the bootstrap method that is configured via Foreman settings.

Next step is creating of  `/etc/chef/client.rb`. The config file also contains chef_handler_foreman
plugin configuration. Then we stored runlist in temporary json file in /tmp and run chef-client with it.
If chef run succeeds the runlist is saved on chef server. After that we clean up
validation.pem and temp runlist json file.

The temp runlist contains runlist that user provided in Host form. Therefore
you should make sure, that recipes in this role always succeed and setup chef-client to run 
repeatedly. After the first chef-client run the provisioned host is 
restarted. Note that the first chef-client run is executed still from installer
(e.g. Anaconda) so you're in chrooted environment. Some things may change after reboot
as there will be likely different version of kernel which might have impact on e.g. network
interface names.

### 3.3 Modify the behavior and select the strategy

Now several question may have popped up, e.g. how do we generate client.rb, how 
client knows what's chef-server url, where is validation.pem read from,
how do I choose which strategy to use, etc. The answer is similar to all
of them. We modify the behaviour of provision templates using Foreman's
parameters. You can read more about them in [Foreman manual](/manuals/latest/index.html#4.2.3Parameters), but the docs mention a lot about puppet,
which is not that interesting in our case.

For us, these parameters are simply variables that can be configured globally and
overriden per host, host group, domain, OS, location, organization. By default
Foreman Chef precreates all parameters for you, you just have to adjust their
values. Navigate to Configure -> Global Parameters. 

![Parameters](/plugins/foreman_chef/{{ page.version }}/parameters.png)

Chef relevant parameters
starts with "chef_".

<table class="table table-bordered table-condensed">
  <tr>
    <th>Parameter name</th>
    <th>Description</th>
  </tr>
  <tr>
    <td>chef_bootstrap_template</td>
    <td>which bootstrap strategy should be used, you can specify brand new one that you created</td>
  </tr>
  <tr>
    <td>chef_bootstrap_version</td>
    <td>what version of chef-client should be installed, if not specified, the latest available will be used</td>
  </tr>
  <tr>
    <td>chef_handler_foreman_url</td>
    <td>where to upload reports and attributes at the end of chef-client run, that should be the address of your smart proxy</td>
  </tr>
  <tr>
    <td>chef_server_certificate</td>
    <td>this is useful with Chef 12, as clients started to verify server certificate by default, it can be used to install self signed chef-server certificate before the first chef-client run, the cert can usually be found on chef server at /var/opt/opscode/nginx/ca/$fqdn.crt</td>
  </tr>
  <tr>
    <td>chef_server_url</td>
    <td>chef server url, if you're using Private Chef or Chef 12, don't forget to add /organization/$name to URL</td>
  </tr>
  <tr>
    <td>chef_validation_private_key</td>
    <td>validation.pem content, private key used to register new client</td>
  </tr>
</table>

From above table, it should be obvious, that you'll have to adjust these values
to your environment. Note that any of these value can be overriden, so you
can e.g. have a host group that's using different chef server or uses different
bootstrap strategy. Also this could be used for multitenant isolation per
organization.

## 3.4 Configuration options

Foreman Chef also adds application wide settings that you can find
in Settings -> Foreman Chef. You can just enable or disable
auto deletion of nodes and clients on chef server upon host deletion in
Foreman. You can also select a bootstrap method which determines
when bootstrap process deployes validation.pem or Foreman does direct
communication with the Chef server and creates client for you. In this
case the client private key is stored in Foreman database.

## 3.5 Manual chef-client setup

If you don't want to use Foreman's provisioning capabilites and you
prefer to install and configure your chef-clients manually or you want to
register existing chef-nodes to Foreman, you can do it by your own.
This way you still can use Foreman's dashboard, monitoring, reports etc. 

All you have to do is to install chef_handler_foreman gem on every
client and modify chef-client config file (/etc/chef/client.rb).
You have to put the following lines at the end of your config files

    require 'chef_handler_foreman'
    foreman_server_options  'https://your.proxy.server:8443'
    foreman_facts_upload    true
    foreman_reports_upload  true
    foreman_enc             true

The last three lines enable modules. You can enable only some of them.
**foreman_facts_upload** configures the handler that will upload
node attributes to Foreman. **foreman_reports_upload** sends logs
about the chef-client run and is used by Foreman to determine the host
configuration status. Foreman also keeps history of all such runs. The
**foreman_enc** loads attributes exposed for the Host from Foreman and
merges them to attributes coming from the Chef server. By default chef-client
merges them on "force_default" level but you can configure the priority
by passing the second attribute to the foreman_enc call. For example
to make Foreman attributes the highest, use following line

    foreman_enc             true, 'automatic'

Note that uploading all attributes to Foreman might create a lot
data and cause slower chef-client runs as well as high Foreman load.
Therefore you can customize which attributes will be sent to Foreman
by specifying a whitelist and/or blacklist. Whitelist will keep sending only
attributes that belongs to whitelisted root attributes. Blacklist filters
out attributes on any level. In following examples only cpu and lsb
attributes are uploaded and all attributes matching *flags* are omitted,
which means no attribute like "cpu::1::flags::1" will be sent.

    foreman_facts_whitelist ['cpu', 'lsb', 'network']
    foreman_facts_blacklist ['flags']

Be careful when limiting attributes, Foreman uses some of them to adjust
host attributes (e.g. network interfaces related ones)

If you filter out attributes that changes with each run (e.g. uptime),
you can use facts caching to decrease Foreman server load. Chef client
will compute hash of attributes set that would be sent and if it matches
hash from previous run it does not send it. To enable this feature,
you have to specify a file in which a md5 hash will be kept.

    foreman_facts_cache_file '/var/cache/chef_foreman_cache.md5'

Note that the order of options above matters. You have to enable facts
uploading before specifying whitelist/blacklist or cache file.

If you prefer to configure client.rb with the [chef-client](https://github.com/chef-cookbooks/chef-client) cookbook, you
can use following

**With a Role**

    "chef_client": {
      "chef_server_url": "https://chef.domain.com",
      "config": {
        "foreman_server_url": "https://foreman.domain.com",
        "foreman_enc": true,
        "foreman_facts_upload": true,
        "foreman_reports_upload": true,
        "reports_log_level": "notice"
      }
    }

**With attributes**

    node['chef_client']['config']['foreman_server_url'] = 'https://foreman.domain.com:8443'
    node['chef_client']['config']['foreman_facts_upload'] = true
    node['chef_client']['config']['foreman_reports_upload'] = true
    node['chef_client']['config']['foreman_enc'] = true
    node['chef_client']['config']['reports_log_level'] = 'notice'

For more information, please visit [project readme on github](https://github.com/theforeman/chef-handler-foreman)

# 4. Usage (features description)

This chapter covers features that you can use in terms of Foreman and Chef
integration. Everything described below assumes you've sucessfully configured
all communication channels. Note that in Foreman, some objects have different
names. Node is equivalent of Host and Node + Ohai attributes are called Facts.

## 4.1 Attributes import

At the end of every chef-client run, chef-client sends all node
attributes to Foreman. If this is the first upload of attributes
to Foreman and node does not exist in Foreman yet, it's automatically
created for you. Attributes contain both ohai data and other node
attributes such as those set by recipes. One of attributes also
contains the node runlist. On every following chef run the attributes
are updated in Foreman. Foreman also parses these attributes to
correctly assign Operating system, Environment etc.

As you can see on following screenshot, we display all imported
attributes. Since chef attributes are nested and forms tree structure,
we display one level in a table.

![Fact values list for one host](/plugins/foreman_chef/{{ page.version }}/facts.png)

To see sub-attributes you can click on parent facts (e.g. chef_packages).

![Nested facts](/plugins/foreman_chef/{{ page.version }}/facts_tree.png)

On lead attributes you can see chart icon at the end of row. If you click
on it, Foreman will generate a chart of distribution of this value throughout
your infrastructure.

![Value distribution](/plugins/foreman_chef/{{ page.version }}/facts_distribution.png)

To easily find all Hosts with chef-client of version you can click on that
value. You'll be redirected to host list matching the search criteria. Note
the search syntax above the table. You can search host based on any fact
values. The same syntax works everywhere in Foreman. For more details
about the syntax, you can check the [Foreman manual Searching section](/manuals/latest/index.html#4.1.5Searching).

![Search by fact value](/plugins/foreman_chef/{{ page.version }}/facts_search_by_value.png)

Also note that even in this case the syntax might seems complicated,
the fact that we support autocompletion should make constructing such
queries easy

![Autocompletion](/plugins/foreman_chef/{{ page.version }}/facts_autocompletion.png)

## 4.2 Trends

If you want to track the fact value in time, you can use Foreman Trends
feature. Let's consider the chef-client package version, if you create
a Trend based on this fact, Foreman generates a chart of distribution of
this value throughout the whole infrastructure, based on snaps in time.
To create such snapshot, you have to run foreman-rake trends:counter
command. You can find more about trends in [Foreman manual](/manuals/latest/index.html#4.1.3Trends). To illustrate the result, on screenshot below
you can see how the chef-client version changed in time. At first, there
were 5 nodes with 3 different versions in total. During second snap, one
node was updated to latest version. Third snap indicates that there's
only one node left pending update.

![Trend chart](/plugins/foreman_chef/{{ page.version }}/trends.png)


## 4.3 Reports

At the end of every chef-client run a report is uploaded to a Foreman.
Report is a log of operation that chef-client did. From this report
Foreman knows what resources were applied, whether there were some 
failures etc. Every chef-client run is one report and in Foreman we
keep all reports. The last report determines the host state.
If you look at Host detail page, you can see charts based on these
reports. Runtime chart informs you about the time that the
chef-client runs took, Resources display the status of resources
per run. 

![Host detail](/plugins/foreman_chef/{{ page.version }}/host_detail.png)

When you click Reports button you get the list of all reports
uploaded for thet Host. On example below you can see that
first run did not introduce any change. Second failed to
apply something, while third succeeded. The last one
did not change any resource, since they were all applied
in previous run.

![Host reports](/plugins/foreman_chef/{{ page.version }}/reports.png)

When you click on the report, you get more details. Let's
see what can we find out about tha failing run. As you can
see on the screenshot, chef tried to install package *toilet*,
but it failed because it could not find such package.

![Failed report](/plugins/foreman_chef/{{ page.version }}/reports_fail.png)

On success report page, we can see that we created two
files based on templates, we uploaded one file from cookbook
and install package *figlet*. Also we can see charts
telling us how much time did the chef spent on various
resource types.

![Success report](/plugins/foreman_chef/{{ page.version }}/reports_applied.png)

One nice feature of reports is displaying a diff of templates.

![Diff in report](/plugins/foreman_chef/{{ page.version }}/reports_diff.png)

## 4.4 Dashboard

As stated above, we use reports to detect the host status. You can
easily check the status of your infrastructure in Foreman dashboard.

![Dashboard](/plugins/foreman_chef/{{ page.version }}/dashboard.png)

In this example, you can see that this infrastructure is not too healthy.
There's only one host that uploaded the report in 35 minutes. Most
of hosts did not send report at all and 10 hosts sent some, but didn't
send a new one recently, so they might be dead. Luckilly, there's
no host with error, which mean no chef-client run failed. Also
recipes seems to be in good shape, as no host has report with
applied resource (so the configuration is in desired state). If the recipe
would be applying some resource with every run, e.g. using exec without
proper guard, it would mark the host as Active.

## 4.5 Host provisioning

Foreman is not only configuration management dashboard but
it's also excellent provisioning tool. It can provision baremetal
hosts as well as hosts in clouds. For list of supported cloud
provides, checkout [the latest Foreman manual](/manuals/latest/index.html#5.2ComputeResources).

As part of provisioning we also bootstrap chef-client. In order
to do that, you must configure provisioning using global parameters,
as stated in configuration chapter in this manual.

To activate chef-client bootstrapping you have to select a chef proxy
that will proxy all requests to the chef-server. After selecting this
proxy, you are able to select a chef environment to which the host
will be assigned during first chef-client run. Note that you can
import these environments through chef proxy to avoid creating
them manually.

![HostProvisioning](/plugins/foreman_chef/{{ page.version }}/host_provisioning.png)

Both, chef proxy and chef environment can be configured for host group
and would be inherited from it as well.

## 4.6 Host deletion

When you delete a host in Foreman, it would be handy to also
delete related node and client in chef-server. If you want Foreman
to do it automatically for you, you must select Chef Proxy for
that host. You can select a Smart Proxy with smart_proxy_chef
plugin in Host form. Also make sure, you have deleting enabled
in Setting, as shown on screenshot below

![Settings](/plugins/foreman_chef/{{ page.version }}/setting.png)

Foreman Chef plugin uses other Foreman plugin called foreman-tasks
that allows us to inspect and retry the task if something goes wrong.
You can find information about all deletions Under Monitor -> Tasks.

## 4.7 Chef environments synchronization

In order to be able to select a chef environment for a host, it must
be defined first. You can either do it manually or synchronize all
chef environments from chef-server through foreman-proxy. Both can
be achieved at the Configure -> (Chef) Environments page. If you have at
least one proxy with the chef feature in your Foreman you will see the
Import button above the table.

![Environments](/plugins/foreman_chef/{{ page.version }}/environments.png)

After you click it, you are presented with an overview of what's not
in sync with chef-server database. You can select what changes you
want to apply. After you confirm your selection, chef environments
will be deleted and created accordingly.

![EnvironmentsSync](/plugins/foreman_chef/{{ page.version }}/environments_sync.png)

## 4.8 Run list management

You can define run list for a host when you provision a new host. If you
edit the host later, you can use the same form to modify the run list. Once
you submit the form, Foreman contacts Chef server (through Foreman proxy)
and saves the change so it's live immediately. The same applies for Chef
environment changes. This way you can easily add new roles and recipes,
remove them, change their order etc.

![RunListManagement](/plugins/foreman_chef/{{ page.version }}/run_list_management.png)

Foreman keeps local copy of the run list so we can solve situations when
the node run list gets out of sync. Imagine you provisioned a host and configured
role A in Foreman. Later someone edited to node in chef-server directly, e.g. using
knife, and added role B. When you later edit the host in Foreman, you will see
the warning icon on Chef tab and see the explaining warning message. If you
immediately submit the Form, node run list would be overriden with original
value that Foreman had therefore the run list would contain only role A. But
if you want to synchronize the run list from Chef to the Foreman, you can click
the reset link in the warning message. This will update the form to reflect
the current version of run list on the Chef server. After the form is submit,
the new version of run list is saved to the Chef server. If you made no changes
after clicking the reset link, no changes will be made on Chef server.

![RunListSync](/plugins/foreman_chef/{{ page.version }}/run_list_sync.png)

The same applies to Chef environment of the node. We don't display the reset link
for the environment but the inline warning message let's you know, what's the
current environment for the node on Chef server if it differs from what Foreman
thinks.

## 4.9 Parameters

Foreman has own parametrization system. You can define parameters that are global
and applies to all hosts. You can also override their values per operating system,
subnet, domain, organization, location, host group and host. Parameters are simple
key - value pairs. Chef attributes are normally organized in nested hashes. This
Foreman parametrization system does not support it directly yet, in future we'll
have this covered by smart variables. But for now we can workaround that by
specifying the nesting using 4 dots operator. So for example to configure Foreman
handler in client.rb, the parameter can be called *chef_client::config::foreman_enc*
and value can be set to true. If you specify another attribute in the same namespace,
they will end up in the same hash, so e.g. with second parameter *chef_client::config::foreman_url*
set to 'https://proxy.domain.com:8443', you would get the folliwing in node attribute 
tree

    :chef_client => {
      :config => {
        :foreman_server_url => 'https://proxy.domain.com:8443'
        :foreman_enc => true,
      }
    }

![ParametersENC](/plugins/foreman_chef/{{ page.version }}/parameters_overrides.png)

If you were following carefully, you noticed that some parameter values are kept as
strings, while others are considered as booleans. In fact, all parameters in this Foreman
parametrization system are strings. We have no way to set the parameter type (until
we have smart variables ready). Therefore if we see the string value is "false" or
"true", we cast it to boolean.

One nice advanced feature of Foreman is, that you can use erb for parameter values.
This way the value can be dynamic. You can use ruby in these ERB snippets and as long
as the Ruby expression uses whitelisted methods, you can use it to generate arbitrary
value. So the valu could be something like

   <%= 1 + 1 %>
   <%= @host.ip %>
   <%= @host.operatingsystem.family == 'RedHat' ? 'yum' : 'apt-get' %>

Foreman also exposes some Foreman data automatically. To see the list of data
that you can use in your cookbooks when you enable foreman_enc, go to host
detail page and click the YAML button. Besides parameters you defined, you'll
also find information about networking etc.

## 4.10 Running chef-client on demand

If you want to run chef-client immediately, you can kick such run using remote exection
plugin. `foreman_chef` plugin provides an integration so it's easy to setup. For information
about remote execution plugin, please visit [the manual](/plugins/foreman_remote_execution/).
Once you have this plugin installed, you should see two Job templates in category Chef.

The first one called `Run chef-client once` is parametrized so when you trigger this job,
you can specify desired log level or whether this should be a why-run. Second called `Run chef-client wrapper`
is just a wrapper around the first one which specify the default log level and disables why-run.
It's useful when you want to enable quick run from host detail page. To do that, navigate to
Remote execution features page under Administer menu. Select `foreman_chef_run_chef_client` feature
which is registered from `foreman_chef` plugin. You can choose arbitrary job template that
will be run, when you trigger the quick chef-client run. You can use default `Run chef-client wrapper`.
The only limitation is, that the template can not require any user inputs.

Once you save the feature, you can go to host detail page. You should see the dropdown `Schedule Remote Job`
button. You can either click it and customize the run in more details or click the dropdown and choose
`Run chef-client Once` which immediately triggers the job through template chosen for the feature.

![REX](/plugins/foreman_chef/{{ page.version }}/rex.png)

Using remote execution plugin you can also kick off new chef-client run on multiple hosts at the same time.
In order to do that, select multiple hosts on host list page and then choose a bulk action `Schedule Remote Job`.

# 5. Advanced topics

## 5.1 Anatomy of Chef run with Foreman

### 5.1.1 Reports and facts

As you can see on schema below, at the end of the run, there are
two separate requests to upload facts and report. The Foreman 
on picture is actually a Smart Proxy with smart_proxy_chef plugin,
that redirects both requests to Foreman. 

![Chef run](/plugins/foreman_chef/{{ page.version }}/chef.svg)

Also the Smart Proxy does the authentication of nodes. 
Both request contain a digital signature constructed using
node's private key. Smart Proxy asks chef server for public
key for this node and uses it to verify the signature. 
If everything is OK, it forwards the request to Foreman.
See a diagram below for illustration.

![Authentication](/plugins/foreman_chef/{{ page.version }}/authentication.svg)

### 5.1.2 ENC, reports and facts

The following diagram illustrates how the chef-client run looks like
with all chef-handler-foreman modules enabled. The ENC (external node classifier)
output from Foreman is a YAML containing attributes compiled for a given node.
The foreman_enc module merges this to node attributes that were
received from Chef server and after that the chef-client run applies the
resource catalog. This means you can manage attributes in Foreman but use
then with any cookbook that normally uses attributes from Chef server.

![ENC](/plugins/foreman_chef/{{ page.version }}/enc.svg)

After the catalog is applied, report and facts are sent to Foreman.

## 5.2 Future

Planned improvements

* use smart variables to support attribute types, nesting, validations etc - currently blocked by by major Foreman refactoring
* make the runlist management optional
* add tests, API

# 6. Help

Please follow our [standard procedures and
contacts]({{site.baseurl}}support.html).

# 7. Getting involved

## 7.1 Troubleshooting

If you find a bug, please file it in
[Redmine](http://projects.theforeman.org/projects/chef/issues/new).

See the [troubleshooting section](/manuals/latest/index.html#7.2GettingHelp)
in the Foreman manual for more info.


## 7.2 Contributing

Follow the [same process as Foreman](/contribute.html#SubmitPatches)
for contributing.

# 8. Links

* foreman_chef plugin [https://github.com/theforeman/foreman_chef](https://github.com/theforeman/foreman_chef)
* smart_proxy_chef plugin [https://github.com/theforeman/smart_proxy_chef](https://github.com/theforeman/smart_proxy_chef)
* chef-handler-foreman [https://github.com/theforeman/chef-handler-foreman](https://github.com/theforeman/chef-handler-foreman)
* issue tracker [http://projects.theforeman.org/projects/chef/issues](http://projects.theforeman.org/projects/chef/issues)
