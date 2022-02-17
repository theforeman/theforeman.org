---
layout: plugin
title: Foreman Templates 7.0 Manual
version: 7.0
# uncomment for older versions than stable or nightly
#robots: noindex
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

If you later decide to remove the plugin, you need to clean its custom data. Otherwise you'd get an error e.g. on settings page, that some class can't be instantiated. Before removing the plugin from your Foreman instance, make sure to run following command

```sh
foreman-rake templates:cleanup
```

This cleans up internals so the plugin can be safely uninstalled. The templates that were created remain untouched. The remove the plugin after clean up differs based on how you installed it. If you used foreman-installer or installed plugin by package directly, then you just need to uninstall the plugin package using rpm/dpkg. For git installations, just remove it from bundler files.

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

## 3.1 Example of configuration GitHub repository

Let's assume you have a GitHub account with login `template_master`. Here are the steps how to configure foreman_templates so that you can import and export templates between Foreman and your GitHub repository. Let's assume the repository is called `templates` and it has branch called `master`.

1. First we'll configure settings. Set a `branch` setting to `master`, `prefix` setting to empty string and `repo` to `ssh://git@github.com/template_master/templates`.
2. We'll need to accept GitHub SSH host key to foreman user, run `sudo -u foreman ssh github.com`, verify and save the key. You'll probably see permission denied message since the ssh connection will not succeed but that's expected.
3. Create an SSH keypair that foreman will use to communicate with GitHub. Run `sudo -u foreman ssh-keygen`. Don't specify any passphrase.
4. Copy the public key, which resides in `/usr/share/foreman/.ssh/id_rsa.pub`, to your SSH keys on GitHub
5. run the export, e.g. by

```
curl -H "Accept:application/json,version=2" -H "Content-Type:application/json" -u admin:changeme -k https://foreman.example.com/api/v2/templates/export -X POST
```

6. you should see templates in the repository

To import templates back, after their content was changed, simply run
 
 ```
 curl -H "Accept:application/json,version=2" -H "Content-Type:application/json" -u admin:changeme -k https://foreman.example.com/api/v2/templates/import -X POST
 ```
 
 If the templates are locked, changes won't be made. To update locked templates, either add `-d '{ "force": "true" }'` to the end of a command or unlock the template.

## 3.2 Advanced git configuration

Additional git configuration for foreman_templates can be configured using the `git config` command line tool or editing the global/foreman user specific `.gitconfig` file. This can be useful when using a git server with a self signed cert, for a complete list of advanced options see `man git config`.

To set `http.sslCAPath` you can simply run following command

```sh
sudo -u foreman git config --global http.sslCAPath /path/to/ca/certs 
```

# 4. Usage (features description)

Both importing and exporting is available as new API endpoints. Previously we also had rake tasks but they are now deprecated as they ignore authorization and auditing. Please see next chapter about API information. There's also a hammer plugin for similar experience that rake tasks provided.

# 5. API and Hammer plugin

# 5.1 API endpoints

The plugin introduces two new endpoints for triggering import and export of templates. This has a couple of benefits like it's run as the authenticated user and therefore leverages the RBAC system. Here's an example using curl, optionally you can also override the default settings by specifying them in the request. In following examples, we override repo parameters, for all available parameters, see <code>&lt;your_foreman_url&gt;/apidoc/</code>.

```sh
curl -H "Accept:application/json,version=2" -H "Content-Type:application/json" -u user1:changeme -k https://foreman.example.com/api/v2/templates/import -X POST -d "{\"repo\":\"/another/repo\"}"
```

an example of JSON you get back follows

```json
{
    "message": {
        "templates": [
            [0] {
                             "name": "community Alterator default finish",
                               "id": 693,
                          "changed": false,
                         "imported": true,
                "additional_errors": null,
                        "exception": null,
                "validation_errors": {},
                             "file": "community_alterator_default_finish.erb",
                             "type": "provisioning_template"
            }
        ],
             "repo": "/another/repo",
           "branch": null
    }
}
```

as you can see, data are structured under message -> templates.

```sh
curl -H "Accept:application/json,version=2" -H "Content-Type:application/json" -u user1:changeme -k https://foreman.example.com/api/v2/templates/export -X POST -d "{\"repo\":\"/another/repo\"}"
```

and similar output for export endpoint

```json
{
    "message": {
            "error": null,
          "warning": null,
             "repo": "/another/repo",
           "branch": null,
         "git_user": "admin",
        "templates": [
            [0] {
                      "id": 697,
                    "name": "community Alterator default finish",
                "exported": true,
                    "type": "provisioning_template"
            }
        ]
    }
}
```

note in examples above, example list only the repository with a single template, you'd get multiple items under templates key, if you have more templates in the repository.

# 5.2 Hammer plugin

You can also install hammer_cli_foreman_templates plugin. The same as showed in example above, using hammer plugin would like like this

