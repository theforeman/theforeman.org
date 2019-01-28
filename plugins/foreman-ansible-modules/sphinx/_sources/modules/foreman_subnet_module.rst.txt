:source: foreman_subnet.py

:orphan:

.. _foreman_subnet_module:


foreman_subnet -- Manage Foreman Subnets using Foreman API
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


.. contents::
   :local:
   :depth: 1


Synopsis
--------
- Create and Delete Foreman Subnets using Foreman API



Requirements
------------
The below requirements are needed on the host that executes this module.

- nailgun >= 0.32.0
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
                    <b>boot_mode</b>
                    <div style="font-size: small">
                        <span style="color: purple">-</span>
                                            </div>
                                    </td>
                                <td>
                                                                                                                            <ul style="margin: 0; padding: 0"><b>Choices:</b>
                                                                                                                                                                <li><div style="color: blue"><b>DHCP</b>&nbsp;&larr;</div></li>
                                                                                                                                                                                                <li>Static</li>
                                                                                    </ul>
                                                                            </td>
                                                                <td>
                                                                        <div>Boot mode used by hosts in this subnet</div>
                                                                                </td>
            </tr>
                                <tr>
                                                                <td colspan="1">
                    <b>cidr</b>
                    <div style="font-size: small">
                        <span style="color: purple">-</span>
                                            </div>
                                    </td>
                                <td>
                                                                                                                                                            </td>
                                                                <td>
                                                                        <div>CIDR prefix length; Required if no mask provided</div>
                                                                                </td>
            </tr>
                                <tr>
                                                                <td colspan="1">
                    <b>dhcp_proxy</b>
                    <div style="font-size: small">
                        <span style="color: purple">-</span>
                                            </div>
                                    </td>
                                <td>
                                                                                                                                                            </td>
                                                                <td>
                                                                        <div>DHCP Smart proxy for this subnet</div>
                                                                                </td>
            </tr>
                                <tr>
                                                                <td colspan="1">
                    <b>discovery_proxy</b>
                    <div style="font-size: small">
                        <span style="color: purple">-</span>
                                            </div>
                                    </td>
                                <td>
                                                                                                                                                            </td>
                                                                <td>
                                                                        <div>Discovery Smart proxy for this subnet</div>
                                                                                </td>
            </tr>
                                <tr>
                                                                <td colspan="1">
                    <b>dns_primary</b>
                    <div style="font-size: small">
                        <span style="color: purple">-</span>
                                            </div>
                                    </td>
                                <td>
                                                                                                                                                            </td>
                                                                <td>
                                                                        <div>Primary DNS server for this subnet</div>
                                                                                </td>
            </tr>
                                <tr>
                                                                <td colspan="1">
                    <b>dns_proxy</b>
                    <div style="font-size: small">
                        <span style="color: purple">-</span>
                                            </div>
                                    </td>
                                <td>
                                                                                                                                                            </td>
                                                                <td>
                                                                        <div>DNS Smart proxy for this subnet</div>
                                                                                </td>
            </tr>
                                <tr>
                                                                <td colspan="1">
                    <b>dns_secondary</b>
                    <div style="font-size: small">
                        <span style="color: purple">-</span>
                                            </div>
                                    </td>
                                <td>
                                                                                                                                                            </td>
                                                                <td>
                                                                        <div>Secondary DNS server for this subnet</div>
                                                                                </td>
            </tr>
                                <tr>
                                                                <td colspan="1">
                    <b>domains</b>
                    <div style="font-size: small">
                        <span style="color: purple">list</span>
                                            </div>
                                    </td>
                                <td>
                                                                                                                                                                    <b>Default:</b><br/><div style="color: blue">None</div>
                                    </td>
                                                                <td>
                                                                        <div>List of DNS domains the subnet should assigned to</div>
                                                                                </td>
            </tr>
                                <tr>
                                                                <td colspan="1">
                    <b>from_ip</b>
                    <div style="font-size: small">
                        <span style="color: purple">-</span>
                                            </div>
                                    </td>
                                <td>
                                                                                                                                                            </td>
                                                                <td>
                                                                        <div>First IP address of the host IP allocation pool</div>
                                                                                </td>
            </tr>
                                <tr>
                                                                <td colspan="1">
                    <b>gateway</b>
                    <div style="font-size: small">
                        <span style="color: purple">-</span>
                                            </div>
                                    </td>
                                <td>
                                                                                                                                                            </td>
                                                                <td>
                                                                        <div>Subnet gateway IP address</div>
                                                                                </td>
            </tr>
                                <tr>
                                                                <td colspan="1">
                    <b>ipam</b>
                    <div style="font-size: small">
                        <span style="color: purple">-</span>
                                            </div>
                                    </td>
                                <td>
                                                                                                                            <ul style="margin: 0; padding: 0"><b>Choices:</b>
                                                                                                                                                                <li><div style="color: blue"><b>DHCP</b>&nbsp;&larr;</div></li>
                                                                                                                                                                                                <li>Internal DB</li>
                                                                                    </ul>
                                                                            </td>
                                                                <td>
                                                                        <div>IPAM mode for this subnet</div>
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
                                                                                                                                                                    <b>Default:</b><br/><div style="color: blue">None</div>
                                    </td>
                                                                <td>
                                                                        <div>List of locations the subnet should be assigned to</div>
                                                                                </td>
            </tr>
                                <tr>
                                                                <td colspan="1">
                    <b>mask</b>
                    <div style="font-size: small">
                        <span style="color: purple">-</span>
                                            </div>
                                    </td>
                                <td>
                                                                                                                                                            </td>
                                                                <td>
                                                                        <div>Subnet netmask. Required if no cidr prefix length provided</div>
                                                                                </td>
            </tr>
                                <tr>
                                                                <td colspan="1">
                    <b>mtu</b>
                    <div style="font-size: small">
                        <span style="color: purple">-</span>
                                            </div>
                                    </td>
                                <td>
                                                                                                                                                            </td>
                                                                <td>
                                                                        <div>MTU</div>
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
                                                                        <div>Subnet name</div>
                                                                                </td>
            </tr>
                                <tr>
                                                                <td colspan="1">
                    <b>network</b>
                    <div style="font-size: small">
                        <span style="color: purple">-</span>
                         / <span style="color: red">required</span>                    </div>
                                    </td>
                                <td>
                                                                                                                                                            </td>
                                                                <td>
                                                                        <div>Subnet IP address</div>
                                                                                </td>
            </tr>
                                <tr>
                                                                <td colspan="1">
                    <b>network_type</b>
                    <div style="font-size: small">
                        <span style="color: purple">-</span>
                                            </div>
                                    </td>
                                <td>
                                                                                                                            <ul style="margin: 0; padding: 0"><b>Choices:</b>
                                                                                                                                                                <li><div style="color: blue"><b>IPv4</b>&nbsp;&larr;</div></li>
                                                                                                                                                                                                <li>IPv6</li>
                                                                                    </ul>
                                                                            </td>
                                                                <td>
                                                                        <div>Subnet type</div>
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
                                                                                                                                                                    <b>Default:</b><br/><div style="color: blue">None</div>
                                    </td>
                                                                <td>
                                                                        <div>List of oganizations the subnet should be assigned to</div>
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
                    <b>remote_execution_proxies</b>
                    <div style="font-size: small">
                        <span style="color: purple">list</span>
                                            </div>
                                    </td>
                                <td>
                                                                                                                                                                    <b>Default:</b><br/><div style="color: blue">None</div>
                                    </td>
                                                                <td>
                                                                        <div>Remote execution Smart proxies for this subnet</div>
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
                                                                        <div>subnet presence</div>
                                                                                </td>
            </tr>
                                <tr>
                                                                <td colspan="1">
                    <b>tftp_proxy</b>
                    <div style="font-size: small">
                        <span style="color: purple">-</span>
                                            </div>
                                    </td>
                                <td>
                                                                                                                                                            </td>
                                                                <td>
                                                                        <div>TFTP Smart proxy for this subnet</div>
                                                                                </td>
            </tr>
                                <tr>
                                                                <td colspan="1">
                    <b>to_ip</b>
                    <div style="font-size: small">
                        <span style="color: purple">-</span>
                                            </div>
                                    </td>
                                <td>
                                                                                                                                                            </td>
                                                                <td>
                                                                        <div>Last IP address of the host IP allocation pool</div>
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
                                <tr>
                                                                <td colspan="1">
                    <b>vlanid</b>
                    <div style="font-size: small">
                        <span style="color: purple">-</span>
                                            </div>
                                    </td>
                                <td>
                                                                                                                                                            </td>
                                                                <td>
                                                                        <div>VLAN ID</div>
                                                                                </td>
            </tr>
                        </table>
    <br/>




