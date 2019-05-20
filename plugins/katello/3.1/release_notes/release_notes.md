---
layout: plugins/katello/documentation
robots: noindex
title: Release Notes
version: 3.1
---

# Katello 3.1 (California Common) Release Notes

## Features 

### Tooling
 * Have the katello service script handle pulp_streamer and squid ([#15484](http://projects.theforeman.org/issues/15484), [7ce677fe](https://github.com/katello//commit/7ce677fee8ea5dcbc4d40098f3cc9895ebb99dd7))

### Installer
 * Make migration generation easier ([#15205](http://projects.theforeman.org/issues/15205), [2af541b4](https://github.com/katello/katello-installer/commit/2af541b44027996ff4703ae97d96004ed5205079))
 * Provide a Rake command to setup a local set of modules similar to how the RPM is built ([#14334](http://projects.theforeman.org/issues/14334), [ada4a4f2](https://github.com/katello/katello-installer/commit/ada4a4f282f99e92646558eebbbc0914084c7c23))

### CLI
 * Upgrade to rubocop 0.39 ([#15029](http://projects.theforeman.org/issues/15029), [36439787](https://github.com/katello/hammer-cli-katello/commit/364397877e80cf99d098748bb418476f1fea079a))

### Tests
 * Run rubocop on rake files ([#15004](http://projects.theforeman.org/issues/15004), [7e1ce1b8](https://github.com/katello/katello/commit/7e1ce1b87479af7c00508923612849d766cbcd26))

### foreman-debug
 * Do not collect squid logs when called from sosreport ([#14608](http://projects.theforeman.org/issues/14608), [32f4434b](https://github.com/katello/katello-packaging/commit/32f4434b668eedf4914a8df82a82de235f1c1826))

### API
 * migrate Release version to host subscriptions controller ([#13903](http://projects.theforeman.org/issues/13903), [536c81e3](https://github.com/katello/katello/commit/536c81e36cd5beb0ceb1d702199c34a8d4a545e4))

### Repositories
 * Running Sync status to contain a direct link to sync tasks ([#10315](http://projects.theforeman.org/issues/10315), [c7746d63](https://github.com/katello/katello/commit/c7746d633041f4f0b4faea4e6715289235772e36))

### Other
 * Add the bin directory and rails script to katello ([#15035](http://projects.theforeman.org/issues/15035), [2d5b1b8e](https://github.com/katello/katello/commit/2d5b1b8e8d2640c83185736ed248f2d7c5976c62))
 * Support rubocop 0.39.0 ([#14950](http://projects.theforeman.org/issues/14950), [bd547d2d](https://github.com/katello/katello/commit/bd547d2dedbe65e96ba958e7f36d8c6e1c763480), [97f83ee6](https://github.com/katello/katello/commit/97f83ee651cd49729d81549edb90cee9e1c8f535), [5e9b7a60](https://github.com/katello/katello/commit/5e9b7a60a2adbb872aa749fd60398ea2b80602ac), [f940aab0](https://github.com/katello/katello/commit/f940aab08dab591e1b3df5bb214a05bc38b738b4), [36c185c5](https://github.com/katello/katello/commit/36c185c50c7040540a2c54b4599f4be84cdeab77))
 * Update Katello to use Task Groups ([#13566](http://projects.theforeman.org/issues/13566), [f803b183](https://github.com/katello/katello/commit/f803b1831438492f7a66d05df47f14c874fff630))

## Bug Fixes 

### Web UI
 * Sync Status page not drawn properly if sync in progress ([#15499](http://projects.theforeman.org/issues/15499), [43ddadae](https://github.com/katello/katello/commit/43ddadaec1d535a5e1a048a053af9d066c447794))
 * Duplicate key on "katello_content_facet_errata_eid_caid" under load ([#15407](http://projects.theforeman.org/issues/15407), [fa3f1fa3](https://github.com/katello//commit/fa3f1fa37c5c347a51cbc02f97c72d9aa5f8d7f4))
 * Available pool quantity is wrong after removed subscribed pool(by virt-who) ([#15394](http://projects.theforeman.org/issues/15394), [e2875646](https://github.com/katello/katello/commit/e28756464517ca7ad971d6669010cd69dfdaf575))
 * "Reset Puppet Environment to match selected Content View" does not work ([#15295](http://projects.theforeman.org/issues/15295), [525a381b](https://github.com/katello/katello/commit/525a381b1c053bde4907fa7ce705b8f6ee394b0b))
 * The page does not load while accessing Content -> "Gpg Keys" when having Any Context set ([#15221](http://projects.theforeman.org/issues/15221), [16d3a1cb](https://github.com/katello/katello/commit/16d3a1cb328dd7609fa593f8ea137d12033ee664))
 * Unnecessary date/time transformation for sync plan start date ([#15180](http://projects.theforeman.org/issues/15180), [0baa312f](https://github.com/katello/katello/commit/0baa312fbfecc4c69befc69230fcdf6612cdc6de))
 * Subscription table has mismatched row colors when there are an odd number of subscriptions under one name ([#11871](http://projects.theforeman.org/issues/11871), [5a4af062](https://github.com/katello//commit/5a4af0626d1692f410448a58bd72660f2b36fcec))

### CLI
 * content view filter cannot be created ([#15395](http://projects.theforeman.org/issues/15395), [3b381817](https://github.com/katello//commit/3b381817f574e747e0858339e11fb3df158337b1))
 * 'hammer sync-plan info' doesn't return start date ([#15204](http://projects.theforeman.org/issues/15204), [59b43952](https://github.com/katello/katello/commit/59b43952ee3fbaabc48da6542220dac7c8fc0de4))
 * Unable to remove host collection from activation key via hammer ([#15162](http://projects.theforeman.org/issues/15162), [bb736223](https://github.com/katello/katello/commit/bb7362231f550310181495c5026b1192bdc4179d))
 * Some tests in hammer-cli-katello use MiniTest's assert() method improperly ([#15142](http://projects.theforeman.org/issues/15142), [27fe17d0](https://github.com/katello/hammer-cli-katello/commit/27fe17d01b87ba375d70c7c46435b7c543854249))
 * Repository list test references nonexistent option ([#15032](http://projects.theforeman.org/issues/15032), [aa6f1757](https://github.com/katello/hammer-cli-katello/commit/aa6f1757255f96a11f1f741fc9b1fa224c2a55cd))
 * (bats fail) hammer repository upload_content missing --organization param ([#15013](http://projects.theforeman.org/issues/15013), [e8c714b8](https://github.com/katello/hammer-cli-katello/commit/e8c714b826dfa5e5fd35baecc35f95680200ba5f))
 * hammer-cli-katello: 'capsule content synchronize' generates error with 'name' input ([#14871](http://projects.theforeman.org/issues/14871), [a167e20e](https://github.com/katello/hammer-cli-katello/commit/a167e20edc76969a13fdf550788df6406c20bc6e))
 * hammer host errata apply async - always displays success ([#14860](http://projects.theforeman.org/issues/14860), [8fbe49ee](https://github.com/katello/hammer-cli-katello/commit/8fbe49ee79e56c1cc7624562ac5cf190b7fe804e))
 * hammer capsule content synchronization needs --help to indicate which fields are required and/or optional ([#14656](http://projects.theforeman.org/issues/14656))
 * hammer activation-key --unlimited-content-hosts flag is confusing ([#14333](http://projects.theforeman.org/issues/14333), [fb494a72](https://github.com/katello/hammer-cli-katello/commit/fb494a72c1f4206004490cdfde11d36709aa9267))

### Installer
 * katello install failing due to passenger error ([#15393](http://projects.theforeman.org/issues/15393), [56adbf64](https://github.com/katello/katello-installer/commit/56adbf64bdedfdc5a290ed248c77623d080bf227), [55154c9a](https://github.com/katello/katello-installer/commit/55154c9aaf66605538bc32cab7c8b16a4bc9df63))
 * The `try` method is used in katello-installer, but it only exists in Rails, not Ruby ([#15327](http://projects.theforeman.org/issues/15327), [41df3788](https://github.com/katello/katello-installer/commit/41df37885ec5bb663dc9656af0d4f22402838372))
 * There is no nil check for missing kafo params 'capsule_certs' and 'parent_fqdn' ([#15325](http://projects.theforeman.org/issues/15325), [0aa56393](https://github.com/katello/katello-installer/commit/0aa563937629ca8ab66c76e4705b8c917b927550))
 * Capsule upgrade 6.1->6.2 snap 13 incorrectly resets trusted hosts and foreman-url ([#15315](http://projects.theforeman.org/issues/15315), [b2322b35](https://github.com/katello/katello-installer/commit/b2322b35054b13b087a9a2448401f89411dbbf77))
 * Make proxy.rb executable ([#15309](http://projects.theforeman.org/issues/15309), [cee964f1](https://github.com/katello/katello-installer/commit/cee964f18b05844b88261712dbf1a207c14cd9aa))
 * Remove unused sam-installer ([#15208](http://projects.theforeman.org/issues/15208), [4cfddef7](https://github.com/katello/katello-installer/commit/4cfddef7b6fb3796979bd465d162293e3607b34b))
 * Set Client SSL certs via parameters ([#15063](http://projects.theforeman.org/issues/15063), [fe37561e](https://github.com/katello/katello-installer/commit/fe37561e43779b283414405b4d9ad9ad9da9b6bd))
 * capsule-certs-generate does not honour "--parent-fqdn" parameter  ([#14978](http://projects.theforeman.org/issues/14978), [3df90771](https://github.com/katello/katello-installer/commit/3df90771d976ce7cb21419c6e09506843cd031e4))
 * Have Katello-installer check to see if there is a proxy env set before running ([#14956](http://projects.theforeman.org/issues/14956), [af52c83c](https://github.com/katello/katello-installer/commit/af52c83c3e7dc649049191cf4fbecbf83f01042e))
 * deploy candlepin url using fqdn ([#14617](http://projects.theforeman.org/issues/14617), [f18f34db](https://github.com/katello/puppet-katello/commit/f18f34dbca8d77f2e1c229f780775b46dab9fda3))
 * [RFE] katello-installer should include --capsule-tftp true by default ([#13546](http://projects.theforeman.org/issues/13546))
 * Katello 3.0 RC5  Upgrade fail  ([#15269](http://projects.theforeman.org/issues/15269), [b5f07391](https://github.com/katello//commit/b5f07391221ca330bade21d1d1614e1e4e2ee4f4))

### Errata Management
 * errata page broken ([#15389](http://projects.theforeman.org/issues/15389), [42502063](https://github.com/katello/katello/commit/42502063e7a47176dec428b13aade2c6329438de))
 * distinct used when finding applicable errata, causing severe slowdowns on dashboard ([#15253](http://projects.theforeman.org/issues/15253), [4667141b](https://github.com/katello/katello/commit/4667141bff31d8781600a19977f1d529e0218b5b))

### Pulp
 * checksum-type does not updated on already synced repository at Capsule. ([#15377](http://projects.theforeman.org/issues/15377), [57ab21e3](https://github.com/katello/katello/commit/57ab21e3d195e977e7844266ecd2572074cf6ef2))
 * Removing a content view, doesn't free disk space ([#15369](http://projects.theforeman.org/issues/15369))

### Activation Key
 * Activation Key returning all systems under associations tab ([#15347](http://projects.theforeman.org/issues/15347), [515a48bf](https://github.com/katello/katello/commit/515a48bf0618c87c63666f945dcc7ae875c69b61))

### Hosts
 * Subscription status is wrong on content host details > subscriptions tab ([#15334](http://projects.theforeman.org/issues/15334), [3c040d05](https://github.com/katello/katello/commit/3c040d05dd25db8c64d91a992b6e75f1d7218f9c))
 * No permissions for power, puppetrun e.t.c in API ([#15236](http://projects.theforeman.org/issues/15236), [5d553340](https://github.com/katello/katello/commit/5d55334096bbf82c7dcb2e7aa4ae098122c24c50))
 * Duplicate entries for hypervisors after renaming content host ([#15197](http://projects.theforeman.org/issues/15197), [78bb525a](https://github.com/katello/katello/commit/78bb525a7814b94680233f7baeb465945fbdff56))
 * Content hosts licensing status is hard to determine from dot colors ([#14992](http://projects.theforeman.org/issues/14992), [bf97d409](https://github.com/katello/katello/commit/bf97d4098fdfed34a40acbd46744b0d690e91d9b))
 * Enable feature to update all packages for a host collection to patch all hosts at once ([#14940](http://projects.theforeman.org/issues/14940), [f85fc0dc](https://github.com/katello/katello/commit/f85fc0dc9212ccba157cfbd0f7c1721b1d04a69b))
 * Katello should be using host.comment instead of content_host.description ([#14822](http://projects.theforeman.org/issues/14822), [155c2f55](https://github.com/katello/katello/commit/155c2f550672057b0ec01a54f0d7afdc6b0519c0))
 * Content Host status is green, but shows "Warning" ([#14372](http://projects.theforeman.org/issues/14372), [d31dff1e](https://github.com/katello/katello/commit/d31dff1eaa26ee3e7390c820457c129a58e5d413))

### Subscriptions
 * Hammer subscription list no longer reports subscriptions as uuids ([#15275](http://projects.theforeman.org/issues/15275), [edafb346](https://github.com/katello/hammer-cli-katello/commit/edafb34667e01c6ff9eac4489c2feb6fec081b35))
 * webUI, Subscription Status shows green instead of red if registered system without auto-attach. ([#15209](http://projects.theforeman.org/issues/15209), [c621ef28](https://github.com/katello/katello/commit/c621ef28136fe4391c890dd800e8ae32cdeca73f))
 * removing a vdc subscription causes candlepin listener to fail as the guest subs are removed too ([#15207](http://projects.theforeman.org/issues/15207), [a89f1f0c](https://github.com/katello/katello/commit/a89f1f0c7bb90290c8796282076afae26dc5df7e))
 * content host installed_products array needs to pass product arch and version to candlepin when specified ([#14593](http://projects.theforeman.org/issues/14593), [20efbb2e](https://github.com/katello/katello/commit/20efbb2e5e2e1c781bb9b6dc484cdf7023e782e2))
 * dynflow_executor memory usage continues to grow, causing performance degredation ([#12650](http://projects.theforeman.org/issues/12650), [7f661597](https://github.com/katello/katello/commit/7f6615978d177510dbebadc4f2edb87184420016))
 * manifest import messages no longer displayed in UI ([#11125](http://projects.theforeman.org/issues/11125), [9789f11e](https://github.com/katello/katello/commit/9789f11e41ffcb764484becff14b5047ff70e105))
 * Importing rhsm facts doesn't set the virtual flag ([#15559](http://projects.theforeman.org/issues/15559), [7b2e6900](https://github.com/katello//commit/7b2e6900777630ad186089c52c0f6fd42373f918))

### API
 * API /products/:product/repositories fails with undefined method ([#15186](http://projects.theforeman.org/issues/15186), [aad44630](https://github.com/katello/katello/commit/aad446300709ff8dc023a2d93d624a41cd2e5e00))
 * Organization show api broken ([#15185](http://projects.theforeman.org/issues/15185), [77e1ab61](https://github.com/katello/katello/commit/77e1ab6140a5e58661e6742343c533491f0e743f))
 * Adding puppet module to Content View by API does not set version, and therefor exclude it in publishing the module ([#15177](http://projects.theforeman.org/issues/15177), [849f26b6](https://github.com/katello/katello/commit/849f26b6dbd5ac4108ff6373ef9491df9fef5855))
 * Api request fails for GET /katello/api/organizations/:organization_id/environments/:id/repositories  ([#15159](http://projects.theforeman.org/issues/15159), [195b9a69](https://github.com/katello/katello/commit/195b9a69aefaf89f45fae1335a0dbafd74d34cff))
 * PUT /api/v2/host_collections/ do not return 'host_ids' attribute ([#15486](http://projects.theforeman.org/issues/15486), [15c1a2eb](https://github.com/katello/katello/commit/15c1a2eb3552c8379e15248c1e9e10fa6fc846a1))
 * Unable to add puppet module stdlib to my content view through the UI ([#15435](http://projects.theforeman.org/issues/15435), [11a5a536](https://github.com/katello/katello/commit/11a5a536052c575ef081c0c92ae39b3223940b9c))

### API doc
 * Document facet attributes for hosts ([#15165](http://projects.theforeman.org/issues/15165), [29f42a35](https://github.com/katello/katello/commit/29f42a35bb9eddcfc8271bc1e3d1dd569579134d))

### Capsule
 * capsule-remove doesn't remove foreman-installer configs and old certs which causes failure of next capsule install  ([#14906](http://projects.theforeman.org/issues/14906), [2f31c5f9](https://github.com/katello/katello-installer/commit/2f31c5f9841bc14d2ad70d03e8eea8fd841e0770))
 * Main sync page throws error/warning upon completion of sync if capsules non-responsive ([#14873](http://projects.theforeman.org/issues/14873), [750181d0](https://github.com/katello/katello/commit/750181d05c2e8de93d1a59bc72727c7f26abd58e))
 * Capsule sync progress should be shown only upto 2 decimal places ([#14644](http://projects.theforeman.org/issues/14644), [91e6967e](https://github.com/katello/katello/commit/91e6967e620bd0c637929c9b32db311ea5eec19f))

### Organizations and Locations
 *  "Content Host Counts" column on the Errata page should only count hosts in the current org ([#14933](http://projects.theforeman.org/issues/14933), [1bddf751](https://github.com/katello/katello/commit/1bddf751ca34d9e786648a2e40e1601769888d2e))

### foreman-debug
 * [foreman-debug] collect /etc/qpid-dispatch/qdrouterd.conf ([#14881](http://projects.theforeman.org/issues/14881), [b73086c2](https://github.com/katello/katello-packaging/commit/b73086c208c192d9c0cf7379e6d52910a7c1b35e))

### Documentation
 * katello-packaging README points to wrong branch ([#14515](http://projects.theforeman.org/issues/14515), [1ada7271](https://github.com/katello/katello-packaging/commit/1ada7271ffdd2439135fb32be68cc1c31f123436))

### Performance
 * product API call with 'enabled=true' slow, causing product page to load slowly ([#14259](http://projects.theforeman.org/issues/14259), [98e9acf6](https://github.com/katello/katello/commit/98e9acf6d88d9cdd6c408297494373721965488f))

### Upgrades
 * On upgraded Viewer role user still can manage Content Views ([#15460](http://projects.theforeman.org/issues/15460), [118ea637](https://github.com/katello//commit/118ea637834534dbe470dee14b868ae74567ccdf))

### Candlepin
 * sub-man registration currently blocks on applicability generation ([#12749](http://projects.theforeman.org/issues/12749), [8305bfbf](https://github.com/katello//commit/8305bfbf8d917b28fe9948dfd1cdcae7de77acbc))

### Other
 * list of packages on About page missing crucial entries ([#15242](http://projects.theforeman.org/issues/15242), [1ade0806](https://github.com/katello/katello/commit/1ade0806bdaa400ac5e063bf0bec47fddc342181))
 *  REST Timeout during manifest import  ([#15170](http://projects.theforeman.org/issues/15170), [022e3d86](https://github.com/katello/puppet-katello/commit/022e3d869580e7bc0931f5e28f9727ebb5b322ee))
 * Remove old broken script files ([#15034](http://projects.theforeman.org/issues/15034), [ebf96ef2](https://github.com/katello/katello/commit/ebf96ef2337018f5a9a260f9b5adf37df542f340))
 * Errant single quote in apidoc for repository create param checksum ([#14975](http://projects.theforeman.org/issues/14975), [0879c327](https://github.com/katello/katello/commit/0879c327e666499243514c1ccb27da80807a41b1))
 * Nightly fails with undefined method 'value' for module ([#14973](http://projects.theforeman.org/issues/14973), [e19e50ab](https://github.com/katello/katello/commit/e19e50abcc41cd7ec268e9024942fa68b88447d0))
 * Docs links in the contributing markdown file are broken ([#14972](http://projects.theforeman.org/issues/14972), [34bfd757](https://github.com/katello/katello/commit/34bfd757773bbd77e8c4c5235d3a739a7a030f48))
 * Uploaded puppet modules from hammer CLI not visible in the UI ([#14949](http://projects.theforeman.org/issues/14949), [4730c9d2](https://github.com/katello/katello/commit/4730c9d2c56c63d85c04672f2a7e9743dc4a65a2))
 * CDN url is allowed to be "https", which only works for one hostname ([#14916](http://projects.theforeman.org/issues/14916), [850a07fe](https://github.com/katello/katello/commit/850a07fec71c55849141c4924c8bd428b927386c))
 * foreman proxy still running on port 8000 needlessly. ([#14750](http://projects.theforeman.org/issues/14750), [01635aa2](https://github.com/katello/katello-installer/commit/01635aa25b4b0642804efc33ce33b9b3eaeefda0))
 * update of subscription facet triggers a second call to dynflow ([#14709](http://projects.theforeman.org/issues/14709), [77b7b555](https://github.com/katello/katello/commit/77b7b555643259212ed0d6879018ec9c84eac2ff))
 * extracting strings is not working due to humanized names ([#14610](http://projects.theforeman.org/issues/14610), [42c1152d](https://github.com/katello/katello/commit/42c1152dbcb3b41d01d4ed3327e86637e39dbdc0))
 * hammer ping prompts for admin password ([#14397](http://projects.theforeman.org/issues/14397))
 * Katello's late initialization causes issues when resuming dynflow tasks ([#15114](http://projects.theforeman.org/issues/15114), [28cb3ef5](https://github.com/katello/katello/commit/28cb3ef503df6f53a14e68b0e80d4048d3a37b7a))


# Contributors

Adam Price
Adam Ruzicka
Andrew Kofink
Brad Buckingham
Bryan Kearney
Chris Duryee
Chris Roberts
Christine Fouant
David Davis
Eric D Helms
Ivan Nečas
John Mitsch
Justin Sherrill
Marek Hulan
Mike McCune
Ondrej Prazak
Partha Aji
Ranjan Kumar
Sean O'Keeffe
Shimon Shtein
Shlomi Zadok
Stephen Benjamin
Tomer Brisker
Tom McKay
Walden Raines
xprazak2
Zach Huntington-Meath

