---
layout: plugin
robots: noindex
title: Katello Developer Guide
---

# Katello Developers

For general contribution information, see [here](/contribute.html).

## Table of Contents

 * [Triage Process](/plugins/katello/developers.html#triage-process)
 * [Testing](/plugins/katello/developers.html#testing)
 * [How to Release Katello](/plugins/katello/developers.html#how-to-release-katello)
 * [Upgrading Candlepin](/plugins/katello/developers.html#upgrading-candlepin)
 * [Upgrading Pulp](/plugins/katello/developers.html#upgrading-pulp)


## Triage Process Links

The Katello bug triage process is designed to address Redmine issues that have been opened by the community and developers in order to target the releases that these issues will be included in. This should be done on a weekly basis and in a top down order of items to be addressed:

  * [Untriaged](https://projects.theforeman.org/projects/katello/issues?query_id=54)

### Triage Runner

The runner is the person in charge of following the procedures here and generally conducting the meeting.

We follow a rotation with respect to who runs the triage session. You can see the rotation [here](http://projects.theforeman.org/projects/katello/wiki/Triage_Rotation). Feel free to sign up if you want to run triage some time!

### Frequency

Triage is done once a week for an hour. As long as a week is not skipped, this has been enough time to get through every issue and leave 5-15 minutes extra. When a release is pending, or a new release has been sent out the volume does spike.

### Issue States

There are a few important states that issues can be in that are worth knowing about before going into the process:

  * New: Unassigned issue
  * Assigned: Developer has taken responsibility
  * Needs more information: User who filed the issue has been asked for further information to help triage or debug the issue
  * Needs design: The issue requires investigation by a developer
  * Ready for Testing: An issue has an open pull request
  * Closed: An issue has been fixed

### Release States

There are a few important states the issue can be in with respect to the 'Release' field within Redmine. These release states have an impact not only a release itself but the triage process as a whole. A quick definition of each that will make more sense in the process section:

  * Empty: No release has been set
  * Katello Backlog: Issues that have been put on the backlog and not scheduled for a release due to any number of reasons
  * Katello Recycle Bin: Issues that have been rejected, or are a duplicate, or have been in 'Needs more information' for longer than two weeks
  * Katello X.Y.Z: Standard releases for issues to be targeted at

### Process

The triage runner starts the meeting by going through the issues in descending order. This is so that if time were to run out, the most critical categories of issues are triaged. The runner is in charge of ensuring the flow of the meeting and updating issues or ensuring that someone on the call takes responsibility for updating an issue. This latter part sometimes occurs if a duplicate needs to be looked up, or another developer on the call can explain/ask the user for more information more clearly than the runner.

#### General Flow for New

The general flow is to open an issue and the runner to examine the issue, typically reading the issue number and general idea aloud. This allows for any developers with knowledge to chime in with any relevant info. The runner attempts to answer the following questions:

* Does this issue need more information from the user?
    * If yes, leave a comment asking for that information, set the 'Needs More Information' status, leave untriaged
* Does this issue need a developer to investigate it further to properly triage it?
    * If yes, set status to 'Needs Design'
* Which release should the issue be targeted at? (e.g. next z-stream, current release, next release, backlog)
* Does any developer want to own it?
    * If yes, assign it
* Does the issue have downstream information?
    * If yes, edit the description to remove the downstream bits
* Issue category?
* Issue priority?
* Issue difficulty?

#### General Flow for Needs More Information

If requested information is provided, set the state to New and triage as normal. If there has been no reponse for two weeks, set the target version to Recycle Bin, with the following comment:

> Please reopen this issue with the requested information, and we will be happy to take a look.

#### General Flow for Ready for Testing

  * Will this pull request get completed by the next release?
  * What release should the issue be targeted for? (e.g. next z-stream, current release, next release)

#### General Flow for Closed

  * What release should the issue be targeted for? (e.g. next z-stream, current release, next release)

### Notes

  * Any issues without a release, or those in the backlog or recycle bin, are set as untriaged [automatically](https://github.com/theforeman/prprocessor) during pull request submission.
  * Reporters of new issues should not set the triaged flag, though they can propose a target version. Participation in weekly triage is encouraged!

## Testing

Running the tests in Katello can take quite a while, especially the ruby ones.
This guide will help in trying to speed up your testing workflow by giving you
some tips.

### When to run tests

An important part of testing is knowing which tests to run and when. This can
save you a lot of time.

Very rarely should you run the entire test suite locally. Instead, just let
Jenkins run it for you after you open a PR. Locally, run new tests you write
along with any tests you think might be affected.

To run an individual file:

```
rake test:katello TEST=../katello/test/models/content_view_test.rb
```

To run an individual test:

```
# testunit style
rake test:katello TEST=../katello/test/models/content_view_test.rb TESTOPTS="-ntest_create"

# spec style
rake test:katello TEST=../katello/test/actions/katello/environment_test.rb TESTOPTS="-n/plans/"
```

#### ktest

Another simple way to speed up tests is by skipping some of the loading and pre-test tasks by
running Ruby directly. This script will speed up your load time by as much as 30-60 seconds. Simply
copy the code below into a script file in your PATH (e.g. ~/.bin/ktest).

```sh
#!/usr/bin/env sh

KATELLO_PATH=/path/to/your/katello/project

if [[ -n $1 ]]
then
  RAKE_PATH=`bundle show rake`
  ruby -I"lib:test:${KATELLO_PATH}/test:${KATELLO_PATH}/spec" -I"${RAKE_PATH}/lib" $@
else
  bundle exec rake test:katello
fi
```

Then you can run a test file like so:

```
ktest ../katello/test/models/content_view_test.rb
```

Or run an individual test:

```
ktest ../katello/test/models/content_view_test.rb -ntest_create
```

You can even record your glue tests:

```
mode=all ktest ../katello/test/models/glue/repository_test.rb
```

One thing to note is that while the normal rake test command will migrate the database, ktest will
not (in the interest of saving time). To do this, simply run this in your foreman directory:

```
RAILS_ENV=test rake db:drop && RAILS_ENV=test rake db:create && RAILS_ENV=test rake db:test:prepare && RAILS_ENV=test rake db:migrate
```

Or if you're a CLI ninja, you can alias it:

```
alias testdb='RAILS_ENV=test rake db:drop && RAILS_ENV=test rake db:create && RAILS_ENV=test rake db:test:prepare && RAILS_ENV=test rake db:migrate'
```

### Javascript Testing

We use both AngularJS and React in our UI and they have different ways of running tests.

For testing Angular code, you can `cd engines/bastion_katello` in the Katello root directory, and run:
```
rake bastion:setup # Setup testing enviromnent
rake bastion:ci    # Run testing suite
```

For testing React code, you can run the following in the Katello root directory:
```
npm test          # Run the test suite
npm run lint      # Run linting
npm run lint:fix  # Automatically fix linting issues
npm run lint:test # Run both linting and testing
```

## How to Release Katello

This guide covers how to peform a community release of Katello. The guide will reference the term 'X.Y' which reprsents the major and minor version that you are releasing. Throughout the guide we will use 2.0 and 2.1 as examples to represent the currently released community version (2.0) and the version that you are working on releasing (2.1).

The Katello release process has two distinct roles that work together to get a release out.

 * Release Owner: manages the release, ensuring that dates are being hit, communicated to the community, issues are being managed in Redmine
 * Release Packager: handles creating source packages, testing pipelines, Koji setup and RPM building

### Step 0: Code Name

Role: releaser owner

Pick a release code name based on a style of beer previously unused. Examples from previous releases are Oktoberfest and Winter Warmer.

### Step 1: Warn Community of Branching

Role: releaser owner

The first step to any release is warning the community of impending branching prior to the branch date to give them time to push on any pull requests that are pending. The notification should be sent no less than 2 weeks prior to the intended branch date and ideally when Foreman sends their branching announcement.

### Step 2: Create Release Configuration and Procedures

Role: releaser owner

Create a 2.1 release configuration in tool_belt at `configs/katello/2.1.yaml`. You may copy the config from the previous release and update accordingly. Once configured, run setup:

```
./tools.rb setup-environment --github-username <username> configs/katello/2.1.yaml
```

You will find the repositories checked out to the versions specified in the release config in `repos/katello/2.1.0/`.

The `tool_belt` repository contains templated procedures that can be generated and then posted to Discourse for tracking of all release activities. To generate:

```
./tools.rb procedure branch katello 2.1
./tools.rb procedure release katello 2.1
```

Copy the output to a Discourse post in the [release section](https://community.theforeman.org/c/development/releases) titled 'Katello 2.1 Release Process'

From here on out the Release Owner and Release Packager should work to close out each of the respective item lists.


## How to Release puppet modules

The release of puppet modules is now part of the foreman-installer release process after the merge of the codebases. This is preserved for now given that this lays out the detailed steps on how to release modules. Building the changelog is a somewhat delicate task. We use [github_changelog_generator](https://github.com/skywinder/github-changelog-generator) which is based on Github pull requests and issues but not everythis has a pull request. Especially cherry picks are sometimes forgotten.

Start with updating the changelog.

```
bundle exec rake changelog
```

This is a [recent addition](https://github.com/theforeman/foreman-installer-modulesync/pull/86) and stable branches might not have this. Then you need to do it manually:

```
# See https://github.com/skywinder/github-changelog-generator#github-token on using a token to avoid ratelimits
github_changelog_generator -u theforeman -p $(basename $PWD) -o new-changelog.md --future-release $(bundle exec rake module:version) --exclude-labels duplicate,question,invalid,wontfix,Modulesync

# Now merge new-changelog.md into CHANGELOG.md - do note that it doesn't handle
# branches so if anything was merged to a stable branch you should manually put
# it in the correct release. This may also break badly on stable branches.

# Add links to Redmine for issues
sed -i 's,\(fixes\|fixing\|refs\) \\#\([0-9]\+\),\1 [\\#\2](https://projects.theforeman.org/issues/\2),i' CHANGELOG.md
```

Now go through the `git diff` and the actual content. Check if pull requests need a `Bug`, `Breaking` or `Enhancements` label. You can also determine based on these labels if a minor or major version bump is needed.

Also compare it with the actual git log:

```
tig $(git describe --abbrev=0 --tags)..HEAD
```

If it needs a major or minor version bump you can use the appropriate rake task. In edge cases it may be needed to do a patch level bump.

```
bundle exec rake module:bump:major
bundle exec rake module:bump:minor
bundle exec rake module:bump:patch
```

If you've made changes, may need to regenerate the changelog now. When you're satisfied you can create a commit:

```
git checkout -b release-$(bundle exec rake module:version)
git add CHANGELOG.md metadata.json
git commit -m "Release $(bundle exec rake module:version)"
```

Now create a pull request. The following assumes you have a remote named `$USER` and [hub](https://github.com/github/hub).

```
git push $USER HEAD -u
hub pull-request -m "Release $(bundle exec rake module:version)"
```

When merging a PR note that the date is in the changelog which you may need to update. Now you can tag the module:

```
bundle exec rake module:tag

# Only recently puppet-blacksmith learned to do GPG signed tags - check this
git verify-tag $(bundle exec rake module:version)

# If it failed you can do it manually
# VERSION=$(bundle exec rake module:version) && git tag -s $VERSION -m "Version $VERSION"
```

When you're satisfied you can push the changes to git and release the module to the forge:

```
# Push the changes to github
git push --follow-tags

# Push the release to the forge
# This assumes you have set the credentials previously
bundle exec rake module:clean module:push

# Automated using pass - https://www.passwordstore.org/
# Assumes you have a katello/forge or theforeman/forge password configured
BLACKSMITH_FORGE_USERNAME="$(jq -r .author metadata.json | tr [A-Z] [a-z])" && BLACKSMITH_FORGE_USERNAME=$BLACKSMITH_FORGE_USERNAME BLACKSMITH_FORGE_PASSWORD=$(pass show $BLACKSMITH_FORGE_USERNAME/forge | head -n 1) bundle exec rake module:clean module:push

# Start the next minor version
bundle exec rake module:bump_commit:patch

# And push the new version
git push
```

## How to Sign RPMs

##### Download Unsigned RPMs

Now sign the RPMs (or ask someone who can to do this part for you), mash and release. Those you can ask are lzap, mmccune, jsherrill, bkearney.

The first step when signing is to download all of the unsigned RPMs from tags that you will be releasing. We are using the .src.rpm to decide if the build as whole is signed or not. For example, if the key was D5A88496:

```
cd some empty directory
VERSION=2.3
for j in rhel5 rhel6 rhel7 fedora20 fedora21 ; do
  for i in "katello-$VERSION-$j" "katello-$VERSION-thirdparty-candlepin-$j" "katello-$VERSION-thirdparty-pulp-$j" ; do
    koji -c ~/.koji/katello-config list-tagged --latest --quiet --inherit --sigs $i ; done \
    | sed 's!^!:!' \
    | perl -ane '$F[1] =~ s!\.src$!! or next; $R{$F[1]} = 1; $S{$F[1]} = 1 if $F[0] eq ":D5A88496";
      END { print map "$_\n", grep { not exists $S{$_} } sort keys %R }' \
    | while read i ; do koji -c ~/.koji/katello-config download-build --debuginfo $i ;
  done;
done;
```

##### Sign the RPMs

Get (decrypt) Katello key and gpg --import it. Of course, you need to be a person who knows how to decrypt the key. Decrypt the passphrase as well. The key that we've used starting with Katello 1.0 is D5A88496. Before doing the first sign, import katello key. In our git repo with keys do this:

```
cd gpg-keys/katello-private
decrypt.sh
gpg --import katello.private.asc
cat katello-passphrase.txt
```

This passphrase will be used for signing the packages. Into ~/.rpmmacros put:

```
%signature gpg
%_gpg_name Katello
%__gpg_sign_cmd %{__gpg} \
    gpg --force-v3-sigs --digest-algo=sha1 --batch --no-verbose --no-armor \
    --no-secmem-warning -u "%{_gpg_name}" \
    -sbo %{__signature_filename} %{__plaintext_filename}
```

Now run:

```
rpmsign --addsign *.rpm
```

##### Import Signatures back to Koji

This step will import only signatures, not packages.

```
koji -c ~/.koji/katello-config import-sig *.rpm
```

As list-signed does not seem to work, do a random check in http://koji.katello.org/packages/ that http://koji.katello.org/packages/<name>/<version>/<release>/data/sigcache/d5a88496/ exists and has some content in it.


##### Create Back Signed RPMs in Koji

```
# in that directory where you've signed the rpms
ls *.src.rpm | sed 's!\.src\.rpm$!!' | xargs koji -c ~/.koji/katello-config write-signed-rpm bc62d13f
```

Do a random check at http://koji.katello.org/packages/<name>/<version>/<release>/data/signed/d5a88496/ to see if the rpms are there. This step will import whole package.

Finally, the signed packages can be mashed and a final test of the signed RPMs performed to ensure nothng was missed. When doing a .Y release this is especially important. The X.Y branch may need some backported documentation changes. After backporting, you will need to do the following:

 * Update latest in \_config.yml to X.Y
 * GA release announcement
 * Update the /project/katello/releases/yum/latest symlink on fedorapeople.org

## Upgrading Candlepin

The following steps are guidelines for testing and submitting a new build of Candlepin to Koji with the intent of including it in a nightly build and ultimately tagging it for inclusion in a Katello release. Candlepin is a vital component of Katello. Here's how to make sure the process goes according to plan.

### Requirements

 - Koji access
 - The Candlepin RPM you'd like to upgrade to and the SRPM from which it was built
 - Familiarality with the changes in the new Candlepin version for focused testing
 - A Katello development environment (ex: centos7-devel from Forklift) for testing the new version

### Steps

1. Stop the Tomcat service in your development environment in order to stop Candlepin: `foreman-maintain service stop --only tomcat`
2. Install the new Candlepin RPM. If there are schema changes in the build you'll need to run `/usr/share/candlepin/cpdb --update` to migrate the database.
At this point you can bring Tomcat back: `foreman-maintain service start --only tomcat`

3. Validate the new version. A thorough test of Candlepin integration includes the following:

   - Importing and refreshing a manifest
   - Performing various actions around activation keys
   - Registering a content host
   - Creating a custom product and adding it to a content host

   If you're aware of a particularly impactful change in the new Candlepin version be sure to test it explicitly.
   Save some time by running the glue tests in parallel: `record=true mode=all rake test:katello:test:glue`

4. If everything checked out - great! If not - fix those broken tests and open a PR.

5. Once any issues are addressed (PRs merged) you can submit the SRPM to Koji with the nightly tag: `koji build katello-thirdparty-candlepin-rhel7 /path/to/srpm`

   The new Candlepin will be included in the next nightly build which will subject it to even more testing.

6. If the nightly build is green the new RPM can be tagged into a specific Katello release. If you don't have sufficient Koji access, reach out to someone who
does in #theforeman-dev and ask them to tag it accordingly. Here's an example for Katello 3.5: `koji-katello tag-pkg katello-3.5-thirdparty-candlepin-rhel7 candlepin-2.1.3-1.el7`
Be sure to substitute your own version numbers for the tag name and RPM.

All done!

## Upgrading Pulp

This document describes how to upgrade to a new version of Pulp. **Benchmarks are
optional but highly recommended.**

### Requirements

This assumes you have a working Katello installation and that you've checked
out all the necessary repositories including [Runcible](https://github.com/Katello/runcible).

1. We recommend capturing some benchmarks before upgrading. This is
optional though if the change in Pulp versions brings minor changes. See step 6
for a idea of what to benchmark.

2. Follow the [Pulp documentation on how to install the latest version](https://pulp-user-guide.readthedocs.org/en/latest/installation.html). If
upgrading from a prevous installation, typically a `yum update *pulp*` will
suffice.  Once you have the latest version installed, make you sure you update
or reset the database. (We recommend keeping track of all packages
installed as part of this upgrade, as it will make package tagging easier in
step 8.)

3. Upgrade Runcible by running the [VCR tests in live mode](https://github.com/Katello/runcible#testing).
Fix any broken tests.
Optionally, run some manual commands from a Ruby console to test Pulp's
functionality. Once you're finished making changes, merge them into master
(going through the Pull Request process).

4. If Runcible changes were needed, [release a new version of Runcible](https://github.com/Katello/runcible#building-and-releasing)
but do NOT build new rpms in koji.

5. Upgrade Katello to your new version of Runcible. Run the Katello VCR tests
in live mode. Fix any failures.

6. Perform the following tests. If you took benchmarks in step 1, compare the
times:
    * Create a yum repository with a URL and sync it.
    * Create a puppet repository and upload some puppet modules for it.
    * Enable a Red Hat repo (6server) and sync it.
    * Create a content view with these repositories. Create a filter and publish the content view.
    * Promote the content view to an environment other than Library. Confirm the content is on the filesystem and perform a content search.
    * Register a consumer and perform some package action.
    * Ensure that errata applicability generation works.

7. Fix any failures from step 6.

8. Do the following within a short time frame:
     * If there was a runcible code change needed:
       * Update Runcible requirement in katello.gemspec.
       * Build new Runcible rpm.
       * Merge open PR for new Runcible requirement and any Katello changes from the fixes from steps 4 & 5.

9. Update the `katello-repos` RPM and Forklift `katello_repositories` role with the new version
