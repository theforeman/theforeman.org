---
layout: post
title: Creating a auto healing Foreman Proxy
author: Sean O'Keeffe
tags:
- foreman
- katello
- smart proxy
- aws
---

Auto healing infrastructure allows scalability, predictability and automated recovery. This is the story of how we created an auto healing Foreman Smart Proxy with Packer, Terraform & Ansible on AWS.

## Why?
Why not? Defining all our infrastructure in code means we can recover from problems quickly and efficiently, not to mention the other benefits of that.
- All of our other cloud applications and infrastructure are auto scaling and rebuilt every 21 days, from NTP & DNS servers to Splunk clusters and all the Applications & Servers they are there to support are built using this process. We don't want to differentiate from the standard.
- No upgrades! We just re-build on the newer version.
- No sessions! Disabling all user access, SSH & console, to our boxes allows simple deployment to cloud providers in our secure environment.


## The process

NOTE: We use Katello, so this guide uses Content Smart Proxies, a similar (probably simpler) process could also work for Foreman's Smart Proxies.

### Base AMI

We start with a Base AMI, this is a custom AMI that we produce based off the official AWS one, it includes custom configuration for hardening, NTP, DNS configuration & more, just basic stuff we want on every machine we deploy. You could replace this with one from the AWS Marketplace if you wanted to. Using Packer we took this base AMI to create a new "foreman-proxy" AMI. This just installs all the packages we need to run foreman-proxy, unregisters from the Katello server & SSH disabled, using the Shell Provisioner. None of our instances on AWS have SSH enabled or yum repos configured when running.

```json
<SNIP>

"provisioners": [
    {
        "type": "shell",
        "inline": [
            "sed -i 's/console=ttyS0,115200n8 console=tty0/console=tty0 console=ttyS0,115200n8/' /etc/default/grub",
            "sudo grub2-mkconfig -o /boot/grub2/grub.cfg",do subscription-manager clean",
            "rpm -q katello-ca-consumer-katello.example.com 2>/dev/null || sudo rpm -Uvh http://katello.example.com/pub/katello-ca-consumer-latest.noarch.rpm",
            "sudo subscription-manager register --org=\"My-Org\" --activationkey=\"foreman-proxy\"",
            "sudo yum install -y katello-agent",
            "sudo yum install -y foreman-proxy-content",
            "sudo yum install -y squid",
            "sudo yum install -y katello-certs-tools",
            "sudo yum install -y katello-debug",
            "sudo yum install -y qpid-dispatch-router",
            "sudo yum install -y mongodb-server",
            "sudo yum install -y pulp-rpm-plugins",
            "sudo yum install -y pulp-server",
            "sudo yum install -y pulp-docker-plugins",
            "sudo yum install -y pulp-selinux",
            "sudo yum install -y python-pulp-streamer",
            "sudo yum install -y python-gofer-qpid",
            "sudo yum install -y ca-certificates",
            "sudo yum install -y mailcap",
            "sudo yum install -y python-qpid",
            "sudo yum install -y python-qpid-qmf",
            "sudo yum install -y qpid-cpp-client",
            "sudo yum install -y python-crane",
            "sudo yum install -y puppet-server",
            "sudo yum install -y foreman-proxy",
            "sudo yum install -y qpid-tools",
            "sudo yum install -y rubygem-apipie-bindings",
            "sudo yum install -y qpid-cpp-server-linearstore",
            "sudo yum install -y httpd",
            "sudo yum install -y mod_passenger",
            "sudo yum install -y mod_wsgi",
            "sudo yum install -y mod_xsendfile",
            "sudo yum install -y mod_ssl",
            "sudo yum install -y pulp-puppet-plugins",
            "sudo yum install -y mongodb",
            "sudo yum install -y puppet",
            "sudo yum install -y katello-client-bootstrap",
            "sudo yum install -y qpid-cpp-server",
            "sudo yum install -y rubygem-json",
            "sudo yum install -y rubygem-smart_proxy_pulp",
            "sudo systemctl mask sshd; sudo systemctl disable sshd; sudo systemctl stop sshd"
        ]
    }
],

<SNIP>
```

We couldn't just do a single long yum command, which would be more efficient, because `yum install -y httpd fake-package` would give a 0 exit code, resulting in a silent failure.

### Terraform, the juicy part

The automated rebuild process uses a randomly assigned hostname, we needed to setup an Elastic Load Balancer attached to an auto scaling group of 1 so we can rebuild without registering to the Katello Server as a new Smart Proxy. Here's how the whole process worked end-to-end:

1. A security group allowing ports required for the Smart Proxy Content.
1. Upload certs.tar to S3 for our capsules.
1. An IAM profile to allow the instance to pull down the certs.tar from S3
1. An Elastic Load Balancer with listeners for all the ports Smart Proxy uses, this ensures Katello & Clients can use the same hostname to communicate with it.
1. Instance using the above "foreman-proxy" AMI with user data that:
   * Sets the hostname to that of the ELB
   * Pulls down the certs.tar from S3
   * Runs foreman-installer via an [Ansible role](https://galaxy.ansible.com/sean797/foreman_installer)
   * Hits https://katello.example.com/katello/api/capsules/:id/content/sync to kick off a Content Sync
   * Reverts hostname change back
1. An Auto Scaling Group per Smart Proxy attached to the ELB, limited to 1 instance
1. A route53 DNS record for the ELB with a CNAME to the instance

## Conclusion

There are a couple of gotchas with this approach, but none that affected us. 
* Every time the instance is rebuilt it has to re-sync Content from the Katello server, this could become an issue depending on scale, you could look into storing `/var/lib/pulp/` & `/var/lib/mongodb/` on a persistent volume to get around this, but we didn't.
* We were only using the Smart Proxy Pulp & OpenSCAP features, other features like DHCP, DNS, TFTP would require persistent volumes to ensure they don't get blown away when the instance is rebuilt.

We have now a repeatable Foreman Smart Proxy build defined in git, enabling us to tare down from one cloud provider and rebuild it on another if required, but for us the most valuable thing is integrating Foreman Smart Proxies to our build process for all our other applications and servers.
