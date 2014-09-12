
The Foreman installer is a collection of Puppet modules that installs everything required for a full working Foreman setup.  It uses native OS packaging (e.g. RPM and .deb packages) and adds necessary configuration for the complete installation.

Components include the Foreman web UI, Smart Proxy, Passenger (for the puppet master and Foreman itself), and optionally TFTP, DNS and DHCP servers.  It is configurable and the Puppet modules can be read or run in "no-op" mode to see what changes it will make.

#### Supported platforms
* Red Hat Enterprise Linux 6 and derivatives (CentOS, Scientific Linux)
  * [EPEL](http://fedoraproject.org/wiki/EPEL/FAQ#How_can_I_install_the_packages_from_the_EPEL_software_repository.3F) is required
  * On RHEL 6, additionally the Optional and RHSCL 1.0 repositories/channels:
    * `yum-config-manager --enable rhel-6-server-optional-rpms rhel-server-rhscl-6-rpms`
    * check the above repositories because the command can silently fail when subscription does not provide it: `yum repolist`
* Fedora 19
* Debian 7 (Wheezy)
* Debian 6 (Squeeze) (update Puppet [from backports](http://backports.debian.org/Instructions/))
* Ubuntu 14.04 (Trusty)
* Ubuntu 12.04 (Precise)

Other operating systems will need to use alternative installation methods (see the manual).