Examples
--------

.. code-block:: yaml+jinja

    
    - name: My subnet
      foreman_subnet:
        name: "My subnet"
        network: "192.168.0.0"
        mask: "255.255.255.192"
        gateway: "192.168.0.1"
        from: "192.168.0.2"
        to: "192.168.0.42"
        boot_mode: "Static"
        dhcp_proxy: "smart-proxy1.foo.example.com"
        tftp_proxy: "smart-proxy1.foo.example.com"
        dns_proxy: "smart-proxy2.foo.example.com"
        vlanid: 452
        mtu: 9000
        domains:
        - "foo.example.com"
        - "bar.example.com"
        organizations:
        - "Example Org"
        locations:
        - "Toulouse"
        server_url: "https://foreman.example.com"
        username: "admin"
        password: "secret"
        verify_ssl: False
        state: present





Status
------




- This module is not guaranteed to have a backwards compatible interface. *[preview]*


- This module is :ref:`maintained by the Ansible Community <modules_support>`. *[community]*





Authors
~~~~~~~

- Baptiste Agasse (@bagasse)


.. hint::
    If you notice any issues in this documentation you can `edit this document <https://github.com/theforeman/foreman-ansible-modules/edit/master/modules/foreman_subnet.py?description=%3C!---%20Your%20description%20here%20--%3E%0A%0A%2Blabel:%20docsite_pr>`_ to improve it.
