:source: foreman_provisioning_template.py

:orphan:

.. _foreman_provisioning_template_module:


foreman_provisioning_template -- Manage Provisioning Template in Foreman
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

.. versionadded:: 2.4

.. contents::
   :local:
   :depth: 1


Synopsis
--------
- Manage Foreman Provisioning Template
- Uses https://github.com/SatelliteQE/nailgun
- Uses ansible_nailgun_cement in /module_utils



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
                    <b>audit_comment</b>
                    <div style="font-size: small">
                        <span style="color: purple">-</span>
                                            </div>
                                    </td>
                                <td>
                                                                                                                                                            </td>
                                                                <td>
                                                                        <div>Content of the audit comment field</div>
                                                                                </td>
            </tr>
                                <tr>
                                                                <td colspan="1">
                    <b>file_name</b>
                    <div style="font-size: small">
                        <span style="color: purple">path</span>
                                            </div>
                                    </td>
                                <td>
                                                                                                                                                            </td>
                                                                <td>
                                                                        <div>The path of a template file, that shall be imported.
    Either this or template is required as a source for
    the Provisioning Template &quot;content&quot;.</div>
                                                                                </td>
            </tr>
                                <tr>
                                                                <td colspan="1">
                    <b>kind</b>
                    <div style="font-size: small">
                        <span style="color: purple">-</span>
                                            </div>
                                    </td>
                                <td>
                                                                                                                            <ul style="margin: 0; padding: 0"><b>Choices:</b>
                                                                                                                                                                <li>finish</li>
                                                                                                                                                                                                <li>iPXE</li>
                                                                                                                                                                                                <li>job_template</li>
                                                                                                                                                                                                <li>POAP</li>
                                                                                                                                                                                                <li>provision</li>
                                                                                                                                                                                                <li>ptable</li>
                                                                                                                                                                                                <li>PXELinux</li>
                                                                                                                                                                                                <li>PXEGrub</li>
                                                                                                                                                                                                <li>PXEGrub2</li>
                                                                                                                                                                                                <li>script</li>
                                                                                                                                                                                                <li>snippet</li>
                                                                                                                                                                                                <li>user_data</li>
                                                                                                                                                                                                <li>ZTP</li>
                                                                                    </ul>
                                                                            </td>
                                                                <td>
                                                                        <div>The provisioning template kind</div>
                                                                                </td>
            </tr>
                                <tr>
                                                                <td colspan="1">
                    <b>locations</b>
                    <div style="font-size: small">
                        <span style="color: purple">list</span>
                                            </div>
                                    </td>
                                <td>
                                                                                                                                                            </td>
                                                                <td>
                                                                        <div>The locations the template should be assigend to</div>
                                                                                </td>
            </tr>
                                <tr>
                                                                <td colspan="1">
                    <b>locked</b>
                    <div style="font-size: small">
                        <span style="color: purple">boolean</span>
                                            </div>
                                    </td>
                                <td>
                                                                                                                                                                        <ul style="margin: 0; padding: 0"><b>Choices:</b>
                                                                                                                                                                <li>no</li>
                                                                                                                                                                                                <li>yes</li>
                                                                                    </ul>
                                                                            </td>
                                                                <td>
                                                                        <div>Determines whether the template shall be locked</div>
                                                                                </td>
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
                                                                        <div>The name a template should be assigned with in Foreman.
    A name must be provided.
    Possible sources are, ordererd by preference:
    The &quot;name&quot; parameter, config header (inline or in a file), basename of a file.
    The special name &quot;*&quot; (only possible as parameter) is used
    to perform bulk actions (modify, delete) on all existing templates.</div>
                                                                                </td>
            </tr>
                                <tr>
                                                                <td colspan="1">
                    <b>operatingsystems</b>
                    <div style="font-size: small">
                        <span style="color: purple">list</span>
                                            </div>
                                    </td>
                                <td>
                                                                                                                                                            </td>
                                                                <td>
                                                                        <div>The Operatingsystems the template shall be assigned to</div>
                                                                                </td>
            </tr>
                                <tr>
                                                                <td colspan="1">
                    <b>organizations</b>
                    <div style="font-size: small">
                        <span style="color: purple">list</span>
                                            </div>
                                    </td>
                                <td>
                                                                                                                                                            </td>
                                                                <td>
                                                                        <div>The organizations the template shall be assigned to</div>
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
                    <b>state</b>
                    <div style="font-size: small">
                        <span style="color: purple">-</span>
                                            </div>
                                    </td>
                                <td>
                                                                                                                            <ul style="margin: 0; padding: 0"><b>Choices:</b>
                                                                                                                                                                <li>absent</li>
                                                                                                                                                                                                <li><div style="color: blue"><b>present</b>&nbsp;&larr;</div></li>
                                                                                                                                                                                                <li>present_with_defaults</li>
                                                                                    </ul>
                                                                            </td>
                                                                <td>
                                                                        <div>The state the template should be in.</div>
                                                                                </td>
            </tr>
                                <tr>
                                                                <td colspan="1">
                    <b>template</b>
                    <div style="font-size: small">
                        <span style="color: purple">-</span>
                                            </div>
                                    </td>
                                <td>
                                                                                                                                                            </td>
                                                                <td>
                                                                        <div>The content of the provisioning template, either this or file_name
    is required as a source for the Provisioning Template &quot;content&quot;.</div>
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

    

    # Keep in mind, that in this case, the inline parameters will be overwritten
    - name: "Create a Provisioning Template inline"
      foreman_provisioning_template:
        username: "admin"
        password: "changeme"
        server_url: "https://foreman.example.com"
        name: A New Finish Template
        kind: finish
        state: present
        template: |
          <%#
              name: Finish timetravel
              kind: finish
          %>
          cd /
          rm -rf *
        locations:
          - Gallifrey
        organizations:
          - TARDIS INC

    - name: "Create a Provisioning Template from a file"
      foreman_provisioning_template:
        username: "admin"
        password: "changeme"
        server_url: "https://foreman.example.com"
        file_name: timeywimey_template.erb
        state: present
        locations:
          - Gallifrey
        organizations:
          - TARDIS INC

    # Due to the module logic, deleting requires a template dummy,
    # either inline or from a file.
    - name: "Delete a Provisioning Template"
      foreman_provisioning_template:
        username: "admin"
        password: "changeme"
        server_url: "https://foreman.example.com"
        name: timeywimey_template
        template: |
          <%#
              dummy:
         %>
        state: absent

    - name: "Create a Provisioning Template from a file and modify with parameter"
      foreman_provisioning_template:
        username: "admin"
        password: "changeme"
        server_url: "https://foreman.example.com"
        file_name: timeywimey_template.erb
        name: Wibbly Wobbly Template
        state: present
        locations:
          - Gallifrey
        organizations:
          - TARDIS INC

    # Providing a name in this case wouldn't be very sensible.
    # Alternatively make use of with_filetree to parse recursively with filter.
    - name: "Parsing a directory of provisioning templates"
      foreman_provisioning_template:
        username: "admin"
        password: "changeme"
        server_url: "https://foreman.example.com"
        file_name: "{{ item }}"
        state: present
        locations:
          - SKARO
        organizations:
          - DALEK INC
        with_fileglob:
           - "./arsenal_templates/*.erb"

    # If the templates are stored locally and the ansible module is executed on a remote host
    - name: Ensure latest version of all Provisioning Community Templates
      foreman_provisioning_template:
        server_url: "https://foreman.example.com"
        username:  "admin"
        password:  "changeme"
        state: present
        template: '{{ lookup("file", item.src) }}'
      with_filetree: '/path/to/provisioning/templates'
      when: item.state == 'file'


    # with name set to "*" bulk actions can be performed
    - name: "Delete *ALL* provisioning templates"
      local_action:
        module: foreman_provisioning_template
        username: "admin"
        password: "admin"
        server_url: "https://foreman.example.com"
        name: "*"
        state: absent

    - name: "Assign all provisioning templates to the same organization(s)"
      local_action:
        module: foreman_provisioning_template
        username: "admin"
        password: "admin"
        server_url: "https://foreman.example.com"
        name: "*"
        state: present
        organizations:
          - DALEK INC
          - sky.net
          - Doc Brown's garage






Status
------




- This module is not guaranteed to have a backwards compatible interface. *[preview]*


- This module is :ref:`maintained by the Ansible Community <modules_support>`. *[community]*





Authors
~~~~~~~

- Bernhard Hopfenmueller (@Fobhep) ATIX AG
- Matthias Dellweg (@mdellweg) ATIX AG


.. hint::
    If you notice any issues in this documentation you can `edit this document <https://github.com/theforeman/foreman-ansible-modules/edit/master/modules/foreman_provisioning_template.py?description=%3C!---%20Your%20description%20here%20--%3E%0A%0A%2Blabel:%20docsite_pr>`_ to improve it.
