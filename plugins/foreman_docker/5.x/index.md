---
layout: plugin
pluginname: foreman_docker
title: Foreman Docker 5.x Manual
version: 5.x
# uncomment for older versions than stable or nightly
#robots: noindex
---

# 1. {{ page.title }}

This plugin has been discontinued. This release helps only with its removal. If you're interested in taking over the maintenance, let us know.

To remove the plugin from you Foreman installation, following steps need to be taken

1. Make a backup.
2. Upgrade to last version of foreman-docker 5.0 - and Katello if you're using it.
3. Run `foreman-rake db:migrate` - if you have Katello, this will erase docker data.
4. Run `foreman-rake foreman_docker:cleanup` - this cleans up all data that this plugin introduced.
5. Run `yum remove tfm-rubygem-foreman_docker` or `apt remove ruby-foreman-docker`.
6. Run `yum remove tfm-rubygem-hammer_cli_foreman_docker` or `apt remove ruby-hammer-cli-foreman-docker` unless you still use Katello commands from it.
7. Update apipie cache by running `foreman-rake apipie:cache`.
8. Restart the httpd service with `service httpd restart`.


# 2. Links

* foreman-docker plugin [https://github.com/theforeman/foreman-docker/](https://github.com/theforeman/foreman-docker/)
* Issue tracker [http://projects.theforeman.org/projects/docker/issues](http://projects.theforeman.org/projects/docker/issues)
