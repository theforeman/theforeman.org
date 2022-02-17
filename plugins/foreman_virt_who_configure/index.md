---
layout: plugin_index
title: Foreman Virt Who Configure documentation
versions: [0.5]
---

# Foreman Virt Who Configure manuals
-----------------------------

<div class='row plugin-manual'>
    {% for version in page.versions %}
	<div class='col-md-4 center'>
		<a href="plugins/foreman_virt_who_configure/{{ version }}/index.html" class="btn-doc btn">
			<i class="fa fa-object-group"></i>
			<p id='manual'>{{ version }}</p>
		</a>
	</div>
    {% endfor %}
</div>
