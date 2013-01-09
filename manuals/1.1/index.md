---
layout: manual
title: Foreman 1.1 Manual
---
#Manual for Foreman 1.1

<!--- missing content commented out. Consider contributing, you kind soul! -->

# 1. About Foreman
## Foreman Architecture

A Foreman installation will always contain a central foreman instance
that is responsible for providing the Web based GUI, node
configurations, initial host configuration files, etc. However, if the
foreman installation supports unattended installations then other
operations need to be performed to fully automate this process. The
smart proxy manages remote services and is generally installed with all
Foreman installations to allow for TFTP, DHCP, DNS, and Puppet, and the
Puppet CA.
![Foreman Architecture](/static/images/foreman_architecture.png)

## Smart-Proxy

A [[Smart-Proxy:Wiki|Smart Proxy]] is located on or near a machine that performs a specific function and helps foreman orchestrate the process of commissioning a new host. Placing the proxy on or near to the actual service will also help reduce latencies in large distributed organizations.

[Read More](4.2_smartproxy.html)


## Supported Distributions

* RedHat (CentOS) 3, 4 and 5 and 6.
* Fedora 10 - 16
* Ubuntu 10.04, 10.10, 11.04, 11.10, 12.04
* Debian Lenny, Squeeze
* Solaris 8, 10
* OpenSUSE 11.4

