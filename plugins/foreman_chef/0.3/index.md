---
layout: plugin
title: Foreman Chef 0.3 Manual
version: 0.3
---

# 1. {{ page.title }}

This plugin enables Foreman to receive reports and attributes from chef clients
and use these data for usual Foreman features like displaying status of your
infrastructure on dashboard, monitoring based on convergence report, 
bootstrapping chef-client during host provisioning etc. This plugin also make
active communication with chef server possible so we can delete nodes and
clients upon host deletion in Foreman.

All communication is through Foreman Proxy which is running a [separate plugin](https://github.com/theforeman/smart_proxy_chef) and has
direct access to the Chef server and Foreman instance. Chef clients must be
able to connect to Foreman Proxy while the opposite direction is not required. The upload is triggered at the end of each chef client run, which is managed by [third plugin](https://github.com/theforeman/chef-handler-foreman) in form of chef handler, also provided by Foreman.

![Infrastructure overview](/plugins/foreman_chef/{{ page.version }}/infrastructure_schema.svg)

Foreman Chef does support "legacy" mode where communication is direct
with no Foreman Proxy involved. In this mode we do not handle authentication
of any uploads from Chef clients, therefore it's strongly discouraged.

## 1.1 Supported platforms

Components are explained below, here's just a list of what platforms you
can use for each of them.

ForemanChef plugin depends on ForemanTasks which works only in Ruby 1.9. This is
OK with all supported Foreman platforms, as Foreman runs on software collection
if needed. Version 0.3 requires Foreman 1.11+.

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
installer supports both and it's fairly easy to setup them. Supposing
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
      
As you might have guessed, you'll need to provide this plugin chef
client name and private key so it can communicate to chef server. Also
note that this client should have admin (or set of privileges) so it
can read other client public keys and any other action you want
Foreman to do for you (e.g. delete nodes, clients). In multi org
environment you can either use pivotal key or if you prefer to keep
it separate, you can install smart proxy per organization and create
different client for each.

Also you should provide chef server url and if you're using self
signed cert for your chef server, you'll have to specify the file
with this cert and private key.

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

At this moment, reports and attributes import should already work,
supposing you configured you chef-clients correctly (see below). 
Bootstrapping chef-client will need more simple manual steps. Also
we'll go over available settings that you can use to modify Foreman
Chef behaviour.

## 3.1 Bootstrapping

Bootstrapping chef-client is natural part of host provisioning. If
you're not familiar with how to setup Foreman provisioning, check
out the manual - [provisioning section](/manuals/latest/index.html#4.4Provisioning). Foreman uses [provisioning templates](/manuals/latest/index.html#4.4.3ProvisioningTemplates), that allows
easy customization of the whole process. Don't worry, we provide
working default versions for you, just keep in mind that you can
change the entire chef-client bootstrapping.

As said before, Foreman Chef plugin provide default chef-client bootstrap
strategies in form of provisioning templates. These are only snippets
that can be reused as a part of any provisioning template. We automatically
include the bootstrap strategy in default `Kickstart default` and 
`Preseed default` provision templates. Complete chef-client bootstrap
strategy name is in format "chef-client $name bootstrap", currently you
can find two of such name - **gem** and **omnibus**. Another snippet
provided by the plugin is called "chef-client bootstrap" which is
a shared part for strategies mentioned before. The last snippet that wraps
everything is called "chef-client" which selects the desired bootstrap
method. This is used as single entry point in all provisioning templates
that support chef bootstrapping.

![Bootstrap templates](/plugins/foreman_chef/{{ page.version }}/templates.png)

Note that all of the snippets are locked which means they should not
be modified directly. If you want to change them, you should clone them
and make all modifications to the clones. The reason is that newer version
of Foreman Chef plugin can make changes to snippets.

### 3.2 The actual bootstrap

Now let's have a closer look to how these strategies work. Both gem and
omnibus first installs a chef-client. The first strategy relies
on existing system rubygems to install chef and chef_handler_foreman gems,
to enable uploading reports and attributes to Foreman. The omnibus
is using curl to download install.sh from [https://www.chef.io/chef](https://www.chef.io/chef) which
installs chef-client using omnibus installer. Then it installs 
chef_handler_foreman gem using bundled rubygems.

The rest is shared for both strategies. It creates `/etc/chef/validation.pem`,
that you have to provide (more on this later), it creates `/etc/chef/client.rb`
config file (in which it also enabled chef_handler_foreman plugin), it creates
default runlist json file in /tmp and runs chef-client with it. If chef
run succeeds the runlist is saved on chef server. After that we clean up
validation.pem and temp runlist json file.

The temp runlist contains `role[default]` so you should make sure, that
recipes in this role always succeeds and setup chef-client to run 
repeatedly. After the first chef-client run the provisioned host is 
restarted. Note that the first chef-client run is executed still from installer
(e.g. Anaconda) so you're in chrooted env. Some things may change after reboot
as there will be likely different version of kernel (e.g. some network
interface names).

### 3.3 Modify the behavior and select the strategy

Now several question may pop up, e.g. how do we generate client.rb, how 
client knows what's chef-server url, where is validation.pem read from,
how do I choose which strategy to use, etc. The answer is similar to all
of them. We modify the behaviour of provision templates using Foreman's
parameters. You can read more about them in [Foreman manual](/manuals/latest/index.html#4.2.3Parameters), but the docs mention a lot about puppet,
which is not that interesting in our case.

For us, these parameters are variables, that can be configured globally and
overriden per host, host group, domain, OS, location, organization. By default
Foreman Chef precreates all parameters for you, you just have to adjust their
values. Navigate to Configure -> Global Parameters. 

![Parameters](/plugins/foreman_chef/{{ page.version }}/parameters.png)

Chef relevant parameters
starts on "chef_".

<table class="table table-bordered table-condensed">
  <tr>
    <th>Parameter name</th>
    <th>Description</th>
  </tr>
  <tr>
    <td>chef_bootstrap_template	chef-client omnibus bootstrap</td>
    <td>which bootstrap strategy should be used, you can specify brand new one that you created</td>
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

Froreman Chef also adds application wide settings that you can find
in Settings -> Foreman Chef. Currently you can just enable or disable
auto deletion of nodes and cients on chef server upon host deletion in
Foreman. More options might be found here later.

## 3.5 Manual chef-client setup

If you don't want to use Foreman's provisioning capabilites and you
prefer to install and configure your chef-clients manually or you want to
register existing chef-nodes to Foreman, you can do it by your own.
This way you still can use Foreman's dashboard, monitoring, reports etc. 

All you have to do is to install chef_handler_foreman gem on every
client and modify chef-client config file (/etc/chef/client.rb).
 You have to put the following lines at the end of your config files

    require 'chef_handler_foreman'
    foreman_server_options  :url => 'https://your.proxy.server:8443'
    foreman_facts_upload    true
    foreman_reports_upload  true
    reports_log_level       "notice"

You can even customize which attributes will be sent to Foreman
by specifying a whitelist and/or blacklist. Whitelist will keep only
attributes that belongs to listed root attributes. Blacklist filters
out attributes on any level. In following examples only cpu and lsb
attributes are uploaded and all attributes matching *flags* are omitted,
which means no attribute like "cpu::1::flags::1" will be sent.

    foreman_facts_whitelist ['cpu', 'lsb']
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

For more information, please visit [project readme on github](https://github.com/theforeman/chef-handler-foreman)

# 4. Usage (features description)

This chapter covers features that you can use in terms of Foreman and Chef
integration. Everything described below assumes you've sucessfully configured
all communication. Note that in Foreman, some objects have different names. Node
is is equivalent of Host and Node + Ohai attributes are called Facts.

## 4.1 Attributes import

At the end of every chef-client run, chef-client sends all node
attributes to Foreman. If this is the first upload of attributes
to Foreman and node does not exist in Foreman yet, it's automatically
created for you. Attributes contain both ohai data and other node
attributes such as those set by recipes. One of attributes also
contains the node runlist. On every following chef run the attributes
are updated in Foreman. Foreman also parses these attributes to
correctly assign Operating system, Environment etc.

As you can see on following screenshow, we display all imported
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
see on the screenshot, chef tried to instal package toilet,
but it failed because it could not find such package.

![Failed report](/plugins/foreman_chef/{{ page.version }}/reports_fail.png)

On success report page, we can see that we created two
files based on templates, we uploaded one file from cookbook
and install package figlet. Also we can see charts
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
no host with error, which mean no chef-client run fails. Also
recipes seems to be in good state, as no host has report with
applied resource (so the configuration is in desired state).


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

# 5. Advanced topics

## 5.1 Anatomy of Chef run with Foreman

As you can see on schema below, at the end of the run, there are
two separate requests to upload facts and report. The Foreman 
on picture is actually a Smart Proxy with smart_proxy_chef plugin,
that redirects both requests to Foreman. 

![Chef run](/plugins/foreman_chef/{{ page.version }}/chef.svg)

Also the Smart Proxy does the authentication of nodes. 
Both request contain a digital signature constructed using
node's private key. Smart Proxy asks chef server for public
key for this node and uses it to verify the signature. 
If everything is OK, it forward the request to Foreman.
See a diagram below for illustration.

![Authentication](/plugins/foreman_chef/{{ page.version }}/authentication.svg)

## 5.2 Future

Plan

* create a client in chef-server during provisioning, so no validation.pem is needed
* import chef environments from proxy
* import chef roles (proabably as config groups)
* manipulate host runlist in Foreman

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
