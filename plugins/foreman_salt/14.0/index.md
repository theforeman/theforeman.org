---
layout: plugin
title: Foreman Salt 14.0 Manual
version: 14.0
---

# 1 {{ page.title }}

Salt support in Foreman is implemented through two plugins: `smart_proxy_salt` and `foreman_salt`.
These plugins enable Foreman to manage Salt Minions, including provisioning, Salt Keys, Salt States, Salt Pillars, and Salt Grains, as well as providing advanced reporting features.
You can schedule Salt jobs and run them recurringly.

# 2 Documentation

[Using Salt for Configuration Management](https://docs.theforeman.org/nightly/Managing_Hosts/index-foreman-el.html#Using_Salt_for_Configuration_Management_managing-hosts)

# 3 Troubleshooting the Salt Plugin

If you find a bug, please file it in [Redmine](https://projects.theforeman.org/projects/salt/issues/new).
You can also find us on libera.chat on `#theforeman`.
For more information, see [logging and reporting problems](https://docs.theforeman.org/nightly/Administering_Red_Hat_Satellite/index-foreman-el.html#Logging_and_Reporting_Problems_admin).

# 4 Contributing to the Salt Plugin

Follow the [same process as Foreman](/contribute.html) for contributing.

You can find the source code on github.com for [foreman_salt](https://github.com/theforeman/foreman_salt), [smart_proxy_salt](https://github.com/theforeman/smart_proxy_salt), and [hammer_cli_foreman_salt](https://github.com/theforeman/hammer_cli_foreman_salt).

You can help us to translate Foreman, the Salt Plugin, and other Foreman Plugins.
See [Translation guide](/contribute.html#Translations).
