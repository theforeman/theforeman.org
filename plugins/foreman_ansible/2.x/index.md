---
layout: plugin
title: Foreman Ansible 2.x Manual
version: 2.x
# uncomment for older versions than stable or nightly
#robots: noindex
---

# 1. Basics

Foreman Ansible allows you to import hosts via Ansible, along with facts about these hosts and reports of their playbook runs. This plugin 2.x series should be compatible with any version of Foreman above 1.17, including 1.17. Foreman Ansible relies on [Foreman Remote Execution](plugins/foreman_remote_execution) in order to be able to run playbooks remotely.

Every time you run a playbook or an Ansible module, Foreman will receive facts and a report for the host you have executed it on. If you ran Ansible from Foreman itself, the output of your Ansible run will be saved in our database.

You can define a list of roles to enforce and run arbitrary playbooks on the hosts.
![host with reports](static/images/plugins/foreman_ansible/registered_host.png)
![rex results](static/images/plugins/foreman_ansible/rex_results.png)
![rex playbook_output](static/images/plugins/foreman_ansible/rex_playbook_output.png)

# 2. Installation

## 2.1 Ansible callback

<script type="text/javascript">
function update_ansible_version(select) {
  var version = select.value;
  $(".ansible_version").hide();
  if (version && version != 'none') {
    $(".ansible_version_"+version).show();
  } else {
    $(".ansible_version_none").show();
  }
}
</script>

In order to make Ansible send us data from the hosts, we set up a callback on your host that runs Ansible.
To provide specific installation instructions, please select your Ansible version:

<select onChange="update_ansible_version(this);">
  <option value="none">-- select Ansible version --</option>
  <option value="25">2.5 or higher</option>
  <option value="22">2.2, 2.3, 2.4</option>
  <option value="21">2.1 or lower</option>
</select>

<div class="ansible_version ansible_version_none">
  <i>No Ansible version selected.</i>
</div>


<div class="ansible_version ansible_version_25 ansible_version_22" style="display:none;">
<p>
Our callback is installed with Ansible itself, change <code>/etc/ansible/ansible.cfg</code> to contain
</p>

{% highlight bash %}
[defaults]
callback_whitelist = foreman
{% endhighlight %}

<p>
and the callback will be enabled after that.
</p>

<p>
Of course, the callback cannot know automatically where is Foreman located and which certificates to use in its requests.
</p>
</div>

<div class="ansible_version ansible_version_25" style="display:none;">
<p>
To configure it, add a section <code>[callback_foreman]</code> at the end of <code>/etc/ansible/ansible.cfg</code> like this:
</p>

{% highlight bash %}
[callback_foreman]
url = 'https://foreman.example.com'
ssl_cert = /etc/foreman-proxy/ssl_cert.pem
ssl_key = /etc/foreman-proxy/ssl_key.pem
verify_certs = /etc/foreman-proxy/ssl_ca.pem
{% endhighlight %}
</div>

<div class="ansible_version ansible_version_21" style="display:none;">
<p>
We don't really test these versions, however if you need to use an old version of Ansible, you could do the following:
</p>

<ul>
  <li>
  Change your <code>/etc/ansible/ansible.cfg</code> to contain the following options:
  </li>

{% highlight bash %}
callback_plugins = ~/.ansible/plugins/callback_plugins/
bin_ansible_callbacks = True
{% endhighlight %}

  <li>
  And run this line to download the callback file in the appropriate location:
  </li>

{% highlight bash %}
wget https://raw.githubusercontent.com/ansible/ansible/stable-2.2/lib/ansible/plugins/callback/foreman.py -O ~/.ansible/plugins/callback_plugins/foreman.py
{% endhighlight %}
</ul>
</div>

<div class="ansible_version ansible_version_22 ansible_version_21" style="display:none;">

<p>
You need to configure it via the following environment variables (the variables need to be available to the user running the callback. Usually <code>foreman-proxy</code>):
</p>

<ul>
  <li>
    FOREMAN_URL: the URL of your Foreman installation (default "http://localhost:3000")
  </li>
  <li>
    FOREMAN_SSL_CERT: The public key when using SSL client certificates (default "/etc/foreman/client_cert.pem")
  </li>
  <li>
    FOREMAN_SSL_KEY: The private key when using SSL client certificates (default  "/etc/foreman/client_key.pem")
  </li>
  <li>
    FOREMAN_SSL_VERIFY: Use *False* to disable certificate checks. You can also set it
    to use the local CA bundle "True", or a path to a CA file for a custom CA.
  </li>
</ul>

<p>
Since the 'foreman' and 'foreman-proxy' are 'no-login' users, you should set these in the <code>EnviromentFile</code> used by systemd, <code>/etc/sysconfig/foreman</code> and <code>/etc/sysconfig/foreman-proxy</code>. An alternative for other users is to put them in their <code>.bashrc</code> as <code>export FOREMAN_URL=yoururl</code>. In most distributions environment variables set in <code>/etc/environment</code> will be shared among all users.
</p>