```sh
hammer import-templates --repo=/another/repo
```

```sh
hammer export-templates --repo=/another/repo
```

For full list of parameters, just add --help to either of these commands.

# 6. Working with locked templates

Templates shipped by Foreman are locked. Template import does not update locked templates by default. Output shows the info about which templates were skipped because of lock ("Skipping Template id #{template_id}:#{template_name} - template is locked"). If you wish to override this behavior, you need to supply 'force' parameter. See <code>&lt;your_foreman_url&gt;/apidoc/</code> for parameter details.

## 6.1 Known taxonomy problems when importing

The import procedure uses template metadata to determine Organization/Location asssociations. When non-admin user initiates the import via API, it may be possible that metadata do not contain any Organization/Location the user is assigned to. In this case, import of the template fails with: `Invalid organizations selection, you must select at least one of yours`. To import such a template, update it's metadata so it contains at least one Organization/Location that user is assigned to. Or alternatively, specify organizations/locations as API parameter.

```sh
curl -H "Accept:application/json,version=2" -H "Content-Type:application/json" -u user1:changeme -k https://foreman.example.com/api/v2/templates/import -X POST -d "{\"organization_ids\": [ 1, 3 ]}"
```

Hammer plugin also exposes these arguments.

```sh
hammer import-templates --organization-ids 1,3
```

When there is OrgA with template some_tmpl and b_user (user only in OrgB) tries to import some_tmpl (which is not yet present in OrgB), it fails with: `name has already been taken`. This is a general problem with taxonomies - some_tmpl is not found for update in scope of OrgB and when we try to create it, we hit the unique constraint on name that is not scoped by taxonomy. To import such a template, change its name in metadata or associate existing template with the same name in OrgA to OrgB as well.

Export API endpoint also allows to set organizations and locations explicitly. If you select OrgA on export, only templates associated with OrgA will be exported. The same applies to hammer plugin.

# 7. Help

There are multiple configuration options which might result in unexpected behavior when used incorrectly. In the list below the most common pitfalls are described. If different you see different error message, please use please follow our [standard procedures and contacts]({{site.baseurl}}support.html).

## 7.1 File based synchronization

These errors can be encountered when repo points to local directory

### 7.1.1 Using file-based synchronization, but couldn't find /specified/path

The repo path was set to a directory that does not exist or can't be found, double check the path and create the directory.

### 7.1.2 Permission denied @ rb_sysopen - /usr/share/foreman_templates/provisioning_templates/kexec/discovery_red_hat_kexec.erb"

The repo path was set to a directory that can't be written to, note that templates are written under user that Foreman runs under, by default "foreman". Make sure the foreman user can write to this directory, e.g. by `chown foreman /usr/share/foreman_templates/; chmod u+rwx /usr/share/foreman_templates/`. The directory that's being used can be also affected by dirname option.

### 7.1.3 Permission denied @ dir_s_mkdir - /some/provisioning_templates"

This can be caused but missing required permissions on directory specified as repo, `/some` in this case. The error message means, foreman user can't write in there.

If user foreman owns the directory /some or permissions are set correctly, SELinux might prevent writing there. If you're using SELinux, see AVC denials and setup appropriate rules.
 
### 7.1.4 No input/empty message on importing

This can be caused by having repo set to a directory that can't be read from, note that templates are read under user that Foreman runs under, by default "foreman". Make sure the foreman user can read content of this directory, e.g. by `chown foreman /usr/share/foreman_templates/; chmod u+rx /usr/share/foreman_templates/`. The directory that's being used can be also affected by dirname option.

## 7.2 Git based synchronization

Following errors messages can be seen when repo is set to a remote repository url, such as `git://git@git.example.com/my_repo`. Usually the error contains also a failing git command. Full error messages can be similar but usually they differ by the part that's listed below. 

### 7.2.1 remote part of refspec is not a valid name in 

This is caused by unspecified branched. Either provide a `branch` parameter or set a default branch in settings.

### 7.2.2 could not read Username for 'https://github.com': No such device or address"

In this case, https protocol was used. A username can be specified as part of the url, e.g. `https://user@github.com/my_repo`. You'll probably also need to set the password, see the message below.

### 7.2.3 could not read Password for 'https://user@github.com': No such device or address"

The https protocol also needs to know the password. You can hardcode it to the url like this `https://user:password@github.com/my_repo` but it will be stored in plaintext and everyone with access to Foreman settings will be able to read it. We suggest you use a key based authentication if you git server supports that.

### 7.2.4 pathspec 'sat1' did not match any file(s) known to git

See the error below

### 7.2.5 ambiguous argument 'origin/sat1': unknown revision or path not in the working tree.

Either of these error messages can be observed when you specified a branch name, `sat1` in this example, but it does not exist on remote server. During export, we clone remote repo and checkout to last version of a specified branch but if it does not exist, the exporting fails.

### 7.2.6 Repository not found.

