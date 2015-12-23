---
layout: plugin
title: Plugins
version: '1.10'
---

# 1. Plugins


Plugins are tools to extend and modify the functionality of Foreman, Smart Proxy and Hammer CLI. The core Foreman applications are designed to be lean, to maximize flexibility and to minimize code bloat. Plugins offer custom functions and features so that each user can tailor their environment to their specific needs.

A plugin project may consist of a single Foreman or Smart Proxy plugin, or often a Foreman plugin, Smart Proxy plugin, and a Hammer CLI plugin working together.

Foreman plugins are implemented as [Rails engines](http://guides.rubyonrails.org/engines.html), and Foreman, Smart Proxy and Hammer CLI plugins are all packaged as [gems](http://guides.rubygems.org/what-is-a-gem/), RPMs and Debian packages.

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
		<a href="plugins/foreman_chef" class="btn-doc btn">
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
		<a href="plugins/foreman_cockpit/" class="btn-doc btn">
			<p class='h2 doc-icon'><i class="fa fa-rocket"></i></p>
			Cockpit
		</a>
	</div>
	<div class='col-md-3 center'>
		<a href="https://github.com/theforeman/foreman_default_hostgroup/" class="btn-doc btn">
			<p class='h2 doc-icon'><i class="fa fa-check-circle"></i></p>
			Default host group
		</a>
	</div>
	<div class='col-md-3 center'>
		<a href="https://github.com/theforeman/foreman-digitalocean/" class="btn-doc btn">
			<p class='h2 doc-icon'><i class="fa fa-pencil"></i></p>
			Digitalocean
		</a>
	</div>
	<div class='col-md-3 center'>
		<a href="plugins/foreman_discovery" class="btn-doc btn">
			<p class='h2 doc-icon'><i class="fa fa-wifi"></i></p>
			Discovery
		</a>
	</div>
	<div class='col-md-3 center'>
		<a href="plugins/foreman_docker" class="btn-doc btn">
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
		<a href="plugins/foreman_openscap" class="btn-doc btn">
			<p class='h2 doc-icon'><i class="fa fa-bank"></i></p>
			OpenSCAP
		</a>
	</div>
	<div class='col-md-3 center'>
		<a href="plugins/foreman_remote_execution" class="btn-doc btn">
			<p class='h2 doc-icon'><i class="fa fa-toggle-right"></i></p>
			Remote Execution
		</a>
	</div>
	<div class='col-md-3 center'>
		<a href="plugins/foreman_salt" class="btn-doc btn">
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

## 1.2 More plugins

Full lists of plugins are available:

* [Foreman plugins](http://projects.theforeman.org/projects/foreman/wiki/List_of_Plugins)
* [Smart proxy plugins](http://projects.theforeman.org/projects/foreman/wiki/List_of_Smart-Proxy_Plugins)
* [Hammer CLI plugins](http://projects.theforeman.org/projects/hammer-cli/wiki/List_of_Plugins)

# 2. Installation

Foreman, Smart Proxy and Hammer CLI plugins are packaged as [gems](http://guides.rubygems.org/what-is-a-gem/), but the Foreman project provides RPMs and Debian packages to ease installation with standard Foreman packages. See below for the different installation methods, which depend on your platform.

The number of plugins available in the project repositories is increasing, so check the [wiki](http://projects.theforeman.org/projects/foreman/wiki/List_of_Plugins) to see if a package is available yet.  If it's an useful or popular plugin and not yet packaged, please file a feature request in [the packaging project](http://projects.theforeman.org/projects/rpms/issues/new).

## 2.1 Using the Foreman installer

Some plugins can be installed using the Foreman installer, which can help with additional configuration that the plugin may require, e.g. config files or services.

To see which plugins the installer can set up, run:

    # foreman-installer --help | grep enable-
        --[no-]enable-foreman-plugin-discovery Enable 'foreman_plugin_discovery' puppet module (default: false)
        --[no-]enable-foreman-plugin-docker Enable 'foreman_plugin_docker' puppet module (default: false)
        --[no-]enable-foreman-plugin-hooks Enable 'foreman_plugin_hooks' puppet module (default: false)

Run the installer with the extra `--enable...` argument to add the plugin.  Any arguments given when Foreman was first installed will be kept the same, saved in the installer answers file.

Note that the installer will enforce the state of all managed configuration files, so manual changes will be reverted.  Use `--noop -v` first to check for any unexpected changes.

    foreman-installer --noop -v --enable-foreman-plugin-discovery

Run again without noop to make the changes:

    foreman-installer --enable-foreman-plugin-discovery

Some plugins have additional parameters, which can be changed using `foreman-installer -i` for interactive mode or found in the `foreman-installer --help` output.

## 2.2 Package installation

#### Select operating system

<script type="text/javascript">
function update_installation_os(select) {
  var os = select.value;
  $(".installation_os").hide();
  if (os && os != 'none') {
    $(".installation_os_"+os).show();
  } else {
    $(".installation_os_none").show();
  }
}
</script>

To provide specific installation instructions, please select your operating system:
<select onChange="update_installation_os(this);">
  <option value="none">-- select operating system --</option>
  <option value="debian">Debian or Ubuntu</option>
  <option value="el6">Enterprise Linux 6</option>
  <option value="el7">Enterprise Linux 7</option>
  <option value="fedora19">Fedora 19</option>
</select>

<div class="installation_os installation_os_none">
  <i>No operating system selected.</i>
</div>

<div class="installation_os installation_os_el6 installation_os_el7 installation_os_fedora19">
  <p>
    The repositories are available at <a href="http://yum.theforeman.org/plugins/">yum.theforeman.org/plugins</a>.  Separate repositories are available for each Foreman release, containing plugins that are compatible with that particular version.  Packages are not currently GPG signed.
  </p>

  <p>
    If not already configured by foreman-release, add the repo by creating <code>/etc/yum.repos.d/foreman-plugins.repo</code> with the following content:
  </p>
</div>

<div class="installation_os installation_os_el6">
<pre>
[foreman-plugins]
name=Foreman plugins
baseurl=http://yum.theforeman.org/plugins/{{page.version}}/el6/x86_64/
enabled=1
gpgcheck=0
</pre>
</div>

<div class="installation_os installation_os_el7">
<pre>
[foreman-plugins]
name=Foreman plugins
baseurl=http://yum.theforeman.org/plugins/{{page.version}}/el7/x86_64/
enabled=1
gpgcheck=0
</pre>
</div>

<div class="installation_os installation_os_fedora19">
<pre>
[foreman-plugins]
name=Foreman plugins
baseurl=http://yum.theforeman.org/plugins/{{page.version}}/f19/x86_64/
enabled=1
gpgcheck=0
</pre>
</div>

<div class="installation_os installation_os_debian">
  <p>
    The repositories are available at <code>http://deb.theforeman.org plugins &lt;version&gt;</code>. Separate repositories are available for each Foreman release, containing plugins that are compatible with that particular version. They are signed with the Foreman APT key.
  </p>

  <p>
    If not already configured, add the repo by editing <code>/etc/apt/sources.list.d/foreman.repo</code> and adding the following line:
  </p>

<pre>
deb http://deb.theforeman.org/ plugins {{page.version}}
</pre>
</div>

<div class="installation_os installation_os_el6 installation_os_el7 installation_os_fedora19">
  <p>
    Change the version number in the URL to match the Foreman release in use.
  </p>

  <p>
    To install a plugin:
  </p>

  <ol>
    <li>Find the package for the plugin with the search function: <code>yum search discovery</code> or by checking the plugin documentation.</li>
    <li>Install the package, e.g. <code>yum install tfm-rubygem-foreman_discovery</code>.</li>
    <li>Restart Foreman with <code>touch ~foreman/tmp/restart.txt</code> or <code>service httpd restart</code></li>
  </ol>

  <p>
    Some plugins (e.g. foreman_column_view) may also require configuration in <code>/etc/foreman/plugins/</code>, check for any .example files.  Smart proxy plugins can be configured in <code>/etc/foreman-proxy/settings.d/</code>.
  </p>
</div>

<div class="installation_os installation_os_debian">
  <p>
    To install a plugin:
  </p>

  <ol>
    <li>Find the package for the plugin: <code>apt-cache search discovery</code></li>
    <li>Install the package, e.g. <code>apt-get install ruby-foreman-discovery</code></li>
    <li>Restart Foreman: <code>touch ~foreman/tmp/restart.txt</code> or <code>service apache2 restart</code></li>
  </ol>

  <p>
    Some plugins (e.g. foreman_column_view) may also require configuration in <code>/etc/foreman/plugins/</code>, check for any .example files.  Smart proxy plugins can be configured in <code>/etc/foreman-proxy/settings.d/</code>.
  </p>
</div>

<div class="installation_os installation_os_el6 installation_os_el7">
  <p>
    The naming of packages is as follows:
  </p>

  <ul>
    <li>Packages for Foreman 1.10 or newer have a <code>tfm-rubygem-foreman_</code> codefix, while packages for Foreman 1.9 or older will have a <code>ruby193-rubygem-foreman_</code> codefix instead.  Adapt any instructions to suit.</li>
    <li>Smart proxy packages have a <code>rubygem-smart_proxy_</code> codefix.</li>
    <li>Hammer CLI packages for Foreman 1.10 or newer have a <code>tfm-rubygem-hammer_cli_</code> codefix, while CLI packages for 1.9 or older will have a <code>rubygem-hammer_cli_</code> codefix only.</li>
  </ul>
</div>

<div class="installation_os installation_os_fedora19">
  <p>
    The naming of packages is as follows:
  </p>

  <ul>
    <li>Foreman plugin packages have a <code>rubygem-foreman_</code> codefix.  Adapt any instructions to suit.</li>
    <li>Smart proxy packages have a <code>rubygem-smart_proxy_</code> codefix.</li>
    <li>Hammer CLI packages have a <code>rubygem-hammer_cli_</code> codefix.</li>
  </ul>
</div>

<div class="installation_os installation_os_debian">
  <p>
    The naming of packages is as follows:
  </p>

  <ul>
    <li>Packages for Foreman have a <code>ruby-foreman-</code> codefix.</li>
    <li>Smart proxy packages have a <code>ruby-smart-proxy-</code> codefix.</li>
    <li>Hammer CLI packages have a <code>ruby-hammer-cli-</code> codefix.</li>
  </ul>
</div>

## 2.3 Advanced Installation from Gems

Not recommended, as it's possible for the 'gem' command to install other, newer dependencies, which can cause problems with the Foreman installation. Do note the install without dependencies below to avoid this problem.

Ensure the plugin you want is available from rubygems.org as a gem. Plugins that aren't published (just git repos) can't be installed with this method without being built as a gem.

### 2.3.1 Red Hat distributions

If on EL6 or EL7, run `scl enable tfm bash` first for an SCL-enabled shell (not needed on Fedora).  On Foreman 1.9 or older, use `scl enable ruby193 bash` instead.

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
* [Hammer CLI developer documentation](https://github.com/theforeman/hammer-cli/blob/master/doc/developer_docs.md)

The Foreman development [mailing list and IRC channels]({{site.baseurl}}support.html) can be of help for plugin developers.

<hr/>
