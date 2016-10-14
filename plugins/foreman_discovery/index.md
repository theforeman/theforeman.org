---
layout: plugin_index
title: Foreman discovery documentation
versions: [7.0, 6.0, 5.0, 4.1, 4.0, 3.0, 2.0]
---

# Foreman discovery manuals
-----------------------------

<div class='row plugin-manual'>
    {% for version in page.versions %}
    <div class='col-md-4 center'>
        <a href="plugins/foreman_discovery/{{ version }}/index.html" class="btn-doc btn">
            <i class="fa fa-newspaper-o"></i>
            <p id='manual'>{{ version }}</p>
        </a>
    </div>
    {% endfor %}
</div>
