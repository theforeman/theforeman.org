---
title: Release Notes
---
# Katello {{ page.version }} Release Notes

## Features

* Make installed packages available in safe mode ([#28082](https://projects.theforeman.org/issues/28082), [c98fdc14](https://github.com/Katello/katello.git/commit/c98fdc1444d1ec43e247dcf7c50e2ed870cb4bbd))
* Generate the complete report about Entitlement Information (hypervisors versus Content Hosts) ([#27923](https://projects.theforeman.org/issues/27923), [63ce30ba](https://github.com/Katello/katello.git/commit/63ce30ba47c954b3d70371ec64fb11a8278397da))
* Add host collections to safe mode ([#27893](https://projects.theforeman.org/issues/27893), [32e7c74e](https://github.com/Katello/katello.git/commit/32e7c74eba444e9c20048b0e587b1aca2d19cf3e))
* [RFE] Add ability to export content view like the CDN ([#27374](https://projects.theforeman.org/issues/27374), [03542576](https://github.com/Katello/hammer-cli-katello.git/commit/035425762591d22cddd649e11835e3147ca7ddf5))
* Content -> Errata should only show repositories that actually contain Errata ([#26975](https://projects.theforeman.org/issues/26975), [6860f9c3](https://github.com/Katello/katello.git/commit/6860f9c3314794b85f1769a83e2501afd91d1cbe))

This release contains many bug fixes in addition to laying the groundwork for moving toward Pulp 3. For the full release notes, see the [Changelog](https://github.com/Katello/katello/blob/KATELLO-3.14/CHANGELOG.md).

## Deprecation Warnings
* deprecate ostree and puppet types ([#28074](https://projects.theforeman.org/issues/28074), [afaed50b](https://github.com/Katello/katello.git/commit/afaed50b6d4c287712405ecc79c8788cbc02caca))
* deprecate background download type ([#28021](https://projects.theforeman.org/issues/28021), [e8979cea](https://github.com/Katello/katello.git/commit/e8979cea62a27706b93ed9c66d43f0cbbcc83602))

## Contributors
- Adam Ruzicka
- Avi Sharvit
- Chris Roberts
- Evgeni Golov
- Ewoud Kohl van Wijngaarden
- Ian Ballou
- Ivan Necas
- James Jeffers
- Jeremy Lenz
- John Mitsch
- Jonathon Turel
- kgaikwad
- Lukas Zapletal
- Marek Hulan
- Markus Bucher
- Nagoor Shaik
- Oleh Fedorenko
- Ondrej Ezr
- Ondrej Prazak
- Partha Aji
- Quirin Pamp
- Samir Jha
- Suraj Patil
- swetha
- Justin Sherrill
- Tomer Brisker
- Walden Raines
- William Clark
