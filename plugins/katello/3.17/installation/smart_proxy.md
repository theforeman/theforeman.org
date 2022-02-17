---
title: Smart Proxy Installation
---

# Smart Proxy Installation


## Hardware Requirements

The Smart Proxy server is only supported on x86_64 Operating Systems

 * 2 Two Logical CPUs
 * 8 GB of memory
 * Disk space usage is similar to that of the main Katello server [Installation](/plugins/katello/{{ page.version }}/installation/index.html)


## Required Ports

At a minimum, the following ports need to be open to external connections for installation:

* 80 TCP - HTTP, used for provisioning purposes
* 443 TCP - HTTPS, used for serving content to clients
* 5647 TCP - qdrouterd - used for client to connect to Qpid Dispatch Router (used for katello-agent)
<div class="alert alert-danger">
Katello-agent is deprecated and will be removed in a future release.
</div>
* 8443 TCP - HTTPS, used for client subscription-manager traffic
* 9090 TCP - HTTPS - used for communication with the Smart Proxy

See the [User Guide](/plugins/katello/{{ page.version }}/user_guide/smart_proxies/index.html) for additional information about Smart Proxy services and required ports.

## Installation

### Install needed packages:

The same yum repositories need to be configured on the Smart Proxy server as the main Katello server. See the installation guide for the [list of required repositories](/plugins/katello/{{ page.version }}/installation/index.html#required-repositories).

Once you get the repositories configured, install the formean-proxy-content package on the Smart Proxy

{% highlight bash %}
yum install -y foreman-proxy-content
{% endhighlight %}

### Generate Certificates for the Smart Proxies

Prior to installing the Smart Proxy, we need to generate certificates on the main **Katello** server:

{% highlight bash %}
foreman-proxy-certs-generate --foreman-proxy-fqdn "myproxy.example.com"\
                       --certs-tar    "~/myproxy.example.com-certs.tar"
{% endhighlight %}

In the above example, replace 'myproxy.example.com' with your Smart Proxy's fully qualified domain name. This will generate a tar file containing all the needed certificates. You will need to transfer those certificates to the server that you will install your Smart Proxy on using whatever method you prefer (e.g. SCP).

The foreman-proxy-certs-generate command will output an example installation command. For example:

{% highlight bash %}
Installing             Done                     [100%] [.....................]
  Success!

  To finish the installation, follow these steps:

  1. Ensure that the foreman-installer-katello package is installed on the system.
  2. Copy ~/myproxy.example.com-certs.tar to the system myproxy.example.com
  3. Run the following commands on the Smart Proxy (possibly with the customized
     parameters, see foreman-installer --scenario foreman-proxy-content --help and
     documentation for more info on setting up additional services):

  yum -y localinstall http://katello.example.com/pub/katello-ca-consumer-latest.noarch.rpm
  subscription-manager register --org "Default_Organization"
  foreman-installer --scenario foreman-proxy-content\
                    --foreman-proxy-content-parent-fqdn   "katello.example.com"\
                    --foreman-proxy-register-in-foreman   "true"\
                    --foreman-proxy-foreman-base-url      "https://katello.example.com"\
                    --foreman-proxy-trusted-hosts         "katello.example.com"\
                    --foreman-proxy-trusted-hosts         "myproxy.example.com"\
                    --foreman-proxy-oauth-consumer-key    "UVrAZfMaCfBiiWejoUVLYCZHT2xhzuFV"\
                    --foreman-proxy-oauth-consumer-secret "ZhH8p7M577ttNU3WmUGWASag3JeXKgUX"\
                    --certs-tar-file                      "/root/myproxy.example.com-certs.tar"
  The full log is at /var/log/foreman-proxy-certs-generate.log
{% endhighlight %}

### Install Smart Proxy

Use the provide installation command from `foreman-proxy-certs-generate`, and tailor for your own purposes as needed.  The defaults will give you a Smart Proxy ready for Content-related services.

See the [User Guide](/plugins/katello/{{ page.version }}/user_guide/smart_proxies/index.html) to learn about setting up provisioning related services, as well as the [Foreman manual](http://theforeman.org/manuals/latest/index.html#4.3SmartProxies)
