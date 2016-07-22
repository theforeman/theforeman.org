---
layout: post
title: Populating your DHCP Server with Subnet data from Foreman
date: 2016-07-22
author: Timo Goebel
tags:
- foreman
- puppet
- dhcp
- subnets
---

ISC's DHCP-server is widely used on Linux systems to offer dynamic IP addresses to computers on a network. DHCP plays an important part in the PXE provisioning workflow.
When you use Foreman and DHCP to manage your network's IP addresses, you usually have to define subnets twice: Once in Foreman and once in `/etc/dhcp/dhcpd.conf` on your server.
This is tedious and error prone. There is a way to import subnets from a DHCP server into Foreman, however you might want to to it the other way round.
If you are using puppet to configure your servers, there is an easier and better way: Define your subnets in Foreman and use a puppet custom function to roll out the config files for isc-dhcpd.
This guide assumes basic knowledge about Puppet and is written for Puppet 3.

<!--more-->

Let me walk you through this:

## Create a Foreman user

First of all create a read only API user in Foreman that is limited to list Foreman's subnets.

In order to do so, create a new Role in Foreman that has the `view_subnet` permission for the resource `Subnet` as shown in the screenshot below. Then create a user as you normaly would and assign the role you just created to it.

![Subnet Filter for Role in Foreman](/static/images/blog_images/2016-07-22-populating-your-dhcp-server-with-subnet-data-from-foreman/add_subnet_api_role.png)

## Configure puppet master

Then you need to add a config file to your puppet master, so that it knows the credentials to access the Foreman API.

The puppet code to do so could look like the follwing. Create a new puppet class and name the file `foreman_credentials.pp`.

```puppet
# == Class: service_puppet::master::foreman_credentials
#
class service_puppet::master::foreman_credentials {

  $foreman_url = 'https://foreman.example.com'
  $foreman_api_user = 'api_subnet_ro'
  $foreman_api_password = 'testtest'

  file {'/etc/puppet/foreman_api.yaml':
    ensure  => file,
    owner   => 'puppet',
    group   => 'puppet',
    mode    => '0640',
    content => template("${module_name}/foreman_api.yaml.erb"),
  }

  ensure_packages('rubygem-apipie-bindings')
}
```

Also add the template file that the class depends on, `foreman_api.yaml.erb` to your module:

```erb
:uri: <%= @foreman_url %>
:username: <%= @foreman_api_user %>
:password: <%= @foreman_api_password %>
:api_version: 2
```

## Configure DHCP server

On the node that you want to act as the DHCP server on your network, let's configure the DHCP service. I recommend using the [puppet dhcp module](https://github.com/theforeman/puppet-dhcp) which is part of `foreman-installer`.

```puppet
class { '::dhcp':
    dnsdomain   => '',
    nameservers => ['8.8.8.8', '8.8.4.4'],
    interfaces  => ['eth0'],
    pxeserver   => '10.0.0.1',
    pxefilename => 'pxelinux.0',
  }

  # get subnet definitions via Foreman API and create dhcp:pool resources accordingly
  service_foreman_create_dhcp_pools()
```

Finally we need to add the custom function, that does the heavy lifting, to our puppet module. Place it under `lib/puppet/parser/functions/service_foreman_create_dhcp_pools.rb`.
The code currently filters the subnets based on the location of the subnet and your dhcp server.

```ruby
require 'apipie-bindings'
require 'yaml'

module Puppet::Parser::Functions
  newfunction(:service_foreman_create_dhcp_pools) do |args|

    config_file = File.join(Puppet.settings[:confdir], 'foreman_api.yaml')

    begin
        config = YAML.load_file(config_file)
    rescue Errno::ENOENT
         raise Puppet::ParseError, "Config File not found #{config_file}"
    end

    begin
        foreman_api = ApipieBindings::API.new(config)
        subnets = foreman_api.resource(:subnets).call(:index, :search => "location ~ #{lookupvar('location')}", :per_page => 99999)['results']
    rescue ApipieBindings::ConfigurationError
        raise Puppet::ParseError, "Your config is bad and you should feel bad"
    rescue RestClient::Unauthorized
        raise Puppet::ParseError, "Unauthorised, check your username/password"
    end

    pool_resources = {}
    subnets.each do |subnet|
        name = subnet['name']
        network = subnet['network']
        mask = subnet['mask']
        gateway = subnet['gateway'] || nil
        from = subnet['from'] || nil
        to = subnet['to'] || nil
        range = nil
        range = [from,to].join(' ') if from and to

        # skip subnet if there is no range defined
        next unless range

        pool_resources[name] = {
            'network' => network,
            'mask' => mask,
            'range' => range,
            'gateway' => gateway,
            'pool_parameters' => ['deny unknown-clients'], # we don't give leases to hosts without a host reservation
        }
    end

    function_create_resources(['dhcp::pool', pool_resources])
  end
end
```

## Conclusion

After everything is set up properly, all the subnets defined in Foreman should appear in the dhcp server's config file on the next puppet run. This technique can easily be reused to retrieve other data from Foreman, let's say dns domains, and configure other services dynamically.

## Acknowledgements

Credits to [Martin Pfeifer](https://github.com/martinpfeifer), who worked with me on this.
