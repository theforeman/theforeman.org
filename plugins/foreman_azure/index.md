---
layout: plugin_index
title: Foreman Azure documentation
versions: [2.2.x, 2.1.x, 2.0.x, 1.x]
---

# Foreman Azure manuals
-----------------------------

<div class='row plugin-manual'>
    {% for version in page.versions %}
	<div class='col-md-4 center'>
		<a href="plugins/foreman_azure/{{ version }}/index.html" class="btn-doc btn">
			<i class="fa fa-newspaper-o"></i>
			<p id='manual'>{{ version }}</p>
		</a>
	</div>
    {% endfor %}
</div>
