---
layout: plugins/katello/documentation
version: 2.4
title: Release Notes
---

# 2.4.1 Gose (2016-03-11)

## Bug Fixes 

### Dashboard
 * Dashboard gives undefined method `label' for nil:NilClass ([#13823](http://projects.theforeman.org/issues/13823), [dc50145a](http://github.com/katello//commit/dc50145ae2d74847fc6a0563963a50ee7cde2e4d))

### Pulp
 * Task pending on waiting for Pulp to start the task ([#13799](http://projects.theforeman.org/issues/13799))
 * Unable to apply updates/erratas ([#12427](http://projects.theforeman.org/issues/12427))

### Capsule
 * Capsule content sync hangs at 75% (100% of the time) ([#13532](http://projects.theforeman.org/issues/13532))
 * Generate Capsule Metadata and Sync fails - Host did not respond within 20 seconds. Is katello-agent installed and goferd running on the Host ([#11971](http://projects.theforeman.org/issues/11971))

### API
 * incremental update with puppet fails with error 'undefined method `id_search'  ([#13253](http://projects.theforeman.org/issues/13253), [4192beda](http://github.com/katello//commit/4192beda1ccadd4ba52cbc524732ba68c9be7299))
 * System product content does not show redhat content ([#13010](http://projects.theforeman.org/issues/13010), [2d7c3558](http://github.com/katello//commit/2d7c35580d5fcfad5e0b95114ab62f34494d7dca))

### Activation Key
 * Can't delete activation key ([#12984](http://projects.theforeman.org/issues/12984), [de57a7b7](http://github.com/katello//commit/de57a7b79357cc5974f13d0f922e103805940661))

### Other
 * After upgrade to foreman 1.10 my smart proxy is no anymore sync and is only sending resetting dropped connection ([#13286](http://projects.theforeman.org/issues/13286))


# 2.4 Gose (2015-12-23)

## Features 

### Katello Disconnected
 * katello-disconnected doesn't validate repoids ([#12606](http://projects.theforeman.org/issues/12606))

### Installer
 * Support number of pulp workers in katello-installer ([#12062](http://projects.theforeman.org/issues/12062))

### Capsule
 * Content Source should be considered a host proxy ([#11748](http://projects.theforeman.org/issues/11748), [35fe89c6](http://github.com/katello/katello/commit/35fe89c660662148ce14fcc6079509ca45d266ed))

### Web UI
 * Add Package Groups to the UI ([#11337](http://projects.theforeman.org/issues/11337), [745d8f3d](http://github.com/katello/katello/commit/745d8f3db9a180fd21c7fc30cd58fa3ca1ed8378))
 * paginate puppet module list when adding ([#9567](http://projects.theforeman.org/issues/9567))
 * Repo-Sync: Make execution date/time changeable ([#8051](http://projects.theforeman.org/issues/8051))

### Foreman Integration
 * Content Dashboard should be migrated to Foreman dashboard plugin API ([#11239](http://projects.theforeman.org/issues/11239), [1f898c28](http://github.com/katello/katello/commit/1f898c28874016d648f48f287902ae026222d786))
 * Remove Katello custom configuration loader and use foreman SETTINGS ([#10621](http://projects.theforeman.org/issues/10621), [5582ee9f](http://github.com/katello/katello/commit/5582ee9f3ec8a08d39ecd8256e76c2f3c32f3f19))

### Packaging
 * As a developer, I want to manage katello packaging in the foreman-packaging repo ([#9660](http://projects.theforeman.org/issues/9660), [4bd1ccbc](http://github.com/katello/katello/commit/4bd1ccbcfbd8ba617c51041ea6d46aabc7d91224))

### Database
 * scoped search for content_view_puppet_environment ([#8694](http://projects.theforeman.org/issues/8694))
 * scoped search for activation key ([#8691](http://projects.theforeman.org/issues/8691), [6c6e3e9c](http://github.com/katello/katello/commit/6c6e3e9c466d5b03f33677c99cb96cdcf2d4b53a))
 * Move Distributions from Elasticsearch to the Database ([#7890](http://projects.theforeman.org/issues/7890), [e1e62922](http://github.com/katello/katello/commit/e1e62922525efeb911627a8909d696c91ebc77de))
 * Move Puppet Modules from Elasticsearch to Database ([#7889](http://projects.theforeman.org/issues/7889), [eccdbdeb](http://github.com/katello/katello/commit/eccdbdebb3f859afa83998c44fca20fc441d5505))
 * Move Package Groups from Elasticsearch to Database ([#7888](http://projects.theforeman.org/issues/7888), [75932819](http://github.com/katello/katello/commit/759328197002826d0af94307e1a878b44e2fc1a2))
 * Move Packages from Elasticsearch to the Database ([#7887](http://projects.theforeman.org/issues/7887), [690b777d](http://github.com/katello/katello/commit/690b777d62eee0ef1800ddbab5990ac7fa7a7f03))

### CLI
 * As a CLI user, I should be able to set content overrides for content-hosts. ([#8481](http://projects.theforeman.org/issues/8481), [6827d362](http://github.com/katello/katello/commit/6827d362212d6e1897ff10f6512bd3996a283310))

### Puppet
 * Provide top level Puppet Module Inventory page ([#5369](http://projects.theforeman.org/issues/5369))

### Other
 * Move hammer modules to ruby193 SCL ([#11259](http://projects.theforeman.org/issues/11259))
 * Add Downstream Strings ([#10974](http://projects.theforeman.org/issues/10974), [0ff39e64](http://github.com/katello/katello/commit/0ff39e64974c2af85e069f72f7574f4cf11e0571))
 * Remove distributors from code base ([#7836](http://projects.theforeman.org/issues/7836), [f80c3bb8](http://github.com/katello/katello.org/commit/f80c3bb83f3a622ad9862b187cfae4d3e28107f5))

## Bug Fixes 

### Katello Disconnected
 * Moving disconnected satellite to connected causes the enabled reposets to move from RPMs Tab to Others Tab ([#12854](http://projects.theforeman.org/issues/12854), [b80a84fb](http://github.com/katello//commit/b80a84fbd3040e742b976766e88ebf3e270daf88))
 * katello-disconnected configure --help typo ([#12142](http://projects.theforeman.org/issues/12142))

### Tooling
 * Katello backup missing foreman cache data ([#12782](http://projects.theforeman.org/issues/12782))

### Client/Agent
 * Timed out agent/capsule tasks are not cancelled ([#12692](http://projects.theforeman.org/issues/12692), [459c151b](http://github.com/katello//commit/459c151b76d95ab5e8715780cfc4ae96b6f53e2e))
 * Support heartbeats on dispatch router ([#12026](http://projects.theforeman.org/issues/12026))

### Installer
 * Missing dependency on CentOS 7.1: python-cherrypy ([#12625](http://projects.theforeman.org/issues/12625))
 * dhcpd.conf file deleted during 'katello-installer --upgrade' when dhcp_managed = false ([#12519](http://projects.theforeman.org/issues/12519))
 * 2.4.0 upgrade does not have new content indexed ([#12510](http://projects.theforeman.org/issues/12510), [da8fcd75](http://github.com/katello//commit/da8fcd750fd22e47c41cd9c7696e7191dfc7d08e))
 * Passenger fails to load on RHEL 6.7 ([#12047](http://projects.theforeman.org/issues/12047), [db486f1b](http://github.com/katello/katello/commit/db486f1b9dd38825af8685c73b548e041d2039af))
 * puppet-pulp: incorrect value for [messaging] topic_exchange ([#12033](http://projects.theforeman.org/issues/12033))
 * rpms and other contnet not accessible over ssl after install ([#11998](http://projects.theforeman.org/issues/11998))
 * Installer is creating a gutterball user account/group, but are not required. ([#11957](http://projects.theforeman.org/issues/11957))
 * cert checker script does not take into account new installs ([#11856](http://projects.theforeman.org/issues/11856), [c4034051](http://github.com/katello/katello-installer/commit/c4034051b39fb3471c01217e51e020c18d255def))
 * katello candlepin installer wget with proxy ([#11824](http://projects.theforeman.org/issues/11824))
 * Installer does not tell you what cert is missing ([#11751](http://projects.theforeman.org/issues/11751))
 * Installer fails interpreting new plugin params from puppet-foreman ([#11675](http://projects.theforeman.org/issues/11675), [af760308](http://github.com/katello/katello-installer/commit/af7603089d17eb405edda590e8f2a458de16fcf5))
 * Installer package generating rake task does not produce unique builds when run successively ([#11666](http://projects.theforeman.org/issues/11666), [15650b1c](http://github.com/katello/katello-installer/commit/15650b1ce2fdd76a1df8c22295477a3217af19a1))
 * Update puppet-katello to use puppet-pulp 1.0 ([#11609](http://projects.theforeman.org/issues/11609), [6ef5d894](http://github.com/katello/katello-installer/commit/6ef5d894bf8b954ca98225398aa14044d7fb9450))
 * Installer generate source rake task should allow customizing prefix of the git archive ([#11334](http://projects.theforeman.org/issues/11334), [915b6b2f](http://github.com/katello/katello-installer/commit/915b6b2f367446702af30539de9f2a22907efded))
 * Add import package group task to katello-installer ([#11327](http://projects.theforeman.org/issues/11327))
 * Katello : Installation of Pulp Capsule fails ([#11041](http://projects.theforeman.org/issues/11041))

### Subscriptions
 * cannot refresh manifest due to dependent repositories ([#12596](http://projects.theforeman.org/issues/12596), [bd187c08](http://github.com/katello//commit/bd187c08ef94ed9a53ace370593deda472ba4760))
 * Cant add a subscription n Times ([#12251](http://projects.theforeman.org/issues/12251))
 * subscription json missing support_type field ([#12032](http://projects.theforeman.org/issues/12032))
 * generated guest subscriptions not shown in UI ([#12031](http://projects.theforeman.org/issues/12031))
 * subscription data not getting updated after candlepin modifies it ([#12030](http://projects.theforeman.org/issues/12030), [64ffadb3](http://github.com/katello//commit/64ffadb312170958895f4e0beea335c353ac4eb6))
 * subscriptions_controller.rb line 86 should be 'sub' not 'subscription' ([#12029](http://projects.theforeman.org/issues/12029))

### Foreman Integration
 * DisownForemanTemplates migration fails when Foreman and Katello migrations not interleaved ([#12520](http://projects.theforeman.org/issues/12520), [122627eb](http://github.com/katello//commit/122627eb006faba7d07f340914fc0ebc115ff98c))
 * Cannot subscribe content host during provision ([#12302](http://projects.theforeman.org/issues/12302), [bdf89b5e](http://github.com/katello//commit/bdf89b5e0edf6bd1ce257d075e89f1786a3b809f))
 * Hostgroup Jail missing access to subscription_manager_configuration_url ([#12177](http://projects.theforeman.org/issues/12177), [05046a3b](http://github.com/katello//commit/05046a3b2c3d26b1c23e4cd2826e10667fe3d290))
 * Organization parameters cannot be accessed through API ([#11947](http://projects.theforeman.org/issues/11947), [3636d92b](http://github.com/katello//commit/3636d92b1fe711f43d5ef5ef2180ac535570deb9))
 * 'Name can't be blank' error under parameter tab, on creating a hostgroup with activation-key ([#11928](http://projects.theforeman.org/issues/11928), [77f3fc91](http://github.com/katello/katello/commit/77f3fc91f3427dc4e6db69df941ade76a25eefcf))
 * Cannot assign puppet classes to new host ([#9609](http://projects.theforeman.org/issues/9609))

### Activation Key
 * Activation Keys not loaded after UPG from 2.3.1 to 2.4.0RC2 ([#12483](http://projects.theforeman.org/issues/12483))

### Capsule
 * Capsule syncs don't work "ERROR][worker-0] pulp_node.handlers.handler:175 -" ([#12448](http://projects.theforeman.org/issues/12448))

### Pulp
 * Actions::Katello::Repository::Sync reports success regardless errors ([#12397](http://projects.theforeman.org/issues/12397), [564152be](http://github.com/katello//commit/564152be85f3aae476aa9745a04dfe71e2d512b5))
 * Error when uploading rpms to a new repo, content_unit_class is taken as a string ([#12123](http://projects.theforeman.org/issues/12123), [e9edcbe7](http://github.com/katello/katello/commit/e9edcbe7aebbf60712783e171b8564e046a50c11))
 * Hammer ping output has no response for pulp_auth only on providing wrong credentials ([#11701](http://projects.theforeman.org/issues/11701), [ab33add4](http://github.com/katello/katello/commit/ab33add4663449aac6241132602c3334f4587081))

### Upgrades
 * import_package_groups rake task fails with ' uninitialized constant Katello::Pulp::PackageGroup::CONTENT_TYPE' ([#12376](http://projects.theforeman.org/issues/12376), [e68d6129](http://github.com/katello//commit/e68d6129d5e6623bc4bb5e53ea1360ec833ca537))
 * 2.4 upgrade fails because answers file references old packages ([#12355](http://projects.theforeman.org/issues/12355), [f5c81ee1](http://github.com/katello//commit/f5c81ee1b16c3e1a6443b138e54bc4ff2c418439))
 * 2.4 Upgrade fails with dependency errors ([#12354](http://projects.theforeman.org/issues/12354))
 * undefined method `type' for #<Katello::Erratum:0x007fa65a818078> ([#12351](http://projects.theforeman.org/issues/12351))
 * Can Upgrade Katello from 2.3 to 2.4 RC ([#12273](http://projects.theforeman.org/issues/12273))

### Web UI
 * Package installation via Satellite 6.1 is much slower than yum ([#12375](http://projects.theforeman.org/issues/12375), [5210a603](http://github.com/katello//commit/5210a603a8281fb14dd1e9a23012baa123122762))
 * undefined method `type' for #<Katello::Erratum:0x007f607cbdfce8> ([#12247](http://projects.theforeman.org/issues/12247), [c69c0a9e](http://github.com/katello//commit/c69c0a9e2908cfa0a5d86298587399c50afeefe7))
 * scoped_search - err 500 on searching on invalid field ([#12140](http://projects.theforeman.org/issues/12140))
 * content view filter rule types displaying incorrectly in UI ([#12037](http://projects.theforeman.org/issues/12037), [9098daa3](http://github.com/katello/katello/commit/9098daa397975014448b30dd366ce66514901c89))
 * Any page using Nutupane details page is "bleeding" search parameters ([#11886](http://projects.theforeman.org/issues/11886), [d31d8e5b](http://github.com/katello/katello/commit/d31d8e5bffb40cd863e552cbe96e7c3753694236))
 * content view puppet module 'select new verison' is broken ([#11877](http://projects.theforeman.org/issues/11877), [bb3ab73e](http://github.com/katello//commit/bb3ab73ebcd3c3547410a03f8981c2a1700e799c))
 * Regression with enabling Satellite Tools repository found while using upstream community build ([#11876](http://projects.theforeman.org/issues/11876), [92f120a7](http://github.com/katello/katello/commit/92f120a7be76840260f0f213e3b0d0db94016a11))
 * Sync status displays incorrect status ([#11646](http://projects.theforeman.org/issues/11646), [3aadd66b](http://github.com/katello/katello/commit/3aadd66ba506f03f4fc2b562654aca0e725c2353))
 * Disabling used repository_set removes repo already from candlepin and pulp before chcking it is used ([#11436](http://projects.theforeman.org/issues/11436), [501e4288](http://github.com/katello/katello/commit/501e42883d2a2db014640fdcf824a21bb2541e34))
 * Duplicate content view entries are shown in composite content view -> Add page ([#11315](http://projects.theforeman.org/issues/11315), [494068c7](http://github.com/katello/katello/commit/494068c7c9b18950df035b4844877115349c9f03))
 * subscriptions UI row width is one short ([#11301](http://projects.theforeman.org/issues/11301), [9c106ae2](http://github.com/katello/katello/commit/9c106ae27a8098b286e2db843773d3251b3bb7b9))
 * support level column in activation key subscriptions blank ([#11297](http://projects.theforeman.org/issues/11297), [a5a5cc75](http://github.com/katello/katello/commit/a5a5cc75230af7b3fea3404455913faa0339c600))
 * Content Dashboard:  "Sync Overview" widget has what seems like a permanent spinner, shows no data. ([#11234](http://projects.theforeman.org/issues/11234), [341cbefc](http://github.com/katello/katello/commit/341cbefca4e6d454e4d483dda87689b9d9360543))
 * Incremental update displays errata counts but calls it Host count ([#11224](http://projects.theforeman.org/issues/11224), [16af5b3f](http://github.com/katello/katello/commit/16af5b3faf28821ea96110864e2ec7b77020ce67))
 * Starred environments are NOT suggested for promotion ([#11076](http://projects.theforeman.org/issues/11076), [560a9991](http://github.com/katello/katello/commit/560a9991fb6b1cba305e2a81c5281a2503deae0f))
 * Replace usages of bst-infinite-scroll ([#10827](http://projects.theforeman.org/issues/10827), [c14f6912](http://github.com/katello/katello/commit/c14f6912c1affef56f12d2dde84707247b6b9779))
 * Content > Red Hat Subscriptions landing page/endpoint is not uniform ([#10721](http://projects.theforeman.org/issues/10721), [2c38e068](http://github.com/katello/katello/commit/2c38e0689ff3918cc052e86887a3aaecaf9ee275))
 * Create New Repository page ([#10457](http://projects.theforeman.org/issues/10457))

### Documentation
 * katello.org/docs katello installation foreman repository version missing for EL7 ([#12361](http://projects.theforeman.org/issues/12361))
 * CLI installation instructions incorrectly fill in repo urls ([#11787](http://projects.theforeman.org/issues/11787), [b71893dd](http://github.com/katello/katello.org/commit/b71893dd884463b1cd486ad71165c48a04479378))

### API
 * Missing routes on API end points ([#12315](http://projects.theforeman.org/issues/12315), [a54f1f89](http://github.com/katello//commit/a54f1f89dfc742c518935a1b926ba89ed0ad0847))
 * Add product name attribute back to subscription in API ([#12002](http://projects.theforeman.org/issues/12002), [87de65ca](http://github.com/katello/katello/commit/87de65caae66971452670c784e49f123f7f85984))
 * hammer respository-set command name mismatch ([#11968](http://projects.theforeman.org/issues/11968), [db1c4c35](http://github.com/katello/hammer-cli-katello/commit/db1c4c35c91448d6f6cd3c15ec98246a651b492f), [9217a2bb](http://github.com/katello/katello/commit/9217a2bbb716ca8dd1415730ef8372bab3f74416))
 * make it easier to find out a puppet env for a given content_view and lifecycle_environment ([#11717](http://projects.theforeman.org/issues/11717), [7c364ba7](http://github.com/katello/katello/commit/7c364ba747706a8c6fac967a29174452ff36b63f))
 * Deprecate the old sync plan available products route ([#11640](http://projects.theforeman.org/issues/11640), [44398fbd](http://github.com/katello/katello/commit/44398fbdfc363fdf1217605cb609acd908fb8733))
 * Package group deprecation method needs to be removed ([#11639](http://projects.theforeman.org/issues/11639))
 * --label is ignored by hammer organization create command ([#11626](http://projects.theforeman.org/issues/11626), [a08199b7](http://github.com/katello/katello/commit/a08199b78ceb149992f34cd4f56b0cab829d03fd))
 * hammer: confusing error message on trying to create a product with an already existing label ([#11589](http://projects.theforeman.org/issues/11589), [5778eefd](http://github.com/katello/katello/commit/5778eefd922674c32947264e7f314d52385107e2))
 * Content View histories task can be deleted, causing ISE on versions list ([#10996](http://projects.theforeman.org/issues/10996), [eee31ac5](http://github.com/katello/katello/commit/eee31ac5debab9dc0ef1252156420577d5f93d31))

### Database
 * undefined method `type' for #<Katello::Erratum:0x007f607cbdfce8> ([#12223](http://projects.theforeman.org/issues/12223))
 * Migration error on upgrade from clean Katello ([#11736](http://projects.theforeman.org/issues/11736), [b2134a6a](http://github.com/katello/katello/commit/b2134a6a3fb4dd80adcdf6148be64a3d8198fcca))

### Puppet
 * Update puppet-katello to include new puppet-pulp "is_parent" param ([#12110](http://projects.theforeman.org/issues/12110))
 * pulp-parent-nodes is not installed by default ([#12094](http://projects.theforeman.org/issues/12094))

### CLI
 * puppet-module list : command does not allow listing modules based on repository name ([#12001](http://projects.theforeman.org/issues/12001), [17ffc1e0](http://github.com/katello/hammer-cli-katello/commit/17ffc1e0c19d153bc18149b3fe5d8f3030a149c5))
 * hammer puppet-module list ignores --repository-id ([#11970](http://projects.theforeman.org/issues/11970), [5e35ee6b](http://github.com/katello/katello/commit/5e35ee6bcf22f860a5281bfc330d71b64c1baf0e))
 * Cannot get content view filter description using hammer info ([#11959](http://projects.theforeman.org/issues/11959), [314d5ee5](http://github.com/katello/hammer-cli-katello/commit/314d5ee5fab9a0ad27147f5a4d33255dbbd86ae8))
 * Update version of hammer-cli-katello to depend on hammer-cli-foreman ([#11922](http://projects.theforeman.org/issues/11922))
 * Can not extract strings for hammer-cli-katello ([#11801](http://projects.theforeman.org/issues/11801), [ff8ad9f9](http://github.com/katello/hammer-cli-katello/commit/ff8ad9f907f92ea3702ca8d0fba63c613ea74c1d))
 * hammer content-host errata apply is only async operation ([#11750](http://projects.theforeman.org/issues/11750), [fa017a14](http://github.com/katello/hammer-cli-katello/commit/fa017a14a31ebf603e628ac4e7b711af4a9f5902))
 * Do not insert this many spaces in `hammer content-host -h | grep available-incremental-updates` ([#11270](http://projects.theforeman.org/issues/11270), [71fef3d2](http://github.com/katello/katello/commit/71fef3d2b49515a776a3046c8319ca153f35b46d))
 * hammer allows me to enable reposets with incorrect release versions ([#11203](http://projects.theforeman.org/issues/11203), [80795424](http://github.com/katello/katello/commit/807954247725729fecf978fa0b324d708b7c9baf))

### Packaging
 * katello-service man page lists options not available ([#11826](http://projects.theforeman.org/issues/11826))
 * The default tagger should be VersionTagger in `master` ([#11105](http://projects.theforeman.org/issues/11105))
 * remove deface version restriction ([#11102](http://projects.theforeman.org/issues/11102), [b151de8b](http://github.com/katello/katello/commit/b151de8b3aa4c266d46be2ad91fa7e02d4fee7ac))

### Content Views
 * Content View Publish: Description field is never shown ([#11647](http://projects.theforeman.org/issues/11647), [b8fbbd8e](http://github.com/katello/katello/commit/b8fbbd8ef92a0203990ea92f9be66223ed6be2bb))

### Atomic
 * Copy over ostree units when we publish/promote content views ([#11611](http://projects.theforeman.org/issues/11611))
 * Set the relative_path for cloned ostree distributors  ([#11567](http://projects.theforeman.org/issues/11567))

### Tests
 * Test failures reading Foreman fixtures from Katello engine root ([#11189](http://projects.theforeman.org/issues/11189), [47805116](http://github.com/katello/katello/commit/47805116917c7308ab21133a074429b8d205b752))

### API doc
 * Typo in validator description ([#8920](http://projects.theforeman.org/issues/8920), [ebb479ca](http://github.com/katello/katello/commit/ebb479ca4046b87e25fcd7ab9dead4bd2f2506e6))

### Other
 * Deleting users who created activation keys deletes all associated keys ([#12804](http://projects.theforeman.org/issues/12804), [01e8b421](http://github.com/katello//commit/01e8b42104c8a5ff532273c52730b680fa34a4a6))
 * Removing a subscription from a content host removes all subscriptions ([#12557](http://projects.theforeman.org/issues/12557), [56aa77b8](http://github.com/katello//commit/56aa77b893d102cfe7e9c51faace468d7b37de48))
 * Marketing products from candlepin showing in database ([#12537](http://projects.theforeman.org/issues/12537), [76449133](http://github.com/katello//commit/764491338a826bd9a8853cdbf947899433db9d3c))
 * rubygem hooks is no longer used by katello ([#12511](http://projects.theforeman.org/issues/12511))
 * undefined method `type' for #<Katello::Erratum:0x0000000fcd8b38>  Documentation ([#12335](http://projects.theforeman.org/issues/12335))
 * Smart Proxy: environment permission error attempting to edit a smart proxy (aka capsule) ([#12182](http://projects.theforeman.org/issues/12182), [b813837e](http://github.com/katello//commit/b813837eb29d02db90932345cfe2efccdd247d99))
 * "katello-service restart" is not restarting services in the right order ([#12181](http://projects.theforeman.org/issues/12181))
 *  "katello-service stop" is killing services in the wrong order ([#12137](http://projects.theforeman.org/issues/12137))
 * Dynflow actions fail when Katello is run via Zeus in development ([#12086](http://projects.theforeman.org/issues/12086), [97d1a0e9](http://github.com/katello/katello/commit/97d1a0e925575af6c426b28f5a3207c009d351bb))
 * Adding puppet module to content view in the CLI fails ([#11775](http://projects.theforeman.org/issues/11775), [58bbf1c6](http://github.com/katello/katello/commit/58bbf1c660d10765d863f3b39b0030ceb9f11381))
 * Remove 'apply_info_task_id' from taxonomies ([#11668](http://projects.theforeman.org/issues/11668), [8ed71027](http://github.com/katello/katello/commit/8ed71027b9deedeaa230b38db9a33dd7805d1d79))
 * katello-service do not handle PostgreSQL service ([#11648](http://projects.theforeman.org/issues/11648), [8d8b7155](http://github.com/katello/katello-installer/commit/8d8b715540921b18d79ed61f8a625f09fb03b5db))
 * remove katello authorization class and inclusions ([#11588](http://projects.theforeman.org/issues/11588), [e1f7e10d](http://github.com/katello/katello/commit/e1f7e10de4ddc8b92bc822191d45f0858b9b1073))
 * hamer create a filter with an in correct types returns a bad error message ([#11565](http://projects.theforeman.org/issues/11565), [90d359d0](http://github.com/katello/katello/commit/90d359d0dda6d4defc44783e89283b18feef3e21))
 * Remove haml-rails in favor of ERB ([#11448](http://projects.theforeman.org/issues/11448), [70f91b26](http://github.com/katello/katello/commit/70f91b26dc04765f3b9c9cd14d12996ddace79ec))
 * Content host bulk update does not respect organization_id parameter ([#11370](http://projects.theforeman.org/issues/11370), [582a318a](http://github.com/katello/katello/commit/582a318a376ae07be3373d032c6049ccc05e3d3e))
 * Remove rubygem-justified ([#11348](http://projects.theforeman.org/issues/11348), [83637bb8](http://github.com/katello/katello/commit/83637bb8183fdbe40fcae38618aad69b11e806c9))
 * i18n_data rubygem no longer needed ([#11347](http://projects.theforeman.org/issues/11347), [aa001bb6](http://github.com/katello/katello/commit/aa001bb6c947b2178ec971c003e87f7ba8a2b135))
 * Pulp errors on content view published with including package or package group filters ([#11325](http://projects.theforeman.org/issues/11325), [f997a216](http://github.com/katello/katello/commit/f997a216bbc22c301541b0fa34cccea39a906c5e))
 * sync plan dates saved incorrectly if I dont use the calendar widget ([#11295](http://projects.theforeman.org/issues/11295), [5054658f](http://github.com/katello/katello/commit/5054658fc1f78eca8b318bdcf530fd4ec13c253c))
 * Tests produce warning about use of top level Logging ([#11294](http://projects.theforeman.org/issues/11294), [20c9d8e2](http://github.com/katello/katello/commit/20c9d8e237a721508f70e7d643f3bae410da3c16))
 * Autocomplete on scoped search displays some characters incorrectly ([#11207](http://projects.theforeman.org/issues/11207), [8797538b](http://github.com/katello/katello/commit/8797538b53de6419e2ba57be376251373b1d76d8))
 * hammer content-view --help having wrong description at remove-version subcommand ([#11110](http://projects.theforeman.org/issues/11110), [56058030](http://github.com/katello/hammer-cli-katello/commit/5605803013a517e572845c6ac33ae09743af8064))
 * katello-backup and katello-restore is missing ([#10960](http://projects.theforeman.org/issues/10960))
 * Katello package search fails with 500 Internal Server Error ([#10919](http://projects.theforeman.org/issues/10919))
 * Remove Content search ([#10806](http://projects.theforeman.org/issues/10806), [bee147d7](http://github.com/katello/katello/commit/bee147d7080cda086a5236a35258234430a9f485))
 * Unable to install katello 2.3 ([#10648](http://projects.theforeman.org/issues/10648), [60e258f1](http://github.com/katello/katello-installer/commit/60e258f10cea87a254ed1f378a8069966ac323e8))
 * Auto-attach subscriptions not working for content hosts with custom products only ([#10208](http://projects.theforeman.org/issues/10208), [1a6cf418](http://github.com/katello/katello/commit/1a6cf418e421e3fa8ae3b61af92fbe1721cca923))
 * no indication when lifecycle environment creation fails ([#9965](http://projects.theforeman.org/issues/9965), [2d6af293](http://github.com/katello//commit/2d6af293d0555f32d82818fb6840ceee1c172d46))
 * The docker tag list and info commands aren't showing tag ([#9691](http://projects.theforeman.org/issues/9691))
 * Repeating error messages when adding a new organization or location ([#9447](http://projects.theforeman.org/issues/9447), [a1cb786b](http://github.com/katello//commit/a1cb786b4d84fa3de5f498daa46a636d4b66ecd0))
