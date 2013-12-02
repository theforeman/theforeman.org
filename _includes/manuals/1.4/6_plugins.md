
Plugins are tools to extend and modify the functionality of Foreman. This article contains a list of plugins by category, and links to other plugin repositories. The core of Foreman is designed to be lean, to maximize flexibility and minimize code bloat. Plugins offer custom functions and features so that each user can tailor their environment to their specific needs. Foreman plugins are implemented as [rail engines](http://guides.rubyonrails.org/engines.html) that are packaged as [gems](http://guides.rubygems.org/what-is-a-gem/) and thus easily installed into Foreman.

### 6.1 Install a Plugin

Foreman plugins are implemented as [gem](http://guides.rubygems.org/what-is-a-gem/) in [Ruby on Rails](http://www.rubyonrails.org). See below for the different installation methods, which depend on your platform.

#### RPM installations

A limited number of plugins are available fully packaged from our yum repositories for ease of use. The number of these is increasing, so check the [wiki](http://projects.theforeman.org/projects/foreman/wiki/List_of_Plugins) to see if a package is available yet.  If it's a useful or popular plugin and not yet packaged, please file a feature request in [the packaging project](http://projects.theforeman.org/projects/rpms/issues/new).
The repos are available at [yum.theforeman.org/plugins](http://yum.theforeman.org/plugins/).  Separate repos are available for each Foreman release, containing plugins that are compatible with that particular version.  Packages are not currently GPG signed.

Configure the repo by creating /etc/yum.repos.d/foreman_plugins.repo:

<pre>
[foreman-plugins]
name=Foreman plugins
baseurl=http://yum.theforeman.org/plugins/1.3/el6/x86_64/
enabled=1
gpgcheck=0
</pre>

Find the package for the plugin: <pre>yum search rubygem-foreman</pre>
Install the package, e.g. <pre>yum install ruby193-rubygem-foreman_discovery</pre>
Restart Foreman: `touch ~foreman/tmp/restart.txt` or `service httpd restart`

Some plugins (e.g. foreman_column_view) may also require configuration in `/usr/share/foreman/config/settings.plugins.d/`, check for any .example files.

#### Advanced: installing from gems

Not recommended, as it's possible for the 'gem' command to try and install newer versions of Rails which can cause problems. Do note the install without dependencies below to avoid this problem.
Ensure the plugin you want is available from rubygems.org as a gem. Plugins that aren't published (just git repos) can't be installed with this method without being built as a gem.

If on EL6, run <pre>scl enable ruby193 bash</pre> first for an SCL-enabled shell (not needed on Fedora)
Install *without* dependencies: <pre>gem install --ignore-dependencies foreman_column_view</pre>
If you need other dependencies (see the rubygems.org page), check the yum repo above (e.g. deface, nokogiri) or install the same way with 'gem'
Add to the `bundler.d/Gemfile.local.rb` file as detailed below.

Restart Foreman `touch ~foreman/tmp/restart.txt` or `service httpd restart`

If you hit problems, uninstall the added gems with <pre>gem uninstall -v VERSION GEM</pre>

#### Debian package or "from source" installations

It is recommended to use `~foreman/bundler.d/Gemfile.local.rb` so that it is not overwritten by future upgrades.
If it's published on rubygems.org, just add the name and the latest released version will be downloaded.  Add to bundler.d/Gemfile.local.rb:
<pre>gem 'foreman_sample_plugin'</pre>

Or bundler can install the plugin from a git repository.  Add to bundler.d/Gemfile.local.rb:
<pre>gem 'foreman_sample_plugin', :git => "https://github.com/example/foreman_sample_plugin.git"</pre>

Next, as a Foreman user (not root), run the following command:
<pre>$ bundle update foreman_sample_plugin</pre>

Then restart Foreman with
<pre>touch ~foreman/tmp/restart.txt</pre>


### 6.2 Create a Plugin

This goal of this article is to help developers quickly and easily create a Foreman plugins. This is not an exhaustive tutorial of Ruby on Rails or an explanation of how rails engines work.

As a starting point to build your first Foreman Plugin run the following command
<pre>rails plugin new my_plugin</pre>

A new directory my_plugin is created for the plugin, in this directory edit the my_plugin.gemspec file, you can specify here the name, authors, description homepage and version of your plugin, by simply replacing  the todo strings with your content.

Next is editing the lib/my_plugin/engine.rb file, add the following code section:
<pre>
# lib/my_plugin/engine.rb
initializer 'my_plugin.register_plugin', :after=> :finisher_hook do |app|
  Foreman::Plugin.register :my_plugin do
    # The following optional sections can be added here:
    # require foreman version section
    # permission section
    # roles section
    # menu section
  end
end
</pre>

Activate the plugin by editing foreman Gemfile.local.rb file and adding the following line
<pre>
# Gemfile.local.rb
gem 'my_plugin', :path => 'path_to/my_plugin'
</pre>

Restart foreman and the new foreman plugin should be listed in the about page plugin tab.

#### 6.2.1 Requiring foreman version
To require a specific foreman version use the bundler require syntax. Most of the version specifiers, like `>= 1.4` are self-explanatory, the specifier `~>` has a special meaning, best shown by example: `~> 2.1` is identical to `>= 2.1` and `< 3.0`.

To read the full specification visit [bundler.io](http://bundler.io/v1.3/gemfile.html)
<pre>
requires_foreman '>= 1.4'
</pre>



#### 6.2.2 Adding permission
Whether adding a new actions to existing controller or adding a new controller, every action must be mapped to a foreman permission.
See a typical structure of the security section of the registered plugin method:
<pre>
security_block :security_block_name do
          permission :view_something, {:controller_name => [:index, :show, :auto_complete_search] }
          permission :new_something, {:controller_name => [:new, :create] }
          permission :edit_something, {:controller_name => [:edit, :update] }
          permission :delete_something, {:controller_name => [:destroy] }
</pre>

#### 6.2.3 Adding roles
The register plugin method allows adding a predefined role, the following sample show how to add a role that includes the set of permissions from the previous section.
<pre>
  # Add a new role called 'New Role Name' if it doesn't exist
  role "New Role Name", [:view_something, :provision_something, :edit_something, :destroy_something]
</pre>


#### 6.2.4 Altering the menu
A plugin can add menu items, entire sub menus and even delete a menu item, here are a few examples:

Adding an item to existing menu:
<pre>
 # menu(menu_name, item_id, options)
 # menu_name can be one of :user_menu, :top_menu or :admin_menu
 # options can include
 #    :url_hash => {:controller=> :example, :action=>:index}
 #    :caption
 #    :html - set html options for the menu item
 #    :parent, :first, :last, :before, :after - are positions statements
 #    :if => code_block is for conditional menus
 #    :children => code_block is for dynamically creating a list of sub menu items.
 #
 # Example: adding a menu item for new host at the top menu under the hosts sub menu:
 menu :top_menu, :new_host, :url_hash => {:controller=> :hosts, :action=>:new},
      :caption=> 'New Host',
      :parent => :hosts_menu,
      :first => true
</pre>

Deleting a menu item
<pre>
 # Example: delete the hosts menu item
 delete_menu_item :top_menu, :hosts
</pre>

Adding a sub menu:
<pre>
 # Adding a sub menu after hosts menu
 sub_menu :top_menu, :example, :caption=> N_('Example'), :after=> :hosts_menu do
   menu :top_menu, :level1, :caption=>N_('the first level'), :url_hash => {:controller=> :example, :action=>:index}
   menu :top_menu, :level2, :url_hash => {:controller=> :example, :action=>:index}
   menu :top_menu, :level3, :url_hash => {:controller=> :example, :action=>:index}
   sub_menu :top_menu, :inner_level, :caption=> N_('Inner level') do
     menu :top_menu, :level41, :url_hash => {:controller=> :example, :action=>:index}
     menu :top_menu, :level42, :url_hash => {:controller=> :example, :action=>:index}
   end
   menu :top_menu, :level5, :url_hash => {:controller=> :example, :action=>:index}
 end
</pre>

### 6.3 Plugin List
Uptodate plugin list is kept in the [wiki](http://projects.theforeman.org/projects/foreman/wiki/List_of_Plugins)
