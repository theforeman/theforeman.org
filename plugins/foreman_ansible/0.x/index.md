---
layout: plugin
title: Foreman Ansible 0.x Manual
version: 0.x
---

# 1. Introduction

Foreman Ansible allows you to import hosts via Ansible, along with facts about these hosts and reports of their playbook runs. This plugin should be compatible with any version of Foreman above 1.8, including 1.8.

Every time you run a playbook or an Ansible module, Foreman will receive facts and a report for the host you have executed it on.

![host with reports](static/images/plugins/foreman_ansible/registered_host.png)

# 2. Installation

## 2.1 Ansible callback

In order to make Ansible send us data from the hosts, we set up a callback on your host that runs Ansible. To do this:

* Change your /etc/ansible/ansible.cfg to contain the following options

      callback_plugins = ~/.ansible/plugins/callback_plugins/
      bin_ansible_callbacks = True

* And run this line to download the callback file in the appropriate location

      wget https://raw.githubusercontent.com/theforeman/foreman_ansible/master/extras/foreman_callback.py -O ~/.ansible/plugins/callback_plugins/foreman_callback.py

* Alternatively, you can find the source for the [Ansible callback here](https://github.com/theforeman/foreman_ansible) and deploy it in your directory of choice.

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

In Foreman, you should add whatever Ansible hosts you want to submit facts from to the setting `trusted_puppetmaster_hosts`. Change it at Administer > Settings, Puppet tab.

If the Foreman setting 'create_new_host_when_facts_are_uploaded' is true, and $HOSTNAME doesn't exist in Foreman, it will autocreate that host in Foreman. If it already exists, it will update the facts.

Similarly, the Foreman setting 'ignore_puppet_facts_for_provisioning' is set to false, facts related to interfaces will update the interfaces of $HOSTNAME in Foreman.

# 4. Usage

No instructions needed! Run ansible on your hosts and the callback will send everything to Foreman automatically. Here's a quick gif of what registering a new host in Foreman looks like.

![registering a host](http://i.imgur.com/mlnVFJj.gif)

# 5. Help

Please follow our [standard procedures and contacts]({{site.baseurl}}support.html).

## 5.1 Troubleshooting

Errors regarding the import of facts and reports will show up on /var/log/foreman/production.log of your Foreman host.

If you find a bug, please file it in
[Redmine](http://projects.theforeman.org/projects/foreman_ansible/issues/new).

See the [troubleshooting section]({{site.baseurl}}manuals/latest/index.html#7.2GettingHelp)
in the Foreman manual for more info.

## 5.2 Contributing

Follow the [same process as Foreman]({{site.baseurl}}contribute.html#SubmitPatches)
for contributing.

Sources at [github.com/theforeman/foreman_ansible](https://github.com/theforeman/foreman_ansible)
