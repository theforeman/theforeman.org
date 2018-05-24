---
layout: post
title: update - Getting foreman search results into your Puppet manifest
date: 2018-05-23 11:19:42
author: Fabien Combernous
tags:
- foreman
- puppet
- puppetdb
- monitoring
- backup
- identity management
---

How to use the foreman search language inside puppet manifests and knowing informations about others nodes.
This page is an update of the [previous post written by Ohad Levy](https://theforeman.org/2012/01/getting-foreman-search-results-into.html)

<!--more-->

## Why ?

When you start puppet, in general you start simply. And so innocently, each node is more or less alone in the world. And puppet, in this way, can already help you so much.

But fastly, you understand that in some situations, it is interesting to know informations from others nodes. And this happend tipically about monitoring, backups or identity management. For instance, you add a new node into your puppet infrastructure. And your monitoring server takes into account this new server by adding the configuration relating to its monitoring. 

In a standard way, in the puppet galaxy it exists the option `storeconfigs` of pupper server and linked [puppetdb server](https://puppet.com/docs/puppetdb/latest). A puppetdb server records every node's catalogs, facts and reports. And the immediate usage is exported resources (a double “at” sign `@@` in manifests). 

But, if you don't have a puppetdb server and you are already using theforeman as external node classifier (aka ENC), you can also make fun stuffs.

## A use case out of standard usages.

Use cases about monitoring or backups are standards. Lets try to build an other example where we can use the foreman search engine.

Imagine that you are managing nodes with puppet and they are in `hostgroups` like `secure_base/role`. Where `secure_base` permits to apply all common settings to all your nodes in a secured environment. And `role` permits to apply settings dedicated to the role of a node. Now, lets say you have the constraint to not use a dns. And your customer would like to call hosts in a humain way, so with names and not with IPs. I already met this use case. Fortunatly, servers were using only one ip address.

So you have to manage your `/etc/hosts` with puppet or you become crazy. 

If each node execute the following code :

```
  $query = foreman({foreman_user => 'apiuser',
                    foreman_pass => 'here_a_password',
                    item         => 'hosts',
                    search       => 'hostgroup_fullname ~ secure_base',
  })

  $nodes = $query['results']

```

In `$nodes`, you got all the needed informations about others nodes. You can check my statement by adding the following peace of code :


```
  $nodes.each | $_node | {
    $_thiscert = $_node['certname']
    $_thisip = $_node['ip']
    notify {  "node ${_thiscert}" : message => "host ${_thisip}"}
  }

```

Lets to use `$nodes` in a template with a `file` resource to manage `/etc/hosts` and you got the trick.

## Unknow function foreman()

If you ran the code above, you probably got an error message like `Evaluation Error: Unknown function: 'foreman'`. By default, the function `foreman()` is not available.

At least two possibilities to get the function into your environement .

 * You installed forman with `foreman-installer`. And so, you can simply copy `/usr/share/foreman-installer/modules/foreman/lib/puppet/parser/functions/foreman.rb` into your module managing `/etc/hosts`.
 * And otherwise, you can [download the function foreman()](https://github.com/theforeman/puppet-foreman/blob/master/lib/puppet/parser/functions/foreman.rb) and use it into your module managing `/etc/hosts`.

Probably a better way is to create a module named like `foreman-libs` containing the function `foreman()`. And add this module in your list of imported modules. To be imported by theforeman, remember that a module must:
 * contain a file `manifests/init.pp`
 * not contain errors, like those reported by `puppet parser validate <file.pp>`.

It is also possible to write your own function to query [the API](https://theforeman.org/documentation.html) in a way that fits your needs.

## Take a look about code of function foreman()

The code is clearly commented. Only by reading comments, it is possible to add following informations.

We used option `item` with `hosts`. But, it may be `environments`, `fact_values`, `hosts`, `hostgroups`, `puppetclasses`, `smart_proxies` or `subnets`.

We didn't used option `per_page`. But, by default the function returns only 20 items in a row.

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


