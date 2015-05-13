---
layout: plugin
title: Plugins
---

# 1. Plugins


Plugins are tools to extend and modify the functionality of Foreman. The core of Foreman is designed to be lean, to maximize flexibility and to minimize code bloat. Plugins offer custom functions and features so that each user can tailor their environment to their specific needs. Foreman plugins are implemented as [Rails engines](http://guides.rubyonrails.org/engines.html) that are packaged as [gems](http://guides.rubygems.org/what-is-a-gem/) and thus easily installed into Foreman.

## 1.1 Popular Plugins
------------------------

<div class='row'>
	<div class='col-md-3 center'>
		<a href="https://github.com/theforeman/foreman_bootdisk" class="btn-doc btn">
			<p class='h2 doc-icon'><i class="fa fa-floppy-o"></i></p>
			Bootdisk
		</a>
	</div>
	<div class='col-md-3 center'>
		<a href="plugins/foreman_chef/0.1" class="btn-doc btn">
			<p class='h2 doc-icon'><i class="fa fa-cutlery"></i></p>
			Chef
		</a>
	</div>
	<div class='col-md-3 center'>
		<a href="https://github.com/GregSutcliffe/foreman_column_view" class="btn-doc btn">
			<p class='h2 doc-icon'><i class="fa fa-bar-chart"></i></p>
			Column view
		</a>
	</div>
	<div class='col-md-3 center'>
		<a href="https://github.com/theforeman/foreman_default_hostgroup/" class="btn-doc btn">
			<p class='h2 doc-icon'><i class="fa fa-check-circle"></i></p>
			Default host group
		</a>
	</div>
</div>
<div class='row'>
	<div class='col-md-3 center'>
		<a href="https://github.com/theforeman/foreman-digitalocean/" class="btn-doc btn">
			<p class='h2 doc-icon'><i class="fa fa-pencil"></i></p>
			Digitalocean
		</a>
	</div>
	<div class='col-md-3 center'>
		<a href="plugins/foreman_discovery/" class="btn-doc btn">
			<p class='h2 doc-icon'><i class="fa fa-wifi"></i></p>
			Discovery
		</a>
	</div>
	<div class='col-md-3 center'>
		<a href="https://github.com/theforeman/foreman-docker/" class="btn-doc btn">
			<p class='h2 doc-icon'><i class="fa fa-ship"></i></p>
			Docker
		</a>
	</div>
	<div class='col-md-3 center'>
		<a href="https://github.com/theforeman/foreman_graphite" class="btn-doc btn">
			<p class='h2 doc-icon'><i class="fa fa-bar-chart"></i></p>
			Graphite
		</a>
	</div>
</div>
<div class='row'>
	<div class='col-md-3 center'>
		<a href="https://github.com/theforeman/foreman_hooks" class="btn-doc btn">
			<p class='h2 doc-icon'><i class="fa fa-anchor"></i></p>
			Hooks
		</a>
	</div>
	<div class='col-md-3 center'>
		<a href="http://katello.org/" class="btn-doc btn">
			<p class='h2 doc-icon'><i class="fa fa-cloud-upload"></i></p>
			Katello
		</a>
	</div>
	<div class='col-md-3 center'>
		<a href="https://github.com/theforeman/foreman_memcache" class="btn-doc btn">
			<p class='h2 doc-icon'><i class="fa fa-tasks"></i></p>
			Memcache
		</a>
	</div>
	<div class='col-md-3 center'>
		<a href="https://github.com/OpenSCAP/foreman_openscap/" class="btn-doc btn">
			<p class='h2 doc-icon'><i class="fa fa-bank"></i></p>
			OpenSCAP
		</a>
	</div>
</div>
<div class='row'>
	<div class='col-md-3 center'>
		<a href="plugins/foreman_salt/" class="btn-doc btn">
			<p class='h2 doc-icon'><i class="fa fa-cube"></i></p>
			Salt
		</a>
	</div>
	<div class='col-md-3 center'>
		<a href="https://github.com/theforeman/foreman_setup" class="btn-doc btn">
			<p class='h2 doc-icon'><i class="fa fa-sun-o"></i></p>
			Setup
		</a>
	</div>
	<div class='col-md-3 center'>
		<a href="https://github.com/theforeman/foreman_templates" class="btn-doc btn">
			<p class='h2 doc-icon'><i class="fa fa-file"></i></p>
			Templates
		</a>
	</div>
	<div class='col-md-3 center'>
		<a href="https://github.com/theforeman/puppetdb_foreman" class="btn-doc btn">
			<p class='h2 doc-icon'><i class="fa fa-database"></i></p>
			PuppetDB
		</a>
	</div>
</div>
<div class='row'>
	<div class='col-md-3 center'>
		<a href="https://github.com/theforeman/foreman-xen" class="btn-doc btn">
			<p class='h2 doc-icon'><i class="fa fa-dashboard"></i></p>
			Xen
		</a>
	</div>
 	<div class='col-md-3 center'>
		<a href="http://projects.theforeman.org/projects/foreman/wiki/List_of_Plugins" class="btn-doc btn">
			<p class='h2 doc-icon'><i class="fa fa-plus"></i></p>
      More
		</a>
	</div>
</div>

# 2. Installation

Foreman plugins are implemented as [gems](http://guides.rubygems.org/what-is-a-gem/) in [Ruby on Rails](http://www.rubyonrails.org). See below for the different installation methods, which depend on your platform.

## 2.1 RPM installations

A limited number of plugins are available fully packaged from our yum repositories for ease of use. The number of these is increasing, so check the [wiki](http://projects.theforeman.org/projects/foreman/wiki/List_of_Plugins) to see if a package is available yet.  If it's a useful or popular plugin and not yet packaged, please file a feature request in [the packaging project](http://projects.theforeman.org/projects/rpms/issues/new).

The repos are available at [yum.theforeman.org/plugins](http://yum.theforeman.org/plugins/).  Separate repos are available for each Foreman release, containing plugins that are compatible with that particular version.  Packages are not currently GPG signed.

* Find the package for the plugin: `yum search rubygem-foreman` or `yum search rubygem-smart_proxy`
* Install the package, e.g. `yum install ruby193-rubygem-foreman_discovery`
* Restart Foreman with `service foreman restart`

Some plugins (e.g. foreman_column_view) may also require configuration in `/usr/share/foreman/config/settings.plugins.d/`, check for any .example files.

## 2.2 Debian installations

A limited number of plugins are available fully packaged from our deb repositories for ease of use. The number of these is increasing, so check the list of plugins to see if a Debian package is available yet. If it's a useful or popular plugin and not yet packaged, please file a feature request in [the packaging project](http://projects.theforeman.org/projects/rpms/issues/new).

The repo is available at `http://deb.theforeman.org plugins <component>`. Separate repos are available for each Foreman release, containing plugins that are compatible with that particular version. They are signed with the Foreman APT key.

* Add a source line like this to apt:
<pre>deb http://deb.theforeman.org/ plugins 1.8</pre>
* Find the package for the plugin: `apt-cache search ruby-foreman`
* Install the package, e.g. `apt-get install ruby-foreman-discovery`
* Restart Foreman: `touch ~foreman/tmp/restart.txt` or `service apache2 restart`

Some plugins (e.g. foreman_column_view) may also require configuration in `/usr/share/foreman/config/settings.plugins.d/`, check for any .example files.

## 2.3 Advanced Installation from Gems

Not recommended, as it's possible for the 'gem' command to try and install newer versions of Rails which can cause problems. Do note the install without dependencies below to avoid this problem.
Ensure the plugin you want is available from rubygems.org as a gem. Plugins that aren't published (just git repos) can't be installed with this method without being built as a gem.

### 2.3.1 Red Hat distributions

If on EL6, run `scl enable ruby193 bash` first for an SCL-enabled shell (not needed on Fedora).

* Install *without* dependencies: `gem install --ignore-dependencies foreman_column_view`
* If you need other dependencies (see the rubygems.org page), check the yum repo above (e.g. deface, nokogiri) or install the same way with 'gem'
* Add to the `bundler.d/Gemfile.local.rb` file as detailed below.
* Restart Foreman with `service foreman restart`

If you hit problems, uninstall the added gems with <pre>gem uninstall -v VERSION GEM</pre>

### 2.3.2 Debian distributions

It is recommended to use `~foreman/bundler.d/Gemfile.local.rb` so that it is not overwritten by future upgrades.

* If it's published on rubygems.org, just add the name and the latest released version will be downloaded. Add to bundler.d/Gemfile.local.rb:
<pre>gem 'foreman_sample_plugin'</pre>
* Or bundler can install the plugin from a git repository.  Add to bundler.d/Gemfile.local.rb:
<pre>gem 'foreman_sample_plugin', :git => "https://github.com/example/foreman_sample_plugin.git"</pre>
* Next, as a Foreman user (not root), run the following command: `$ bundle update foreman_sample_plugin`
* Then restart Foreman with `touch ~foreman/tmp/restart.txt`

# 3. Writing Your Own

More information about writing your own plugins is available in the wiki:

* [How to Create a Foreman Plugin](http://projects.theforeman.org/projects/foreman/wiki/How_to_Create_a_Plugin)
* [How to Create a Smart Proxy Plugin](http://projects.theforeman.org/projects/foreman/wiki/How_to_Create_a_Smart-Proxy_Plugin)

<hr/>