# 2. Quickstart
## Summary
The "Foreman installer" is a collection of Puppet modules that installs different components needed to get a full working Foreman setup. These include the [smart proxy](https://github.com/theforeman/smart-proxy), Passenger (for the Puppet master and Foreman itself), and an optional TFTP server.

## Installation
[The Foreman installer](https://github.com/theforeman/foreman-installer) uses Puppet to install Foreman. This guide assumes that you've already installed Puppet itself, but the installer will setup Foreman and the Puppet master with Passenger, the [smart proxy](https://github.com/theforeman/smart-proxy), git, xinetd (on EL/Fedora systems), and a TFTP server.


### Downloading the installer
**Download the modules:**

{% highlight bash %}
export MODULE_PATH="/etc/puppet/modules/common"
mkdir -p $MODULE_PATH
for mod in apache foreman foreman_proxy git passenger puppet tftp xinetd; do
  mkdir -p $MODULE_PATH/$mod
  wget http://github.com/theforeman/puppet-$mod/tarball/master -O - | tar xzvf - -C $MODULE_PATH/$mod --strip-components=1
done;
{% endhighlight %}

**To install Foreman, the smart proxy, Puppet, and a Puppet master:**
{% highlight bash %}
echo include puppet, puppet::server, foreman, foreman_proxy | puppet apply --modulepath /etc/puppet/modules/common
{% endhighlight %}

### Additional reading...
* [Managing a datacenter with Foreman and Puppet](http://engineering.yakaz.com/managing-an-infrastructure-datacenter-with-foreman-and-puppet.html)
* [EC2 provisioning using Foreman](http://blog.theforeman.org/2012/05/ec2-provisioning-using-foreman.html)
* [Creating a new host using the Foreman API](http://blog.theforeman.org/2012/01/creating-new-host-using-foreman-api.html)
* [Re-provisioning without PXE](http://blog.theforeman.org/2012/01/re-provision-host-without-pxeboot.html)


#[3. Installing Foreman](/manuals/1.1/3_installing_foreman.html)
## 3.1 Requirements for the foreman core component
**before you start, make sure you have:**

* Puppet >= 0.24-4
* rake >= 0.84
* rubygems
* ruby-sqlite3 (libsqlite3-ruby) if you are going to use sqlite as your database
* git (if installing from source )
* ruby-libvirt (epel-repo, only for develop branch)

The installation has been successfully tested on RHEL[5,6], Fedora[13,14,15,16,17], Debian Linux 5.0 (Lenny) and 6.0 (Squeeze) and Ubuntu Linux 10.04, 10.10, 11.04, and 12.04. For older operating systems you might need additional packages (e.g. sqlite).

It is also known to work on Solaris and Mac.

##3.2 Foreman Installer

The "Foreman installer" is a collection of Puppet modules that installs different components needed to get a full working Foreman setup. These include the [smart proxy](https://github.com/theforeman/smart-proxy), Passenger (for the Puppet master and Foreman itself), and an optional TFTP server.

### Installation
[The Foreman installer](https://github.com/theforeman/foreman-installer) uses Puppet to install Foreman. This guide assumes that you've already installed Puppet itself, but the installer will setup Foreman and the Puppet master with Passenger, the [smart proxy](https://github.com/theforeman/smart-proxy), git, xinetd (on EL/Fedora systems), and a TFTP server.


### Downloading the installer
**Download the modules:**
{% highlight bash %}
export MODULE_PATH="/etc/puppet/modules/common"
mkdir -p $MODULE_PATH
for mod in apache foreman foreman_proxy git passenger puppet tftp xinetd; do
  mkdir -p $MODULE_PATH/$mod
  wget http://github.com/theforeman/puppet-$mod/tarball/master -O - | tar xzvf - -C $MODULE_PATH/$mod --strip-components=1
done;
{% endhighlight %}

**To install Foreman and proxy:**
{% highlight bash %}
echo include foreman, foreman_proxy | puppet apply --modulepath /etc/puppet/modules/common
{% endhighlight %}


### Additional reading...
* [Managing a datacenter with Foreman and Puppet](http://engineering.yakaz.com/managing-an-infrastructure-datacenter-with-foreman-and-puppet.html)
* [EC2 provisioning using Foreman](http://blog.theforeman.org/2012/05/ec2-provisioning-using-foreman.html)
* [Creating a new host using the Foreman API](http://blog.theforeman.org/2012/01/creating-new-host-using-foreman-api.html)
* [Re-provisioning without PXE](http://blog.theforeman.org/2012/01/re-provision-host-without-pxeboot.html)

## 3.3 Install From Packages
You can either use Debian or Redhat based packages!
### [3.3.1 RPM Based Packages](/manuals/1.1/3.3.1_rpm_packages.html)
###[3.3.2 Debian Based Packages](/manuals/1.1/3.3.2_debian_packages.html)
## 3.4 Install From Source
### Latest development code

Foreman has now moved to using Rails 3 and Bundler to get up and running. This is the preferred way to get Foreman if you want to benefit from the latest improvements. By using the git repository you can also upgrade more easily. You will need to have Bundler installed manually for now (check your distribution repositories, or install it via rubygems).

to get latest "development" version do:

You will want to make sure that you have one of the *mysql-devel*, *postgresql-devel*, and *sqlite-devel* libraries installed so the database gems can install properly.
also, you would also need *gcc*, *ruby-devel*, *libxml-devel*, *libxslt-devel*, and *libvirt-devel* packages

Additionally, it is important that `config/database.yml` is set to use
the correct database in the "production" block. Rails (and subsequently
Foreman) will use these connection settings under "production" to manage
the database it uses and setup the necessary schema.

{% highlight bash %}
git clone https://github.com/theforeman/foreman.git -b develop
cd foreman
# must have the bundler gem installed -- gem install bundle
bundle install --without mysql mysql2  sqlite test --path vendor # or postgresql
cp config/settings.yaml.example config/settings.yaml
cp config/database.yml.example config/database.yml
RAILS_ENV=production bundle exec rake db:migrate # (to set up database schema)
{% endhighlight %}

You can run Foreman with the command *"./script/rails s -e production"*

## Latest stable version

to get latest "stable" version do:

{% highlight bash %}
git clone https://github.com/theforeman/foreman.git -b 1.0-stable
cd foreman
git submodule init
git submodule update
{% endhighlight %}

If you are behind a proxy or firewall and don't have access to Github
using the git protocol, use http protocol instead:

{% highlight bash %}
git clone https://github.com/theforeman/foreman.git foreman
cd foreman
sed -i 's/git:\/\//http:\/\//g' .gitmodules
git submodule init
git submodule update
{% endhighlight %}

## 3.5 Configuration
The following sections detail the configuration steps required to get Foreman working in your environment.

Lets get started!

### 3.5.1 Initial Setup
### Configuration

Foreman configuration is managed from two places; a configuration file *config/settings.yaml* and from the *SETTINGS/Foreman Settings* page. A full description of the configuration options is given at [foreman_configuration](3.5.2_configuration_options.html)

### Database

Foreman uses a database, this database can be shared with Puppet store-configs (they are compatible, as Foreman extends the puppet database schema). By default, SQLite is used, if you want to use other database (e.g. [MySQL](3.5.3_database_setup.html)) please modify the configuration file under *config/database.yml*.

If you want to share the database with Puppets (storeconfig), just modify *config/database.yml* to point to the same database configuration as puppet is.

In both cases, please use the *production* settings.

to initialize the database schema type:
<pre>cd <foreman installation path> && RAILS_ENV=production rake db:migrate</pre>

On foreman 1.0 use bundle:
<pre>cd <foreman installation path> && RAILS_ENV=production bundle exec rake db:migrate</pre>

For more information please see the database configuration page [here](3.5.3_database_setup.html)

### Import Data from Puppet

At this point, you might want to go through the [[FAQ]] to see how can you import your data into Foreman.

### Start The Web Server

if you installed via rpm, just start the foreman service, or start the builtin web server by typing:
<pre>RAILS_ENV=production rails server</pre>

and point your browser to `http://foreman:3000`

If you would like to keep the server running, its recommend to setup
passenger or use the RPM. Example usage with passenger can be found on
[GitHub](http://github.com/theforeman/puppet-foreman/blob/master/templates/foreman-vhost.conf.erb).

### Getting your Puppet Reports into Foreman

Read [Puppet_Reports](3.5.4_puppet_reports.html) to learn how to get your nodes to report to Foreman.

### 3.5.2 Configuration

Configuration is broken into two parts. The *config/settings.yaml* file and the *SETTINGS/Foreman Settings* page. The configuration file contains a few low-level options that need to be set before Foreman starts but the majority of Foreman customization is managed from within the program on the *Foreman Settings* page.

### The config/settings.yaml file

#### YAML start

The first non-comment line of this file must be three dashes.

<pre>
---
</pre>

#### login

This boolean option configures whether Foreman requires users to to login. If it is set then each user will be expected to authenticate themselves and all operations will occur, and be audited, under their identity. When this option is _false_ then all activity will be executed under the admin account.

<pre>
:login: true
</pre>

#### require_ssl

This boolean option configures whether Foreman insists on using only https/ssl encrypted communication channels in the web interface. This does not configure the channels used to contact the smart-proxies. Note that certain operations will still accept a http connection even if this is set, for example, the downloading of a finish script.

<pre>
:require_ssl: true
</pre>

#### unattended

This boolean option configures whether Foreman will act as a simple node classifier for puppet, or support the full spectrum of operations required for managing a host's lifecycle. When set to _true_ then foreman will provide full host building facilities for various operating systems.
<pre>
:unattended: true
</pre>

### The 'SETTINGS/Foreman Settings' page

#### administrator

When Foreman needs to mail the administrator then this is the email address that it will contact.
Default: root@<your domain>.

#### default_puppet_environment

When Foreman receives a fact upload from a machine that it has not previously come across it will create a host in its database. If the facts from that host did not contain information about the puppet environment then it will assign the _default_puppet_environment_ environment to this host.
Default: production

#### Default_variables_Lookup_Path

A Smart-variable's match criteria are evaluated in a specific order and if this search order is not provided then _Default_variables_Lookup_Path_ is used.
Default: ["fqdn", "hostgroup", "os", "domain"]

#### document_root

This is the directory into which the *rake puppet:rdoc:generate* task will place the web-based on-line documentation for your puppet classes. It should be under a web server's control and the default location is served by Foreman's own web server.
Default: public/puppet/rdoc

#### email_reply_address

The return address applied to outgoing emails.
Default: Foreman-noreply@<your domain>

#### Enable_Smart_Variables_in_ENC

Whether Smart-variables should be included in the yaml node information provided to puppet.
Default: true

#### entries_per_page

The number of entries that will be shown in the web interface for list operations.
Default: 20

#### failed_report_email_notification

If this option is set to _true_ then an email will be sent to the host's owner whenever a report is received that contains errors. If the host is not owned or Foreman is not configured to use logins then send the email to the administrator.
Default: false

#### foreman_url

Emails may contain embedded references to Foreman's web interface. This option allows the hostname component of the URL to be configured.
Default: foreman.<your domain>

#### ignore_puppet_facts_for_provisioning

If this option is set to _true_ then Foreman will not update a host's IP and MAC with the values that it receives in a host's facts and it will also include Foreman's values for IP and MAC to puppet in its node information.
Default: false

#### manage_puppetca

If this option is set to _true_ then Foreman will manage a host's Puppet certificate signing. If it is set to _false_ then some external mechanism is required to ensure that the host's certificate request is signed.
Default: true

#### modulepath

This it the modulepath that foreman uses when processing puppet modules. It is usually able to determine this itself at runtime but if it is not able to find a value then _modulepath_ is used.
Default: /etc/puppet/modules

#### puppet_interval

This is the number of minutes between each run of puppet.
Default: 30

#### puppet_server

The default puppet server hostname. For larger organizations this is often a non fqdn so that a name like _puppet_ can be a different host within each DNS domain.
Default: puppet

#### puppetconfdir
Path to puppet.conf.
Default: /etc/puppet/puppet.conf


#### puppetrun

If this option is set to _true_ then Foreman will be able to trigger a puppet run on any host that it manages.
Default: false

#### root_pass

If a root password is not provided whilst configuring a host then this encrypted password is used when building the machine. The plain text password "123123" has been encrypted to produce the default value.
Default: xybxa6JUkz63w
(To generate a new one you should use: *openssl passwd "your_password"* )


#### safemode_render

The default templating system used within Foreman allows unlimited interpolated variables and expressions. This could obviously be abused so a evaluation environment is provided that restricts the template variables and expressions to a whitelist. When this option is _true_ then only known helper methods and instance variables will be available in template expansion.
Default: true

#### ssl_ca_file

The SSL Certificate Authority file that Foreman will use when connecting to its smart-proxies.
Default: The CA file used by puppet

#### ssl_certificate

The SSL certificate that Foreman will use when connecting to its smart-proxies.
Default: The host certificate used by puppet

#### ssl_priv_key

The SSL private key file that Foreman will use when connecting to its smart-proxies.
Default: The private key file used by puppet

#### update_environment_from_facts

If Foreman receives an environment fact from one of its hosts and if this option is _true_, it will update the host's environment with the new value. By default this is not the case as Foreman should manage the host's environment.
Default: false

#### using_storeconfigs

Set this option to _true_ if your Foreman installation shares puppet's storeconfig database.
Default: true if puppet uses store configs otherwise false.

### 3.5.3 Database Setup

By default, Foreman will use sqlite3 as a database, its configuration can be found at
<pre>config/database.yml</pre>
By default, the  database can be found at the db subdirectory.
Foreman is a rails application, therefor, anything that is supported under RAILS (sqlite, mysql, postgresql, ...) can be used.
At this time, Oracle DB is known to not work. Patches are welcome!

### For MySQL

edit your config/database.yml and modify:
{% highlight ruby %}
production:
  adapter: mysql
  database: puppet
  username: puppet
  password: password
  host: localhost
  socket: "/var/run/mysqld/mysqld.sock"
{% endhighlight %}

If you use foreman 1.0 with foreman-mysql2 use 'adapter: mysql2' instead

Afterwards you would need to re-populate your database, simply execute extras/dbmigrate script.

###  I want to switch from SQLite to Mysql and maintain my data

This article on yamldb may help you out, don't bet the farm on it though...

[http://blog.heroku.com/archives/2007/11/23/yamldb_for_databaseindependent_data_dumps/](http://blog.heroku.com/archives/2007/11/23/yamldb_for_databaseindependent_data_dumps/)

### 3.5.4 Puppet Reports

### Overview

Foreman uses a custom puppet reports address (similar to tagmail or store) which Puppet will use to upload it's report into Foreman.
This enables you to see the reports through the web interface as soon as the client finish its run.

### Configuration

#### Client

Ensure that the puppet clients has the following option in their puppet.conf:
<pre>report = true</pre>

Without it, no reports will be sent.

#### puppetmaster

1. copy [https://raw.github.com/theforeman/puppet-foreman/master/templates/foreman-report.rb.erb](https://raw.github.com/theforeman/puppet-foreman/master/templates/foreman-report.rb.erb) to your report directory
2. e.g. /usr/lib/ruby/1.8/puppet/reports/foreman.rb or /usr/lib/ruby/site_ruby/1.8/puppet/reports/foreman.rb or /var/lib/gems/1.8/gems/puppet-2.6.4/lib/puppet/reports/foreman.rb
3. make sure you copied the foreman-report.rb.erb to **foreman.rb** so puppet can find it!
4. open the new file with your favorite editor
5. edit the URL to point to foreman.
6. add this report in your puppetmaster reports - e.g, in your master puppet.conf under the main section add:

<pre>reports=log, foreman</pre>

and restart your puppetmaster

You should start seeing reports coming in under the reports link.

### Expire Reports automatically

You will probably want to delete your reports after some time to limit database growth. To do so, you can set a cronjob:

Available conditions:

* days => number of days to keep reports (defaults to 7)
* status => status of the report (defaults to 0 --> "reports with no errors")

Example:

1. Expires all reports regardless of their status
    <pre>rake reports:expire days=7 RAILS_ENV="production"</pre>
2. expires all non interesting reports after one day
    <pre>rake reports:expire days=1 status=0 RAILS_ENV="production"</pre>

*Note:* on Debian systems, these commands must be run as the *foreman* user from its default home directory.

### 3.5.5 Importing Facts
This page summarize the many ways you can get your facts visible in Foreman.


If you are planning to use Foreman as your Puppet [External Nodes](#) Classifier, the *recommended* approach would be using the ENC script, which both updates your facts, and fetch the information at the same time.


### Using Puppet Storeconfigs

#### Missing facts when using storeconfigs

If nodes are finishing their catalog runs, although the hosts operating system description is missing. Ensure that your /etc/puppet/puppet.conf contains the dbadapter under the [master] section. Add the following and either wait for a node to check in again, or manually run it with puppetd --test for this information to be updated.

_/etc/puppet/puppet.conf_
{% highlight yaml %}
[master]

  storeconfigs=true
  dbadapter=mysql
  dbuser= puppetuser
  dbpassword= puppetpass
  dbserver= mysql.domain.com
{% endhighlight %}



### Not using Puppet storeconfigs

#### Running Foreman on the puppetmaster

If you run Foreman on the same machine as your puppetmaster and you have only one puppet master, you probably want to create a simple cronjob:
<pre>
rake puppet:import:hosts_and_facts RAILS_ENV=production
</pre>

this will import your facts (only new facts) every time you run the script.

### Multiple puppet masters or Foreman on another server

#### Pushing facts through HTTP directly to Foreman

Foreman accepts remote puppetmaster sending their nodes facts through http, making it effective way to send facts over WAN.

This [script](https://github.com/theforeman/puppet-foreman/blob/283619064fbde0275235535b19c53da249357035/files/push_facts.rb) is meant to run on each of your puppetmasters. The script will scan over all of the new fact files (from its last run) and will send them to foreman.

You will need to edit the script and set the Foreman URL (based on where Foreman is located in your setup).

You should run this script in a cronjob, if you have many puppet masters, you might consider adding a simple sleep argument (as mentioned inside the script header), this will avoid all of your puppetmasters hammering your database at the same time.

#### local file system access to fact yaml files

The previously mentioned  rake task accepts a _dir_ parameter, which means you can tell it to import facts from any directory.
if you store your fact yaml on some network share, or if you want to mount your puppetmaster you can:
<pre>
rake puppet:import:hosts_and_facts dir=/my/dir/with/yaml/files RAILS_ENV=production
</pre>

However, I would not recommend this option if you have any network latency or if it requires you to run an NFS (or sshfs) etc


# 4. General Foreman
This section covers general information on using Foreman to manage your infrastructure. It covers the features of the web interface, managing puppet, provisioning systems and the installation and configuration of Foreman Smart Proxies.

## 4.1 Web Interface
### 4.1.1 Authentication
### LDAP Authentication

Foreman natively supports LDAP authentication using one or multiple LDAP directories.


#### Enabling LDAP

Enable LDAP and User/Group settings menus

Edit your config/setting.yml
<pre>
:login: true
</pre>

and restart Foreman

#### Setting up

Go to  More -> LDAP Authentication

Click on New Ldap Source and enter the following

* *Name*: an arbitrary name for the directory
* *Host*: the LDAP host name
* *Port*: the LDAP port (default is 389)
* *LDAPS*: check this if you want or need to use LDAPS to access the directory
* *Account*: leave this field empty if your LDAP can be read anonymously, otherwise enter a user name that has read access to the LDAP or use $login (which will be replaced with the actual user credentials upon login)
* *Account Password*: password for the account (if defined above and its not using the $login)
* *baseDN*: the top level DN of your LDAP directory tree

#### On the fly user creation

By checking *On-the-fly user creation*, any LDAP user will have his Foreman account automatically created the first time he logs into Foreman.
For that, you have to specify the LDAP attributes name (firstname, lastname, email) that will be used to create their Foreman accounts.

### Examples

#### Active Directory

<pre>
Name              = My Directory
Host              = host.domain.org
Port              = 636
TLS               = yes
Onthefly register = yes
Account           = MyDomain\$login
Password          = <leave blank>
Base DN           = CN=users,DC=host,DC=domain,DC=org
attr login        = sAMAccountName
attr firstname    = givenName
attr lastname     = sN
mail              = mail
</pre>

#### OpenLDAP

<pre>
Name              = My Directory
Host              = host.domain.org
Port              = 389
TLS               = no
Onthefly register = yes
Account           = <leave blank> (if anonymous access is enabled)
Password          = <leave blank>
Base DN           = ou=Users,dc=domain,dc=co,dc=il
attr login        = uid
attr firstname    = givenName
attr lastname     = sn
mail              = mail
</pre>

Note that LDAP attribute names are *case sensitive*.


### Troubleshooting

If you want to use on-the-fly user creation, make sure that Foreman can fetch from your LDAP all the required information to create a valid user.
For example, on-the-fly user creation won't work if you don't have valid email adresses in your directory (you will get an 'Invalid username/password' error message when trying to log in).



### 4.1.2 Roles and Permissions

A user's access to the features of Foreman are constrained by the roles and permissions that they are granted. These permissions are also used to restrict the set of hosts, host groups and domains that a user is able to access and modify.

Note: a user with global admin enabled is not restricted by the authorization system. This is the default for installations that do not have :login:true in _config/settings.yml_.

A logged in user will be granted the **Anonymous** role plus one or more additional roles. The permissions associated with these roles are aggregated and determine the final permission set.

Roles may be administered only by a user with global admin privileges.

### Roles

These may be created, deleted and edited on the **Roles** page. Each role will be associates with one or more base privileges.

There are two builtin system roles
1. Anonymous: This is a set of permissions that every user at your installation will be granted, irrespective of any other roles that they have.
2. Default user: When a new Role is created this set of permissions are used as the template for the Role. The name is somewhat misleading but basically an ordinary default user who was assigned this Role would have these permissions set.

### Permissions

These determine the operations that are allowed to be performed upon the items to which they refer. For simple items, like an architecture, this operates as expected but for more complex items, such as, the hosts a user is able to operate on, there is an additional layer of security called filtering.

When editing a user account there is a section at the bottom that narrows the scope of the permissions granted to a subset of the hosts, domains and host groups. See _filtering_ below.

<table class="table table-bordered table-condensed">
    <tbody><tr>
      <th>Permission</th>
      <th>Description</th>
    </tr>
    <tr>
      <td colspan="2"><strong><em>Permissions for Architectures, Authentication providers, environments, External variables, Common parameters, Medias, Models, Operating systems, Partition tables, Puppet classes and User groups</em></strong></td>
    </tr>
    <tr>
      <td>view</td>
      <td>The user is allowed to see this type of object when listing them on the index page</td>
    </tr>
    <tr>
      <td>create</td>
      <td>The user is allowed to create this type of object </td>
    </tr>
    <tr>
      <td>edit</td>
      <td>The user is allowed to edit this type of object</td>
    </tr>
    <tr>
      <td>destroy</td>
      <td>The user is allowed to destroy this type of object</td>
    </tr>
    <tr>
      <td colspan="2"><strong><em>Permissions for Domains</em></strong></td>
    </tr>
    <tr>
      <td>view</td>
      <td>The user is allowed to see a list of domains when viewing the index page</td>
    </tr>
    <tr>
      <td>create</td>
      <td>The user is allowed to create a new domain and will also be able to create domain parameters </td>
    </tr>
    <tr>
      <td>edit</td>
      <td>The user is allowed to edit a domain and will also be able to edit a domain's parameters. If they have domain filtering active in their profile then only these domains will be editable</td>
    </tr>
    <tr>
      <td>destroy</td>
      <td>The user is allowed to destroy a domain and will also be able to destroy domain parameters. If they have domain filtering active in their profile then only these domains will be deletable</td>
    </tr>
    <tr>
      <td colspan="2"><strong><em>Permissions for Host groups</em></strong></td>
    </tr>
    <tr>
      <td>view</td>
      <td>The user is allowed to see a list of host groups when viewing the index page</td>
    </tr>
    <tr>
      <td>create</td>
      <td>The user is allowed to create a new host group and will also be able to create host group parameters </td>
    </tr>
    <tr>
      <td>edit</td>
      <td>The user is allowed to edit a host group and will also be able to edit a host group's parameters. If they have host group filtering active in their profile then only these host groups will be editable</td>
    </tr>
    <tr>
      <td>destroy</td>
      <td>The user is allowed to destroy a host group and will also be able to destroy host group parameters. If they have host group filtering active in their profile then only these host groups will be deletable</td>
    </tr>
    <tr>
      <td colspan="2"><strong><em>Permissions for Hosts</em></strong></td>
    </tr>
    <tr>
      <td>view</td>
      <td>The user is allowed to see a list of hosts when viewing the index page. This list may be constrained by the user's host filters</td>
    </tr>
    <tr>
      <td>create</td>
      <td>The user is allowed to create a new host. This operation may be constrained by the user's host filters </td>
    </tr>
    <tr>
      <td>edit</td>
      <td>The user is allowed to edit a host. This operation may be constrained by the user's host filters</td>
    </tr>
    <tr>
      <td>destroy</td>
      <td>The user is allowed to destroy a host. This operation may be constrained by the user's host filters</td>
    </tr>
    <tr>
      <td colspan="2"><strong><em>Permissions for Users</em></strong></td>
    </tr>
    <tr>
      <td>view</td>
      <td>The user is allowed to see a list of users when viewing the index page. A user will always be able to see their own account even if they do not have this permission</td>
    </tr>
    <tr>
      <td>create</td>
      <td>The user is allowed to create a new user </td>
    </tr>
    <tr>
      <td>edit</td>
      <td>The user is allowed to edit existing users. A user will always be able to edit their own basic account settings and password</td>
    </tr>
    <tr>
      <td>destroy</td>
      <td>The user is allowed to delete users from the system</td>
    </tr>
  </tbody></table>

### Filtering

If the filtering section at the bottom of the user's profile page has no content then the permissions that the user has been granted will apply to all hosts within the system.

However, if the filtering section is in use then the permissions will apply only to those items selected in the filters and the user will have no access to anything not selected by the filters.

This is primarily a mechanism for restricting access to hosts. However if one or more domains or host groups are selected then this also restricts where parameters can be created, edited and deleted.

Filtering operates by generating a list of hosts on which actions can be performed. The list may be built out of four components

1. Ownership: The hosts that a user owns directly or hosts that are owned by a user group of which the user is a member.

2. Domain membership: The hosts that exist within one or more indicated domains.

3. Host group membership: The hosts that are defined as being of one or more host group types.

4. Fact filtering: These restrict the hosts to those machines that have this fact associated with them. As a fact is only generated during a puppet run, this filter will only refer to machines that have been built and therefore cannot be used to restrict the creation of machines.

These four pools of hosts can be combined by adding them together or the filters can be used to restrict the selected hosts to a smaller and smaller subset of the total. Think of it as set operations.

Note: If the "Administrator" check box is checked for a user, filtering will not take effect.

### Example

A user's filter section has the **select** checkbox unticked, indicating that the user's owned hosts are not included in the final set of hosts, (unless they are selected some other way.)

The domain selection is prefixed with **plus all** and the two domains **a.com** and **b.com** are ticked. This implies that the hosts selected are the user's hosts, (of which there are none,) **plus all** the hosts in **a.com** and **b.com**.

The host group section is prefixed by **must be** and the hostgroup **web server** is selected. This implies that the hosts selected are the user's hosts, (of which there are none,) **plus all** the hosts in **a.com** and **b.com** but they **must be** of type **web server**.

The fact filter section is prefixed by **must match** and there are two filters _virtual = vmware_ and _architecture = i386_. This implies that the hosts selected are the user's hosts, (of which there are none,) **plus all** the hosts in **a.com** and **b.com** but they **must be** of type **web server** and **must match** an _i386 vmware host_.

In any of these sections above, if the prefix had been **plus all** then every host in the system that matched the selections would have been added to the final host list, (though possibly removed by a later filter.)


### 4.1.3 Trends

Trends in Foreman allow you to track changes in your infrastructure over time. It allows you to track both Foreman related information and any puppet facts. The Trend pages give a graph of how the number of hosts with that value have changed over time, and the current hosts list.

There are two pieces to the Trends area, the Trends to track and their corresponding counters. To define trend counters, use the "Add Trend Counter" button on the '/trends' page. Optionally set the "Name" field to over-ride odd puppet fact names to be more readable. Once created you can optionally 'Edit' the Trend to change the display names of the underlying values.

Next, to start collecting trend data, set a cron job to execute 'rake trends:counter'. Each time the rake task executes it will create 1 tick on the graphs, so you can fine tune the granularity with your cron job. We recommend using the same as your puppet run interval (30 minutes). Here's an example to run once per hour:

{% highlight sh %}
0 * * * * cd /usr/share/foreman/ && /usr/bin/rake trends:counter
{% endhighlight %}

Finally note that these trends are the same for all users. So if you delete a Trend category you will loose all history for that trend and the trackers will start all over again. So please be careful when deleting.

#### ---------  the following section needs update -----------------
### 4.1.4 Auditing
## 4.2 Managing Puppet
### 4.2.1 Environments
### 4.2.2 Classes
### 4.2.3 Global Parameters
### 4.2.4 Smart Variables
#### ----------- end of section needs update -----------------------

## 4.2 Smart Proxies

The Smart Proxy is a project which provides a restful API to various sub-systems.

Its goal is to provide an API for a higher level orchestration tools (such as Foreman).
The Smart proxy provides an easy way to add or extended existing subsystems and API's.

Currently supported (Click on the links below for more details).

* **DHCP**   - [ISC DHCP](4.3.3_isc_dhcp.html) and [MS DHCP](4.3.4_ms_dhcp.html) Servers
* **DNS**    - [Bind](4.3.5_bind.html) and [MS DNS](#) Servers
* **TFTP**   - any UNIX based [tftp](4.3.7_smartproxy_tftp.html) server
* **Puppet** - Any Puppet server from 0.24.x
* **Puppet CA** - Manage certificate signing, cleaning and autosign on a Puppet CA server

If you require another sub system type or implementation, Please add a new feature request.

[installation instructions](4.3.1_smartproxy_installation.html)

After you got it running, You would need to configure each one of the sub systems via the [[settings.yml]] file in the config directory.

[API](#) Reference

[Release Notes](#)

[Known Issues](#)

### 4.2.1 Smartproxy Installation

### Description

A smart proxy is an autonomous web-based foreman component that is placed on a host performing a specific function in the host commissioning phase.
It receives requests from Foreman to perform operations that are required during the commissioning process and executes them on its behalf. More details can be found on the [Foreman Architecture](1.1_architecture.html) page.

To fully manage the commissioning process then a smart proxy will have to manipulate these services, DHCP, DNS, Puppet CA, Puppet and TFTP. These services may exist on separate machines or several of them may be hosted on the same machine. As each smart proxy instance is capable of managing all the of these services, there is only need for one proxy per host.
In the special case of a smart proxy managing a windows DHCP server, the host machine must be running Windows and support the **netsh dhcp** utility, it does not need to be the Microsoft DHCP server itself.

### Source code

You can get the latest stable code from [GitHub](https://github.com/theforeman/smart-proxy) ([via git](git://github.com/theforeman/smart-proxy.git)).

<pre>
git clone git://github.com/theforeman/smart-proxy.git
</pre>

### RPM

You can get a the stable rpm [Here](http://yum.theforeman.org/)

### Debian/Ubuntu packages

We provide packages for Smart-Proxy for the following Debian-based Linux distributions:

* Debian Linux 6.0 (Squeeze)
* Ubuntu Linux 11.04 (Precise Pangolin)

These packages may also work on (let us know if they do :P):

* Debian Linux 5.0 (Lenny), see notes below
* Ubuntu Linux 10.04 (Lucid Lynx)
* Ubuntu Linux 10.10 (Maverick Meerkat)
* Ubuntu Linux 11.04 (Natty Narwhal)

Add one (and only one) of the following package sources to your */etc/apt/sources.list* or create an appropriate file in */etc/apt/sources.list.d/*:

<pre>
# Stable packages

# Debian Squeeze
deb http://deb.theforeman.org/ squeeze stable
# Ubuntu Precise
deb http://deb.theforeman.org/ precise stable

# Nightly builds. Beware: HERE BE DRAGONS

# Debian Squeeze
deb http://deb.theforeman.org/ squeeze nightly
# Ubuntu Precise
deb http://deb.theforeman.org/ precise nightly
</pre>

The public key for [secure APT](http://wiki.debian.org/SecureApt) can be downloaded [here](http://deb.theforeman.org/foreman.asc)

You can add the key after its download with

<pre>
  # Debian Linux (as root)
  apt-key add foreman.asc

  # Ubuntu Linux (as normal user)
  sudo apt-key add foreman.asc
</pre>

or combine downloading and registering:

<pre>
  # Debian Linux (as root)
  wget -q http://deb.theforeman.org/foreman.asc -O- | apt-key add -

  #Ubuntu Linux (as normal user)
  wget -q http://deb.theforeman.org/foreman.asc -O- | sudo apt-key add -
</pre>

The key fingerprint is

<pre>
  1DCB 15D1 2CA1 40EE F494  7E57 66CF 053F E775 FF07
  Foreman Archive Signing Key <packages@theforeman.org>
</pre>

To install Smart-Proxy, run

<pre>
  # Debian Linux (as root)
  apt-get update
  apt-get install foreman-proxy

  # Ubuntu Linux (as normal user)
  sudo aptitude update
  sudo aptitude install foreman-proxy
</pre>

### Debian Linux 5.0 (Lenny)

Users of Debian Lenny will have to use [rake](http://packages.debian.org/lenny-backports/rake), [rack](http://packages.debian.org/lenny-backports/librack-ruby), and [Sinatra](http://packages.debian.org/lenny-backports/libsinatra-ruby) from *lenny-backports*.

See [http://backports.debian.org/Instructions/](http://backports.debian.org/Instructions/) for instructions on how to add **lenny-backports** to your list of repositories and install a package from it.

Please note that you'll have to install the packages from *lenny-backports* using *apt-get -t lenny-backports install libsinatra-ruby*.


### Configuration file

Usually can be found at /etc/foreman-proxy/settings.yml or on the config/settings.yml subdirectory.
You can use the *settings.yml.example* file inside the *config* directory as a template for your own *settings.yml*.

If you don't plan to use one of the subsystems, please disable them in this configuration file. For more information see [Smartproxy Configuration](/manuals/1.1/4.2.2_smartproxy_settings.html)


### Start the daemon

<pre>
  bin/smart-proxy.rb
</pre>

Or if you installed it via a package simply start the foreman-proxy service.

### Add the smart-proxy to Foreman

* Go to [FOREMAN_URL]/smart_proxies and click *New Proxy*
* Type in the Name for your Proxy and the URL of your Proxy, with the Port used.

For example:
<pre>
  Name: Puppet-Proxy
  URL: http://puppet.your-domain.com:8443
</pre>

### 4.2.2 Smartproxy Settings

The configuration for Smart-Proxy is held in the */etc/foreman-proxy/settings.yml* or *config/settings.yml* file.

### YAML start

The first non-comment line of this file must be three dashes.

<pre>---</pre>

### SSL configuration

The existence of all the three ssl key entries below enables the use of an SSL connections.

**NOTE** that both client certificates need to be signed by the same CA, which must be in the *ssl_ca_file*, in order for this to work
see [SSL](4.2.6_smartproxy_ssl.html) for more information

<pre>
  :ssl_certificate: ssl/certs/fqdn.pem
  :ssl_ca_file: ssl/certs/ca.pem
  :ssl_private_key: ssl/private_keys/fqdn.key
</pre>

This is the list of hosts from which the smart proxy will accept connections. If this list is empty then every verified SSL connection is allowed to access the API.
<pre>
:trusted_hosts:
- foreman.prod.domain
- foreman.dev.domain
</pre>

### Instance attributes

If this entry is present and not false then Smart-Proxy will attempt to disconnect itself from the controlling terminal and daemonize itself.

<pre>
:daemon: true
</pre>

The port listened to by the proxy. If this is not present then the default Sinatra port of 4567 is used.

<pre>
:port: 8443
</pre>

### TFTP section

Activate the TFTP management module within the Smart-Proxy instance.

The *tftproot* value is directory into which tftp files are copied and then served from. The tftp daemon will also be expected to chroot to this location. This component is only supported in the Unix environment
<pre>
:tftp: true
:tftproot: /var/lib/tftpboot
:tftp_servername: name of your tftp server (used for next server value in your dhcp reservation) - defaults to the host name of your proxy.
</pre>

**NOTE**: the foreman proxy user must have read/write access to the _tftpboot/pxelinux.cfg_ and _tftpboot/boot_ directories.

### DNS section

Activate the DNS management module within the Smart-Proxy instance.

The DNS module can manipulate any DNS server that complies with the ISC Dynamic DNS Update standard and can therefore be used to manage both Microsoft and Bind servers.

The **dns_key** is used to validate the client request. If it is not present then the update operation is performed without peer verification, (not recommended.)
The **dns_server** option is used if the Smart-Proxy is not located on the same physical host as the DNS server. If it is not specified then localhost is presumed.
<pre>
:dns: true
:dns_key: /home/proxy/keys/Kapi.+157+47848.private
:dns_server: dnsserver.site.domain.com
</pre>

**NOTE**: if you use a key, make sure that the foreman proxy account can read that file.

### DHCP section

Activate the DHCP management module within the Smart-Proxy instance.

<pre>
:dhcp: true
</pre>

If the DHCP server is ISC compliant then set **dhcp_vendor** to **isc**. In this case Smart-Proxy must run on the same host as the DHCP server.
If the proxy is managing a Microsoft DHCP server then set **dhcp_vendor** to **native_ms**. Smart-Proxy must then be run on an NT server so as to access the Microsoft native tools, though it does not have to be the same machine as the DHCP server. More details can be found at [[Foreman:Foreman Architecture]].

<pre>
:dhcp_vendor: isc
</pre>

The DHCP component needs access to the DHCP configuration file as well as the currently allocated leases. The section below shows these values for a RedHat client. In the case of a Smart-Proxy hosted on an Ubuntu machine then these values would be more appropriate: **/etc/dhcp3/dhcpd.conf** and **/var/lib/dhcp3/dhcpd.leases**

<pre>
:dhcp_config: etc/dhcpd.conf
:dhcp_leases: etc/dhcpd.leases
</pre>

**NOTE**: Make sure that the foreman proxy account can read both ISC configuration files.

If your **native_ms** implementation is slow then you can request that the smart proxy only operate on a subset of the subnets managed by the dhcp server.
<pre>
:dhcp_subnets: [192.168.1.0/255.255.255.0, 192.168.11.0/255.255.255.0]
</pre>
If you secured your DHCP with an "omapi_key", add the entries:
<pre>
:dhcp_key_name: omapi_key
:dhcp_key_secret: XXXXXXXX
</pre>

### Puppet Certificate Authority section

Activate the Puppet CA management module within the Smart-Proxy instance.

This should only be enabled in the Smart-Proxy that is hosted on the machine responsible for providing certificates to your puppet clients. You would expect to see a directory **/var/lib/puppet/ssl/ca** on such a host.
<pre>
:puppetca: true
</pre>

If your puppet SSL directory is located elsewhere, you'll need to set 'ssldir' as well.
<pre>
:ssldir: /etc/puppet/ssl
</pre>

<pre>
:puppetdir: /etc/puppet
</pre>

The proxy requires write access to the puppet autosign.conf file, which is usually owner and group puppet, and has mode 0644 according to the puppet defaults.

Ensure the foreman-proxy user is added to the puppet group ( e.g. `gpasswd -a foreman-proxy puppet` or `usermod -aG puppet foreman-proxy`)

puppet.conf:
<pre>
[master]
autosign = $confdir/autosign.conf {owner = service, group = service, mode = 664 }
</pre>


Sudo access to the proxy is required - in your sudoers file ensure you have the following lines:

For older puppet (pre-3.0) with separate sub-commands available:

<pre>
foreman-proxy ALL = NOPASSWD: /usr/sbin/puppetca *
Defaults:foreman-proxy !requiretty
</pre>

For newer monolithic puppet without separate commands (3.0-onwards)

<pre>
foreman-proxy ALL = NOPASSWD: /usr/bin/puppet cert *
Defaults:foreman-proxy !requiretty
</pre>


### Puppet section

Activate the puppet management module within the Smart-Proxy instance.

This should only be enabled in the Smart-Proxy that is hosted on the machine capable of executing *puppetrun*. This will be a puppetmaster.
This can also be set to true if you need to import puppet classes from the puppetmaster. Without this the import will not be possible

<pre>
:puppet: true
</pre>

<pre>
:puppet_conf: /etc/puppet/puppet.conf
# Defaults to %INSTALL_DIR%/.puppet/puppet.conf
</pre>

Sudo access to the proxy is required - in your sudoers file ensure you have the following lines:

<pre>
Defaults:foreman-proxy !requiretty
foreman-proxy ALL = NOPASSWD: /usr/bin/puppetrun
</pre>
If running puppet version 2.6+ you will need to use the following  (use /opt/puppet/bin/puppet for Puppet Enterprise)
<pre>
Defaults:foreman-proxy !requiretty
foreman-proxy ALL = NOPASSWD: /usr/bin/puppet
</pre>

**EDIT** In my case the account which was triggering puppetrun was not foreman-proxy but *foreman* itself. It took me some time to figure out why puppetruns are not triggered.

### Logging

The proxy's output is captured to the the **log_file** and may be filtered via the usual unix syslog levels:

* *WARN*
* *DEBUG*
* *ERROR*
* *FATAL*
* *INFO*
* *UNKNOWN*

See Ruby's [Logger class](http://www.ruby-doc.org/stdlib/libdoc/logger/rdoc/classes/Logger.html) for details.

<pre>
:log_file: /tmp/proxy.log
:log_level: DEBUG
</pre>

### 4.2.3 ISC_DHCP
ISC implementation is based on the omapi interface, which means:

* No need for root permissions on your DHCP server
* No need to restart (or "sync") your dhcp server after every modifications.


### Configuration

* dhcpd configuration file:
ensure you have the following line in your dhcpd.conf file (somewhere in the top first lines):
<pre>omapi-port 7911;</pre>
* configure the settings file to point to your dhcpd.conf and dhcpd.leases files (make sure they are readable by the smart-proxy user)
* make sure the omshell command (/usr/bin/omshell) can be executed by the smart-proxy user.
* make sure that /etc/dhcp and /etc/dhcp/dhcpd.conf has group foreman-proxy


### Securing the dhcp API

The dhcpd api server will listen to any host. You might need to add a omapi_key to provide basic security.

Example generating a key (on CentOS):
<pre>
yum install bind97
dnssec-keygen -r /dev/urandom -a HMAC-MD5 -b 512 -n HOST omapi_key
cat Komapi_key.+*.private |grep ^Key|cut -d ' ' -f2-
</pre>

1. Edit your "/etc/dhcpd.conf":

    <pre>
    omapi-port 7911;
    key omapi_key {
    algorithm HMAC-MD5;
    secret "XXXXXXXXX"; #<-The output from the generated key above.
    };
    omapi-key omapi_key;
    </pre>

2. Make sure you also add the omapi_key to your proxy's [[Smart-Proxy:Settingsyml#DHCP-section|settings.yml]]

3. Restart the dhcpd and foreman-proxy services

### Testing

If everything works, you could browse your dhcp server data if you goto http://proxy:8443/dhcp

The next step is to set up appropriate Subnets in Foreman from the settings menu.

### Sample dhcpd.conf
<pre>
ddns-update-style interim;
ignore client-updates;
authoritative;
allow booting;
allow bootp;

omapi-port 7911;
#Optional key:
key omapi_key {
        algorithm HMAC-MD5;
        secret "2wgoV3yukKdKMkmOzOn/hIsM97QgLTT4CLVzg9Zv0sWOSe1yxPxArmr7a/xb5DOJTm5e/9zGgtzL9FKna0NWis==";
}
omapi-key omapi_key;

subnet 10.1.1.0 netmask 255.255.255.0 {
# --- default gateway
  option routers      10.1.1.254;
  option subnet-mask  255.255.255.0;

  option domain-name    "domain.com";
  option domain-name-servers  10.1.1.1, 8.8.8.8;
  option log-servers    syslog;
  option ntp-servers    ntp;

  range dynamic-bootp 10.1.1.10 10.1.1.250;
  default-lease-time 21600;
  max-lease-time 43200;

}
</pre>

### 4.2.4 MS_DHCP
The Microsoft smart-proxy installation procedure is very basic compared to the RPM or APT based solution.

It is required that this procedure is executed as an administrator.

It is not required that the smart-proxy be on the same host as the MS dhcp server.  The smart-proxy just needs to be on a windows host that has netsh commands available.

1. Go to the smart-proxy repository at https://github.com/theforeman/smart-proxy
2. Select download and choose the latest revision
3. Extract this to a directory that does not have any spaces in its name.
4. Go to the rubyinstaller webpage at http://rubyinstaller.org/downloads/
5. Download and install the "ruby 1.8.7 release 334":http://rubyforge.org/frs/download.php/74293/rubyinstaller-1.8.7-p334.exe (Allow the ruby associations to be installed.)
6. Open a CMD window and, using *gem install --version X.X.X --platform ?????*, add these gems

<pre>
  columnize (0.3.2)
  highline (1.6.1)
  json (1.4.6 x86-mswin32)
  linecache (0.43 mswin32)
  mime-types (1.16)
  mocha (0.9.11)
  net-ping (1.3.7)
  rack (1.2.0)
  rake (0.8.7)
  rest-client (1.6.1)
  sinatra (1.1.0)
  tilt (1.1)
  win32-api (1.4.6 x86-mswin32-60)
  win32-open3 (0.3.2 x86-mswin32-60)
  win32-service (0.7.1 x86-mswin32-60)
  windows-api (0.4.0)
  windows-pr (1.1.2)
</pre>

Command to download them all:

<pre>
wget http://rubygems.org/downloads/columnize-0.3.2.gem \
     http://rubygems.org/downloads/haml-3.0.24.gem \
     http://rubygems.org/downloads/highline-1.6.1.gem \
     http://rubygems.org/downloads/json-1.4.6-x86-mswin32.gem \
     http://rubygems.org/downloads/linecache-0.43-mswin32.gem \
     http://rubygems.org/downloads/mime-types-1.16.gem \
     http://rubygems.org/downloads/mocha-0.9.11.gem \
     http://rubygems.org/downloads/net-ping-1.3.7.gem \
     http://rubygems.org/downloads/rack-1.2.0.gem \
     http://rubygems.org/downloads/rake-0.8.7.gem \
     http://rubygems.org/downloads/rest-client-1.6.1.gem \
     http://rubygems.org/downloads/sinatra-1.1.0.gem \
     http://rubygems.org/downloads/tilt-1.1.gem \
     http://rubygems.org/downloads/win32-api-1.4.6-x86-mswin32-60.gem \
     http://rubygems.org/downloads/win32-open3-0.3.2-x86-mswin32-60.gem \
     http://rubygems.org/downloads/win32-service-0.7.1-x86-mswin32-60.gem \
     http://rubygems.org/downloads/windows-api-0.4.0.gem \
     http://rubygems.org/downloads/windows-pr-1.1.2.gem
</pre>

To get it to work on Windows 2008 R2 some of the packages has to change

<pre>
 columnize (0.3.2)
 highline (1.6.1)
 json (1.4.6 x86-mingw32)
 linecache (0.43 mswin32)
 mime-types (1.16)
 mocha (0.9.11)
 net-ping (1.3.7)
 rack (1.2.0)
 rake (0.8.7)
 rest-client (1.6.1)
 sinatra (1.1.0)
 tilt (1.1)
 win32-api (1.4.6 x86-mingw32)
 win32-open3 (0.3.2 x86-mingw32)
 win32-service (0.7.1 x86-mswin32-60)
 windows-api (0.4.0)
 windows-pr (1.1.2)
</pre>

Easy copy and paste method (platform may be different for you.  Please check gem environment to find out.

<pre>
  gem install --version 0.3.2 --platform x86-mingw32 columnize
  gem install --version 1.6.1 --platform x86-mingw32 highline
  gem install --version 1.4.6 --platform x86-mingw32 json
  gem install --version 0.43 --platform x86-mingw32 linecache
  gem install --version 1.16 --platform x86-mingw32 mime-types
  gem install --version 0.9.11 --platform x86-mingw32 mocha
  gem install --version 1.3.7 --platform x86-mingw32 net-ping
  gem install --version 1.2.0 --platform x86-mingw32 rack
  gem install --version 0.8.7 --platform x86-mingw32 rake
  gem install --version 1.6.1 --platform x86-mingw32 rest-client
  gem install --version 1.1.0 --platform x86-mingw32 sinatra
  gem install --version 1.1 --platform x86-mingw32 tilt
  gem install --version 1.4.6 --platform x86-mingw32 win32-api
  gem install --version 0.3.2 --platform x86-mingw32 win32-open3
  gem install --version 0.7.1 --platform x86-mingw32-60 win32-service
  gem install --version 0.4.0 --platform x86-mingw32 windows-api
  gem install --version 1.1.2 --platform x86-mingw32 windows-pr
</pre>

Command to download them all:

<pre>
wget http://rubygems.org/downloads/columnize-0.3.2.gem \
     http://rubygems.org/downloads/haml-3.0.24.gem \
     http://rubygems.org/downloads/highline-1.6.1.gem \
     http://rubygems.org/downloads/json-1.4.6-x86-mingw32.gem \
     http://rubygems.org/downloads/linecache-0.43-mswin32.gem \
     http://rubygems.org/downloads/mime-types-1.16.gem \
     http://rubygems.org/downloads/mocha-0.9.11.gem \
     http://rubygems.org/downloads/net-ping-1.3.7.gem \
     http://rubygems.org/downloads/rack-1.2.0.gem \
     http://rubygems.org/downloads/rake-0.8.7.gem \
     http://rubygems.org/downloads/rest-client-1.6.1.gem \
     http://rubygems.org/downloads/sinatra-1.1.0.gem \
     http://rubygems.org/downloads/tilt-1.1.gem \
     http://rubygems.org/downloads/win32-api-1.4.6-x86-mingw32.gem \
     http://rubygems.org/downloads/win32-open3-0.3.2-x86-mingw32.gem \
     http://rubygems.org/downloads/win32-service-0.7.1-x86-mswin32-60.gem \
     http://rubygems.org/downloads/windows-api-0.4.0.gem \
     http://rubygems.org/downloads/windows-pr-1.1.2.gem
</pre>

8) CD to the root of the smart-proxy install directory

9) Edit config/settings.yml so that it looks a bit like this

_Sample config/settings.yml file_
<pre>
 ---
 # HTTPS settings
 :ssl_certificate: c:\documents\smart-proxy\config\signed.pem
 :ssl_private_key: c:\documents\smart-proxy\config\private.pem
 :ssl_ca_file:     c:\documents\smart-proxy\config\ca.pem

 :trusted_hosts: [ foreman.someware.com]

 :daemon: false


 # Enable DHCP management
 :dhcp: true
 # The vendor can be either isc or native_ms
 :dhcp_vendor: native_ms
 # The dhcp_server is only used by the native_ms implementation
 :dhcp_server: 172.29.90.240

 # Where our proxy log files are stored
 # filename or STDOUT
 # Unix setting
 #:log_file: log/proxy.log
 # Windows setting
 :log_file: c:\tmp\proxy.log
 # valid options are
 # Logger::WARN, Logger::DEBUG, Logger::Error, Logger::Fatal, Logger:INFO, LOGGER::UNKNOWN
 #:log_level: Logger::DEBUG
</pre>

10) Create the SSL key

10.1) Login to your puppetmaster

10.2) puppetca --generate _Smart-proxy FQDN_. (Do not use an alias here.)

10.3) Copy the private key, the public certificate and the ca.pem from /var/lib/puppet/ssl over to the locations that you specified in the setting file.

11) Test the installation by running ruby bin\smart-proxy.rb

12) Install the program as a service

12.1) ruby extra\register-service.rb

12.2) This may install the service but not run it. If so then try to start the service from the Ordinary Microsoft services snapin utility.

13) You may test connectivity by running the *extra\query.rb* utility from your foreman host. (Note that this file comes from the _extra_ directory in the smart-proxy release.)

### 4.2.5 Bind

Bind configuration manipulation is based on nsupdate, which means that in theory could also be used to manipulate other dns servers which support nsupdate (such as Microsoft DNS server).

### Configuration

In order to communicate securely with your dns server, you would need a key which will be used by nsupdate and your named daemon using ddns-confgen or dnssec-keygen

### example using ddns-confgen

execute 'ddns-confgen -k foreman -a hmac-md5' - this should output something like the following:

<pre>
# To activate this key, place the following in named.conf, and
# in a separate keyfile on the system or systems from which nsupdate
# will be run:
key "foreman" {
        algorithm hmac-md5;
        secret "GGd1oNCxaKsh8HA84sP1Ug==";
};

# Then, in the "zone" statement for each zone you wish to dynamically
# update, place an "update-policy" statement granting update permission
# to this key.  For example, the following statement grants this key
# permission to update any name within the zone:
update-policy {
        grant foreman zonesub ANY;
};

# After the keyfile has been placed, the following command will
# execute nsupdate using this key:
nsupdate -k <keyfile>
</pre>

You should create a new file (such as /etc/rndc.key or other) and store the key "foreman {...} in it.
in the proxy Settings file you should point to this file location - make sure that the proxy have read permissions to this file.

In your named file, you could add the update-policy statement or something like this [named example file](http://theforeman.org/projects/smart-proxy/wiki/Named_example_file) if you need more fine grained permissions.

### 4.2.6 SSL

The smart proxy can work in SSL mode, where both sides verify and trust each other.

### Configure SSL certificates

This request will only be accepted if the SSL certificates match. Therefore the client's private key grants access to proxy's funtionality, so protect it.

As this tool is meant to interoperate with a puppet installation I suggest that you use the Certificate Authority provided by a puppet server as your CA.

1. Login to your puppetmaster, which has a Certificate Authority

2. Use the puppet tools to create a new certificate

    <pre>puppetca --generate <proxy-FQDN> </pre>

3. Copy the certificate keys to your Windows host

    <pre>
      scp puppetmaster:/var/lib/puppet/ssl/ca/signed/<proxy-FQDN>.pem signed.pem
      scp puppetmaster:/var/lib/puppet/ssl/private_keys/<proxy-FQDN>.pem private.pem</pre>

4. Copy the ssl/certs/ca.pem from any puppet client to the smart-proxy\config directory. This ensures that the proxy trusts the same CA as a puppet client.

### Example 2
The above instructions kind of confused me.  I think they are for when you are trying to use smart-proxy on a system that isn't normally managed by puppet but you want to use the puppet CA.

In my instance my smart-proxy was already managed by puppet, so certs already existed on the system.  My puppet certdir was /etc/puppet/ssl so I just had to edit the smart-proxy settings.yml (/etc/foreman-proxy/settings.yml on my system) to reference the paths:

SNIPPET of settings.yml:
<pre>
---
# SSL Setup

# if enabled, all communication would be verfied via SSL
# NOTE that both certificates need to be signed by the same CA in order for this to work
# see http://theforeman.org/projects/smart-proxy/wiki/SSL for more information
:ssl_certificate: /etc/puppet/ssl/certs/FQDN.pem
:ssl_ca_file: /etc/puppet/ssl/certs/ca.pem
:ssl_private_key: /etc/puppet/ssl/private_keys/FQDN.pem
# the hosts which the proxy accepts connections from
# commenting the following lines would mean every verified SSL connection allowed
:trusted_hosts:
- foreman.corp.com
#- foreman.dev.domain
</pre>

Of course if you have a smart-proxy module in puppet to manage your smart-proxies you can template it out like:
<pre>
:ssl_certificate: /etc/puppet/ssl/certs/<%= @fqdn %>.pem
:ssl_ca_file: /etc/puppet/ssl/certs/ca.pem
:ssl_private_key: /etc/puppet/ssl/private_keys/<%= @fqdn %>.pem

:trusted_hosts:
- <%= foreman_server %>
</pre>

### Troubleshooting

<pre>
  Unable to save
  Unable to communicate with the proxy: No such file or directory - /.puppet/var/ssl/certs/foremanserver.domainname.corp.pem
  Please check the proxy is configured and running on the host before saving.
</pre>

Workaround
<pre>
  mkdir /.puppet
  ln -s /var/lib/puppet/ /.puppet/var
  add foreman, foreman-proxy to puppet group
  chmod -R 640 /var/lib/puppet/ssl/private_keys
  chgrp -R puppet /var/lib/puppet/ssl/private_keys
</pre>

### Example 2 Continued
I also ran into this issue ... here is my breakdown of it.

This seems to stem from the foreman webserver needing access to it's certificate.  It looks for it down the webuser home directory for .puppet which somewhat is supposed to mimic the puppetdir.

So for my SLES system which:
* Webuser - wwwrun
* Webuser homedir - /var/lib/wwwrun
* Puppet dir - /etc/puppet

Looks in /var/lib/wwwrun/.puppet/ssl/certs

So I needed to do the following on my foreman web server:
<pre>
  add wwwrun to puppet group
  cd /var/lib/wwwrun
  ln -s /etc/puppet .puppet
  chgrp -R puppet /etc/puppet/ssl/private_keys
  chmod 640 /etc/puppet/ssl/private_keys/*
</pre>

### 4.2.7 TFTP

An essential first step in netbooting a system is preparing the TFTP server with the PXE configuration file and boot images.  This document assumes that you have already configured your DHCP infrastructure, either via manual configuration or through the DHCP smart proxy.

### Configuration Values

Once enabled, there is currently only one valid setting to change, the default TFTP root.  This is set with the *:tftproot:* parameter, which defaults to */var/lib/tftpboot*.

Foreman tries to guess the right server name that should put into the dhcp record, if this is not what you want, you can override it - see
*tftp_servername* under [Settings.yml](4.3.2_smartproxy_settings.html).

### Setting Up the Proxy Server Host

Regardless of the filesystem setup is performed, you must also make sure you have the wget utility installed and in the default path.  *wget* is used to download OS specific installation when a given host is enabled for the build process.

### Automatic Setup

Foreman includes a [TFTP server module](https://github.com/theforeman/puppet-foreman_proxy/blob/master/manifests/tftp.pp) that will perform all of the basic setup.  It defaults to TFTP root of */var/lib/tftpboot*, which may change if necessary.  You will still need to provide the basic TFTP load images in your TFTP root directory.  For vanilla PXE booting, this includes *pxelinux.0*, *menu.c32*, and *chain.c32*.

### Manual Setup

The setup is very simple, and may be performed manually if desired.

1. The TFTP root directory must exist (we will use */var/lib/tftpboot* in this example).
2. Populate */var/lib/tftpboot* with PXE booting prerequisites.  At a minimum, this should include:
    * *pxelinux.0*
    * *menu.c32*
    * *chain.c32*
3. Create the directory */var/lib/tftpboot/boot* and make it writeable by the foreman proxy user (foreman-proxy, for instance, when installing through a rpm package).
4. Create the directory */var/lib/tftpboot/pxelinux.cfg* and make it writeable by the foreman proxy user (foreman-proxy).

### Setting Up Foreman

In most cases, the default templates should work fine.  You do, however, need to make sure that a PXELinux or gPXE template is associated with your hosts.  See [[Foreman:Unattended_installations|Unattended Installations]] for details.  The template will be used to define the PXE configuration file when a host is enabled for build.

### Workflow

This is a rough outline of the steps triggered on the TFTP smart proxy host when you click on the "Build" link for a host.

1. Call *mkdir -p /var/lib/tftpboot/pxelinux.cfg* if it does not already exist.
2. Create a host-specific TFTP configuration file in */var/lib/tftpboot/pxelinux.cfg/01-XX-XX-XX-XX-XX-XX*, named based off of the MAC address, using the associated PXE template.
3. Call *mkdir -p /var/lib/tftpboot/boot* if it does not already exist.
4. Download the OS specific kernel and initrd files using wget.
    1. The download URLs are derived from the installation media path, and OS specific log (see *app/models/redhat.rb* and *debian.rb* in foreman for examples of the gory details).
    2. The *debian.rb* file tries to guess if you want Ubuntu or Debian, based on the Name you give to your OS in the UI. If the name does not contain 'ubuntu' or 'debian', it may default to debian, hence fail to fetch the kernel/initrd.
5. The exact wget command is
    <pre>wget --no-check-certificate -nv -c <src> -O "<destination>"</pre>
6. At this point, the TFTP state is ready for the installation process.
7. Once the host has completed installation, the OS specific installation script should inform foreman by retrieving the built URL.
8. The host-specific TFTP configuration file is deleted.
9. The kernel and initrd are not deleted, but left in place for future installs of the same OS and architecture combination.  Please note that in the unlikely case that these files are modified, the simplistic freshness check of wget will likely get confused, corrupting the downloaded versions of the files.  If this happens, you should simply delete the files and let them be re-downloaded from scratch.

### Limitations

At the moment, the proxy is not able to fetch boot files using NFS.
As a workaround, expose your installation medium (or use a public mirror) over http/ftp to configure one machine with the require boot files.
this would be resolved as part of #992.

#### ---------  the following section needs update -----------------
## 4.4 Provisioning
### 4.4.1 Operating Systems
### 4.4.2 Installation Media
### 4.4.3 Provisioning Templates
### 4.4.4 Partition Tables
#5. Advanced Foreman
## 5.1 API
## 5.2 Compute Resources
## 5.3 Install Locations
#### ----------- end of section needs update -----------------------

# 6. Troubleshooting
There are two primary methods of getting support for the Foreman: IRC and mailing lists.

### IRC
We work on the [irc.freenode.net](http://webchat.freenode.net/) servers. You can get general support in #theforeman, while development chat takes place in #theforeman-dev.

### Mailing lists
Mailing lists are available via Google Groups. Much like IRC, we have a general users (support, Q/A, etc) lists and a development list:

* [foreman-users](https://groups.google.com/forum/?fromgroups#!forum/foreman-users)
* [foreman-dev](https://groups.google.com/forum/?fromgroups#!forum/foreman-users)
