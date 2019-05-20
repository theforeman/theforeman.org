---
layout: plugin
title: Foreman Ansible 1.x Manual
version: 1.x
# uncomment for older versions than stable or nightly
robots: noindex
---

# 1. Basics

Foreman Ansible allows you to import hosts via Ansible, along with facts about these hosts and reports of their playbook runs. This plugin 1.x series should be compatible with any version of Foreman above 1.12, including 1.12.

Every time you run a playbook or an Ansible module, Foreman will receive facts and a report for the host you have executed it on.

![host with reports](static/images/plugins/foreman_ansible/registered_host.png)

It also allows you to define a list of roles so you can enforce them on your hosts.

# 2. Installation

## 2.1 Ansible callback

In order to make Ansible send us data from the hosts, we set up a callback on your host that runs Ansible. To do this:

* If you use Ansible 2.2+ , our callback is installed with Ansible itself, simply change `/etc/ansible/ansible.cfg` to contain

      [defaults]
      bin_ansible_callbacks = True
      callback_whitelist = foreman

and the callback will be enabled after that.


For Ansible versions older than 2.2:

* Change your `/etc/ansible/ansible.cfg` to contain the following options

      callback_plugins = ~/.ansible/plugins/callback_plugins/
      bin_ansible_callbacks = True

* And run this line to download the callback file in the appropriate location

      wget https://raw.githubusercontent.com/theforeman/foreman_ansible/master/extras/foreman_callback.py -O ~/.ansible/plugins/callback_plugins/foreman_callback.py

* Alternatively, you can find the source for the [Ansible callback here](https://github.com/theforeman/foreman_ansible) and deploy it in your directory of choice.

----

You can configure it via the following environment variables:

* FOREMAN_URL: the URL of your Foreman installation (default "http://localhost:3000")
* FOREMAN_SSL_CERT: The public key when using SSL client certificates (default "/etc/foreman/client_cert.pem")
* FOREMAN_SSL_KEY: The private key when using SSL client certificates (default  "/etc/foreman/client_key.pem")
* FOREMAN_SSL_VERIFY: wether to verify SSL certificates. Use *False*
  to disable certificate checks. You can also set it to CA bundle (default is "True").

To obtain a valid certificate for your host follow the procedure as described [here](http://theforeman.org/manuals/latest/index.html#4.3.10SSL)
See the [python-requests documentation](http://docs.python-requests.org/en/master/user/advanced/#ssl-cert-verification) on the details of certificate setup.

## 2.2 Plugin

If this is the first plugin you're installing, please see the [plugin
repository section]({{site.baseurl}}plugins/#2.2Packageinstallation) to set up the
repository first.

To install Foreman Ansible, run the following:

* Red Hat based (RHEL, CentOS...)

      # yum install tfm-rubygem-foreman_ansible

* Fedora

      # yum install rubygem-foreman_ansible

* Debian based (Debian, Ubuntu...)

      # apt-get install ruby-foreman-ansible

Restarting Foreman might be needed after installing the package.

## 2.3 Inventory

You can use the dynamic inventories feature in Ansible to make your inventory be Foreman, and have host properties and parameters available as Ansible variables in your manifests.

The project is not packaged, but you can find the sources here at [theforeman/foreman_ansible_inventory](https://github.com/theforeman/foreman_ansible_inventory). Check Ansible's [dynamic inventory documentation](http://docs.ansible.com/ansible/intro_dynamic_inventory.html) to install it.

# 3. Configuration

In Foreman, you should add whatever Ansible hosts you want to submit facts from to the setting `trusted_puppetmaster_hosts`. Change it at Administer > Settings, Auth tab.

If the Foreman setting `create_new_host_when_facts_are_uploaded` (Puppet tab) is true, and $HOSTNAME doesn't exist in Foreman, it will autocreate that host in Foreman. If it already exists, it will update the facts.

Similarly, the Foreman setting `ignore_puppet_facts_for_provisioning` (Provisioning tab) is set to false, facts related to interfaces will update the interfaces of $HOSTNAME in Foreman.

There are several Ansible options you can configure under Administer -> Settings in case you need to configure the Ansible port, user, etcetera. You can override these options on any host via Host parameters, Host group parameters or Global parameters by setting the attributes as explained on the settings description (e.g: a parameter 'ansible_user' on a host will make Foreman use that parameter as the Ansible user instead of the default)

![ansible settings](static/images/plugins/foreman_ansible/settings.png)

# 4. Usage

Run ansible on your hosts and the callback will send everything to Foreman automatically. Here's a quick gif of what registering a new host in Foreman looks like.

![registering a host](static/images/plugins/foreman_ansible/registering_a_host.gif)

## 4.1 Importing Roles

Ansible roles can be imported from a smart proxy that has 'Ansible' feature or from '/etc/ansible/roles' on your Foreman host. A list of all roles already imported into Foreman can be accessed through 'Configure' in the main menu. You can select the source for import from the dropdown on the right.

![ansible roles index](static/images/plugins/foreman_ansible/ansible_roles_index.png)
![ansible import dropdown](static/images/plugins/foreman_ansible/ansible_import_dropdown.png)

You will be presented with a list of possible changes. You can remove the Ansible roles from Foreman that are obsolete and you can import new ones.

![ansible import roles](static/images/plugins/foreman_ansible/ansible_import_roles.png)

## 4.2 Selecting roles for a host

Ansible roles can be assigned to a host on 'Ansible Roles' tab on the host's edit page. It is also possible to inherit Ansible roles form a host group.

After your host is provisioned and calls home (by using `foreman_url('built')` in a template), Foreman will do an initial Ansible run to configure the host according to the applicable roles for it. Since Foreman cannot know how long it will take until the host comes back online after the OS is installed and rebooted, Foreman will make Ansible timeout for 5 minutes. This is configurable under Administer > Settings, 'Post-provision timeout' or on a per-host basis by overriding the setting with a parameter.

Inherited roles are added automatically upon host group change and the select interface disables direct removal of such items.
![select roles for host](static/images/plugins/foreman_ansible/select_roles_for_host.png)

Host group edit form contains very similar tab where you can pre-configure selection of Ansible roles for hosts.
![select roles for hostgroup](static/images/plugins/foreman_ansible/select_roles_for_hostgroup.png)

## 4.3 Running a playbook

To run the playbook with the roles selected, click on the 'play Ansible roles' button and Foreman will run a playbook on the background.  Logs for this playbook can be found under the regular Foreman log, usually `/var/log/foreman/production.log`

![role play](static/images/plugins/foreman_ansible/role_play.png)

You can also select multiple hosts on the hosts index page, and run the playbook for their Ansible roles by clicking on this button:

![multiple role play](static/images/plugins/foreman_ansible/multiple_role_play.png)

Alternatively, you can run the playbook for all Ansible roles applicable to hosts in a host group by clicking on the Play roles button on the Host groups page.

![hostgroup role play](static/images/plugins/foreman_ansible/hostgroups_role_play.png)

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