This is self-explanatory, the remote server was successfully contacted, authentication succeeded but the specified URL does not point to existing repository. Double check the repo URL.

### 7.2.7 Unable to look up git@github.com (port 9418) (Name or service not known)

The repo was specified set to `git://git@github.com/theforeman/community-templates`. The problem is caused by using `git://` as a protocol, try changing it to `ssh://`

### 7.2.8 Using file-based synchronization, but couldn't find /usr/share/foreman/git@github.com/user/my-repository.git

The repo was set to `git@github.com/user/my-repository.git` and since it does not start with the protocol, we consider that as a path on local hard drive. Add a protocol prefix, e.g. `ssh://git@github.com/user/my-repository.git` 

### 7.2.9 ssh: Could not resolve hostname github.com:user: Name or service not known fatal: Could not read from remote repository. Please make sure you have the correct access rights and the repository exists.

In this case, `ssh://git@github.com:user/my-repository.git` URL was specified. The problem is caused by the colon after hostname. It must be converted to slash `/`, so the right URL should look this way `ssh://git@github.com/user/my-repository.git`  

### 7.2.10 Host key verification failed.

The user under which the Foreman runs does now have the public key of git repository in known host database. Run `sudo -u foreman ssh github.com`, verify the fingerprint and save it.  
you don't have ssh-key

### 7.2.11 Permission denied (publickey)

The git repository does not recognize any of foreman user ssh key or foreman user does not have any key. To generate a new key, you can run `sudo -u foreman ssh-keygen`. The private key can not be protected by passphrase, otherwise Foreman could not read it. Public key of this newly generated key pair must be installed on remote git server. This could also happen if key is installed, but the wrong user was specified in the url. Usually, the url should be in form `ssh://git@example.com/path` where git is shared for all users.

## 7.3 Other pitfalls

### 7.3.1 You set the repo to /tmp but don't see anything new added even after export says Success

This is usually the case on systemd-enabled operating systems. Foreman service uses [PrivateTmp](https://access.redhat.com/blogs/766093/posts/1976243) so the Foreman process basically has it's own /tmp mounted. Please use a different directory.

### 7.3.2 I see a success but not new commit appears in remote git repository

This can happen if there's no change since last commit. In fact, the export was successful.

# 8 Deprecated rake-tasks documentation

Following section covers deprecated interface using rake tasks. We recommend using API or hammer plugin instead. This interface can be removed in future.

If you installed the plugin using foreman-installer, or simply it's package based installation), you should be able to run rake using `foreman-rake` command. Source-based installs of Foreman will need to use Bundler to call Rake as normal, e.g. cloned from git, you should likely use `RAILS_ENV=production bundle exec rake` ran from your Foreman directory.

There are other ways to run the action discussed under API chapter.
 
# 8.1 Importing

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

The progress of the whole import is logged to production.log, you might need to adjust log levels for getting more information. The output contains list of created/updated templates as well as applied diffs.

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

# 8.2 Exporting

If you want to edit templates directly in Foreman and then sync them back to external repositories, you need the exporting task. This plugin allows to export directly to git repository or local directory. For exporting to git repository, the user that's Foreman running under needs to have write (commit) access to this repository. If your settings are correctly configure, exporting can be triggered by running following command.

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

Suppose you'd like to change something in default Foreman templates. You can use this plugin to make this process easy. First you need to update the template in you database and test it works. Then go to https://github.com/theforeman/community-templates and fork the repository. Clone your fork to the host where you have Foreman installed. Then run `foreman-rake templates:export repo=/path/to/your/clone`. Review the change, commit the change by `git commit -a` and push back to your GitHub fork by `git push`. Then on GitHub, open a new PR against theforeman/community-templates repositories.

# 8.3 Purging

It can happen that you import a lot of templates that you're not interested in. E.g. the first run could import all community-templates with "[Community]" prefix. You can use purge task to destroy all templates matching given `prefix`. Also `negate` can be used for this task. For example

```sh
# deletes all templates with prefix '[Community] '
foreman-rake templates:purge prefix='[Community] ' verbose=true

# deletes all templates other than those that start with prefix '[my] '
foreman-rake templates:purge prefix='[my] ' verbose=true negate=true
```

# 9. Getting involved

## 9.1 Troubleshooting

If you find a bug, please file it in
[Redmine](http://projects.theforeman.org/projects/templates/issues/new).

See the [troubleshooting section](/manuals/latest/index.html#7.2GettingHelp)
in the Foreman manual for more info.


## 9.2 Contributing

Follow the [same process as Foreman](/contribute.html#SubmitPatches)
for contributing.

# 10. Links

* foreman_templates plugin [https://github.com/theforeman/foreman_templates](https://github.com/theforeman/foreman_templates)
* issue tracker [http://projects.theforeman.org/projects/templates/issues](http://projects.theforeman.org/projects/templates/issues)
