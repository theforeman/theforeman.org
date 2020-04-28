
The Foreman installer is a collection of Puppet modules that installs everything required for a full working Foreman setup.  It uses native OS packaging (e.g. RPM and .deb packages) and adds necessary configuration for the complete installation.

Components include the Foreman web UI, Smart Proxy, Passenger, a Puppet master (either Puppet Server or under Passenger), and optionally TFTP, DNS and DHCP servers.  It is configurable and the Puppet modules can be read or run in "no-op" mode to see what changes it will make.

#### Supported platforms
* CentOS 7 x86_64
* Debian 10 (Buster), i386/amd64/aarch64
* Red Hat Enterprise Linux 7, x86_64
* Ubuntu 18.04 (Bionic), i386/amd64/aarch64

#### Untested platforms (packages may not work on these)

These platforms are not tested by automatic installations. They are generally close to supported platforms so the packages may work, but additional work may be needed. For any queries for these platforms raise a question in [discourse support section](https://community.theforeman.org/c/support/10)

  * Scientific Linux and Oracle Linux 7, x86_64

Other operating systems will need to use alternative installation methods (see the manual).

The installation will require 4GB of memory, see [System Requirements](manuals/{{page.version}}/index.html#3.1SystemRequirements) for more information.
