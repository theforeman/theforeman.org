---
layout: post
title: Building Ubuntu Using Katello File Repo
date: 2017-05-19
author: Leah Fisher
tags:
- katello
- ubuntu
- repo
---

This blog post describes how to use Katello 3.5 to host Ubuntu repos.

# Building Ubuntu Using Katello File Repo
I have an offline network and need to build both RPM based systems and DEB based systems. Instead of installing Katello to handle rpms, and something else to handle debs, I set up Katello to handle both.

## Get Local Copy of Repo
I created a script to do this for me, with following assumptions:

 - Using box that has debmirror installed
	 - Installing this on a Fedora box required me to remove /etc/debmirror.conf for this script to work
 - Has rsync installed
 - Media is mounted at /mnt has enough space to copy the repo
 - The example is downloading xenial, but can be duplicated to do other releases.
 - /mnt has a copy of [file_repogen.rb](https://gist.github.com/jlsherrill/e7c72e1ed82379955c2208ac472b0be7)

 

       #!/bin/bash
        arch=amd64
        section=main,restricted,universe,multiverse,main/debain-installer,universe/debian-installer,multiver/debian-installer,restricted/debian-installer
        release=xenial,xenial-updates
        server=us.archive.ubuntu.com
        inpath=/ubuntu
        outpath=/mnt/ubuntu/xenial
    
        debmirror --arch=$arch \
    	    --no-source \
    	    --section=$section \
    	    --host=$server \
    	    --dist=$release \
    	    --di-dist=dists \
    	    --di-arch=arches \
    	    --root=$inpath \
    	    --progress \
    	    --ignore-release-gpg \
    	    --no-check-gpg \
    	    --exclude-deb-section=games \
    	    --exclude=sid \
    	    --method=rsync \
    	    $outpath
    	    
    	for i in $(echo $release | sed "s/,/ /g"); do
    		rsync -L --progress --exclude=*i386 -a rsync://$server/ubuntu/dists/$i $outpath/dists/
    	done
    	
    	/mnt/file_repogen.rb /mnt/ubuntu/xenial

## Import into Katello
Your repo has been downloaded and prepped with a pulp_manifest so it's ready to be imported into Katello.

I created a product called Ubuntu and made a repository for each Ubuntu Distro I was trying to use. In this case, I have a repo called xenial. The type is file and the url is pointed to the media I have made available on my system. Then I start the sync and slowly sync the repo.

* Issues:  /var/spool/pulp stores a copy of the files as it syncs, which I did not give enough space to since it was not listed in the katello installer documentation.  Due to this, it takes many many failed syncs to sync all the files.

## Set up the Foreman Info

* Update the Ubuntu Mirror Installation media to `http://foreman/pulp/isos/Default_Organization-Ubuntu-$release/`
* Add your operating system to foreman

## Build a Host
You should now be able to build a host selecting Ubuntu as an operating system and it will build off your local media.
