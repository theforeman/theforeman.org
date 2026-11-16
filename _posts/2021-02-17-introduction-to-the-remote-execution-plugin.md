---
layout: post
title: Introduction to the Remote Execution Plugin
date: 2021-02-17 17:00:00
author: Marek Hulan
tags:
- foreman
- community
- tutorial
- howto
- beginners
- openhab
- puppet
- browfield
---

In this post, we’ll see how to add a remote execution plugin to the Foreman installation 
and look at its basic functionality. We’ll create some jobs that we execute through SSH 
on one or more Foreman hosts. Then we’ll look at some real-world use cases of
useful SSH jobs automation. We’ll show how to deploy the Puppet agent on the Foreman host and
illustrate the use with home automation, running commands on SSH enabled routers.

<!--more-->

## Plugin installation

To add the remote execution feature, a plugin for Foreman and Smart Proxy is required.
The installer can handle both the installation and the initial configuration.
The Foreman installer can be run repeatedly. As long as you haven’t done manual modifications
to your installation, such as changing configuration files yourself, it will do no harm.
You don’t have to repeat the same parameters, their values are stored from the previous
run, therefore you can simply just add new parameters. The bare minimum to install or extend
existing Foreman instance with the Remote Execution, run the following:

```
foreman-installer --enable-foreman-plugin-remote-execution \
              --enable-foreman-proxy-plugin-remote-execution-script
```

If you plan to use CLI commands, you must install a plugin for that, so you can use REX CLI commands by
adding `--enable-foreman-cli-remote-execution` to the command above.

## Running the first job

Once the installer finishes the run, you will see the new menu entries in the Foreman
instance. Let’s try running a job on some host. Make sure the host is running SSH daemon
and Foreman can connect to it. Navigate to an existing host detail page and click the
*Schedule Remote Job* button. Fill in a simple bash command to the command field,
e.g. “echo Hello world”. Click Advanced fields and specify the password for the user.
The password is stored only for the time it takes to execute the script,
then it’s wiped out.

<p float='left' align='center'>
  <img src="/static/images/blog_images/2021-02-17-introduction-to-the-remote-execution-plugin/run_first_job.png" width="700" />
</p>

Click the *Submit* button. The job will get started and,
if all works, it should finish successfully, which is indicated by the green chart.
You don’t have to reload the page to see the result, it refreshes automatically.

<p float='left' align='center'>
  <img src="/static/images/blog_images/2021-02-17-introduction-to-the-remote-execution-plugin/job_invocation_1.png" width="700" />
</p>

Let’s investigate the output of the job. On the job detail page, click the the host
name link in the table at the bottom of the page - you may need to scroll down a bit.
You should see “Hello world” which is the STDOUT of the job. The job is considered
successful if the connection was established and the job finished with exit status 0.
Otherwise it’s considered a failure and you’d see the error in the same place,
where you normally see the STDOUT.

<p float='left' align='center'>
  <img src="/static/images/blog_images/2021-02-17-introduction-to-the-remote-execution-plugin/job_invocation_2.png" width="700" />
</p>

One error you may encounter is, the host name can’t be resolved or connected to.
Make sure the host hostname can be resolved. If that is not possible or you prefer
to use its IP address for the connection, change *Setting -> Remote Execution -> Connect by IP*
to *Yes*.

## REX at scale

It is not practical to specify the SSH password for each job. Especially if you run the
job on multiple hosts and they don’t have the same password. The installer generates a
SSH key pair on the Foreman Proxy host. You can distribute the generated SSH public key
or setup your existing SSH key you already use. The default SSH key pair location is at
* ~foreman-proxy/.ssh/id_rsa_foreman_proxy
* ~foreman-proxy/.ssh/id_rsa_foreman_proxy.pub

If you replace these files with your own key, either make sure the private key is not
protected by a passphrase or you need to specify it for every job, similar to how we
specified the password. To distribute the generated public key, you can use the following
command

```
ssh-copy-id -i ~foreman-proxy/.ssh/id_rsa_foreman_proxy.pub root@target-machine.example.com
```

However, you can use a more elegant way and do it from Foreman directly. For that we’ll
create a new job template, that will configure the SSH key on a machine on which it’s run.
Navigate to *Hosts -> Job templates* and click the *New Job Template* button.
Name it e.g. “Setup SSH key”. In the editor field, you can specify any script enriched
with ERB syntax. For example, you can write a template that renders to a bash script and
deploys the SSH public key like this:

```
#!/bin/bash
mkdir -p ~/.ssh
echo “ssh-rsa AAAAB3NzaC1yc2EAA...” > ~/.ssh/authorized_keys
```

But we can also use an existing template snippet that also takes care of the right file
permissions and deploys all public keys that Foreman is configured to use.
To do that, use the following template content:

