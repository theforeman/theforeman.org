---
layout: post
title: Foreman 1.17 fact filtering
date: 2018-03-07 14:27:47
author: Foreman
tags:
- foreman
---

Newer versinos of Foreman come with a handy feature - fact and NIC filtering. When
Foreman manages hypervisors or container hosts with many bridge or virtual
devices, fact names are too often updated and when under heavy load, database
locks or rollbacks can happen as fact uploads are one of the most common API
calls. Also for each individual NIC reported, Foreman creates NIC entry and by
design it never deletes those from the database. This can lead to situations
when hypervisors and container hosts are assigned thousands of NICs when more and more VMs (or
containers) are spawned. This slows down performance of various actions, most
importantly fact import.

<!--more-->

NIC filtering has been in Foreman for some time (introduced by 1.11), it is
available as an Administer - Setting option and is called
"Ignore interfaces with matching identifier". It's an array of ignored patterns
where asterisk is wildcard, which defaults to:

* lo
* usb*
* vnet*
* macvtap*
* _vdsmdummy_
* veth*
* docker*
* tap*
* qbr*
* qvb*
* qvo*
* qr-*
* qg-*
* vlinuxbr*
* vovsbr

All network interfaces detected by Foreman matching any of these patterns are
silently ignored and never added into Foreman inventory. This setting solves part one of
the problem. Now let's focus on what's new in Foreman 1.17.

The new setting is named "Exclude pattern for facts stored in Foreman" and
works similarly, but for fact names. This prevents Foreman from performing
unnecessary updates in fact names database table which can easly become a
bottleneck for all fact update API calls. The default pattern list is the very
same, but both lists can be changed individually via Administer - Settings -
Provisioning.

We also see the same problems for hosts with many (thousands) of hard disks
which are reported as "blockdevice" facts. In that case, users can add a new entry to
"Exclude pattern for facts stored in foreman" setting in the form of
"blockdevice*" to prevent slow updates. Unfortunately, this is currently only
possible globally, not per server.

During Foreman upgrades, filters are set but data is never deleted. Users
with slow performance of puppet or RHSM fact updates must perform a cleanup of
all fact names from the database to actually take advantage of this
improvement. Use the following command during or after upgrade to get rid of
unnecessary NICs:

    # foreman-rake interfaces:clean

The same command for getting rid of unnecessary fact names:

    # foreman-rake facts:clean

Foreman users on version 1.11 - 1.16 can still ignore fact names via a
workaround. There is a
[patch](https://gist.github.com/lzap/7e2591232879cbd35cccb5d7cc88d23d) which
filters out all fact names, it's a generated regular expression from the list
above. It does not have "blockdevice" filter, edit the line accordingly if
needed. The patch will block both puppet and RHSM facts, to use this for
Ansible, Salt or Chef, construct similar regular expression. Do not forget to
delete all unecessary fact_names from the database. This depends on content
created by managed hosts, here is an example in foreman-rake console (psql can
be used as well):

    arel = FactName.arel_table
    query = arel[:name].matches_any(['blockdevice%', '%veth%', '%\\_br\\_%', '%br-%'])

    FactName.where(query).select(:id, :name).find_in_batches(:batch_size => 100) do |batch|
      name_ids = batch.map(&:id)
      records = FactValue.where(:fact_name_id => name_ids).delete_all
      puts "Removed #{records} fact_value records."
    end

    records = FactName.where(query).delete_all
    puts "Removed #{records} fact names"
