---
layout: plugins/katello/documentation
version: 2.4
title: Client Installation
script: osmenu.js
---

# Client Installation

Client machines can be added in one of two ways: manually or via a provisioned host.

## Manual

Install the appropriate Katello client release packages.  For CentOS 6, you will also need to enable the COPR repository for subscription-manager.

<p>
  Select your Operating System:
  <select id="operatingSystems">
     <option value="el5">Enterprise Linux 5 (CentOS, etc.)</option>
     <option value="el6">Enterprise Linux 6 (CentOS, etc.)</option>
     <option value="el7">Enterprise Linux 7 (CentOS, etc.)</option>
     <option value="fc20">Fedora 20</option>
     <option value="fc21">Fedora 21</option>
  </select>
</p>

<div id="el5" markdown="1">
```bash
yum update -y https://fedorapeople.org/groups/katello/releases/yum/{{ page.version }}/client/RHEL/5Server/x86_64/katello-client-repos-latest.rpm
```
</div>

<div id="el6" style="display:none;" markdown="1">
```bash
wget https://copr.fedoraproject.org/coprs/dgoodwin/subscription-manager/repo/epel-6/dgoodwin-subscription-manager-epel-6.repo -O /etc/yum.repos.d/dgoodwin-subscription-manager-epel-6.repo
yum update -y https://fedorapeople.org/groups/katello/releases/yum/{{ page.version }}/client/RHEL/6Server/x86_64/katello-client-repos-latest.rpm
```
</div>

<div id="el7" style="display:none;" markdown="1">
```bash
yum update -y https://fedorapeople.org/groups/katello/releases/yum/{{ page.version }}/client/RHEL/7Server/x86_64/katello-client-repos-latest.rpm
```
</div>

<div id="fc20" style="display:none;" markdown="1">
```bash
yum update -y https://fedorapeople.org/groups/katello/releases/yum/{{ page.version }}/client/RHEL/Fedora/20/x86_64/katello-client-repos-latest.rpm
```
</div>

<div id="fc21" style="display:none;" markdown="1">
```bash
yum update -y https://fedorapeople.org/groups/katello/releases/yum/{{ page.version }}/client/RHEL/Fedora/21/x86_64/katello-client-repos-latest.rpm
```
</div>

Now you are ready to install the katello-agent:

```
# yum install katello-agent
```

## Provisioned

In order to install the katello-agent package on a host you are provisioning, you will need to make the appropriate client repository available within your Katello. The first step is to either create a new product or add to an existing product, the appropriate client repository from the dropdown in the [manual](#manual) section above. After you create the new repositories, they will need to be synced locally. Next, you will then need to add them to the relevant content view(s) for the hosts you are wanting to provision. At this point, a new version of the content view can be published and promoted to the appropriate environments that you are wanting to provision a host into. At this point, you can go provision a host and the host will install the katello-agent package during setup.
