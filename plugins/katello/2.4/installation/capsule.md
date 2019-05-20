---
layout: plugins/katello/documentation
robots: noindex
version: 2.4
title: Capsule Installation
---

# Capsule Installation


## Hardware Requirements

The Capsule server is only supported on x86_64 Operating Systems

 * 2 Two Logical CPUs
 * 4 GB of memory
 * Disk space usage is similar to that of the main Katello server [Installation](/plugins/katello/{{ page.version }}/installation/index.html)


## Required Ports

At a minimum, the following ports need to be open to external connections for installation:

* 80 TCP - HTTP, used for provisioning purposes
* 443 TCP - HTTPS, used for web access and api communication
* 9090 TCP - HTTPS - used for communication with the smart proxy

See the [User Guide](/plugins/katello/{{ page.version }}/user_guide/capsules/index.html) for additional information about Capsule services and required ports.

## Installation

### Generate Certificates for the Capsules

Prior to installing the Capsule, we need to generate certificates on the main **Katello** server:

```
capsule-certs-generate --capsule-fqdn "mycapsule.example.com"\
                       --certs-tar    "~/mycapsule.example.com-certs.tar"
```

In the above example, replace 'mycapsule.example.com' with your Capsule's fully qualified domain name. This will generate a tar file containing all the needed certificates. You will need to transfer those certificates to the server that you will install your Capsule on using whatever method you prefer (e.g. SCP).

The capsule-certs-generate command will output an example installation command. For example:

```
Installing             Done                     [100%] [.....................]
  Success!

  To finish the installation, follow these steps:

  1. Ensure that the capsule-installer is available on the system.
     The capsule-installer comes from the capsule-installer package and
     should be acquired through the means that are appropriate to your deployment.
  2. Copy ~/mycapsule.example.com-certs.tar to the system mycapsule.example.com
  3. Run the following commands on the Capsule (possibly with the customized
     parameters, see capsule-installer --help and
     documentation for more info on setting up additional services):

  rpm -Uvh http://katello-centos6-2.0.example.com/pub/katello-ca-consumer-latest.noarch.rpm
  subscription-manager register --org "ACME_Corporation"
  capsule-installer --parent-fqdn          "katello.example.com"\
                    --register-in-foreman  "true"\
                    --foreman-oauth-key    "EwZePUX7erQeYbuMqytLCd4jHndY5iH4"\
                    --foreman-oauth-secret "K5TmVVsEmc29DCAscJEnupDmHcQQFdc4"\
                    --pulp-oauth-secret    "7TwngPvBSkJELCAQ4fjEmmY9FUn2UGZJ"\
                    --certs-tar            "~/mycapsule.example.com-certs.tar"\
                    --puppet               "true"\
                    --puppetca             "true"\
                    --pulp                 "true"
  The full log is at /var/log/katello-installer/capsule-certs-generate.log
```

### Install needed packages:

The same yum repositories need to be configured on the Capsule server as the main Katello server. See the installation guide for the [list of required repositories](/plugins/katello/{{ page.version }}/installation/index.html#required-repositories).

```
yum install -y capsule-installer
```

### Install Capsule

Use the provide installation command from `capsule-certs-generate`, and tailor for your own purposes as needed.  The defaults will give you a Capsule ready for Content-related services.

See the [User Guide](/plugins/katello/{{ page.version }}/user_guide/capsules/index.html) to learn about setting up provisioning related services, as well as the [Foreman manual](http://theforeman.org/manuals/latest/index.html#4.3SmartProxies)
