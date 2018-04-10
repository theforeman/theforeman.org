---
layout: plugin_index
title: Katello Documentation
versions: [{name: 3.6, display: '3.6'}, {name: 3.5, display: '3.5'}, {name: 3.4, display: '3.4'}, {name: 3.3, display: '3.3'}, {name: 3.2, 'display': '3.2'}, {name: 3.1, display: '3.1'}, {name: 3.0, display: '3.0'}, {name: 2.4, display: '2.4'}, {name: 'nightly', display: 'nightly'}]
---

<div class="row" style="min-height: 700px">
  <div class="col-sm-10">
    <h1>
      <img src="{{ site.baseurl }}/static/images/katello_logo.png" alt="Katello" width="10%"/>
      Katello
    </h1>

    <br/>
    <p>
      Katello brings the full power of content management alongside the provisioning and configuration capabilities of <a href="http://theforeman.org">Foreman.</a>
    </p>

    <br/>
    <h4>
      <i class="fa fa-refresh" style="margin-right: 8px;"></i>Local Yum and Puppet Repositories
    </h4>
    <p style="font-size: 14px">
      Create, organize, and manage local yum and puppet repositories.
      Sync remote repositories or upload content directly to build a library of content that serves as the basis for building custom builds of your content.
      <a href="/plugins/katello/nightly/user_guide/content/index.html">Learn More</a>
    </p>

    <br/>
    <h4>
      <i class="fa fa-camera" style="margin-right: 6px;"></i>
      Snapshot Content and Configuration for Reproducible Builds
    </h4>
    <p style="font-size: 14px">
      Take your local content and filter out packages, errata and puppet modules to create custom builds into units called Content Views.
      Make your custom builds available to your hosts by moving it through environment paths that mimic traditional development workflows (Dev &#x2192; QE &#x2192; Stage &#x2192; Production).
      <a href="/plugins/katello/nightly/user_guide/content_views/index.html">Learn More</a>
    </p>

    <br/>
    <h4>
      <i class="fa fa-warning" style="margin-right: 6px;"></i>
      Issue Package and Errata Updates
    </h4>
    <p style="font-size: 14px">
      Use your locally managed content to install package and errata updates to a host or group of hosts.
      <a href="/plugins/katello/nightly/user_guide/content_hosts/index.html">Learn More</a>
    </p>

    <br/>
    <h4>
      <i class="fa fa-bomb" style="margin-right: 6px;"></i>
      Troubleshooting
    </h4>
    <p style="font-size: 14px">
      Having issues with your Katello? Check the <a href="/support.html">support page</a> for information on how to get help or the <a href="/plugins/katello/{{ page.versions[0].name }}/troubleshooting/index.html">troubleshooting guide</a> for common issues.
    </p>

    <br/>
    <h4>
      <i class="fa fa-wrench" style="margin-right: 6px;"></i>
      Are you a Katello developer?
    </h4>
    <p style="font-size: 14px">
      For general development information, including how to get started contributing please see the <a href="/contribute.html">contributing guide</a>. For Katello specific developer information please reference the <a href="/plugins/katello/developers.html">Katello Developer Guide</a>.
    </p>
  </div>

  <div class="col-sm-2 pull-right">
    <h3 style="border-bottom: 1px solid #CCC;">Versions</h3>
    {% for version in page.versions %}
		<a href="plugins/katello/{{ version.name }}/index.html" class="btn" style="text-transform: none">
			<i class="fa fa-newspaper-o"></i>
			<span id='manual'>{{ version.display }}</span>
		</a>
    {% endfor %}
  </div>
</div>

<br/>
<br/>
