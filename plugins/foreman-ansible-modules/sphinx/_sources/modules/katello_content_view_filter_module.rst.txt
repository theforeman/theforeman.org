:source: katello_content_view_filter.py

:orphan:

.. _katello_content_view_filter_module:


katello_content_view_filter -- Create and Manage Katello content View filters
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


.. contents::
   :local:
   :depth: 1


Synopsis
--------
- Create and Manage Katello content View filters



Requirements
------------
The below requirements are needed on the host that executes this module.

- nailgun >= 0.28.0
- python >= 2.6
- ansible >= 2.3


Parameters
----------

.. raw:: html

    <table  border=0 cellpadding=0 class="documentation-table">
        <tr>
            <th colspan="1">Parameter</th>
            <th>Choices/<font color="blue">Defaults</font></th>
                        <th width="100%">Comments</th>
        </tr>
                    <tr>
                                                                <td colspan="1">
                    <b>content_view</b>
                    <div style="font-size: small">
                        <span style="color: purple">-</span>
                         / <span style="color: red">required</span>                    </div>
                                    </td>
                                <td>
                                                                                                                                                            </td>
                                                                <td>
                                                                        <div>Name of the content view</div>
                                                                                </td>
            </tr>
                                <tr>
                                                                <td colspan="1">
                    <b>date_type</b>
                    <div style="font-size: small">
                        <span style="color: purple">-</span>
                                            </div>
                                    </td>
                                <td>
                                                                                                                            <ul style="margin: 0; padding: 0"><b>Choices:</b>
                                                                                                                                                                <li>issued</li>
                                                                                                                                                                                                <li><div style="color: blue"><b>updated</b>&nbsp;&larr;</div></li>
                                                                                    </ul>
                                                                            </td>
                                                                <td>
                                                                        <div>Search using the 'Issued On' or 'Updated On'</div>
                                                    <div>Valid on <code>filter_type</code> erratum only</div>
                                                                                </td>
            </tr>
                                <tr>
                                                                <td colspan="1">
                    <b>end_date</b>
                    <div style="font-size: small">
                        <span style="color: purple">-</span>
                                            </div>
                                    </td>
                                <td>
                                                                                                                                                            </td>
                                                                <td>
                                                                        <div>erratum end date (YYYY-MM-DD)</div>
                                                                                </td>
            </tr>
                                <tr>
                                                                <td colspan="1">
                    <b>errata_id</b>
                    <div style="font-size: small">
                        <span style="color: purple">-</span>
                                            </div>
                                    </td>
                                <td>
                                                                                                                                                            </td>
                                                                <td>
                                                                        <div>erratum id</div>
                                                                                </td>
            </tr>
                                <tr>
                                                                <td colspan="1">
                    <b>filter_state</b>
                    <div style="font-size: small">
                        <span style="color: purple">-</span>
                                            </div>
                                    </td>
                                <td>
                                                                                                                            <ul style="margin: 0; padding: 0"><b>Choices:</b>
                                                                                                                                                                <li><div style="color: blue"><b>present</b>&nbsp;&larr;</div></li>
                                                                                                                                                                                                <li>absent</li>
                                                                                    </ul>
                                                                            </td>
                                                                <td>
                                                                        <div>State of the content view filter</div>
                                                                                </td>
            </tr>
                                <tr>
                                                                <td colspan="1">
                    <b>filter_type</b>
                    <div style="font-size: small">
                        <span style="color: purple">-</span>
                         / <span style="color: red">required</span>                    </div>
                                    </td>
                                <td>
                                                                                                                            <ul style="margin: 0; padding: 0"><b>Choices:</b>
                                                                                                                                                                <li>rpm</li>
                                                                                                                                                                                                <li>package_group</li>
                                                                                                                                                                                                <li>erratum</li>
                                                                                                                                                                                                <li>docker</li>
                                                                                    </ul>
                                                                            </td>
                                                                <td>
                                                                        <div>Content view filter type</div>
                                                                                </td>
            </tr>
                                <tr>
                                                                <td colspan="1">
                    <b>inclusion</b>
                    <div style="font-size: small">
                        <span style="color: purple">-</span>
                                            </div>
                                    </td>
                                <td>
                                                                                                                                                                                                                <b>Default:</b><br/><div style="color: blue">no</div>
                                    </td>
                                                                <td>
                                                                        <div>Create an include filter</div>
                                                                                </td>
            </tr>
                                <tr>
                                                                <td colspan="1">
                    <b>max_version</b>
                    <div style="font-size: small">
                        <span style="color: purple">-</span>
                                            </div>
                                    </td>
                                <td>
                                                                                                                                                            </td>
                                                                <td>
                                                                        <div>package maximum version</div>
                                                                                </td>
            </tr>
                                <tr>
                                                                <td colspan="1">
                    <b>min_version</b>
                    <div style="font-size: small">
                        <span style="color: purple">-</span>
                                            </div>
                                    </td>
                                <td>
                                                                                                                                                            </td>
                                                                <td>
                                                                        <div>package minimum version</div>
                                                                                </td>
            </tr>
                                <tr>
                                                                <td colspan="1">
                    <b>organization</b>
                    <div style="font-size: small">
                        <span style="color: purple">-</span>
                         / <span style="color: red">required</span>                    </div>
                                    </td>
                                <td>
                                                                                                                                                            </td>
                                                                <td>
                                                                        <div>Organization that the Content View is in</div>
                                                                                </td>
            </tr>
                                <tr>
                                                                <td colspan="1">
                    <b>password</b>
                    <div style="font-size: small">
                        <span style="color: purple">-</span>
                         / <span style="color: red">required</span>                    </div>
                                    </td>
                                <td>
                                                                                                                                                            </td>
                                                                <td>
                                                                        <div>Password for user accessing Foreman server</div>
                                                                                </td>
            </tr>
                                <tr>
                                                                <td colspan="1">
                    <b>repositories</b>
                    <div style="font-size: small">
                        <span style="color: purple">list</span>
                                            </div>
                                    </td>
                                <td>
                                                                                                                                                                    <b>Default:</b><br/><div style="color: blue">[]</div>
                                    </td>
                                                                <td>
                                                                        <div>List of repositories that include name and product</div>
                                                    <div>An empty Array means all current and future repositories</div>
                                                                                </td>
            </tr>
                                <tr>
                                                                <td colspan="1">
                    <b>rule_name</b>
                    <div style="font-size: small">
                        <span style="color: purple">-</span>
                                            </div>
                                    </td>
                                <td>
                                                                                                                                                                    <b>Default:</b><br/><div style="color: blue">C(name)</div>
                                    </td>
                                                                <td>
                                                                        <div>Content view filter rule name or package name</div>
                                                                                </td>
            </tr>
                                <tr>
                                                                <td colspan="1">
                    <b>rule_state</b>
                    <div style="font-size: small">
                        <span style="color: purple">-</span>
                                            </div>
                                    </td>
                                <td>
                                                                                                                            <ul style="margin: 0; padding: 0"><b>Choices:</b>
                                                                                                                                                                <li><div style="color: blue"><b>present</b>&nbsp;&larr;</div></li>
                                                                                                                                                                                                <li>absent</li>
                                                                                    </ul>
                                                                            </td>
                                                                <td>
                                                                        <div>State of the content view filter rule</div>
                                                                                </td>
            </tr>
                                <tr>
                                                                <td colspan="1">
                    <b>server_url</b>
                    <div style="font-size: small">
                        <span style="color: purple">-</span>
                         / <span style="color: red">required</span>                    </div>
                                    </td>
                                <td>
                                                                                                                                                            </td>
                                                                <td>
                                                                        <div>URL of Foreman server</div>
                                                                                </td>
            </tr>
                                <tr>
                                                                <td colspan="1">
                    <b>start_date</b>
                    <div style="font-size: small">
                        <span style="color: purple">-</span>
                                            </div>
                                    </td>
                                <td>
                                                                                                                                                            </td>
                                                                <td>
                                                                        <div>erratum start date (YYYY-MM-DD)</div>
                                                                                </td>
            </tr>
                                <tr>
                                                                <td colspan="1">
                    <b>types</b>
                    <div style="font-size: small">
                        <span style="color: purple">-</span>
                                            </div>
                                    </td>
                                <td>
                                                                                                                                                                    <b>Default:</b><br/><div style="color: blue">[u&#39;bugfix&#39;, u&#39;enhancement&#39;, u&#39;security&#39;]</div>
                                    </td>
                                                                <td>
                                                                        <div>erratum types (enhancement, bugfix, security)</div>
                                                                                </td>
            </tr>
                                <tr>
                                                                <td colspan="1">
                    <b>username</b>
                    <div style="font-size: small">
                        <span style="color: purple">-</span>
                         / <span style="color: red">required</span>                    </div>
                                    </td>
                                <td>
                                                                                                                                                            </td>
                                                                <td>
                                                                        <div>Username on Foreman server</div>
                                                                                </td>
            </tr>
                                <tr>
                                                                <td colspan="1">
                    <b>verify_ssl</b>
                    <div style="font-size: small">
                        <span style="color: purple">boolean</span>
                                            </div>
                                    </td>
                                <td>
                                                                                                                                                                                                                    <ul style="margin: 0; padding: 0"><b>Choices:</b>
                                                                                                                                                                <li>no</li>
                                                                                                                                                                                                <li><div style="color: blue"><b>yes</b>&nbsp;&larr;</div></li>
                                                                                    </ul>
                                                                            </td>
                                                                <td>
                                                                        <div>Verify SSL of the Foreman server</div>
                                                                                </td>
            </tr>
                                <tr>
                                                                <td colspan="1">
                    <b>version</b>
                    <div style="font-size: small">
                        <span style="color: purple">-</span>
                                            </div>
                                    </td>
                                <td>
                                                                                                                                                            </td>
                                                                <td>
                                                                        <div>package version</div>
                                                                                </td>
            </tr>
                        </table>
    <br/>




Examples
--------

.. code-block:: yaml+jinja

    
    - name: Exclude csh
      katello_content_view_filter:
        username: "admin"
        password: "changeme"
        server_url: "https://foreman.example.com"
        name: "package filter 1"
        organization: "Default Organization"
        content_view: Web Servers
        filter_type: "rpm"
        package_name: tcsh

    - name: Include newer csh versions
      katello_content_view_filter:
        username: "admin"
        password: "changeme"
        server_url: "https://foreman.example.com"
        name: "package filter 1"
        organization: "Default Organization"
        content_view: Web Servers
        filter_type: "rpm"
        package_name: tcsh
        min_version: 6.20.00
        inclusion: True





Status
------




- This module is not guaranteed to have a backwards compatible interface. *[preview]*


- This module is :ref:`maintained by the Ansible Community <modules_support>`. *[community]*





Authors
~~~~~~~

- Sean O'Keeffe (@sean797)


.. hint::
    If you notice any issues in this documentation you can `edit this document <https://github.com/theforeman/foreman-ansible-modules/edit/master/modules/katello_content_view_filter.py?description=%3C!---%20Your%20description%20here%20--%3E%0A%0A%2Blabel:%20docsite_pr>`_ to improve it.
