---
layout: plugin_index
title: Foreman Salt documentation
versions: [14.0, 13.0, 12.0, 11.0, 7.0, 6.0, 5.0, 4.0, 3.0, 2.1, 2.0]
---

# Foreman Salt manuals
-----------------------------

Documentation: [Using Salt for Configuration Management](https://docs.theforeman.org/nightly/Managing_Hosts/index-foreman-el.html#Using_Salt_for_Configuration_Management_managing-hosts)

<div class='row plugin-manual'>
    {% for version in page.versions %}
	<div class='col-md-4 center'>
		<a href="plugins/foreman_salt/{{ version }}/index.html" class="btn-doc btn">
			<i class="fa fa-newspaper-o"></i>
			<p id='manual'>{{ version }}</p>
		</a>
	</div>
    {% endfor %}
</div>
