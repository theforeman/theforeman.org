---
layout: post
title: 'Contributing to the Installer Puppet Modules'
date: 2018-05-21 12:00:00
author: 
  name: Christopher Duryee
  uri: Chris_Duryee 
tags:
- foreman
---


# How do I get started with contributing to the installer?

The Foreman installer can be intimidating at first. It manages lots of files, and has many, many, many options. Even more options are exposed via `custom-hiera.yaml`. If you want to make a change that's not covered by either an installer option or `custom-hiera.yaml`, you may feel like you are out of luck. However, this is a great opportunity to make an upstream contribution!

This blog post shows the steps on how to identify a change you want to make in the installer and create an upstream pull request in the correct installer module. This post specifically describes "bugfix"-level changes to the installer; larger changes such as adding a new puppet module are outside the scope of this document.

## Initial setup

*The workflow below describes how I would proceed with an installer change. However, everyone is different and there are multiple ways to go about doing the same thing.*

If you found an issue to fix, it's likely on your production Foreman installation. This is not a suitable place to edit installer code! Do not do this. Instead, use [forklift](https://github.com/theforeman/forklift). Forklift uses Vagrant and Ansible to create development VMs on a hypervisor. I have only used Forklift with Fedora but I've heard it works on Debian, Ubuntu, and Gentoo :penguin:.  You'll need to find a place to run Forklift before continuing. You can use `centos7-foreman-nightly` for a vanilla Foreman install, or `centos7-katello-nightly` for a Katello install.

If you have found an issue in a commercial product that uses Foreman, you'll need to replicate the issue in Foreman. Otherwise, please contact your vendor for assistance.

