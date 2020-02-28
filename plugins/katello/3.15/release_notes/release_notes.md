---
title: Release Notes
---

# Katello {{ page.version }} Release Notes

For the full release notes, see the [Changelog](https://github.com/Katello/katello/blob/KATELLO-3.15/CHANGELOG.md).

## Features

### Subscriptions
 * [sat-e-390] Provide informative message on Content -> Subscriptions page when in Simple Content Access ([#28842](https://projects.theforeman.org/issues/28842), [e451d816](https://github.com/Katello/katello.git/commit/e451d816df1f5762bef1b5c5e182c78537fd6e1f))
 * As user I want to see a "disabled" status for Golden Ticketed Orgs ([#28721](https://projects.theforeman.org/issues/28721), [62f26fab](https://github.com/Katello/katello.git/commit/62f26fab0018afd66bc6f124d1c35b676c75215e))
 * Handle ManifestRefresh with Pulp 3 ([#28183](https://projects.theforeman.org/issues/28183), [645def3a](https://github.com/Katello/katello.git/commit/645def3aa6f1edec7ef62e8c062bdf84e87f189c), [36938093](https://github.com/Katello/katello.git/commit/369380931608509ca493c4ef3230ec83db976cd3))

### Errata Management
 * Allow searching errata by issued date ([#28780](https://projects.theforeman.org/issues/28780), [9dd8c02f](https://github.com/Katello/katello.git/commit/9dd8c02f02d73d6064ce3a2c4d220c5a1a50d104))

### Upgrades
 * rake task should validate that all expected content is migrated once it completes ([#28660](https://projects.theforeman.org/issues/28660), [0f32a081](https://github.com/Katello/katello.git/commit/0f32a0811a20e76cc6509c793dc6e5ed608be377))
 * Rake task to switchover any data from pulp2 ids to pulp3 ids ([#28657](https://projects.theforeman.org/issues/28657), [ff5f2fe0](https://github.com/Katello/katello.git/commit/ff5f2fe0ee34f82e27d3c79d4d3f3e3778a42ec5))

### Tooling
 * foreman-debug support for pulp3 ([#28501](https://projects.theforeman.org/issues/28501))
 * katello reset needs to reset pulp3 database  ([#28102](https://projects.theforeman.org/issues/28102), [5c7d6199](https://github.com/Katello/katello.git/commit/5c7d61990adca10d5d06aa3e9573e897671501a1))

### Hammer
 * add possibiliy to add ssl-stuff with the name ([#28294](https://projects.theforeman.org/issues/28294), [b6f129a1](https://github.com/Katello/hammer-cli-katello.git/commit/b6f129a1b7245226499540e2aeb49a14a83cd1ed), [801649e1](https://github.com/Katello/katello.git/commit/801649e1efec04e439ad79262200b0be7fc6f55b))
 * Rename "hammer gpg" command ([#28293](https://projects.theforeman.org/issues/28293), [5c2a94c1](https://github.com/Katello/hammer-cli-katello.git/commit/5c2a94c159df8d7130fc0ad73c8589085d9b441c))

### Web UI
 * Upgrade vendor to v3 ([#28241](https://projects.theforeman.org/issues/28241), [01850835](https://github.com/Katello/katello.git/commit/01850835b2c9901923e2cad83862887ed4452b34), [90ee6e7b](https://github.com/Katello/katello.git/commit/90ee6e7b50402a0055ded6e8b21846712eb6bed7))

### Hosts
 * Create Report Template to list inactive hosts ([#28211](https://projects.theforeman.org/issues/28211), [fc40e380](https://github.com/Katello/katello.git/commit/fc40e38029a95bcb9f75535f268c4399f0b2215d))

### Host Collections
 * HostCollection Errata Install WebUI errata selection and pagination issues ([#27647](https://projects.theforeman.org/issues/27647), [3b7824c6](https://github.com/Katello/katello.git/commit/3b7824c6f28dd5db8eb884e66a14ec125070f239), [667ff57a](https://github.com/Katello/katello.git/commit/667ff57ad9cf874886e97eac51c70556425b839b))

### Other
 * Allow pool organization in safe mode ([#28789](https://projects.theforeman.org/issues/28789), [d6939f6f](https://github.com/Katello/katello.git/commit/d6939f6ff0c5936c00d03ed900a1fd597d0dc176))
 * Disable auto-attach for Host Collection while in Simple Content Access ([#28778](https://projects.theforeman.org/issues/28778), [63b72b6f](https://github.com/Katello/katello.git/commit/63b72b6ffebe3724158abcd593be3ce844eec50a))
 * Extend Organization Jail from core ([#28773](https://projects.theforeman.org/issues/28773), [80e077bb](https://github.com/Katello/katello.git/commit/80e077bbe306c04f13a70e18f4bdf6f28418669c))
 * Use ForemanModal in Katello modals ([#28056](https://projects.theforeman.org/issues/28056), [7ced8f27](https://github.com/Katello/katello.git/commit/7ced8f27806a3efd3660c4464b7b4c6d164af453))


## Deprecation Warnings

### Hammer
 * deprecate ostree and puppet types ([#28908](https://projects.theforeman.org/issues/28908), [3c825116](https://github.com/Katello/hammer-cli-katello.git/commit/3c825116892f5e79c83837ec0c8fb03ad0b912f9))

### API
 * deprecate ostree and puppet types ([#28873](https://projects.theforeman.org/issues/28873), [346bb238](https://github.com/Katello/katello.git/commit/346bb2384586e7442f79a4b0f2c47bc3199aa500))


## Contributors

* Avi Sharvit
* Brad Buckingham
* Chris Roberts
* Dhananjay Gupte
* Eric Helms
* Ian Ballou
* James Jeffers
* Jeremy Lenz
* John Mitsch
* Jonathon Turel
* Justin Sherrill
* Marek Hulán
* Michael Moll
* Partha Aji
* Ranjan Kumar
* Ron Lavi
* Samir Jha
* Shimon Shtein
* Shira Maximov
* Swetha Seelam Lakshmi Narayanan
* Walden Raines