```
<%= snippet 'remote_execution_ssh_keys' %>
```

To see what the template renders to, click on the *Preview* tab.

You can organize your Job templates to categories, if you want to change the default one,
switch over to the *Job* tab and set the desired category. If the category does not exist
yet, it’s automatically created. In my case, I set the category to “Bootstrap”. Then save
the template by clicking the *Submit* button. Now navigate to the hosts list page.
Select the hosts on which you’d like to deploy the SSH keys to and which have the same
root password. Then click the *Select Action* drop down and pick *Schedule Remote Job*
action. Select the *Job category*, e.g. Bootstrap. You can pick only templates from this
category in the next field. If there’s just one job template in the Bootstrap category,
it will be prefilled. Note that the *Search query* field is pre-set to the list of hosts
you’ve selected. Set the password in advanced fields again and hit *Submit* button.

After it finishes, let’s see whether the key based authentication works now. Click on the
*Rerun* button, which takes you back to the Job invocation form. It also prefills the form,
so we don’t have to specify the target hosts again. Just change the Job category to
*Commands* and the Job template to *Run Command - SSH Default*. Note that the form has
now additional field to specify the command you want to run. The Job template can define
additional user inputs that can be then used in the job. Try running `echo Hello world`
command again, this time don’t specify any password. If the SSH key was deployed
successfully, the job should succeed and print Hello world on STDOUT.

That was quite a lot of work to run the Hello world on multiple machines. But it
should be clear that running any job on an arbitrary set of hosts is a matter of a few
clicks. You can watch the progress of the run live, including the STDOUT for any host.
As a bonus, you can see the details of any previous run, review changes of the job
definitions in Audits page, schedule jobs to specific time or even set up recurring
execution of some job. You can limit which user can run what job on specific hosts.
Senior sysadmins can create job templates for juniors, who can run them on servers without
having direct access to them, e.g. allowing them only to restart stuck services.

## Real world use case #1 - Puppet deployment in a brownfield deployment

