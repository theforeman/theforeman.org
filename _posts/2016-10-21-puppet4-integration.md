---
layout: post
title: Katello Puppet 4 integration
date: 2016-10-19
author: Zach Huntington-Meath
tags:
- katello
- puppet
excerpt: |
    Puppet 4 integration is coming to Katello and we wanted to share with you how it works!
---

### Puppet 4 Integration with Katello

Recently, Foreman and Puppet 4 became compatible. Now, Katello is ready to work with Puppet 4. It is available in Katello nightly and will be released in version 3.2.  In this post, we will explain how to create new Katello instances that are Puppet 4 ready, and upgrade existing systems.

There are some important things to know about using Katello with Puppet 4:

- Puppet 4 uses the Java Virtual Machine and requires more memory than Puppet 3 did. This means that systems acting as Katello servers with Puppet 4 need a larger amount of memory. At a minimum, we are requiring 8 GB of memory, and recommending 12GB

- Puppet 4 masters can still provision hosts with Puppet 3 with [some configuration](https://docs.puppet.com/puppetserver/latest/compatibility_with_puppet_agent.html). This can help with systems that are migrating over to Puppet 4. You can start with upgrading your masters to Puppet 4 and then gradually upgrade your agents.

- You can use this matrix as a quick reference of what can work together:

<table class="table table-bordered table-striped" style="width:50%">
  <thead>
    <tr>
      <th style="text-align: center">&nbsp;</th>
      <th style="text-align: center">Puppet 3 client</th>
      <th style="text-align: center">Puppet 4 client</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style="text-align: center"><strong>Puppet 4 server</strong></td>
      <td style="text-align: center">Compatible</td>
      <td style="text-align: center">Compatible</td>
    </tr>
    <tr>
      <td style="text-align: center"><strong>Puppet 3 server</strong></td>
      <td style="text-align: center">Compatible</td>
      <td style="text-align: center">Not compatible</td>
    </tr>
  </tbody>
</table>

- Katello will by default install modules to the normal file paths for the version of Puppet you are using. 
 * Puppet 3 will install modules to `/etc/puppet/environments`
 * Puppet 4 will install modules to `/etc/puppetlabs/code/environments`

### How to upgrade Katello servers, capsules, and hosts to use Puppet 4

We have a [great video](https://youtu.be/GFNPHypFhl4?t=2545) and [excellent documentation](http://www.katello.org/docs/3.2/upgrade/puppet.html) on how to upgrade from Puppet 3 to 4.

To upgrade an existing Katello instance to Puppet 4:

Before starting, we recommend creating a [backup](http://www.katello.org/docs/3.2/user_guide/backup/) or a snapshot of your system.

You will need to give your system access to the new Puppet packages. To do this follow the instructions [here](https://docs.puppet.com/puppet/4.6/reference/puppet_collections.html).

Then run:

```bash
katello-service stop # This will stop all services.
foreman-installer --upgrade-puppet # This performs the upgrade.
```

The `--upgrade-puppet` command will restart the services, but you can check that they are running with `hammer ping`. If you run `puppet --version` on the server, it should show `4.x.x`. 

### How to install Katello with Puppet 4

#### Production Environments
If you want to install a real production server with Puppet 4 we reccommend following the instructions listed in our [documentation](http://www.katello.org/docs/3.2/installation/index.html). 

If you want to create a test Katello production server configured with Puppet 4, the easiest way is to spin up a Virtual Machine with [Forklift](https://github.com/Katello/forklift).

To do this you can follow these instructions:

```bash
git clone https://github.com/katello/forklift.git
cd forklift
vagrant up centos7-katello-p4
```

This will setup a virtual environment with Katello and Puppet 4 enabled.

#### Development environment

If you are so inclined, you can create a development environment of Katello using Puppet 4. To do this, spin it up (also with Forklift) as a virtual machine with the following configuration:

```yaml
example-dev-p4:
  box: centos7
  memory: 9000
  shell: 'yum -y install ruby && cd /vagrant && ./setup.rb'
  options: --scenario=katello-devel --puppet-four
  installer: --katello-devel-github-username <YOUR GITHUB USERNAME> --disable-system-checks
  ansible:
    group: 'server'
```
* Note that this setup does require you to have a fork of Foreman and Katello setup on your Github account.

- Run `vagrant up example-dev-p4` and let it spin up the box.

- After it's complete you will want to run this series of commands:

```bash
sudo yum install npm -y
cd foreman
npm install
```

- Then you'll have to edit a setting in `/home/vagrant/foreman/config/environments/development.rb` by changing the following setting to `false`:

```vim
config.webpack.dev_server.enabled = false
```

- Next run

```bash
rake webpack:compile
rails s
```

- Now you have a functioning development environment!


#### Making Capsules

If you wanted to create a capsule you can do so either with insturctions from our official [documentation](http://www.katello.org/docs/3.2/installation/capsule.html). You can also follow these steps using Forklift:

* In your boxes.yml file, you can write:
```yaml
example-capsule-p4:
  box: centos7
  ansible:
    playbook: 'playbooks/capsule-dev.yml'
    options: --puppet-four
    group: 'capsule'
    server: 'example-katello-p4'
```

* After run:

```bash
vagrant up example-capsule-p4
```

* Once installation completes you'll have a capsule registered to your Katello environment.

### Contributors

Thanks to everyone on the Katello team for putting in the effort for making this happen. Thanks also to the Foreman team and our contributors, who put so much effort into these great projects!

### More Information

Here are some good places to find more information about Puppet 4 and using it with Katello:

[Puppet 4 documentation](https://docs.puppet.com/puppet/4.5/reference/)

[Puppet 4 package collections](https://docs.puppet.com/puppet/4.6/reference/puppet_collections.html)

[Katello Puppet upgrade documentation](http://www.katello.org/docs/3.2/upgrade/puppet.html)

[Katello Capsule creation documentation](http://www.katello.org/docs/3.2/installation/capsule.html)

[Forklift repository](https://github.com/Katello/forklift)

[Puppet upgrade demo](https://youtu.be/GFNPHypFhl4?t=2545)
