---
layout: plugin_index
title: Foreman OpenSCAP documentation
versions: [0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 0.12, 1.0, 5.0]
---

# Foreman OpenSCAP manuals
-----------------------------

<div class='row plugin-manual'>
    {% for version in page.versions %}
	<div class='col-md-4 center'>
		<a href="plugins/foreman_openscap/{{ version }}/index.html" class="btn-doc btn">
			<i class="fa fa-newspaper-o"></i>
			<p id='manual'>{{ version }}</p>
		</a>
	</div>
    {% endfor %}
</div>
