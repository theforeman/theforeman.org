
The Foreman installer is a collection of Puppet modules that installs everything required for a full working Foreman setup.  It uses native OS packaging (e.g. RPM and .deb packages) and adds necessary configuration for the complete installation.

Components include the Foreman web UI, Smart Proxy, a Puppet server, and optionally TFTP, DNS and DHCP servers. It is configurable and the Puppet modules can be read or run in "no-op" mode to see what changes it will make.

The installation will require 4GB of memory, see [System Requirements](manuals/{{page.version}}/index.html#3.1SystemRequirements) for more information.

#### Supported platforms

* Enterprise Linux 8, x86_64
* Enterprise Linux 9, x86_64
* Debian 11 (Bullseye), amd64
* Ubuntu 22.04 (Jammy), amd64

#### Enterprise Linux

The Foreman packages and installer are tested on AlmaLinux 8, AlmaLinux 9, CentOS Stream 8 and CentOS Stream 9, but other RHEL derivatives can work because they're similar. Sometimes additional work may be needed. For any queries for these platforms raise a question in [discourse support section](https://community.theforeman.org/c/support/10)
