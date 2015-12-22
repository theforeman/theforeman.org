---
layout: post
title: Image based deployment via dd and nbd
date: '2015-11-30T10:05:00.004+03:00'
author: Lukas Zapletal
tags:
- foreman
- discovery
- provisioning
modified_time: '2015-11-30T10:05:00.004+03:00'
guest_post: true
gust_url: http://lukas.zapletalovi.com/2015/11/image-based-deployment-via-dd-and-nbd.html
excerpt: |
    Having capable live distribution on discovered nodes means we can do
    interesting things with them. Image-based deployment looks like a very
    easy thing to implement. Roll a classroom of workstation in few minutes!
---

I was doing little research on image-based deployment. I already created a
small patch exposing all block devices via netcat. But since OpenStack guys do
deployments via iSCSI, I was wondering if I can do the same.

But first of all, let's test how raw image copy (via dd) compares to exposed
block device (iSCSI/NBD). Instead of iSCSI, I will test Network Block Device,
which is easier to configure and it is present in all Linux distributions,
including Fedora and RHEL (the client is actually in the kernel itself).

Target setup with NBD is very easy:

    dst# mkdir /etc/nbd-server/; cat >/etc/nbd-server/config <<EOF
    [generic]
    [vdb]
    exportname = /dev/XYZ
    readonly = false
    multifile = false
    copyonwrite = false
    EOF

    dst# nbd-server -d

    src# sudo modprobe nbd
    src# sudo nbd-client dst-server -N vdb /dev/nbd1

Initial testing in the train involved testing on KVM instance. Direct transfer
of 1GB image with CirrOS (created with a command below) with block size of 1kB
was the fastest method indeed:

    src# time sudo dd if=/tmp/cirros.img of=/dev/nbd1 bs=1k
    real    0m0.882s

Compressing the data speeds up things, lzop seems to be the fastest of course:

    dst# nc -l 1234 > /dev/vdb
    src# time sudo cat /tmp/cirros.img | ncat dst-server 1234
    real    0m9.871s

    dst# nc -l 1234 | gunzip > /dev/vdb
    src# time sudo cat /tmp/cirros.img | gzip -1 | ncat dst-server 1234
    real    0m5.917s

    dst# nc -l 1234 | lzop -d > /dev/vdb
    src# time sudo cat /tmp/cirros.img | lzop | ncat dst-server 1234
    real    0m2.358s

Note that KVM/virtio is a special case, usually lzop is faster than raw data.
Now the remote block device approach:

    src# time sudo virt-builder cirros-0.3.1 --output /tmp/cirros.img --size 1G
    real    0m20.352s

The same size, but over the (virtual) network:

    src# time sudo virt-builder cirros-0.3.1 --output /dev/nbd1
    real    0m20.867s

I was surprised that the transfer was almost the same speed as local storage
(I was using virtio driver). I was expecting it to be little more slower. That
looks promising!

At home, I was able to do real testing on remote RHEL7 server over 1gig LAN
connection. For the record, I had to disable IPv6 to get nbd-server running
due to some bugs. For comparison, I created 10GB image. First, test the
fastest possible stream method:

    dst# nc -l 1234 | lzop -d > /dev/XYZ
    src# time sudo cat /tmp/cirros.img | lzop | ncat dst-server 1234
    real    1m32.336s

Now, that is a difference. Let's test attached block storage. Locally first:

    src# time sudo virt-builder cirros-0.3.1 --output cirros.img --size 10240000000b
    real    0m33.030s

The same size, but over the (gigabit) network:

    src# time sudo virt-builder cirros-0.3.1 --output /dev/nbd1
    real    0m29.926s

I was scratching my head for few seconds until I realized why the attached
physical storage is actually faster. The local test was on my T430s laptop
with HDD in DVD bay while the server was Dell Precision T5400 with
end-consumer SATA drive. Still faster than the two inch laptop one.

Anyway, it looks like NBD performs well enough. I think this is a go to
implement this in foreman-discovery-image. Exporting volumes via NBD is an
easy task, the only work needs to be done on smart-proxy side to implement new
virt-builder plugin which will do the deployment.
