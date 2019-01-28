:source: foreman_setting_facts.py

:orphan:

.. _foreman_setting_facts_module:


foreman_setting_facts -- Gather facts about Foreman Settings
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


.. contents::
   :local:
   :depth: 1

DEPRECATED
----------
:Removed in Ansible: version: 2.8
:Why: This has been replaced with another module.
:Alternative: Use :ref:`foreman_fact <foreman_fact_module>` instead.



Synopsis
--------
- Gather facts about Foreman Settings



Requirements
------------
The below requirements are needed on the host that executes this module.

- nailgun >= 0.30.2
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
                    <b>name</b>
                    <div style="font-size: small">
                        <span style="color: purple">-</span>
                                            </div>
                                    </td>
                                <td>
                                                                                                                                                            </td>
                                                                <td>
                                                                        <div>Name of the Setting to fetch</div>
                                                    <div>If not given, fetch all settings</div>
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
                        </table>
    <br/>




Examples
--------

.. code-block:: yaml+jinja

    
    - name: "Read a Setting"
      foreman_setting_facts:
        username: "admin"
        password: "changeme"
        server_url: "https://foreman.example.com"
        name: "http_proxy"
      register: result
    - debug:
        var: result.settings[0].value

    - name: "Read all Settings"
      foreman_setting_facts:
        username: "admin"
        password: "changeme"
        server_url: "https://foreman.example.com"
      register: result
    - debug:
        var: item.name
      with_items: result.settings




Return Values
-------------
Common return values are documented :ref:`here <common_return_values>`, the following are the fields unique to this module:

.. raw:: html

    <table border=0 cellpadding=0 class="documentation-table">
        <tr>
            <th colspan="1">Key</th>
            <th>Returned</th>
            <th width="100%">Description</th>
        </tr>
                    <tr>
                                <td colspan="1">
                    <b>settings</b>
                    <div style="font-size: small; color: purple">-</div>
                                    </td>
                <td></td>
                <td>
                                            <div>List of settings</div>
                                        <br/>
                                    </td>
            </tr>
                        </table>
    <br/><br/>


Status
------


- This module will be removed in version 2.8. *[deprecated]*
- For more information see `DEPRECATED`_.


Authors
~~~~~~~

- Matthias M Dellweg (@mdellweg) ATIX AG


.. hint::
    If you notice any issues in this documentation you can `edit this document <https://github.com/theforeman/foreman-ansible-modules/edit/master/modules/foreman_setting_facts.py?description=%3C!---%20Your%20description%20here%20--%3E%0A%0A%2Blabel:%20docsite_pr>`_ to improve it.
