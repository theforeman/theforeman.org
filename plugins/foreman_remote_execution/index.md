---
layout: plugin_index
title: Foreman Remote Execution Documentation
versions: [10.0, 1.7, 1.3, 0.3, 0.2, 0.1, 0.0]
---

# Foreman Remote Execution manuals
-----------------------------

<div class='row plugin-manual'>
    {% for version in page.versions %}
	<div class='col-md-4 center'>
		<a href="plugins/foreman_remote_execution/{{ version }}/index.html" class="btn-doc btn">
			<i class="fa fa-newspaper-o"></i>
			<p id='manual'>{{ version }}</p>
		</a>
	</div>
    {% endfor %}
</div>
