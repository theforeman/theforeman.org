---
layout: post
title: Journey to High Availability
date: 2015-11-07 14:26:51
author: Christopher Pisano - The Advisory Board Company
tags:
- foreman
- puppet
guest_post: true
excerpt: |
  This is a recount of the road from an all in one Foreman implementation to a full HA deployment. 
  We will also be looking forward beyond our current implementation to future plans.
---

###Overview

We started with Foreman almost two years ago now because we simply needed a front end to Puppet and the Open Source Puppet Dashboard just didn't fit the bill at the time. We deployed an all in one implementation as a POC using MySQL and eventually moved into production with a PostgreSQL database and two clustered external Puppet Masters. The Puppet CA lived on Foreman as well as the Smart-Proxy and we set up an unnecessary host group structure with an obscene amount of Smart-Class Parameters; we did not use Hiera at the time. As our environment grew our implementation became slower and slower. We added resources but at the end of the day it was still a single instance running the Puppet CA, Foreman webUI and the ENC/Reports functions. As we grew to over 1,000 hosts (today ~1,700) things got worse; our host groups increased, our Smart-Class Parameters increased and our performance decreased. We lived with this for some time being satisfied with the status quo until we set an initiative to deploy an implementation suitable for an enterprise. It is here where all the fun begins.

###Requirements

Before the project began we needed to come up with a list of requirements the implementation needed to meet and prioritize what is necessary now and what we can implement in the future. Below is what we came up with.

- High availability at all tiers
  - Foreman
  - Memcache
  - Puppet
  - PuppetDB
  - CA
  - Database

This was the highest priority. We needed our implementation to be up at virtually all times. We also wanted a deployment that allowed us to test updates safely and not have to plan all maintenance for after business hours.

- Built with the latest available versions that we could support
  - Foreman 1.9.x
  - Puppet 3.8.x
  - PostgreSQL 9.x
  - CentOS 6.x

We decided that our existing deployment and hosts were to be considered legacy. Since we were starting from scratch we decided it would be best to build with the latest and greatest (within reason). Puppet 4 and CentOS 7 were just not doable at this point in time which is why we went with 3.8.x and 6.x respectively.

- Provision new hosts
  - VMware
    - CentOS/RHEL
    - Windows
  - AWS
    - CentOS

We are close to a 100% virtual environment using mostly VMware and some AWS. Deploying hosts from two different tools just wasn't an option moving forward. We also needed to increase the consistency of our server builds and where the new hosts lived in Foreman.

- Support multiple locations
  - Two physical data centers
  - AWS

Because we have more than one data center and a private cloud we needed Foreman to support hosts that live in all places. Different product teams servers live in a different combination of locations and we need to be able to distinguish that for access permissions as well as reporting.

- Allow product teams to manage their hosts
  - Equivalent of admin rights
  - Only to the hosts they own

One of our main goals is to empower our product teams to manage their servers without having our Infrastructure Operations team be a bottleneck. In order to achieve this we need to have an organized structure of locations/organizations/host groups as well as role based access controls for users.

- Integrate with DHCP and DNS
  - Clustered MS DHCP 
    - One cluster per location
  - MS DNS
    - DNS servers per location

Part of the goal is to have Foreman manage our servers lifecycle and increase our efficiency and consistency in provisioning. We can provision without IP addresses and nobody is going to remember the IP addresses of all of their servers. An added benefit is that Foreman cleans these up when hosts are destroyed; something humans rarely do. . . or at least remember to do.

###The Implementation

####Building the Infrastructure

I will discuss building the entire deployment with the exception of the database. Our Enterprise Data Management team built and maintains our PostgreSQL backend; we just have a username, database name and password to connect with. They are using PostgreSQL 9.x and utilizing PG_Pool for high availability.

####Puppet

The first thing we did was build out our Puppet infrastructure. The foreman-installer makes this very easy since it can be used to configure your Puppet masters and Puppet CA. We started by building four Puppet masters using Puppet Server v1. This will ease our upgrade to Puppet 4 when the time comes and for the time being give us better performance and tuning capabilities of our masters. Since we wanted to have the CA separate from the masters we set CA => false and specified the DNS name of what we wanted our CA server to be.

When going through the installer be sure to not use the hostname for any certificates for the Puppet masters, CA servers, PuppetDB servers or Foreman servers. Since we are clustering everything we will be use generically named certificates that we will be generating on our CA. This will allow the certificate to be verified when requests hit any of the hosts in the cluster. Each of the Puppet masters, CA servers, PuppetDB servers and Foreman servers will use their hostname based certificates when running the Puppet agnet. The server setting should be set to the name of your generic certificate for your Puppet masters; similar to what you did for the CA.

You will also want to configure the Foreman Smart-Proxy on each of the Puppet masters using the foreman-installer. We will only enable the puppet module of the Smart-Proxy and keep everything else disabled. If you want to have Foreman invoke Puppet agent runs then configure those settings as needed; we did and it is a very useful feature in our opinion. The registered URL for the Smart-Proxy should be something generic that you create a DNS entry for and will eventually point to the virtual IP on your load balancer that the Puppet masters will sit behind. 

On your load balancer of choice you will want to add all of your Puppet masters and allow the load balancer to pass traffic on ports 8443 (Smart-Proxy) and 8140 (Puppet). You should configure your load balancer so all nodes are active. If you are using version control for your code and a continuous integration server for deployments you might want to look into setting up shared storage for your Puppet environments (we did with NFS on our NetApp) and allow the load balancers to pass traffic on port 22 so your continuous integration server can log in and run your scripts to pull code. 

While on the topic of shared storage for your Puppet masters it is not necessary but you should use shared storage for /var/lib/puppet/yaml. If you don't you will receive a warning message until the Puppet agent for every host checks into each server at least once.

Next we built our Puppet CA servers. Again we used the foreman-installer for this and mostly followed the same process as we did the Puppet masters. We wanted to use Puppet Server V1, a generic name for the certificate to be used and the Foreman Smart-Proxy installed. The differences are that now we want CA => true and for the Smart-Proxy you want to only enable the puppetca module. The load balancer configuration is almost identical with the exception of port 22 and you want an active/passive configuration rather than an active/active. This is because the inventory.txt file is not locked when the process runs and active/active risks corruption. You will still need to keep /var/lib/puppet/ssl in sync between the two CA servers. There are many ways to do this but we chose NFS. 

We wanted to institute PuppetDB for the insight it gave us into our environment and for some of the advanced features it offers. We used the PuppetDB module from the Forge to install and configure both PuppetDB servers, and the configuration for PuppetDB on our Puppet masters. Just like the CA servers and the Puppet masters before them we want to use a generically named certificate for the PuppetDB servers. There is no Smart-Proxy configuration necessary here, but PuppetDB does need to have a database backend. We chose to have our Enterprise Data Management team give us another database on the same cluster Foreman will use. The load balancer configuration is pretty straight forward; we did active/active passing traffic for ports 8080 (http for the dashboard) and 8081 (https for Puppet).

Once you have these three peices functional a big congratulations is in order because you have just built a highly available implementation of Puppet! Though PuppetDB is not necessary it is the icing on the cake for this part.

####Foreman and Memcache (The fun stuff)
