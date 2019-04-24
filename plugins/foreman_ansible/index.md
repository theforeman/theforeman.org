---
layout: plugin_index
title: Foreman Ansible documentation
versions: [3.x, 2.x, 1.x, 0.x]
---

# Foreman Ansible manuals
-----------------------------

<div class='row plugin-manual'>
    {% for version in page.versions %}
	<div class='col-md-4 center'>
		<a href="plugins/foreman_ansible/{{ version }}/index.html" class="btn-doc btn">
			<i class="fa fa-newspaper-o"></i>
			<p id='manual'>{{ version }}</p>
		</a>
	</div>
    {% endfor %}
</div>
