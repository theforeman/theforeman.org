
The Foreman installer is a collection of Puppet modules that installs everything required for a full working Foreman setup.  It uses native OS packaging (e.g. RPM and .deb packages) and adds necessary configuration for the complete installation.

Components include the Foreman web UI, Smart Proxy, Passenger (for the puppet master and Foreman itself), and optionally TFTP, DNS and DHCP servers.  It is configurable and the Puppet modules can be read or run in "no-op" mode to see what changes it will make.

#### Supported platforms
* CentOS, Scientific Linux or Oracle Linux 6 or 7, x86_64
* Debian 8 (Jessie), i386/amd64/armhf
* Debian 7 (Wheezy), i386/amd64
* Fedora 21, x86_64
* Red Hat Enterprise Linux 6 or 7, x86_64
* Ubuntu 14.04 (Trusty), i386/amd64/armhf
* Ubuntu 12.04 (Precise), i386/amd64

Other operating systems will need to use alternative installation methods (see the manual).
