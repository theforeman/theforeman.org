---
layout: plugin
title: Foreman Remote Execution 0.1 Manual
version: 0.1
---

# 1. {{ page.title }}

This plugin enables Foreman to run arbitrary commands on hosts using different
providers. Initially only an SSH provider is supported but we plan to add more.
Communication goes through the smart proxy so Foreman does not have to have
direct access to the target host and can scale to control many hosts. A command
can be customized similarly to provisioning templates or partition tables. A
number of templates are included for running basic commands, installing
packages, etc. For more details see the [Job
Templates](plugins/foreman_remote_execution/{{page.version}}/index.html#3.1JobTemplates)
section.

Below is a short demo of running a single command on a particular host, with
the ability to view the output live:

![GIF Demo](/plugins/foreman_remote_execution/{{page.version}}/remote_execution.gif)

The command can be executed on multiple servers at once while specific parts of
it can vary per host - in other words you can use variables in your commands.
Variable values can be filled by given host fact, smart class parameter, smart
variable or even host parameter. Last but not least, like the "command" example
above, the value can be specified by user when they trigger the execution.

A few examples of tasks that this plugin helps you achieve:

- Install/update/remove a package
- Bootstrap a configuration management agent
- Trigger a Puppet/Salt/Chef run

## 1.1 Components

The whole remote execution system is pluggable, making it easy to add more
providers of communication later. Therefore it's split into several components
that must be installed on Foreman and the Smart Proxy.

<table class="table table-bordered table-condensed">
  <tr>
    <th>Plugin</th>
    <th>Description</th>
  </tr>
  <tr>
    <td>foreman_remote_execution</td>
    <td>Required, contains the UI part and currently also SSH provider, depends on foreman-tasks</td>
  </tr>
  <tr>
    <td>foreman_tasks</td>
    <td>Required, keep status of all executed commands, allows debugging if something goes wrong</td>
  </tr>
  <tr>
    <td>smart_proxy_remote_execution_ssh</td>
    <td>Smart Proxy plugin, required for using SSH provider, proxies the communication between Foreman and hosts, requires smart_proxy_dynflow</td>
  </tr>
  <tr>
    <td>smart_proxy_dynflow</td>
    <td>Smart Proxy plugin, runs the jobs asynchronously and keeps status of commands executed via this proxy. This plugins uses relational SQL DB (sqlite).</td>
  </tr>
</table>


## 1.2 Compatability

Each component is packaged for platforms that Foreman is officially packaged
for. Since both Foreman and Smart Proxy plugins requires Dynflow, Ruby 1.9+ is
required.

### 1.2.1 foreman_remote_execution

<table class="table table-bordered table-condensed">
  <tr>
    <th>Foreman</th>
    <th>foreman_remote_execution</th>
  </tr>
  <tr>
    <td>1.9.x</td>
    <td>0.0.x</td>
  </tr>
  <tr>
    <td>1.10.x</td>
    <td>0.1.x</td>
  </tr>
</table>

### 1.2.2 smart_proxy_remote_execution_ssh

<table class="table table-bordered table-condensed">
  <tr>
    <th>Smart Proxy</th>
    <th>smart_proxy_remote_execution_ssh</th>
    <th>Notes</th>
  </tr>
  <tr>
    <td>1.9.x</td>
    <td>0.0.x</td>
    <td>No compatability with EL6 or Ubuntu 12.04</td>
  </tr>
  <tr>
    <td>1.10.x</td>
    <td>0.0.x</td>
    <td>No compatability with EL6 or Ubuntu 12.04</td>
  </tr>
</table>

# 2. Installation

## 2.1 Plugin Installation

This chapter covers a clean Foreman and plugin installation. We assume the
smart proxy will be installed on the same host, however it's not a requirement.
Please adapt according to your needs.

Start by installing the Foreman nightly or 1.10 repository and EPEL7, see
[Quickstart instructions](/manuals/latest/index.html#2.Quickstart) and [Foreman
manual](/manuals/latest/index.html#3.InstallingForeman) for more information.

### With Foreman Installer

You can install both the Foreman and Smart Proxy plugin with the installer:

    foreman-installer --enable-foreman-plugin-remote-execution\
                      --enable-foreman-plugin-tasks\
                      --enable-foreman-proxy-plugin-remote-execution-ssh

The installer will automatically configure an SSH key for you, or you may use an existing see.  See the foreman-installer --help for more information.

### Manual Installation

In the case you want to install the package manually on an existing Foreman or
a Katello, use the following steps.

Install the packages appropriate for your operating system:

RPM:

    yum install tfm-rubygem-foreman_remote_execution tfm-rubygem-foreman-tasks\
                rubygem-smart_proxy_remote_execution_ssh

DEB:

    apt-get install ruby-foreman-tasks ruby-foreman-remote-execution\
                    ruby-smart-proxy-remote-execution-ssh

Next you have to setup ssh keys. By default smart proxy loads the key
from `/usr/share/foreman-proxy/.ssh/id_rsa_foreman_proxy`. To customize it you
can edit the configuration in
`/etc/foreman-proxy/config/settings.d/remote_execution_ssh.yml`. Without
customization you need to create new ssh key and distribute it to
target hosts. The key must not use passphrase.

To generate a key, run following command on the host where Smart Proxy runs

    mkdir ~foreman-proxy/.ssh
    chown foreman-proxy ~foreman-proxy/.ssh
    sudo -u foreman-proxy ssh-keygen -f ~foreman-proxy/.ssh/id_rsa_foreman_proxy -N ''

When using SELinux make sure the directory and the files have correct labels
of ssh_home_t. If not, restore the context:

    restorecon -RvF ~foreman-proxy/.ssh

Don't forget to restart Foreman, Smart Proxy and Foreman tasks so
plugins are loaded

    service httpd restart
    service foreman-tasks restart
    service foreman-proxy restart

Finally, you have to refresh the Smart Proxy features in the Foreman:
Dynflow and Ssh should appear there as new features of the Smart Proxy.

## 2.2 Remote Hosts Configuration

The remote hosts need to be configured to accept the private key that the smart
proxy is using. `root` is used as the default user for accessing remote hosts
via SSH.  You may set the **remote_execution_ssh_user** global setting to change
the default.  If you would like to override at the host group, host, or
other level, you may use parameters to do so.  Set a parameter called
**remote_execution_ssh_user**.

The ssh keys for the smart proxies are available as a host parameter -
`remote_execution_ssh_keys`.  This allows you to manage the authorized keys
with your configuration management platform of choice, or through a
provisioning template.

If you prefer to use a provisioning template, an example snippet is included.
In the kickstart %post or finish template, simply include:

     <%= snippet 'remote_execution_ssh_keys' %>

If you prefer to distribute the keys manually, you may do this:

    ssh-copy-id -i ~foreman-proxy/.ssh/id_rsa_foreman_proxy.pub root@target.example.com

Alternatively, the Smart Proxy publishes the public key over the API, so that
one can just download it into authorized keys:

    curl https://myproxy.example.com:8443/ssh/pubkey >> ~/.ssh/authorized_keys

For the execution to work, the client needs to have **openssh-server**
installed and configured.  Also, **openssh-clients** need to be present, in
order to **scp** to work (which we use for getting
the scripts to the remote host)

# 3. Usage

After installation you can start preparing your commands and run them on your
hosts. Every command must be defined as a Job Template. Once defined it can be
executed multiple times. Let's start with the definition first.

## 3.1 Job Templates

If you're familiar with Foreman provisioning templates, you should find writing
job templates familiar. First navigate to the Host > Job Templates menu. Then
hit the green button with label "New Job Template".

Note: If you don't see a menu entry, the Foreman plugin is not installed
correctly.

Now you should see a form similar to the Provisioning template one. In first
tab you have to fill in **Name**. You can use input macros in ERB tags which
stands for variables which you define in second tab called Job.

![Job Template form](/plugins/foreman_remote_execution/{{page.version}}/job_template_form.png)

Before we get to inputs, lets look at other fields in Job tab. First one is an
autocomplete field called **Job name**. This is generic name of the Job, which
might be implemented by more than one job template.  For example, one template
may use `yum` to install a package, while the other uses `dnf`.  At invocation
time you can choose which template to use.

This is more useful when more than one provider is available.  For example, you
might have both an SSH and an Ansible template that implements the "Install
Package" job.

On the very same tab you can configure inputs. These template inputs
defines values that can be accessed in the template itself. To add new input,
click the green button "+ Add Input" which adds more fields to the form. To
remove the input, hit the cross in top right corner of the input form.

We support four types of inputs. Each must have it's **name** which is
used in macro. If my input has the name "motd", I can then use
following ERB tag in my template code:

    echo "<%= input('motd') -%>" > /etc/motd

The way we determine the input value differes based on **Input type**.  Let's
start with User input. This input always needs the value to be specified
by user. It means when user runs the job, we display the field that they
must fill in, or provide options to select from. The provided value will be
used as a result for the corresponding input macro. Whatever you put in
**Description** field will be displayed to the user so he knows what's the
purpose of this input.

The rest of the types load values from the host and do not require any user
interaction. Since the template is always rendered for a specific host on which
the job is executed we load the value this host data. These data can be either
Fact (coming from Puppet/Salt/Chef), smart class parameter (when you use
Foreman as Puppet ENC), smart variable or a parameter.

If you want to load value from host facts, use Fact value input type.
You'll have to specify the **Fact name** so Foreman can match the
right fact. If you make a mistake or the fact is not present for a
given host, the rendering of template will fail and hence the
execution on this host will fail.

If you want to use a value from smart class parameter, use Puppet parameter
input type. you'll have to specify puppet class name and the name of its
parameter. It's the value that you can see in ENC YAML under `classes` key.

If you want to use either smart variable or parameter, use Variable input type.
Both of these values are part of ENC YAML under `parameters` key overiding each
other if they have same name. You have to specify the name of either parameter
or smart variable.

If you're confused about the difference between smart class parameter,
smart variable and parameter, checkout Foreman manual
[parameters](http://www.theforeman.org/manuals/latest/index.html#4.2.3Parameters)
section

Note that until inputs are saved the preview of template won't work.
To review the template first save it and then get back to the form and
hit Preview button.

## 3.2 Executing a Job

To execute on one host, go to the host detail page and click green "Run Job"
button. For multiple hosts, use the bulk action tool on the "All hosts" page
to select "Run Job".

![Job Invocation form](/plugins/foreman_remote_execution/{{page.version}}/invocation_form.png)

In this form you select which **Job name** you want to run on selected
host(s). Then you can see prefilled **Search query** that uses the
[Foreman searching syntax](/manuals/latest/index.html#4.1.5Searching).
You can customize the query to search any set of hosts, e.g. all hosts
running CentOS 7.1 or hosts with 1 GB memory. You can check how many
hosts such search query covers by clicking refresh button below.

You can also specify **Type of query**. Currently we support two
options

- **Static query** - evaluates the search query immediately when you
    hit the Submit button and saves the resulting set as the target of
    this execution
- **Dynamic query** - stores the search query and does the evaluation
    just before the command is executed, which means if there are new
    hosts added meanwhile, the job will be executed on them as well

Dynamic query will be more powerful when we add scheduling job executions in
future. Also it will be useful when Bookmark is used for specifying the
targets.

Then there's the template selection. If you have multiple job templates for a
given **Job name** you'll have to select one. If there's just one like in my
example, you'll just have to provide values for all user inputs. After
submiting the form, you're redirected to the Job detail.

## 3.3 Job detail

On the Job detail page you can see overall progress and result of the job
execution.

![Job detail 1](/plugins/foreman_remote_execution/{{page.version}}/job_detail_1.png)

In the overview tab you can see what query was used to find the hosts and how
many hosts were found using it. Below is the evaluated template in generic
form. If there were some fact or parameter inputs used, you will see only
placeholders for them since they are specific to each host. User inputs are
evaluated since they are same for all hosts. A chart is showing the status of
the job on all targets.

From this screen you can even cancel the job if it's not finished yet.  First
cancel attempt will try to cancel the run on the Smart Proxy. If proxy does not
respond, you can hit the cancel button a second time which forces the Job to be
cancelled on Foreman (while it still might be running on Smart Proxy). Last Job
Task takes you to Foreman Tasks that represents this Job.

In Hosts tab you can see all hosts targeted by this execution, status
of the job on them and link to Foreman Task that represent the
execution for a particular host. Note that this task is a subtask of a
whole Job task.


## 3.4 Jobs list

You can find all Jobs when you navigate to Monitor > Jobs. A table
lists all jobs from history to future. You can search jobs by **Job name** with
a queries like

    job_name ~ set*

This example would find all executions that run job which names starts with
"set".

![Job invocations list](/plugins/foreman_remote_execution/{{page.version}}/job_invocations.png)

# 4. Advanced topics

In this section we try to explain how things work behind the scenes.

## 4.1 Determining the smart proxy for host

In order to perform the job on a host, there needs to be a Smart Proxy
available to do the job. In the default install, it would use all Smart proxies
with a remote execution provider.  This can be turned off by changing the
global setting **remote_execution_global_proxy** to false.

In more complex environments, not all proxies can be used, due to possible
network isolation.  In this case, you may assign a pool of proxies to each
subnet, and jobs will be load balanced across them.

Alternatively, you may enable a fallback mode by setting
**remote_execution_fallback_proxy** to true.  In this case, the plugin will
consider any proxy associated with the host, such as its Puppetmaster, as long
as the proxy also has a remote execution feature.

# 5. Help

Please follow our [standard procedures and contacts]({{site.baseurl}}support.html).

# 6. Getting involved

## 6.1 Troubleshooting

If you find a bug, please file it in
[Redmine](http://projects.theforeman.org/projects/foreman_remote_execution/issues/new).

See the [troubleshooting section](/manuals/latest/index.html#7.2GettingHelp)
in the Foreman manual for more info.


## 6.2 Contributing

Follow the [same process as Foreman](/contribute.html#SubmitPatches)
for contributing.

# 7. Links

* foreman_remote_execution plugin [https://github.com/theforeman/foreman_remote_execution](https://github.com/theforeman/foreman_remote_execution)
* foreman-tasks plugin [https://github.com/theforeman/foreman-tasks](https://github.com/theforeman/foreman-tasks)
* smart_proxy_remote_execution_ssh [https://github.com/theforeman/smart_proxy_remote_execution_ssh](https://github.com/theforeman/smart_proxy_remote_execution_ssh)
* smart_proxy_dynflow [https://github.com/theforeman/smart_proxy_dynflow](https://github.com/theforeman/smart_proxy_dynflow)
* issue tracker [http://projects.theforeman.org/projects/foreman_remote_execution](http://projects.theforeman.org/projects/foreman_remote_execution)
