---
layout: post
title: update - Getting Foreman search results into your Puppet manifest
date: 2018-06-14 11:19:42
author: Fabien Combernous
tags:
- Foreman
- Puppet Server
- PuppetDB
- monitoring
- backup
- identity management
---

How to use the Foreman search language inside Puppet manifests and get information about other nodes.
This page is an update of the [previous post written by Ohad Levy](https://theforeman.org/2012/01/getting-foreman-search-results-into.html)

<!--more-->

## Why ?

When you start Puppet, in general you start simply. And so innocently, each node is more or less alone in the world. And Puppet, in this way, can already help you so much.

But quickly, you understand that in some situations, it is interesting to know information from other nodes. And this happens typically about monitoring, backups or identity management. For instance, you add a new node into your infrastructure. And your monitoring server takes into account this new server by adding the configuration relating to its monitoring. 

In a standard way, in the Puppet galaxy there exists the option `storeconfigs` of Puppet Server and linked [PuppetDB](https://puppet.com/docs/puppetdb/latest). A PuppetDB service records every node's catalogs, facts and reports. And the immediate usage is exported resources (a double “at” sign `@@` in manifests). 

But, if you don't have a PuppetDB and you are already using Foreman as external node classifier (aka ENC), you can also make fun stuff.

## An use case out of standard usages.

Use cases about monitoring or backups are standard. Lets try to build another example where we can use the Foreman search engine.

Imagine that you are managing nodes with a Puppet Server and they are in `hostgroups` like `secure_base/role`. Where `secure_base` permits to apply all common settings to all your nodes in a secured environment. And `role` permits to apply settings dedicated to the role of a node. Now, lets say you have the constraint to not use a DNS server. And your customer would like to call hosts in a human way, so with names and not with IPs. I already met this use case. Fortunately, servers were using only one IP address.

So you have to manage your `/etc/hosts` with a configuration management tool or you become crazy. 

If each Puppet node execute the following code :

```
$query = foreman({foreman_user => 'apiuser',
                  foreman_pass => 'here_a_password',
                  item         => 'hosts',
                  search       => 'hostgroup_fullname ~ secure_base',
})

$nodes = $query['results']
```

In `$nodes`, you got all the needed informations about other nodes. You can check my statement by adding the following piece of code :

```
$nodes.each | $_node | {
  $_thiscert = $_node['certname']
  $_thisip = $_node['ip']
  notify {  "node ${_thiscert}" : message => "host ${_thisip}"}
}
```

Let's use `$nodes` in a template with a `file` resource to manage `/etc/hosts` and you got the trick.

## Unknow function foreman()

If you ran the code above, you probably got an error message like `Evaluation Error: Unknown function: 'foreman'`. By default, the function `foreman()` is not available.

Several possibilities to get the function into your environement :

 * You installed Foreman with `foreman-installer`. And so, you can simply copy `/usr/share/foreman-installer/modules/foreman/lib/puppet/parser/functions/foreman.rb` into your module managing `/etc/hosts`.
 * Otherwise, you can [download the function foreman()](https://github.com/theforeman/puppet-foreman/blob/master/lib/puppet/parser/functions/foreman.rb) and use it into your module managing `/etc/hosts`.
 * Probably a better way is to create a module named like `foreman-libs` containing the function `foreman()`. Add this module in your list of imported modules. 

It is also possible to write your own function to query [the API](https://theforeman.org/documentation) in a way that fits your needs.

## A look at foreman()'s code

The code is clearly commented. Only by reading comments, it is possible to add following informations.

We used option `item` with `hosts`. But, it may be `environments`, `fact_values`, `hosts`, `hostgroups`, `puppetclasses`, `smart_proxies` or `subnets`.

We didn't used option `per_page`. By default, the function returns only 20 items in a row. 
For instance, if you manage 800 nodes. Probably you will add new nodes in the futur. So 1000 should be enough. 
Adjust the value according to the number of nodes :

```
$query = foreman({foreman_user  => 'apiuser',
                  foreman_pass  => 'here_a_password',
                  item          => 'hosts',
                  search        => 'hostgroup_fullname ~ secure_base',
                  per_page      => 1000,
})
```

We didn't used the possibility to make a filter on the result of the query with option `filter_result`. But it is possible to use it like bellow :

```
$query = foreman({foreman_user  => 'apiuser',
                  foreman_pass  => 'here_a_password',
                  item          => 'hosts',
                  search        => 'hostgroup_fullname ~ secure_base',
                  filter_result => ['ip','certname'],
})
```

And `$query` will contain an array of hashes like `[{ip => 192.168.1.5, certname => server1.example.com}, {ip => 192.168.1.10, certname => server2.example.com}, ...]`