It’s the time for the first practical use case. In the previous
[blog post](https://theforeman.org/2021/01/updating-foreman-inventory-with-system-facts.html),
it would be handy to automate the setup of the Puppet agent. Foreman already comes
with the snippet, that is normally used during the host provisioning to bootstrap the
Puppet agent. However, if you start with Foreman and want to manage an existing
infrastructure, it’s useful to deploy Puppet agents to all existing hosts.
Puppet agents then ask the Puppet server deployed with Foreman for their configuration.
Puppet configuration management goes beyond this post, but this illustrates how
Remote Execution allows to automate this task.

To deploy a Puppet agent, we need to install a package, create a configuration file
with information about the Puppet server and trigger a one Puppet agent run.
The first template version could look like this

```
yum -y install puppet
cat > /etc/puppet/puppet.conf << EOF
[agent]
pluginsync      = true
report          = true
ca_server       = foreman.example.com
certname        = <%= @host.fqdn %>
environment     = Production
server          = foreman.example.com
EOF

/usr/bin/puppet agent --config /etc/puppet/puppet.conf --onetime --server foreman.example.com --no-daemonize
```

The certname is set according to the host fully qualified domain name.
The `@host` variable represents the target host on which you run the job over SSH.
See the documentation of all available variables and methods at *Administer -> About -> Templates DSL*
link. It would also be good to decide on how to install the package based on the host
OS. E.g. this could do the trick

```
<% if @host.operatinsystem.family == ‘Redhat’ %>
yum -y install puppet
<% else %>
apt install puppet
<% end %>
```

Or we could reuse an existing job template, that cover many more operating systems and
is installed by default with the plugin. This is how we can install package on all
supported OSes in job templates:

```
<%= render_template("Package Action - SSH Default", :action => "install", :package => 'puppet') %>
```

In the same way, you could customize the Puppet server or ca server based on what is
assigned to the host. Before we continue, I want to point out that thanks to the
fact the remote execution plugin uses the same templating engine, we can easily
reuse that snippet from provisioning templates. The entire job template would look
like this:

```
<%= snippet 'puppet_setup' %>
```

As long as the target host has the right Puppet server and CA assigned, the job
will deploy the Puppet agent and perform the initial run.

## Real world use case #2 - Home automation

I use [openHAB](https://www.openhab.org/) to automate several things at home. One of them
is arming the home alarm. It’s armed automatically every night and unarmed in the morning.
If it detects, no one is at home, it automatically arms the house even during the day.
If someone opens the door or garage when the house is armed, among other things it starts
the siren. I wanted a way to indicate the arm status that would not be too disruptive but
visible in various places at home. Since I have 3 WRT routers with OpenWrt installed
on them, I can control their LEDs. OpenWrt does not offer any remotely accessible API
for that as far as I know. However it’s a few shell lines to configure it once you’re
SSHed on your router.

Here comes Foreman into the play. I could use exec binding of openHAB and write the
script that would SSH to the router and run those few commands. That would be less
resource heavy for sure. However I wanted to have a central place to manage all SSH
scripts and keys, something that can be easily extended in future when I add more
scripts and something that I can easily control through REST API. With Foreman, I’m
able to configure openHAB to trigger a single REST API request that starts the LED
blinking on all three devices. The job templates allow me to parametrize the script easily.

So here’s what I had to do. OpenWrt uses dropbear as an SSH server, so I had to install
my ~foreman-proxy/.ssh/id_rsa_foreman_proxy.pub key to /etc/dropbear/authorized_keys on
all routers. Then I added routers to my Foreman by running hammer command like this

```
hammer host create --name up-router.example.com --managed false --build false --ip 192.168.2.2 \
  --location-id 2 --organization-id 1
```

For more information about populating hosts in Foreman, see the first [blog post][https://theforeman.org/2020/12/how-to-start-with-foreman.html] of this series.

I created a new job template that switches the LED blinking. I could create two different
templates, one for enabling second for disabling. However I decided to use a single
template and parametrize the action. This can be done by defining a template input
under the *Inputs* tab. If you want to let users specify some input when they trigger
the job, set the *Input Type* to *User Input*. In my case I called the input “state”
and set two possible options - ”yes” and ”no”. If you don’t set any options, the input
will be a free text form. But in this case, I wanted to limit the user input only to
enable or disable the LED blinking.

<p float='left' align='center'>
  <img src="/static/images/blog_images/2021-02-17-introduction-to-the-remote-execution-plugin/template_input.png" width="700" />
</p>

The value for user input is then available through the `input()` macro in the template.
The template example will make this clear

```
#!/bin/sh
<%- if @host.os.name == 'OpenWrt' -%>
<%-   if input('state') == 'on' -%>
<%=     "uci set system.led_wan_amber.trigger='timer'" %>
<%=     "uci set system.led_wan_amber.default=1" %>
<%=     "uci set system.led_wan_amber.delayoff=1000" %>
<%=     "uci set system.led_wan_amber.delayon=1000" %>
<%-   else -%>
<%=     "uci set system.led_wan_amber.trigger='none'" %>
<%=     "uci set system.led_wan_amber.default=0" %>
<%-   end -%>
<%=   "uci commit" %>
<%=   "/etc/init.d/led restart" %>
<%- else -%>
<%=   render_error('Unsupported OS for enabling LED') -%>
<%- end -%>
```

Based on the state input it set the desired configuration. Then it commits the OpenWrt
configuration and restarts the LED service, which is the same code for both cases.
It’s all wrapped in the OS check, since `uci` would only work on the OpenWrt hosts.
If an unsupported host is passed, it renders a meaningful error message.

When the job is run from the UI, the state input is presented. The inline help shown
after clicking the question mark icon shows the text that’s put in the Template Input
description.

<p float='left' align='center'>
  <img src="/static/images/blog_images/2021-02-17-introduction-to-the-remote-execution-plugin/led_invocation.png" width="700" />
</p>

The same input can be specified when the job is run through the REST API. Now, let’s
figure out how we can find out how to construct the API requests. The API documentation
is published at the [Foreman website](https://theforeman.org/api/latest/index.html).
However, you can also see the same documentation extended from plugins in your own
Foreman instance. The link can be found at *Administer -> About -> API Resources*.
Search for ”Job invocations”, specifically for ”Create a job invocation”. With that,
it’s not too hard to create the openHAB rule. This is how it looks

```
rule "House armed"
when
 Item armed_Status changed from OFF to ON
then
  sendHttpPostRequest("https://admin:changeme@foreman.example.com/api/job_invocations", "application/json", '{"location_id": 2,
 "organization_id": 1,
 "job_invocation": {
   "job_template_id": 142,
   "targeting_type": "static_query",
   "inputs": {
     "state": "on"
   },
   "search_query": "hostgroup = Routers"
 }}')
end
```

Of course I changed the URL and user credentials, in real world, I recommend using
a strong password or even better, creating a personal access token for the non-admin
user, who has permissions limited just to run this specific job.
The search query specifies the targets, in my case it’s all hosts assigned to the
Routers host group. The job template id is the id of the template I created.
Similarly there’s a rule for disarming, just changing the state input value to off.
The same flow of course is not limited to the openHAB, you can very easily convert
this to curl command or fire the similar request form any other (home) automation tool.

## Summary

I hope you found this Remote Execution introduction useful and I’ll be happy if
you share your experience and thoughts in the discussion below. I plan to incorporate
REX in the next posts too. The user interface for triggering the job is now being greatly
improved. If you have a suggestion for an improvement, please open a new issue in
our [issue tracker](https://projects.theforeman.org/projects/foreman_remote_execution)