<p>
To obtain a valid certificate for your host follow the procedure as described <a href='manuals/latest/index.html#4.3.10SSL'>here</a>.
</p>
<p>
See the <a href='http://docs.python-requests.org/en/master/user/advanced/#ssl-cert-verification'>python-requests documentation</a> on the details of certificate setup.
</p>
</div>


## 2.2 Plugin

If this is the first plugin you're installing, please see the [plugin
repository section]({{site.baseurl}}plugins/#2.2Packageinstallation) to set up the
repository first.

You can use foreman-installer to install Foreman Ansible:

      # foreman-installer --enable-foreman-plugin-ansible --enable-foreman-proxy-plugin-ansible

To run Ansible playbooks as Job Templates, you will also need Remote Execution:

      # foreman-installer --enable-foreman-plugin-remote-execution --enable-foreman-proxy-plugin-remote-execution-ssh

## 2.3 Inventory

You can use the dynamic inventories feature in Ansible to make your inventory be Foreman, and have host properties and parameters available as Ansible variables in your manifests.

The project is not packaged, but you can find the sources here at [ansible/ansible](https://github.com/ansible/ansible/blob/devel/contrib/inventory/foreman.py). You will need to setup a config file `/etc/ansible/foreman.ini`, which you can find in [ansible/ansible](https://github.com/ansible/ansible/blob/devel/contrib/inventory/foreman.ini).

Check Ansible's [dynamic inventory documentation](http://docs.ansible.com/ansible/intro_dynamic_inventory.html) to install it.

# 3. Configuration

Smart proxies are authenticated by Foreman usually through certificates (found in /etc/foreman-proxy/). Therefore, when it comes to proxies, it is NOT necessary to add them to the setting `trusted_hosts`.

If you want to use Ansible and submit facts/reports to Foreman, through the callback, you should add whatever hosts (again, except Smart Proxies) you want to submit facts **from** to the setting `trusted_hosts`. Change it at Administer > Settings, Auth tab. e.g: If you're running Ansible from host 'A', which SSHs into host 'B', you need to add host 'A'

If the Foreman setting `create_new_host_when_facts_are_uploaded` (Puppet tab) is true, and $HOSTNAME doesn't exist in Foreman, it will autocreate that host in Foreman. If it already exists, it will update the facts.

Similarly, the Foreman setting `ignore_puppet_facts_for_provisioning` (Provisioning tab) is set to false, facts related to interfaces will update the interfaces of $HOSTNAME in Foreman.

There are several Ansible options you can configure under Administer -> Settings -> Ansible.

Configuration for Ansible itself, such as 'ansible_user', 'ansible_become', etc., can be set on any host via Host parameters, Host group parameters or Global parameters by setting the attributes as explained on the settings description.

By default foreman-ansible relies on the settings of Remote Execution for SSH connection options, like SSH user and password or the SSH key passphrase.

![ansible settings](static/images/plugins/foreman_ansible/settings.png)

# 4. Usage

Run ansible on your hosts and the callback will send everything to Foreman automatically. Here's a quick gif of what registering a new host in Foreman looks like.

![registering a host](static/images/plugins/foreman_ansible/registering_a_host.gif)

After a host is registered, you should be able to see facts and reports for a host

![facts for a host](static/images/plugins/foreman_ansible/facts_for_a_host.png)
![reports for a host](static/images/plugins/foreman_ansible/report_for_a_host.png)

## 4.1.1 Importing Roles

Ansible roles can be imported from a smart proxy that has 'Ansible' feature or from '/etc/ansible/roles' on your Foreman host. A list of all roles already imported into Foreman can be accessed through 'Configure' in the main menu. You can select the source for import from the dropdown on the right.

![ansible roles index](static/images/plugins/foreman_ansible/ansible_roles_index.png)
![ansible import dropdown](static/images/plugins/foreman_ansible/ansible_import_dropdown.png)

You will be presented with a list of possible changes. You can remove the Ansible roles from Foreman that are obsolete and you can import new ones.

![ansible import roles](static/images/plugins/foreman_ansible/ansible_import_roles.png)

## 4.1.2 Importing Variables

Similar to Ansible roles, variables in these roles can be imported in the same fashion. Go to 'Configure > Ansible Variables' to find a list of variables already imported. When you trigger a new import of Ansible variables, if the variables belong to a role that has not been imported yet, it will be automatically imported alongside the Ansible variable.

![ansible variables index](static/images/plugins/foreman_ansible/ansible_variables_index.png)

You will be presented with a list of possible changes. You can remove the Ansible roles from Foreman that are obsolete and you can import new ones.

![ansible variables import](static/images/plugins/foreman_ansible/ansible_variables_import.png)

Variables are imported into Foreman as Lookup Values, hence you may use them exactly like you use Puppet Smart Class Parameters or Smart Variables. Smart Matchers are available for use too. Find more information about how to override Ansible variables in [this section of the manual](plugins/foreman_ansible/2.x/index.html#4.5OverridingAnsibleVariables).

![ansible variables details](static/images/plugins/foreman_ansible/ansible_variables_details.png)

## 4.2 Selecting roles for a host

Ansible roles can be assigned to a host on 'Ansible Roles' tab on the host's edit page. It is also possible to inherit Ansible roles form a host group.

After your host is provisioned and calls home (by using `foreman_url('built')` in a template), Foreman will do an initial Ansible run to configure the host according to the applicable roles for it. Since Foreman cannot know how long it will take until the host comes back online after the OS is installed and rebooted, Foreman will make Ansible timeout for 5 minutes. This is configurable under Administer > Settings, 'Post-provision timeout' or on a per-host basis by overriding the setting with a parameter.

Inherited roles are added automatically upon host group change and the select interface disables direct removal of such items.
![select roles for host](static/images/plugins/foreman_ansible/select_roles_for_host.png)

Host group edit form contains very similar tab where you can pre-configure selection of Ansible roles for hosts.
![select roles for hostgroup](static/images/plugins/foreman_ansible/select_roles_for_hostgroup.png)

## 4.3 Running Ansible Roles

To run the playbook with the roles selected, click on the 'play Ansible roles' button and Foreman will run a playbook on the background.  Logs for this playbook can be found under the regular Foreman log, usually `/var/log/foreman/production.log`

![role play](static/images/plugins/foreman_ansible/role_play.png)

You can also select multiple hosts on the hosts index page, and run the playbook for their Ansible roles by clicking on this button:

![multiple role play](static/images/plugins/foreman_ansible/multiple_role_play.png)

Alternatively, you can run the playbook for all Ansible roles applicable to hosts in a host group by clicking on the Play roles button on the Host groups page.

![hostgroup role play](static/images/plugins/foreman_ansible/hostgroups_role_play.png)

## 4.4 Running Ansible Playbooks (Job Templates)

To run a playbook:
  - On the Host page, click on Scheduled Remote Job, choose a Job Template, and submit it
  - On the Host list, select multiple hosts, then click on "Select Action" -> "Scheduled Remote Job"
  - On the Job Templates list, look for a Job Template and click on "Run", then submit it

For example, here is how to run 'yum install -y vim' once, on one host.

![run ansible job](static/images/plugins/foreman_ansible/run_ansible_job.gif)

And here is how to schedule a playbook run in the future on multiple hosts:

![schedule ansible job](static/images/plugins/foreman_ansible/schedule_ansible_job.gif)

For more information about scheduled jobs, check out the [Foreman Remote Execution manual](/plugins/foreman_remote_execution)

## 4.5 Overriding Ansible Variables

[Ansible variables](https://docs.ansible.com/ansible/latest/user_guide/playbooks_variables.html) are referenced in playbooks and templates with the syntax {% raw %}"{{ myvariable }}"{% endraw %}. For example:

```yaml
template: src=foo.cfg.j2 dest={% raw %}{{ remote_install_path }}{% endraw %}/foo.cfg
```

uses the 'remote_install_path' variable. You can use Foreman to override these variables. The variables will only be overridden if you run your roles from Foreman, as Foreman sends an inventory with a dictionary containing variable names and values when it runs Ansible roles.

There are three ways to override an Ansible variable:

1. Import the variable following [this section of the manual](plugins/foreman_ansible/2.x/index.html#4.1.2ImportingVariables). Once the variable is imported, you may provide a type and a default value:

![ansible variables default](static/images/plugins/foreman_ansible/ansible_variables_default.png)

and you can also specify [Smart Matchers]({{site.baseurl}}manuals/latest/index.html#4.2.6SmartMatchers) to specify default matching values for certain Host groups, FQDNs, Operating Systems, or Domains.

![ansible variables matchers](static/images/plugins/foreman_ansible/ansible_variables_matchers.png)


2. Set the variable you want to override as a Host Parameter, Host Group Parameter, or Global Parameter. The 'name' of the parameter would be the name of the Ansible variable you want to override, and the 'value' of the parameter the value of the variable. Notice variables sent this way will always have the type String. If you want to override variables that should have other types, use method 1.

3. Another way to override the variable is to set it as a Job Template input. For example, let's create a Job Template containing a playbook with the variable \{\{ command \}\}.

![override_var_1](static/images/plugins/foreman_ansible/override_var_1.png)

Then set a Job Template Input with the name of the variable "command":

![override_var_2](static/images/plugins/foreman_ansible/override_var_2.png)

As you see, the variable "command" is now available to be set on every Job Template run.

![override_var_3](static/images/plugins/foreman_ansible/override_var_3.png)

You can override this variable every time you run the Job Template by setting the variable as Input. This takes precedence over Host Parameters.


# 5. Help

Please follow our [standard procedures and contacts]({{site.baseurl}}support.html).

## 5.1 Troubleshooting

Errors regarding the import of facts and reports will show up on /var/log/foreman/production.log of your Foreman host.

If you find a bug, please file it in
[Redmine](http://projects.theforeman.org/projects/ansible/issues/new).

See the [troubleshooting section]({{site.baseurl}}manuals/latest/index.html#7.2GettingHelp)
in the Foreman manual for more info.

## 5.2 Contributing

Follow the [same process as Foreman]({{site.baseurl}}contribute.html#SubmitPatches)
for contributing.

Sources at [github.com/theforeman/foreman_ansible](https://github.com/theforeman/foreman_ansible)