Once you found a suitable hypervisor to run Forklift, follow the [Quickstart instructions](https://github.com/theforeman/forklift#quickstart). They are copied here for reference:

```
git clone https://github.com/theforeman/forklift.git
cd forklift
vagrant up centos7-katello-nightly
```

This will run for a few minutes and then create what's called a "production test environment". This phrase seems like an oxymoron, but for developers, a "production" install just means "package-based install". We need this type of installation since we are working on the installer that manages the configuration files for Foreman/Katello code, and not the Foreman or Katello codebase itself.

If the above command was successful you'll see something like this:

```
PLAY RECAP *********************************************************************
centos7-katello-nightly    : ok=19   changed=12   unreachable=0    failed=0   

Wednesday 16 May 2018  11:18:53 -0400 (0:00:00.012)       0:16:52.838 ********* 
=============================================================================== 
foreman_installer : Run installer ------------------------------------- 537.06s
foreman_installer : Install additional packages ----------------------- 344.72s
foreman_installer : Install foreman-installer -------------------------- 50.66s
foreman_repositories : Install foreman-release-scl --------------------- 34.82s
selinux : Ensure libselinux-python is installed ------------------------ 26.23s
epel_repositories : Setup Epel Repository ------------------------------- 6.79s
foreman_repositories : Setup Foreman Repository ------------------------- 6.34s
katello_repositories : Setup Katello Repository ------------------------- 2.23s
puppet_repositories : Setup Puppet 5 Repository ------------------------- 1.62s
Gathering Facts --------------------------------------------------------- 0.71s
selinux : Set selinux state --------------------------------------------- 0.45s
etc_hosts : Build hosts file -------------------------------------------- 0.33s
epel_repositories : Enable CentOS-CR Repository ------------------------- 0.30s
ostree_repositories : enable-ostree-repo -------------------------------- 0.30s
katello_repositories : Set up release repositories ---------------------- 0.03s
foreman_repositories : include_tasks ------------------------------------ 0.03s
puppet_repositories : Include puppet 5 for RedHat ----------------------- 0.03s
foreman_installer : include_tasks --------------------------------------- 0.03s
foreman_installer : include_tasks --------------------------------------- 0.03s
katello_repositories : include_tasks ------------------------------------ 0.02s
```

If the command was not successful, please reach out to the [foreman-dev discourse list](https://community.theforeman.org/c/development) (preferred), or #theforeman-dev on libera.chat. We love having new contributors; someone will help you. It's possible that you did everything correctly and there is a bug in forklift, so don't be afraid to reach out for assistance.

Once you have your centos7-katello-nightly VM running, you are ready to develop!  The next step is to ssh to your instance with `vagrant ssh centos7-katello-nightly`. You should be presented with a shell, and can attempt to reproduce the issue. In our example, we will want to add an option to optionally remove indexes from the `/pub` directory.

The first step is always to reproduce the issue on the nightly VM. If our hypervisor is not our workstation/laptop, we will need to get https and http access to the nightly VM first. To do this we'll set up an SSH tunnel on our hypervisor. 

First, capture the IP address of the guest (*TIP:* You can use `vagrant ssh-config <vm>` to accomplish the same thing):

```
vagrant@centos7-katello-nightly ~]$ ip addr
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN 
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host 
       valid_lft forever preferred_lft forever
2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP qlen 1000
    link/ether 52:54:00:6d:3a:d0 brd ff:ff:ff:ff:ff:ff
    inet 192.168.121.8/24 brd 192.168.121.255 scope global dynamic eth0
       valid_lft 3420sec preferred_lft 3420sec
    inet6 fe80::5054:ff:fe6d:3ad0/64 scope link 
       valid_lft forever preferred_lft forever
```

There is a lot of output here, but the part we care about is "192.168.121.8".  Next, in a new terminal on your workstation, run this command: `ssh -f -N -L 2000:192.168.121.8:443 user@<hypervisor hostname>`. This will tunnel TCP requests from port 2000 on your workstation through your hypervisor to port 443 on your guest. You can also set up bridged networking, but SSH tunnels are usually quicker to set up. If your VM's IP address changes, you'll need to kill this tunnel and make a new one. If you don't kill the old one first, your new one won't be able to bind to port 2000. Again, this is only needed if your hypervisor is not your laptop or workstation.

Once this is done, you can go to "https://localhost:2000" (or "https://hostname/" if you don't need SSH forwarding) on your browser, and you will be presented with a Foreman login window! Just kidding, you will be presented with a box that says "Your connection is not secure". This is normal because your development environment does not have a valid CA certificate. This is expected, just click "Advanced" and then "accept" and then "confirm", and then you will get the login window :smile:. The login is always 'admin' and the password is 'changeme'.

The next few paragraphs outline some development steps. *No one is expected to know all of this stuff off the top of their heads!* I am leaving out a lot of trial and error. This part can take days of work if you are new to puppet development, and lots of question asking.

## Fixing the Issue

Once you are able to log in, now you are really in business. Let's reproduce the issue finally. Go to `https://localhost:2000/pub/` and you should see the directory listing. We want to be able to optionally disable this. If we manually edit `/etc/httpd/conf.d/05-foreman-ssl.d/pulp.conf` and reload httpd, we get the behavior we want. We probably want to be able to specify the "Options" flags via `custom-hiera.yaml`, and have the default be `+FollowSymLinks +Indexes` to preserve the existing behavior.

The next step is to find where that file is controlled. The quickest way is to grep for its contents in `/usr/share/katello-installer-base`. You'll see that the file is controlled by `/usr/share/katello-installer-base/modules/katello/files/pulp-apache-ssl.conf`.  Let's confirm that by editing the file, and running `foreman-installer -v --disable-system-checks` to see if the change lands. The `--disable-system-checks` is needed because the development VM has 5GB of memory, and the installer wants to make sure you have 8GB.

If the change worked, you'll see something like this:
```
[ WARN 2018-05-16T15:42:29 verbose]  /Stage[main]/Katello::Pulp/Foreman::Config::Passenger::Fragment[pulp]/File[/etc/httpd/conf.d/05-foreman-ssl.d/pulp.conf]/content:                                                                                                                   
[ WARN 2018-05-16T15:42:29 verbose] --- /etc/httpd/conf.d/05-foreman-ssl.d/pulp.conf    2018-05-16 15:24:05.909088167 +0000
[ WARN 2018-05-16T15:42:29 verbose] +++ /tmp/puppet-file20180516-27893-4dzuz3   2018-05-16 15:42:29.592649312 +0000
[ WARN 2018-05-16T15:42:29 verbose] @@ -9,5 +9,5 @@
[ WARN 2018-05-16T15:42:29 verbose]    <IfModule mod_passenger.c>
[ WARN 2018-05-16T15:42:29 verbose]      PassengerEnabled off
[ WARN 2018-05-16T15:42:29 verbose]    </IfModule>
[ WARN 2018-05-16T15:42:29 verbose] -  Options +FollowSymLinks
[ WARN 2018-05-16T15:42:29 verbose] +  Options +FollowSymLinks +Indexes
[ WARN 2018-05-16T15:42:29 verbose]  </Location>
```

Hooray! We have found the correct file to edit. However, there's a problem.  This is a file, not a template. A template allows you to write a code snippet that gets evaluated to a string, which then gets inserted into the config file.  Before we make this file a template, we'll need to create a fork of the puppet-katello repository. A fork is just a personal copy of puppet-katello on github.

**NOTE**: this is an abbreviated version of using git. You'll likely want to read a [more detailed document](https://guides.github.com/activities/hello-world/) to get a better understanding of git if you are a beginner.

If you have not already created an account on github.com, please do so. Next, go to https://github.com/theforeman/puppet-katello, and click *fork*! This will create your own fork of the project. You'll be using this to make your changes, and eventually create a pull request.

Once your fork is created, you can view in the the github.com web UI at `https://github.com/username/puppet-katello`. Click "clone or download", then click "Use SSH" and copy the given URL. Next, on your development server as vagant user (not root), you'll need to clone down the repo.

First, pull down your upstream repo by running `git clone https://github.com/theforeman/puppet-katello.git`. Then, go into the created directory and run `git remote add -f username git@github.com:username/puppet-katello.git`. This will fail, because you need to pull your private SSH key onto the VM. Edit `/home/vagrant/.ssh/id_rsa`, add your private key, and run "git fetch username". It should work now, congrats!

Let's use this branch instead of the one that was installed on the system:

```
cd /usr/share/katello-installer-base/modules/
rm -rf katello
ln -s /home/vagrant/puppet-katello katello
```

Now, become the vagrant user again and run `sudo foreman-installer -v --disable-system-checks`. This should lay down the old pulp.conf file, since we are using our checkout instead of the locally modified copy. It will fail at first, run `yum install puppet-agent-puppet-strings.noarch` to make it work.  Progress!

Let's make that file a template now. Here's an example diff:

```diff
[vagrant@centos7-katello-nightly puppet-katello]$ git diff --cached
diff --git a/files/pulp-apache-ssl.conf b/files/pulp-apache-ssl.conf
deleted file mode 100644
index f08ddfe..0000000
--- a/files/pulp-apache-ssl.conf
+++ /dev/null
@@ -1,13 +0,0 @@
-### File managed with puppet ###
-
-<Location /pulp/api>
-  SSLUsername SSL_CLIENT_S_DN_CN
-</Location>
-
-Alias /pub /var/www/html/pub
-<Location /pub>
-  <IfModule mod_passenger.c>
-    PassengerEnabled off
-  </IfModule>
-  Options +FollowSymLinks +Indexes
-</Location>
diff --git a/manifests/pulp.pp b/manifests/pulp.pp
index d0d7b95..9e64f5b 100644
--- a/manifests/pulp.pp
+++ b/manifests/pulp.pp
@@ -86,7 +86,7 @@ class katello::pulp (
 
   foreman::config::passenger::fragment { 'pulp':
     content     => file('katello/pulp-apache.conf'),
-    ssl_content => file('katello/pulp-apache-ssl.conf'),
+    ssl_content => template('katello/pulp-apache-ssl.conf.erb'),
   }
 
   # NB: we define this here to avoid a dependency cycle. It is not a problem if
diff --git a/templates/pulp-apache-ssl.conf.erb b/templates/pulp-apache-ssl.conf.erb
new file mode 100644
index 0000000..f08ddfe
--- /dev/null
+++ b/templates/pulp-apache-ssl.conf.erb
@@ -0,0 +1,13 @@
+### File managed with puppet ###
+
+<Location /pulp/api>
+  SSLUsername SSL_CLIENT_S_DN_CN
+</Location>
+
+Alias /pub /var/www/html/pub
+<Location /pub>
+  <IfModule mod_passenger.c>
+    PassengerEnabled off
+  </IfModule>
+  Options +FollowSymLinks +Indexes
+</Location>

```

Re-run the installer and ensure nothing broke. Now we parameterize the string:

```diff
$ git diff
diff --git a/manifests/pulp.pp b/manifests/pulp.pp
index 9e64f5b..ac1174e 100644
--- a/manifests/pulp.pp
+++ b/manifests/pulp.pp
@@ -32,6 +32,7 @@ class katello::pulp (
   Boolean $db_unsafe_autoretry = $::katello::pulp_db_unsafe_autoretry,
   Optional[Enum['majority', 'all']] $db_write_concern = $::katello::pulp_db_write_concern,
   Boolean $manage_db = $::katello::pulp_manage_db,
+  String $pub_dir_options = "+FollowSymlinks +Indexes",
 ) {
   include ::certs
   include ::certs::qpid_client
diff --git a/templates/pulp-apache-ssl.conf.erb b/templates/pulp-apache-ssl.conf.erb
index f08ddfe..2820a8b 100644
--- a/templates/pulp-apache-ssl.conf.erb
+++ b/templates/pulp-apache-ssl.conf.erb
@@ -9,5 +9,5 @@ Alias /pub /var/www/html/pub
   <IfModule mod_passenger.c>
     PassengerEnabled off
   </IfModule>
-  Options +FollowSymLinks +Indexes
+  Options <%= @pub_dir_options %>
 </Location>
```

Re-run the installer and ensure nothing broke. Now we can add `katello::pulp::pub_dir_options: "+FollowSymlinks"` to `custom-hiera.yaml`, run the installer again, and see what happens:

```diff
[ WARN 2018-05-16T16:33:41 verbose]  /Stage[main]/Katello::Pulp/Foreman::Config::Passenger::Fragment[pulp]/File[/etc/httpd/conf.d/05-foreman-ssl.d/pulp.conf]/content:                                                                                                                   
[ WARN 2018-05-16T16:33:41 verbose] --- /etc/httpd/conf.d/05-foreman-ssl.d/pulp.conf    2018-05-16 16:31:04.486064240 +0000
[ WARN 2018-05-16T16:33:41 verbose] +++ /tmp/puppet-file20180516-30733-1em1di7  2018-05-16 16:33:41.832676077 +0000
[ WARN 2018-05-16T16:33:41 verbose] @@ -9,5 +9,5 @@
[ WARN 2018-05-16T16:33:41 verbose]    <IfModule mod_passenger.c>
[ WARN 2018-05-16T16:33:41 verbose]      PassengerEnabled off
[ WARN 2018-05-16T16:33:41 verbose]    </IfModule>
[ WARN 2018-05-16T16:33:41 verbose] -  Options +FollowSymlinks +Indexes
[ WARN 2018-05-16T16:33:41 verbose] +  Options +FollowSymlinks
[ WARN 2018-05-16T16:33:41 verbose]  </Location>
```

We did it! Let's remove that line and make sure it goes back to normal:

```diff
[ WARN 2018-05-16T16:50:10 verbose] --- /etc/httpd/conf.d/05-foreman-ssl.d/pulp.conf    2018-05-16 16:33:41.887676990 +0000
[ WARN 2018-05-16T16:50:10 verbose] +++ /tmp/puppet-file20180516-622-ej00eh     2018-05-16 16:50:10.657060958 +0000
[ WARN 2018-05-16T16:50:10 verbose] @@ -9,5 +9,5 @@
[ WARN 2018-05-16T16:50:10 verbose]    <IfModule mod_passenger.c>
[ WARN 2018-05-16T16:50:10 verbose]      PassengerEnabled off
[ WARN 2018-05-16T16:50:10 verbose]    </IfModule>
[ WARN 2018-05-16T16:50:10 verbose] -  Options +FollowSymlinks
[ WARN 2018-05-16T16:50:10 verbose] +  Options +FollowSymlinks +Indexes
[ WARN 2018-05-16T16:50:10 verbose]  </Location>
```

Looks good! Our total code change was:

```diff
[vagrant@centos7-katello-nightly puppet-katello]$ git diff --cached
diff --git a/files/pulp-apache-ssl.conf b/files/pulp-apache-ssl.conf
deleted file mode 100644
index f08ddfe..0000000
--- a/files/pulp-apache-ssl.conf
+++ /dev/null
@@ -1,13 +0,0 @@
-### File managed with puppet ###
-
-<Location /pulp/api>
-  SSLUsername SSL_CLIENT_S_DN_CN
-</Location>
-
-Alias /pub /var/www/html/pub
-<Location /pub>
-  <IfModule mod_passenger.c>
-    PassengerEnabled off
-  </IfModule>
-  Options +FollowSymLinks +Indexes
-</Location>
diff --git a/manifests/pulp.pp b/manifests/pulp.pp
index d0d7b95..ac1174e 100644
--- a/manifests/pulp.pp
+++ b/manifests/pulp.pp
@@ -32,6 +32,7 @@ class katello::pulp (
   Boolean $db_unsafe_autoretry = $::katello::pulp_db_unsafe_autoretry,
   Optional[Enum['majority', 'all']] $db_write_concern = $::katello::pulp_db_write_concern,
   Boolean $manage_db = $::katello::pulp_manage_db,
+  String $pub_dir_options = "+FollowSymlinks +Indexes",
 ) {
   include ::certs
   include ::certs::qpid_client
@@ -86,7 +87,7 @@ class katello::pulp (
 
   foreman::config::passenger::fragment { 'pulp':
     content     => file('katello/pulp-apache.conf'),
-    ssl_content => file('katello/pulp-apache-ssl.conf'),
+    ssl_content => template('katello/pulp-apache-ssl.conf.erb'),
   }
 
   # NB: we define this here to avoid a dependency cycle. It is not a problem if
diff --git a/templates/pulp-apache-ssl.conf.erb b/templates/pulp-apache-ssl.conf.erb
new file mode 100644
index 0000000..2820a8b
--- /dev/null
+++ b/templates/pulp-apache-ssl.conf.erb
@@ -0,0 +1,13 @@
+### File managed with puppet ###
+
+<Location /pulp/api>
+  SSLUsername SSL_CLIENT_S_DN_CN
+</Location>
+
+Alias /pub /var/www/html/pub
+<Location /pub>
+  <IfModule mod_passenger.c>
+    PassengerEnabled off
+  </IfModule>
+  Options <%= @pub_dir_options %>
+</Location>
```

Of course, this only covers port 443 and not 80. You'll need to do something similar to make port 80 work.

After all that is done, you can commit your change and create a pull request.  Each module has its own process for this. You'll find more information in `CONTRIBUTING.md`, which will outline how to run unit tests. Once those are successful, you can put in a pull request. There are [installer testing instructions](https://github.com/theforeman/forklift/blob/master/docs/development.md#test-puppet-module-pull-requests) available as well. As mentioned before, feel free to reach out if you need assistance.
