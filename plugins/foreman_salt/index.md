---
layout: plugin_index
title: Foreman Salt documentation
versions: [13.0, 12.0, 11.0, 7.0, 6.0, 5.0, 4.0, 3.0, 2.1, 2.0]
---

# Foreman Salt

Salt support in Foreman is implemented through two server side plugins: [foreman_salt](https://github.com/theforeman/foreman_salt) and [smart_proxy_salt](https://github.com/theforeman/smart_proxy_salt).
There is also a Hammer plugin [hammer_cli_foreman_salt](https://github.com/theforeman/hammer_cli_foreman_salt).
These plugins enable Foreman to manage Salt Minions, including provisioning, Salt Keys, Salt States, Salt Pillars, and Salt Grains, as well as providing advanced reporting features.
You can schedule Salt jobs and run them recurringly.

For documentation, see [Using Salt for Configuration Management](https://docs.theforeman.org/nightly/Managing_Hosts/index-foreman-el.html#Using_Salt_for_Configuration_Management_managing-hosts)

## Troubleshooting the Salt Plugin

If you find a bug, please file it in [Redmine](https://projects.theforeman.org/projects/salt/issues/new).
For general support information, see [here]({{site.baseurl}}support.html).
For more information, see [logging and reporting problems](https://docs.theforeman.org/nightly/Administering_Project/index-foreman-el.html#Logging_and_Reporting_Problems_admin)

## Contributing to the Salt Plugin

Follow the [same process as Foreman]({{site.baseurl}}contribute.html) for contributing.

You can find the source code on GitHub for [foreman_salt](https://github.com/theforeman/foreman_salt), [smart_proxy_salt](https://github.com/theforeman/smart_proxy_salt), and [hammer_cli_foreman_salt](https://github.com/theforeman/hammer_cli_foreman_salt).

You can help us to translate Foreman, the Salt Plugin, and other Foreman Plugins.
See [Translation guide]({{site.baseurl}}contribute.html#Translations).


## Legacy version documentation

<div class='row plugin-manual'>
    {% for version in page.versions %}
	<div class='col-md-4 center'>
		<a href="{{site.baseurl}}plugins/foreman_salt/{{ version }}/index.html" class="btn-doc btn">
			<i class="fa fa-newspaper-o"></i>
			<p id='manual'>{{ version }}</p>
		</a>
	</div>
    {% endfor %}
</div>
