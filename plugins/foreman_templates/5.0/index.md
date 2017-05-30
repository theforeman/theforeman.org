---
layout: plugin
title: Foreman Templates 5.0 Manual
version: 5.0
---

# 1. {{ page.title }}

This plugin enables synchronization of provisioning templates, partition tables and job templates from external git repository and/or file system. It can be used both with the [community templates](https://github.com/theforeman/community-templates) repository or with any other source of templates that has the same directory structure. Please note that Foreman core provides tracking of changes, browsing the history and reverting natively, but if you need more advanced tools such as branching, code reviews etc. you might be interested in this plugin.

You can use the native git support for simple synchronization with remote git repositories, which is usually useful for syncing new template versions from community repository or for exporting local changes to contribute back. Or if you have more complicated workflow, you can use this plugin to sync the directory when required. This way, you can use any VCS (including git) to control the versioning of that directory and use this plugin to sync whenever the directory is at desired version.

# 2. Installation

You can install the plugin using the foreman-installer (recommended way). To do that, run the installer with following argument

    foreman-installer --enable-foreman-plugin-templates

If you installed the plugin using [package directly](https://theforeman.org/plugins/#2.2Packageinstallation), you should run the migrations and seed (just to be sure) and restart the Foreman.
If installed foreman from git, you can simply add foreman-templates gem as one of the dependencies. Don't forget to run migrations and seed afterwards and obviously restart the Foreman.

# 2.1 Uninstallation

If you later decide to remove the plugin, you need to clean it's custom data. Otherwise you'd get error e.g. on settings page, that some class can't be instantiated. Before removing the plugin from your Foreman instance, make sure to run following command

```sh
foreman-rake templates:cleanup
```

This cleans up internals so the plugin can be safely uninstalled. The tempaltes that were created remain untouched. The remove the plugin after clean up differs based on how you installed it. If you used foreman-installer or installed plugin by package directly, then you just need to uninstall the plugin package using rpm/dpkg. For git installations, just remove it from bundler files.

# 3. Configuration

After the installation there are new settings available. These are the default setting for both importing and exporting tasks. They can be overridden on each synchronization run and serve only as default so users don't have to specify the same value on every run. You will find them under Administer -> Settings -> TemplateSync. Only administrator can modify their values. Following table explains the attribute behavior. Note that some are only used on import or export actions.

<table class="table table-bordered table-condensed table-striped">
  <tr>
    <th>Setting name</th>
    <th>Meaning on importing</th>
    <th>Meaning on exporting</th>
  </tr>
  <tr>
    <td><i>associate</i></td>
    <td>associate OS, Organization, Location based on metadata</td>
    <td>N/A</td>
  </tr>
  <tr>
    <td><i>branch</i></td>
    <td colspan="2">git branch to read or write from/to (only for git-based repositories), default value is based on current Foreman version - e.g. develop or 1.15-stable</td>
  </tr>
  <tr>
    <td><i>dirname</i></td>
    <td>subdirectory under $repo to read from</td>
    <td>subdirectory under $repo to export to</td>
  </tr>
  <tr>
    <td><i>filter</i></td>
    <td>import only templates with name matching this regular expression, after $prefix was applied</td>
    <td>export only templates with name matching this regular expression</td>
  </tr>
  <tr>
    <td><i>metadata_export_mode</i></td>
    <td>N/A</td>
    <td>one of refresh/remove/keep, refresh generates new metadata on export based on current associations and attributes, remove strips all metadata from template, keep keeps the same metadata that are part of template code</td>
  </tr>
  <tr>
    <td><i>negate</i></td>
    <td colspan="2">negates the $filter condition</td>
  </tr>
  <tr>
    <td><i>prefix</i></td>
    <td>adds specified string to beginning of the template on import, but only if the template name does not start with the prefix already</td>
    <td>N/A</td>
  </tr>
  <tr>
    <td><i>repo</i></td>
    <td colspan="2">target path, specifies also the protocol, e.g. /tmp/dir or git://example.com, https://example.com, ssh://example.com</td>
  </tr>
  <tr>
    <td><i>verbose</i></td>
    <td colspan="2">adds extra verbose messages to the action output</td>
  </tr>
</table>

Settings above are preconfigured for importing from upstream community-templates repository.

# 4. Usage (features description)

Both importing and exporting is available as rake tasks. Rake tasks are triggered from terminal. If you installed the plugin using foreman-installer, or simply it's package based installation), you should be able to run rake using `foreman-rake` command. Source-based installs of Foreman will need to use Bundler to call Rake as normal, e.g. cloned from git, you should likely use `RAILS_ENV=production bundle exec rake` ran from your Foreman directory.

There are other ways to run the action discussed under API chapter.
 
# 4.1 Importing

If you have all attributes configured via Settings you can simply run following command

```sh
foreman-rake templates:import
```

This task based on $repo setting either uses git or scans local directory for templates to import. If you want to customize any setting for a particular run, just specify it as extra argument.

```sh
foreman-rake templates:import repo=https://github.com/theforeman/community-templates
```

The example above would clone the repository to some temp directory. If `branch` was specified, it switches to this branch. Then if `dirname` was provided, it will "cd" into it. Finally it searches for all files in this directory and subdirectories that has `'.erb` suffix. Then the template is parsed and imported (see below for more details)

```sh
foreman-rake templates:import repo=/var/lib/my_templates
```

Compared to previous example, this uses local directory. Therefore not git clone or branch checkout is done. If `dirname` is specified, the task goes into this subdirectory and searches for all files with '.erb' extension. Then the same parsing and importing process follows,

The parsing process reads the content of the file. It expects the content of the template including some template metadata. The metadata are an ERB comment on top of the file, for illustration see some template in [community-templates repository](https://github.com/theforeman/community-templates/blob/develop/provisioning_templates/provision/kickstart_default.erb). It's in yaml format and specifies template name, kind, compatible operating systems, organizations, locations and possibly other. The template gets it's name based on information from metadata. Before the template is saved in database, `prefix` setting is applied to it's name. Then the `filter` regular expression is matched against the prefixed name. If the `filter` matches, templates is saved. If `negate` is set to `true`, the template would be saved only if `filter` regular expression didn't match the template name. If the template with a given name exists in database already, it's content is updated.

The result of the whole import is printed on the STDOUT. The output contains list of created/updated templates as well as applied diffs.

A few more useful examples follow

```sh
# prefix all templates with "[comunity] " string to avoid overriding existing templates
foreman-rake templates:import prefix='[community] '

# get the latest templates (might be compatible with only Foreman nightly)
foreman-rake templates:import repo=https://github.com/theforeman/community-templates branch=develop

tree /tmp/my-repo/
/tmp/my-repo/
└── large-ptable.erb

0 directories, 1 file

# this will create a template named "[community] large-ptable"
foreman-rake templates:import repo=/tmp/my-repo/ prefix='[community] '

```

# 4.2 Exporting

If you want to edit templates directly in Foreman and then sync them back to external repositories, you need the exporting task. This plugin allows to export directly to git repository or local directory. For exporting to git repository, the user that's Foreman running under needs to have write (commit) access to this repository. If your settings is correctly configure, exporting can be triggered by running following command.

```sh
foreman-rake templates:export
```

If the `repo` is git repository, we clone it to a temp directory. Then we apply changes to template files and automatically create a commit with a generated message and push it back to origin. We do not delete files that are not present in Foreman database, so this should not be destructive. On the other hand if you want more control over the process or you want to use another SCM, local directory export is advised. To specify a local directory, just set the repo accordingly
 
```sh
foreman-rake templates:export repo=/var/lib/my_templates
```

When `repo` is set to local directory, exported templates are written into it. We don't touch any other files, so the directory can be under git (or any other SCM) control. You can then investigate changes by running `git status` and do the commit yourself when you're happy about the change.

For both git and plain directory targets, following applies. If `dirname` is specified, the export is written to this subdirectory of `repo`. Only templates with name matching to `filter` are exported. If filter is blank, all templates are exported. In case `negate` was used, the `filter` matching result is negated. This can be used to ignore some templates, e.g. following would not export templates starting with [private] and [wip] prefixes

```sh
foreman-rake templates:export filter='\[wip\]|\[private\] '
```
 
When a template is exported, there are 3 ways how to handle metadata.

* **refresh** - remove any metadata from template content and generate new based on current template attributes and assignment
* **remove** - remove any metadata from template content, useful if you want to add metadata manually or externally
* **keep** - keep any metadata found in template content despite current attributes and assignments in database, useful when you want to send a patch to community-templates but you don't have all operating systems configured in your Foreman

Suppose you'd like to change something in default Foreman templates. You can use this plugin to make this process easy. First you need to update the template in you database and test it works. Then go to https://github.com/theforeman/community-templates and fork the repository. Clone your fork to the host where you have Foreman installed. Then run `foreman-rake templates:export repo=/path/to/your/clone`. Review the change, commit the change by `git commit -a` and push back to your github fork by `git push`. Then on github, open a new PR against theforeman/community-templates repositories.

# 4.3 Purging

It can happen that you import a lot of templates that you're not interested in. E.g. the first run could import all community-templates with "[Community]" prefix. You can use purge task to destroy all templates matching given `prefix`. Also `negate` can be used for this task. For example

```sh
# deletes all templates with prefix '[Community] '
foreman-rake templates:purge prefix='[Community] ' verbose=true

# deletes all templates other than those that start with prefix '[my] '
foreman-rake templates:purge prefix='[my] ' verbose=true negate=true
```

# 5. API

Its recommend to initiate an import using the API instead of the traditional `foreman-rake templates:import`. This has a couple of benefits like it's run as the user and therefore leverages the RBAC system. Here's an example using curl, optionally you can also override the default settings by specifying them in the request. See <code>&lt;your_foreman_url&gt;/apidoc/</code> for a full list of parameters available.

```sh
curl -H "Accept:application/json,version=2" -H "Content-Type:application/json" -u user1:changeme -k https://foreman.example.com/api/v2/templates/import -X POST -d "{\"repo\":\"/another/repo\"}"
```

# 6. Working with locked templates
Templates shipped by Foreman are locked. Template import does not update locked templates by default. Output shows the info about which templates were skipped because of lock ("Skipping Template id #{template_id}:#{template_name} - template is locked"). If you wish to override this behavior, you need to supply 'force' parameter. See <code>&lt;your_foreman_url&gt;/apidoc/</code> for parameter details.


## 6.1 Known taxonomy problems when importing

The import procedure uses template metadata to determine Organization/Location asssociations. When non-admin user initiates the import via API, it may be possible that metadata do not contain any Organization/Location the user is assigned to. In this case, import of the template fails with: `Invalid organizations selection, you must select at least one of yours`. To import such a template, update it's metadata so it contains at least one Organization/Location that user is assigned to.

When there is OrgA with template some_tmpl and b_user (user only in OrgB) tries to import some_tmpl (which is not yet present in OrgB), it fails with: `name has already been taken`. This is a general problem with taxonomies - some_tmpl is not found for update in scope of OrgB and when we try to create it, we hit the unique constraint on name that is not scoped by taxonomy. To import such a template, change its name in metadata or associate existing template with the same name in OrgA to OrgB as well.

# 7. Help

Please follow our [standard procedures and contacts]({{site.baseurl}}support.html).

# 8. Getting involved

## 8.1 Troubleshooting

If you find a bug, please file it in
[Redmine](http://projects.theforeman.org/projects/templates/issues/new).

See the [troubleshooting section](/manuals/latest/index.html#7.2GettingHelp)
in the Foreman manual for more info.


## 8.2 Contributing

Follow the [same process as Foreman](/contribute.html#SubmitPatches)
for contributing.

# 9. Links

* foreman_templates plugin [https://github.com/theforeman/foreman_templates](https://github.com/theforeman/foreman_templates)
* issue tracker [http://projects.theforeman.org/projects/templates/issues](http://projects.theforeman.org/projects/templates/issues)
