---
layout: plugin_index
title: Foreman Templates documentation
versions: [8.0, 7.0, 6.0, 5.0, 4.0]
---

# Foreman Templates manuals
-----------------------------

<div class='row plugin-manual'>
    {% for version in page.versions %}
	<div class='col-md-4 center'>
		<a href="plugins/foreman_templates/{{ version }}/index.html" class="btn-doc btn">
			<i class="fa fa-newspaper-o"></i>
			<p id='manual'>{{ version }}</p>
		</a>
	</div>
    {% endfor %}
</div>
