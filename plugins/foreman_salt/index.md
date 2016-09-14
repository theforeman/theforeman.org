---
layout: plugin_index
title: Foreman Salt documentation
versions: [7.0, 6.0, 5.0, 4.0, 3.0, 2.1, 2.0]
---

# Foreman Salt manuals
-----------------------------

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
