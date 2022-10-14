---
layout: plugin_index
title: Katello Legacy Documentation
versions: ['3.18','3.17','3.16','3.15','3.14','3.13','3.12','3.11','3.10','3.9','3.8','3.7','3.6','3.5','3.4','3.3','3.2','3.1']
---

<div class="row" style="min-height: 700px">
  <div class="col-sm-10">
    <h1>
      <img src="{{ site.baseurl }}/static/images/katello_logo.png" alt="Katello" width="10%"/>
      Katello
    </h1>

    <br/>
    <p>
      Older releases of Katello are available as a single PDF file per release.
    </p>

    <ul>
      {% for version in page.versions %}
      <li>
        <a href="https://downloads.theforeman.org/documentation-archive/katello/katello_{{ version }}_manual.pdf" class="btn" style="text-transform: none">
          <i class="fa fa-newspaper-o"></i>
          <span id='manual'>{{ version }} (single pdf)</span>
        </a>
      </li>
      {% endfor %}
    </ul>
  </div>

</div>

<br/>
<br/>
