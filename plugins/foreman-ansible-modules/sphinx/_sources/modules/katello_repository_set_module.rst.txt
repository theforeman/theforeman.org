:source: katello_repository_set.py

:orphan:

.. _katello_repository_set_module:


katello_repository_set -- Enable/disable repositories in Katello repository sets
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


.. contents::
   :local:
   :depth: 1


Synopsis
--------
- Enable/disable repositories in Katello repository sets



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
                        <span style="color: purple">boolean</span>
                         / <span style="color: red">required</span>                    </div>
                                    </td>
                                <td>
                                                                                                                                                                        <ul style="margin: 0; padding: 0"><b>Choices:</b>
                                                                                                                                                                <li>no</li>
                                                                                                                                                                                                <li>yes</li>
                                                                                    </ul>
                                                                            </td>
                                                                <td>
                                                                        <div>Name of the repository set</div>
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
                                                                        <div>Organization name that the repository set is in</div>
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
                    <b>product</b>
                    <div style="font-size: small">
                        <span style="color: purple">-</span>
                         / <span style="color: red">required</span>                    </div>
                                    </td>
                                <td>
                                                                                                                                                            </td>
                                                                <td>
                                                                        <div>Name of the parent product</div>
                                                                                </td>
            </tr>
                                <tr>
                                                                <td colspan="1">
                    <b>repositories</b>
                    <div style="font-size: small">
                        <span style="color: purple">list</span>
                         / <span style="color: red">required</span>                    </div>
                                    </td>
                                <td>
                                                                                                                                                            </td>
                                                                <td>
                                                                        <div>Release version and base architecture of the repositories to enable</div>
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
                         / <span style="color: red">required</span>                    </div>
                                    </td>
                                <td>
                                                                                                                            <ul style="margin: 0; padding: 0"><b>Choices:</b>
                                                                                                                                                                <li>enabled</li>
                                                                                                                                                                                                <li>disabled</li>
                                                                                    </ul>
                                                                            </td>
                                                                <td>
                                                                        <div>Whether the repositories are enabled or not</div>
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
                        <span style="color: purple">-</span>
                                            </div>
                                    </td>
                                <td>
                                                                                                                                                                                                                <b>Default:</b><br/><div style="color: blue">yes</div>
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

    
    - name: "Enable RHEL 7 RPMs repositories"
      katello_repository_set:
        username: "admin"
        password: "changeme"
        server_url: "https://foreman.example.com"
        verify_ssl: false
        name: "Red Hat Enterprise Linux 7 Server (RPMs)"
        organization: "Default Organization"
        product: "Red Hat Enterprise Linux Server"
        repositories:
        - releasever: "7.0"
          basearch: "x86_64"
        - releasever: "7.1"
          basearch: "x86_64"
        - releasever: "7.2"
          basearch: "x86_64"
        - releasever: "7.3"
          basearch: "x86_64"
        state: enabled

    - name: "Enable RHEL 7 RPMs repositories with label"
      katello_repository_set:
        username: "admin"
        password: "changeme"
        server_url: "https://foreman.example.com"
        verify_ssl: false
        organization: "Default Organization"
        label: rhel-7-server-rpms
        repositories:
        - releasever: "7.0"
          basearch: "x86_64"
        - releasever: "7.1"
          basearch: "x86_64"
        - releasever: "7.2"
          basearch: "x86_64"
        - releasever: "7.3"
          basearch: "x86_64"
        state: enabled

    - name: "Disable RHEL 7 Extras RPMs repository"
      katello_repository_set:
        username: "admin"
        password: "changeme"
        server_url: "https://foreman.example.com"
        verify_ssl: false
        name: Red Hat Enterprise Linux 7 Server - Extras (RPMs)
        organization: "Default Organization"
        product: Red Hat Enterprise Linux Server
        state: disabled
        repositories:
          - basearch: x86_64





Status
------




- This module is not guaranteed to have a backwards compatible interface. *[preview]*


- This module is :ref:`maintained by the Ansible Community <modules_support>`. *[community]*





Authors
~~~~~~~

- Andrew Kofink (@akofink)


.. hint::
    If you notice any issues in this documentation you can `edit this document <https://github.com/theforeman/foreman-ansible-modules/edit/master/modules/katello_repository_set.py?description=%3C!---%20Your%20description%20here%20--%3E%0A%0A%2Blabel:%20docsite_pr>`_ to improve it.
