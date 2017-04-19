---
layout: post
title: Foreman Community Newsletter - September 2016
date: 2016-09-29 11:55:26
author: Greg Sutcliffe
tags:
- foreman
- newsletter
- community
excerpt: |
  Foreman 1.13 highlights, Katello 3.1 and 3.2-RC1, EL6 deprecated for 1.14 and all the
  usual plugin and media roundup
---

### Foreman 1.13 RC2 released

Foreman 1.13 RC2 is now available for general testing - and this is a big one!
We've got the initial work on IPv6 (addressing and partial orchestration), UEFI
and GRUB2 bootloader support, improvements to DHCP subnet parsing, Compute
Resource upgrades (notably OpenStack Liberty), and support for Facter 2's
structured facts - and that's just the headlines!

With so many new features, your help is needed more than ever to test this
release and ensure it meets the rock-solid quality expected of our releases.
You can find out more and get involved from the [announcement][1_13_rc1] and
please do report any [bugs][bugs]. Thanks!

[1_13_rc1]: https://groups.google.com/d/topic/foreman-announce/klyCElDqal0/discussion
[bugs]: http://projects.theforeman.org/projects/foreman/issues/new

### 1.12.3 released

The latest point release of the Foreman 1.12 series is now available, bringing
bugfixes and support for Puppet Server 2.6. You can read all the details in the
[announcement][1_12_3]

[1_12_3]: https://groups.google.com/d/topic/foreman-users/0njkhkpRWzM/discussion

### EL6 deprecated in 1.13, to be removed in 1.14

Users of EL6 / Centos6 should be aware that 1.13 will be the last release with
packages for this OS. 1.13 will be supported until early next year, and users
are strongly encouraged to start planning their migrations before that date.

Note that installation of EL6 hosts from Foreman is still supported - it's the
packages for Foreman itself that will no longer be produced for EL6.

1.13 RC packages are currently missing for EL6 - this is being worked on, so
look for them in the near future.

### Katello 3.1 and 3.2 RC1

The long-awaited Katello 3.1 release happened on September 9th, bringing a
welcome round of improvements. You can learn more via the
[announcement][K_3_1].

Hot on 3.1's heels, Katello 3.2 RC1 has just been released - notably bring
support for Puppet 4 to Katello. As always, your testing is hugely appreciated
in making these releases as stable as possible - if you'd like to try it out,
check out [this thread][K_3_2_rc1] and [let us know][kbugs] how it goes.
Thanks!

[K_3_1]: https://groups.google.com/d/topic/foreman-users/jnvGiYYpd9A/discussion
[K_3_2_rc1]: https://groups.google.com/d/topic/foreman-users/3gGorphv1vI/discussion
[kbugs]: http://projects.theforeman.org/projects/katello/issues/new

### New media and blogs

#### [Community Demo - 15th September](https://youtu.be/GFNPHypFhl4)

Another packed demo, great to see them building up again. This time we had some
Roles/Orgs updates, Ansible & Remote Execution integration, Katello
improvements and a new MS-DHCP provider for the smart proxy. Check it out!

### Upcoming events

#### [AnsibleFest Brooklyn - 11th October](https://www.ansible.com/ansiblefest)

We're hoping to have a small presence at the next AnsibleFest in Brooklyn next
month - if you're planning to go along, you can ping [Andrew][akofink]
(*akofink* on IRC) or get in touch with [me][mail_greg] and if there's enough
interest, perhaps we can get a Foreman/Ansible thing going on the day!

[akofink]: https://twitter.com/akofink
[mail_greg]: mailto:greg.sutcliffe@gmail.com

#### [Community Demo - 13th October](https://youtu.be/Rao1O1mc8AU)

The next community demo will be on 13th October, and as ever you're warmly
welcomed to join us live for an hour of discussion on the latest work done in
the Foreman community. See you then!

#### [CfgMgmtCamp Berlin - 15th November](http://cfgmgmtcamp.eu/berlin-2016)

If you love Config Management Camp in Ghent, but just can't wait until
February, then you'll want to check out the one day event being organised in
Berlin. Registration *and* the CFP are still open, so book in, and maybe even
submit a Foreman talk of your own!

_(All Foreman events are now available via the [Foreman Calendar](/events))_

### Updated plugins

- [foreman_ansible](https://github.com/theforeman/foreman_ansible) updated to 1.2

Foreman Ansible now orchestrates running role playbooks via foreman-tasks.
Packaging is almost done, and [Daniel][dlobatog] will make announcement to the
[mailing list][userslist] once it's all done. Be sure to check the docs for the
changes.

- [foreman_bootdisk](https://github.com/theforeman/foreman_bootdisk) updated to 8.0.2
- [foreman_hooks](https://github.com/theforeman/foreman_hooks) updated to 0.3.12
- [foreman_openscap](https://github.com/OpenSCAP/foreman_openscap) updated to 0.6.2
- [foreman_remote_execution](https://github.com/theforeman/foreman_remote_execution) updated to 1.2.1
- [foreman_templates](https://github.com/theforeman/foreman_templates) updated to 3.0.0
- [foreman_xen](https://github.com/theforeman/foreman-xen) updated to 0.3.1
- [hammer_cli](https://github.com/theforeman/hammer-cli) updated to 0.8.0

- [smart_proxy_dns_infoblox](https://github.com/theforeman/smart_proxy_dns_infoblox) &
  [smart_proxy_dhcp_infoblox](https://github.com/theforeman/smart_proxy_dhcp_infoblox) now RPM & DEB packaged

[dlobatog]: https://twitter.com/dLobatog
[userslist]: https://groups.google.com/forum/#!forum/foreman-users

### Acknowledgements

Thanks to everyone who contributes to the Foreman community - patches, plugins,
testing, bug reports, translations, interviews, presentations, and everything
else. Your efforts are very much appreciated!
