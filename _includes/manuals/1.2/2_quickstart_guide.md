
The Foreman installer is a collection of Puppet modules that installs everything required for a full working Foreman setup.  It uses native OS packaging (e.g. RPM and .deb packages) and adds necessary configuration for the complete installation.

Components include the Foreman web UI, Smart Proxy, Passenger (for the puppet master and Foreman itself), and optionally TFTP, DNS and DHCP servers.  It is configurable and the Puppet modules can be read or run in "no-op" mode to see what changes it will make.

#### Supported platforms
* RHEL derivatives (CentOS), version 6 (EPEL required, plus subscribe to "optional" channel on RHEL 6)
* Fedora 18, 19
* Debian 7 (Wheezy)
* Debian 6 (Squeeze) (update Puppet from backports)
* Ubuntu 12.04 (Precise)

Other operating systems will need to use alternative installation methods (see the manual).
