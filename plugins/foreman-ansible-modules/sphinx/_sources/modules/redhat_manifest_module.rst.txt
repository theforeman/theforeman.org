:source: redhat_manifest.py

:orphan:

.. _redhat_manifest_module:


redhat_manifest -- Interact with a Red Hat Satellite Subscription Manifest
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


.. contents::
   :local:
   :depth: 1


Synopsis
--------
- Download and modify a Red Hat Satellite Subscription Manifest



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
                                            </div>
                                    </td>
                                <td>
                                                                                                                                                            </td>
                                                                <td>
                                                                        <div>Manifest Name</div>
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
                    <b>path</b>
                    <div style="font-size: small">
                        <span style="color: purple">path</span>
                                            </div>
                                    </td>
                                <td>
                                                                                                                                                            </td>
                                                                <td>
                                                                        <div>path to export the manifest</div>
                                                                                </td>
            </tr>
                                <tr>
                                                                <td colspan="1">
                    <b>pool_id</b>
                    <div style="font-size: small">
                        <span style="color: purple">-</span>
                                            </div>
                                    </td>
                                <td>
                                                                                                                                                            </td>
                                                                <td>
                                                                        <div>Subscription pool_id</div>
                                                                                </td>
            </tr>
                                <tr>
                                                                <td colspan="1">
                    <b>pool_state</b>
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
                                                                        <div>Subscription state</div>
                                                                                </td>
            </tr>
                                <tr>
                                                                <td colspan="1">
                    <b>portal</b>
                    <div style="font-size: small">
                        <span style="color: purple">-</span>
                                            </div>
                                    </td>
                                <td>
                                                                                                                                                                    <b>Default:</b><br/><div style="color: blue">https://subscription.rhn.redhat.com</div>
                                    </td>
                                                                <td>
                                                                        <div>Red Hat Portal subscription access address</div>
                                                                                </td>
            </tr>
                                <tr>
                                                                <td colspan="1">
                    <b>quantity</b>
                    <div style="font-size: small">
                        <span style="color: purple">integer</span>
                                            </div>
                                    </td>
                                <td>
                                                                                                                                                            </td>
                                                                <td>
                                                                        <div>quantity of pool_id Subscriptions</div>
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
                                                                        <div>Manifest state</div>
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
                    <b>uuid</b>
                    <div style="font-size: small">
                        <span style="color: purple">-</span>
                                            </div>
                                    </td>
                                <td>
                                                                                                                                                            </td>
                                                                <td>
                                                                        <div>Manifest uuid</div>
                                                                                </td>
            </tr>
                                <tr>
                                                                <td colspan="1">
                    <b>validate_certs</b>
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
                                                                        <div>Validate Portal SSL</div>
                                                                                </td>
            </tr>
                        </table>
    <br/>




Examples
--------

.. code-block:: yaml+jinja

    
    - name: Create katello.example.com Manifest and add 7 sub
      redhat_manifest:
        name: "katello.example.com"
        username: "john-smith"
        password: "changeme"
        pool_id: XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
        quantity: 7
        validate_certs: false

    - name: Ensure my manifest has 10 of one subs in it and export
      redhat_manifest:
        uuid: XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX
        username: john-smith
        password: changeme
        pool_id: XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
        quantity: 10
        validate_certs: false
        path: /root/manifest.zip

    - name: Remove all of one subs from katello.example.com
      redhat_manifest:
        name: katello.example.com
        username: john-smith
        password: changeme
        pool_id: XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
        pool_state: absent
        validate_certs: false





Status
------




- This module is not guaranteed to have a backwards compatible interface. *[preview]*


- This module is :ref:`maintained by the Ansible Community <modules_support>`. *[community]*





Authors
~~~~~~~

- Sean O'Keeffe (@sean797)


.. hint::
    If you notice any issues in this documentation you can `edit this document <https://github.com/theforeman/foreman-ansible-modules/edit/master/modules/redhat_manifest.py?description=%3C!---%20Your%20description%20here%20--%3E%0A%0A%2Blabel:%20docsite_pr>`_ to improve it.
