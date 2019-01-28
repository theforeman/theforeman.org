:source: foreman_operating_system.py

:orphan:

.. _foreman_operating_system_module:


foreman_operating_system -- Manage Foreman Operating Systems
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

.. versionadded:: 2.4

.. contents::
   :local:
   :depth: 1


Synopsis
--------
- Manage Foreman Operating System Entities
- Uses https://github.com/SatelliteQE/nailgun



Requirements
------------
The below requirements are needed on the host that executes this module.

- nailgun >= 0.29.0
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
                    <b>architectures</b>
                    <div style="font-size: small">
                        <span style="color: purple">list</span>
                                            </div>
                                    </td>
                                <td>
                                                                                                                                                            </td>
                                                                <td>
                                                                        <div>architectures, the operating system can be installed on</div>
                                                                                </td>
            </tr>
                                <tr>
                                                                <td colspan="1">
                    <b>description</b>
                    <div style="font-size: small">
                        <span style="color: purple">-</span>
                                            </div>
                                    </td>
                                <td>
                                                                                                                                                            </td>
                                                                <td>
                                                                        <div>Description of the Operating System</div>
                                                                                </td>
            </tr>
                                <tr>
                                                                <td colspan="1">
                    <b>family</b>
                    <div style="font-size: small">
                        <span style="color: purple">-</span>
                         / <span style="color: red">required</span>                    </div>
                                    </td>
                                <td>
                                                                                                                                                            </td>
                                                                <td>
                                                                        <div>distribution family of the Operating System</div>
                                                                                </td>
            </tr>
                                <tr>
                                                                <td colspan="1">
                    <b>major</b>
                    <div style="font-size: small">
                        <span style="color: purple">-</span>
                         / <span style="color: red">required</span>                    </div>
                                    </td>
                                <td>
                                                                                                                                                            </td>
                                                                <td>
                                                                        <div>major version of the Operating System</div>
                                                                                </td>
            </tr>
                                <tr>
                                                                <td colspan="1">
                    <b>media</b>
                    <div style="font-size: small">
                        <span style="color: purple">list</span>
                                            </div>
                                    </td>
                                <td>
                                                                                                                                                            </td>
                                                                <td>
                                                                        <div>list of installation media</div>
                                                                                </td>
            </tr>
                                <tr>
                                                                <td colspan="1">
                    <b>minor</b>
                    <div style="font-size: small">
                        <span style="color: purple">-</span>
                                            </div>
                                    </td>
                                <td>
                                                                                                                                                            </td>
                                                                <td>
                                                                        <div>minor version of the Operating System</div>
                                                                                </td>
            </tr>
                                <tr>
                                                                <td colspan="1">
                    <b>name</b>
                    <div style="font-size: small">
                        <span style="color: purple">-</span>
                         / <span style="color: red">required</span>                    </div>
                                    </td>
                                <td>
                                                                                                                                                            </td>
                                                                <td>
                                                                        <div>Name of the Operating System</div>
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
                    <b>password_hash</b>
                    <div style="font-size: small">
                        <span style="color: purple">-</span>
                                            </div>
                                    </td>
                                <td>
                                                                                                                            <ul style="margin: 0; padding: 0"><b>Choices:</b>
                                                                                                                                                                <li>MD5</li>
                                                                                                                                                                                                <li>SHA256</li>
                                                                                                                                                                                                <li>SHA512</li>
                                                                                    </ul>
                                                                            </td>
                                                                <td>
                                                                        <div>hashing algorithm for passwd</div>
                                                                                </td>
            </tr>
                                <tr>
                                                                <td colspan="1">
                    <b>provisioning_templates</b>
                    <div style="font-size: small">
                        <span style="color: purple">list</span>
                                            </div>
                                    </td>
                                <td>
                                                                                                                                                            </td>
                                                                <td>
                                                                        <div>list of provisioning templates</div>
                                                                                </td>
            </tr>
                                <tr>
                                                                <td colspan="1">
                    <b>ptables</b>
                    <div style="font-size: small">
                        <span style="color: purple">list</span>
                                            </div>
                                    </td>
                                <td>
                                                                                                                                                            </td>
                                                                <td>
                                                                        <div>list of partitioning tables</div>
                                                                                </td>
            </tr>
                                <tr>
                                                                <td colspan="1">
                    <b>release_name</b>
                    <div style="font-size: small">
                        <span style="color: purple">-</span>
                                            </div>
                                    </td>
                                <td>
                                                                                                                                                            </td>
                                                                <td>
                                                                        <div>Release name of the operating system (recommended for debian)</div>
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
                    <b>state</b>
                    <div style="font-size: small">
                        <span style="color: purple">-</span>
                                            </div>
                                    </td>
                                <td>
                                                                                                                            <ul style="margin: 0; padding: 0"><b>Choices:</b>
                                                                                                                                                                <li><div style="color: blue"><b>present</b>&nbsp;&larr;</div></li>
                                                                                                                                                                                                <li>present_with_defaults</li>
                                                                                                                                                                                                <li>absent</li>
                                                                                    </ul>
                                                                            </td>
                                                                <td>
                                                                        <div>State of the Operating System</div>
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

    
    - name: "Create an Operating System"
      foreman_operating_system:
        username: "admin"
        password: "changeme"
        server_url: "https://foreman.example.com"
        name: "TheAnswer"
        value: "42"
        state: present

    - name: "Ensure existence of an Operating System (provide default values)"
      foreman_operating_system:
        username: "admin"
        password: "changeme"
        server_url: "https://foreman.example.com"
        name: "TheAnswer"
        value: "43"
        state: present_with_defaults

    - name: "Delete an Operating System"
      foreman_operating_system:
        username: "admin"
        password: "changeme"
        server_url: "https://foreman.example.com"
        name: "TheAnswer"
        state: absent





Status
------




- This module is not guaranteed to have a backwards compatible interface. *[preview]*


- This module is :ref:`maintained by the Ansible Community <modules_support>`. *[community]*





Authors
~~~~~~~

- Matthias M Dellweg (@mdellweg) ATIX AG
- Bernhard Hopfenmüller (@Fobhep) ATIX AG


.. hint::
    If you notice any issues in this documentation you can `edit this document <https://github.com/theforeman/foreman-ansible-modules/edit/master/modules/foreman_operating_system.py?description=%3C!---%20Your%20description%20here%20--%3E%0A%0A%2Blabel:%20docsite_pr>`_ to improve it.
