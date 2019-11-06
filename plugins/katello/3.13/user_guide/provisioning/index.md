---
title: Provisioning
---

# Provisioning

See [the Foreman manual](http://theforeman.org/manuals/latest/index.html#4.4Provisioning) for general information on configuring provisioning.

## Templates

Katello ships a number of templates in addition to the standard Foreman ones. When using these templates, if a host has a Host group with an [Activation Key](/plugins/katello/{{ page.version }}/user_guide/activation_keys/index.html), it will register as a Content Host automatically.

  - **Katello Kickstart Default** - Kickstart template for Fedora, CentOS, RHEL, and other Red Hat-compatible operating systems.
  - **Katello Kickstart Default Finish** - image-based provisioning
  - **Katello Kickstart Default User Data** - cloud-init template for EC2 and OpenStack
  - **subscription_manager_registration** - Snippet for registering a host for content

To customize any of the above templates, simply clone them and add your changes.

When you synchronize a repository with a distribution such as Fedora or CentOS, Katello will automatically create the operating system and assign these default templates.  You may change the defaults by going to Administer > Settings, and selecting the Katello tab.

If provisioning hosts using a synced CentOS 8 repository, the AppStream repository is needed for Kickstart to work.  To set this up, create an "AppStream" repository within the same lifecycle environment and content view as the CentOS 8 repository and sync it.  Katello will automatically add this AppStream repo to the Kickstart file.  After creating the host using CentOS 8 content, double check that the generated Kickstart file mentions the AppStream repo.  The host provisioning should proceed automatically as expected.

**Note:** Currently, CentOS 8 Anaconda requires that the AppStream repository is specifically named "AppStream".  To get around this, edit the Kickstart default provisioning template (or create a new one) to ensure this block:

```erb
<% @additional_media.each do |medium| -%>
repo --name <%= medium[:name] %> --baseurl <%= medium[:url] %> <%= medium[:install] ? ' --install' : '' %><%= proxy_string %>
<% end -%>
```

will produce a line with `repo --name AppStream --baseurl <AppStream repo url>`.

For example, consider replacing that code block with:

```erb
<% @additional_media.each do |medium| -%>
<% if (medium[:url].include?("AppStream") and @host.operatingsystem.name == '< REPLACE ME >' and os_major >= 8) -%>
repo --name AppStream --baseurl <%= medium[:url] %>
<% else -%>
repo --name <%= medium[:name] %> --baseurl <%= medium[:url] %> <%= medium[:install] ? ' --install' : '' %><%= proxy_string %>
<% end -%>
<% end %>
```

[Related CentOS 8 issue](https://bugs.centos.org/view.php?id=16470)
