:source: foreman_compute_profile.py

:orphan:

.. _foreman_compute_profile_module:


foreman_compute_profile -- Manage Foreman Compute Profiles using Foreman API
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

.. versionadded:: 2.0

.. contents::
   :local:
   :depth: 1


Synopsis
--------
- Create and delete Foreman Compute Profiles using Foreman API



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
                    <b>name</b>
                    <div style="font-size: small">
                        <span style="color: purple">-</span>
                         / <span style="color: red">required</span>                    </div>
                                    </td>
                                <td>
                                                                                                                                                            </td>
                                                                <td>
                                                                        <div>compute profile name</div>
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
                                                                        <div>foreman user password</div>
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
                                                                        <div>foreman url</div>
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
                                                                                                                                                                                                <li>absent</li>
                                                                                    </ul>
                                                                            </td>
                                                                <td>
                                                                        <div>compute profile presence</div>
                                                                                </td>
            </tr>
                                <tr>
                                                                <td colspan="1">
                    <b>updated_name</b>
                    <div style="font-size: small">
                        <span style="color: purple">-</span>
                                            </div>
                                    </td>
                                <td>
                                                                                                                                                            </td>
                                                                <td>
                                                                        <div>new compute profile name</div>
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
                                                                        <div>foreman username</div>
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
                                                                        <div>verify ssl connection when communicating with foreman</div>
                                                                                </td>
            </tr>
                        </table>
    <br/>




Examples
--------

.. code-block:: yaml+jinja

    
    - name: compute profile
      foreman_compute_profile:
        name: example_compute_profile
        server_url: foreman.example.com
        username: admin
        password: secret
        verify_ssl: false
        state: present





Status
------




- This module is not guaranteed to have a backwards compatible interface. *[preview]*


- This module is :ref:`maintained by the Ansible Community <modules_support>`. *[community]*





Authors
~~~~~~~

- Philipp Joos (@philippj)


.. hint::
    If you notice any issues in this documentation you can `edit this document <https://github.com/theforeman/foreman-ansible-modules/edit/master/modules/foreman_compute_profile.py?description=%3C!---%20Your%20description%20here%20--%3E%0A%0A%2Blabel:%20docsite_pr>`_ to improve it.
