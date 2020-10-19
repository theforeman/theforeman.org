---
layout: post
title: Foreman Config as Code
date: 2020-10-16 10:44:31
author: Jeffrey van Pelt
tags:
- foreman
- ansible
---

A while back, the Foreman developers released an [Ansible Collection](https://theforeman.org/2020/09/foreman-ansible-modules-v130-released.html) that contains modules to control almost any aspect of a Foreman server. This allows to apply the 'Infrastructure as Code' principle to my favorite OS Lifecycle and Deployment tool as well!

So, I dug in and made a role for Ansible which does just that!

TL;DR: [Check it out on Github](https://github.com/Thulium-Drake/ansible-role-foreman) or [Ansible Galaxy](https://galaxy.ansible.com/thulium_drake/foreman)

<!--more-->

## Environment
Before we look at how it works, we first need to prepare a little network with the correct stuff, below is a small 3-host layout which we'll use:

* Hostname: foreman.infra.example.com  
  OS: CentOS 7  
  Foreman version: 2.0.3  
  Katello version: 3.15  
  IP address: 192.168.255.15/24
* Hostname: ansible.infra.example.com  
  OS: Debian 10  
  Ansible version: ansible-base 2.10.0  
  IP address: 192.168.255.10/24
* Hostname: target.infra.example.com  
  OS: N/A  

Both systems have the default setup with which it comes out of the box, so no special setup required! Just make sure you can access them as root without password and have Internet access.

## Prepare the Ansible control node
Enable the Ansible repository on your system and install the following packages

```bash
echo 'deb http://ppa.launchpad.net/ansible/ansible/ubuntu eoan main' >> /etc/apt/sources.list.d/ansible.list
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367
apt update
apt install ansible-base python3-netaddr
```

After installing Ansible, create a new directory for your Ansible project and download all required Ansible code:

```bash
mkdir ~/foreman-ansible
cd ~/foreman-ansible

mkdir roles collections group_vars host_vars

cat <<EOF > requirements.yml
collections:
  - name: 'theforeman.foreman'
roles:
  - name: 'foreman'
    src: 'thulium_drake.foreman'
EOF

cat <<EOF > ansible.cfg
[defaults]
retry_files_enabled = False
inventory           = inventory
remote_user         = root
roles_path          = roles
collections_path    = collections

[inventory]
enable_plugins = theforeman.foreman.foreman, yaml, ini
EOF

cat <<EOF > inventory
[foreman]
foreman.example.com

[foreman_infra]

[foreman_infra:children]
foreman
EOF

ansible-galaxy install -r requirements.yml
```


## Install and configure Foreman
Now you're almost all set! All you now need is a bunch of variables set and you're good to go. If you look in the 'playbooks' folder inside role (located in ~/foreman-ansible/roles/foreman), you can find just that. It is an example variable file based on what I have used in the past for a client.

So copy over the file to your project and start installing:

```
cd ~/foreman-ansible/
cp roles/foreman/playbooks/groupvars_foreman_infra.yml group_vars/foreman_infra.yml
cp roles/foreman/playbooks/foreman_install.yml .

ansible-playbook foreman_install.yml
```

This playbook will install the Forklift repo on your Foreman server and run the provided playbooks to install the Foreman server on your system. Afterwards, you can find your fresh Foreman installation at https://foreman.infra.example.com

Now you can start the second playbook to configure it

```bash
cd ~/foreman-ansible/
cat <<EOF > foreman_config.yml
- name: 'Configure Foreman'
  hosts: 'foreman'
  tasks:
    - name: 'Configure Foreman'
      import_role:
        name: 'foreman'
EOF
ansible-playbook foreman_config.yml
```

This playbook will configure your Foreman server with among others, the following:

* Organization & Locations
* Lifecycle paths
* Products & Repositories
* Content Views  
  It will create 2 types of CVs (check the role docs for more information):
    * 'normal' ones that contain a product's repos
    * Composites that will contain one or multiple 'normal' ones, these are eventually assigned to clients
* Activation Keys (one for each Lifecycle)
* Subnets & Domains
* Host Groups (based on Activation Keys)
* Host Discovery (check the documentation for additional instructions)

After the playbook completes, you should be able to deploy a fresh installation of CentOS on the 3rd system we added to the lab! Create a new host in Foreman, assign it a Hostgroup and deploy away!

## Final remarks
This role will help anyone to deploy a typical Foreman server in their environment in a quick, reproducable manner. However, in order to do so, I made a couple of assumptions when developing it. So it might not be a perfect fit for everyone.

I'm looking forward to hearing about your experiences with this, you can find me on the [forums](https://community.theforeman.org/) as Thulium-Drake!
