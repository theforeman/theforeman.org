
Plugins are tools to extend and modify the functionality of Foreman. The core of Foreman is designed to be lean, to maximize flexibility and minimize code bloat. Plugins offer custom functions and features so that each user can tailor their environment to their specific needs. Foreman plugins are implemented as [rail engines](http://guides.rubyonrails.org/engines.html) that are packaged as [gems](http://guides.rubygems.org/what-is-a-gem/) and thus easily installed into Foreman.

### 6.1 Install a Plugin

Foreman plugins are implemented as [gems](http://guides.rubygems.org/what-is-a-gem/) in [Ruby on Rails](http://www.rubyonrails.org). See below for the different installation methods, which depend on your platform.

#### RPM installations

A limited number of plugins are available fully packaged from our yum repositories for ease of use. The number of these is increasing, so check the [wiki](http://projects.theforeman.org/projects/foreman/wiki/List_of_Plugins) to see if a package is available yet.  If it's a useful or popular plugin and not yet packaged, please file a feature request in [the packaging project](http://projects.theforeman.org/projects/rpms/issues/new).
The repos are available at [yum.theforeman.org/plugins](http://yum.theforeman.org/plugins/).  Separate repos are available for each Foreman release, containing plugins that are compatible with that particular version.  Packages are not currently GPG signed.

Configure the repo by creating /etc/yum.repos.d/foreman_plugins.repo:

<pre>
[foreman-plugins]
name=Foreman plugins
baseurl=http://yum.theforeman.org/plugins/{{page.version}}/el6/x86_64/
enabled=1
gpgcheck=0
</pre>

Find the package for the plugin: <pre>yum search rubygem-foreman</pre>
Install the package, e.g. <pre>yum install ruby193-rubygem-foreman_discovery</pre>
Restart Foreman with `service foreman restart`

Some plugins (e.g. foreman_column_view) may also require configuration in `/usr/share/foreman/config/settings.plugins.d/`, check for any .example files.

#### Debian installations

A limited number of plugins are available fully packaged from our deb repositories for ease of use. The number of these is increasing, so check the list of plugins to see if a Debian package is available yet. If it's a useful or popular plugin and not yet packaged, please file a feature request in [the packaging project](http://projects.theforeman.org/projects/rpms/issues/new).

The repo is available at `http://deb.theforeman.org plugins main`. There is only one component (main) for all plugins at this time. They are signed with the Foreman APT key.

1. Add a source line like this: `deb http://deb.theforeman.org/ plugins main` to Apt
2. Find the package for the plugin: `apt-cache search ruby-foreman`
3. Install the package, e.g. `apt-get install ruby-foreman-discovery`
4. Restart Foreman: `touch ~foreman/tmp/restart.txt` or `service apache2 restart`

Some plugins (e.g. foreman_column_view) may also require configuration in `/usr/share/foreman/config/settings.plugins.d/`, check for any .example files.

#### Advanced: installing from gems

Not recommended, as it's possible for the 'gem' command to try and install newer versions of Rails which can cause problems. Do note the install without dependencies below to avoid this problem.
Ensure the plugin you want is available from rubygems.org as a gem. Plugins that aren't published (just git repos) can't be installed with this method without being built as a gem.

If on EL6, run <pre>scl enable ruby193 bash</pre> first for an SCL-enabled shell (not needed on Fedora)
Install *without* dependencies: <pre>gem install --ignore-dependencies foreman_column_view</pre>
If you need other dependencies (see the rubygems.org page), check the yum repo above (e.g. deface, nokogiri) or install the same way with 'gem'
Add to the `bundler.d/Gemfile.local.rb` file as detailed below.

Restart Foreman with `service foreman restart`

If you hit problems, uninstall the added gems with <pre>gem uninstall -v VERSION GEM</pre>

#### Debian package or "from source" installations

It is recommended to use `~foreman/bundler.d/Gemfile.local.rb` so that it is not overwritten by future upgrades.
If it's published on rubygems.org, just add the name and the latest released version will be downloaded.  Add to bundler.d/Gemfile.local.rb:
<pre>gem 'foreman_sample_plugin'</pre>

Or bundler can install the plugin from a git repository.  Add to bundler.d/Gemfile.local.rb:
<pre>gem 'foreman_sample_plugin', :git => "https://github.com/example/foreman_sample_plugin.git"</pre>

Next, as a Foreman user (not root), run the following command:
<pre>$ bundle update foreman_sample_plugin</pre>

Then restart Foreman with `touch ~foreman/tmp/restart.txt`

### 6.2 Plugin List
An up-to-date plugin list is kept in the [wiki](http://projects.theforeman.org/projects/foreman/wiki/List_of_Plugins)

