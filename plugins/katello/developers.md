---
layout: plugin
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

### Step 0: Code Name

Pick a release code name based on a style of beer previously unused. Examples from previous releases are Oktoberfest and Winter Warmer.

### Step 1: Warn Community of Branching

The first step to any release is warning the community of impending branching prior to the branch date to give them time to push on any pull requests that are pending. The notification should be sent no less than 2 weeks prior to the intended branch date and ideally when Foreman sends their branching announcement.

### Step 2: Stable Pulp Build

Prior to branching the Katello repositories, the release nanny should figure out what the current stable version of Pulp is and if not already tagged and built, do so. Please see the [Upgrading Pulp Guide](/plugins/katello/developers.html#upgrading-pulp).

### Step 3: Setup Your Environment

All you need is [tool_belt](https://github.com/theforeman/tool_belt).

```sh
git clone https://github.com/theforeman/tool_belt
cd tool_belt
bundle
./tools.rb
```

### Step 4: Configure the Release

Create a 2.1 release configuration in tool_belt at `configs/katello_21.yaml`. You may copy the config from the previous release and update accordingly. Once configured, run setup:

```
./tools.rb setup-environment --github-username <username> configs/katello_21.yaml
```

You will find the repositories checked out to the versions specified in the release config in `repos/katello_X.Y.0/`.

### Step 5: Get Your Branch On

#### Step 5.1: Create the branches for gems and docs

On the date you previously warned the community branching would occur, ensure any project dependencies are updated, including gem version constraints, and branch the repositories:

```
./tools branch configs/katello_XY.yaml
```

You will also need to branch the documentation at [theforeman.org](https://theforeman.org/plugins/katello).

```
./tools branch-docs config/katello_XY.yaml
```

Make sure to follow the instructions and update the docs to use the current release version. Submit a pull request to theforeman.org repository with the changes.

Congratulations, you have successfully branched all of the repositories and prepared them for release. We recommend double checking each repository ensuring that the branch exists in the upstream repository, that the top of the commit stack in that branch includes the tag you created prior to branching (so that you have an initial tag point that represents the branch point) and that the tag itself exists. The last part of this step is to send to a follow up notification letting the community know that everything has been branched.

#### Step 5.2: Teach Jenkins about the new branch

Jenkins has a [branch map](https://github.com/theforeman/foreman-infra/blob/master/puppet/modules/jenkins_job_builder/files/theforeman.org/pipelines/test/testKatello.groovy#L2) for running Katello tests against the correct Foreman version, this map needs to be updated to contain the new version you've just branched.

### Step 6. Release puppet modules

Review the modules for releasing - we should be keeping them up to date when making incompatible changes, but do any need bumps of the major or minor version? If so, do so now.

Go through the [list of managed modules](https://github.com/theforeman/foreman-installer-modulesync/blob/master/managed_modules.yml).

Building the changelog is a somewhat delicate task. We use [github_changelog_generator](https://github.com/skywinder/github-changelog-generator) which is based on Github pull requests and issues but not everythis has a pull request. Especially cherry picks are sometimes forgotten.

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

### Step 7. Pin katello-installer puppet modules for release

On the katello-installer's KATELLO-X.Y branch, we need to pin the modules to a minor release. To pin to patch levels, we use Puppetfile.lock.

```sh
KATELLO_VERSION=3.7
FOREMAN_VERSION=1.18

# Fail fast
set -e

# Prepare the new branch
git checkout -b KATELLO-$KATELLO_VERSION

# Pin all modules to releases
# NOTE: some modules are using git forks because there is no release - handle with care
bundle exec rake pin_modules

# Stage your changes
git add Puppetfile

# Append the foreman-installer's puppet file:
curl https://raw.githubusercontent.com/theforeman/foreman-installer/${FOREMAN_VERSION}-stable/Puppetfile >> Puppetfile

# Update the lock file
bundle exec librarian-puppet update

# Revert the foreman appendage
git checkout Puppetfile

# Remove lock file from .gitignore
sed -i '/Puppetfile.lock/d' .gitignore
git add .gitignore Puppetfile.lock

git commit -m "Branch Katello ${KATELLO_VERSION}"
```

The result would look like [this](https://github.com/Katello/katello-installer/commit/76698d96872e7b8439daf6f15ebc1249ae23c53f).

### Step 8: Configure Koji

Note that to perform this step, Foreman must have generated it's Koji build targets for the targeted Foreman release. This is due to how Katello tags inherit from some Foreman tags. Coordinate with the Foreman release nanny on when they plan to do that step and wait to do this step until then. Koji needs to have configuration added specific to the tags that the release will occur under. The first step is to add new build roots and tags. Note that you will need access to koji. Contact the Development forum board to request access.

```
./tools koji configs/katello_XY.yaml # Make sure it looks good
./tools koji --commit configs/katello_XY.yaml
```

### Step 9: Setup Mash Scripts

In order to generate the release repositories on Koji, a mash script for the version being released needs to be added. If you do not have direct access to the koji.katello.org box, you can request access or ask someone who does to perform this step for you.

```
./tools mash-scripts config/katello_XY.yaml # Make sure it looks good
./tools mash-scripts --commit config/katello_XY.yaml
```

The generated mash scripts should be committed to tool_belt and a pull request opened. The scripts will then need to be copied onto the Koji box itself. If you do not have access, please contact someone that does or request this action on the Development forum board.

### Step 10: Verify Repos

At this point we want to verify the updates we made to the version branches by mashing and checking the repositories generated on koji.

You'll want to run this job: `http://ci.theforeman.org/job/packaging_mash_rpms/`

With the parameter set as:

```
katello-mash-split-X.Y.py
```

View the generated repositories at `http://koji.katello.org/releases/yum/katello-X.Y` and ensure none of the packages have a git hash within the package name.

### Step 11: Build Fresh X.Y Packages

For each repository that was branched, and for each package within a given repository (e.g. katello has both the katello and rubygem-katello packages) we do a tito release koji. For example, the Katello repository:

```
cd katello/
tito release koji
cd deploy/
tito release koji
```

NOTE: This step can only be done after you have created the X.Y tags.

### Step 12: Update Repos RPM

Now we update the repos file to point at where the released version of the repositories will exist for the X.Y release.

```
cd katello-misc/repos
export VER=X.Y
sed -i "s#/[Nn]ightly/#/$VER/#g" katello*.repo
git commit -a -m 'Updating repository URL to X.Y'
tito tag
tito release koji
/usr/local/bin/katello-mash-split-X.Y.py
```

### Step 13: Release X.Y Release Candidate RPMs

For this step we'll need to update the Jenkins job that pushes RPMs to fedorapeople and run the job. Go to `http://ci.theforeman.org/view/Katello%20Pipeline/job/release_push_rpm_katello/configure` and add X.Y to the list of RELEASE choices and save the configuration. Now head to `http://ci.theforeman.org/view/Katello%20Pipeline/job/release_push_rpm_katello/build?delay=0sec`, choose the X.Y version you just added and click `Build`. This will run a script that copies the RPMs from Koji to fedorapeople.

### Step 14: Update forklift

We maintain a deployment tool, forklift, for easily testing and deploying Katello versions. You'll want to clone the repository (https://github.com/theforeman/forklift) and update the following:

1. Edit the [README](https://github.com/theforeman/forklift/blob/master/docs/production.md#vagrant-box-installation) to indicate the new version and the OSes it works with.
1. Update the foreman version mappings - https://github.com/theforeman/forklift/blob/master/config/versions.yaml
1. Verify the boxes exist with `vagrant status`
1. Create pipeline playbooks for the new version - https://github.com/theforeman/forklift/tree/master/pipelines
  - This should include a playbook to install the version fresh as well as
    upgrading from the two versions prior.

### Step 15: Test

Use the newly updated forklift pipeline playbooks to test the X.Y release:

```sh
ansible-playbook pipelines/pipeline_katello_XY.yml -e "forklift_state=up"
```

Generally, we should test the fresh install pipeline before moving on to the upgrade pipelines. Once all pipelines are passing locally, the release in koji is ready to be published to https://fedorapeople.org/groups/katello/releases. Contact a senior engineer in theforeman-dev to complete this step.

### Step 16: Announce RC

Now you are ready to announce the RC by sending an post to the Release Announcements forum board, pointing users at the installation instructions. You should also open a PR to `katello.org` to update the news section with an announcement of the RC release.

### Step 17: Fix Bugs

As users test the RC, they may find and file issues. In addition, the RC may have been released with issues still to be fixed. As these issues are identified and fixed, they will need to be backported. The tool_belt tooling can be used to identify issues that need cherry picking across the various repositories. See the tool belt [README](https://github.com/theforeman/tool_belt/blob/master/README.md) for information on how to setup and configure it.

### Step 18: Release!

After iterating through Step 15 a few times over the course of roughly a month, and in sync with Foreman's release date decide that you are ready to release.

```
cd katello-misc/repos
sed -i "s#/gpgcheck=0/#/gpgcheck=1/#g" katello*.repo
git commit -a -m 'Turning on GPG key checking for X.Y'
tito tag
tito release koji
```

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

As list-signed does not seem to work, do a random check in ​http://koji.katello.org/packages/ that http://koji.katello.org/packages/<name>/<version>/<release>/data/sigcache/d5a88496/ exists and has some content in it.


##### Create Back Signed RPMs in Koji

```
# in that directory where you've signed the rpms
ls *.src.rpm | sed 's!\.src\.rpm$!!' | xargs koji -c ~/.koji/katello-config write-signed-rpm bc62d13f
```

Do a random check at http://koji.katello.org/packages/<name>/<version>/<release>/data/signed/d5a88496/ to see if the rpms are there. This step will import whole package.

Finally, the signed packages can be mashed and a final test of the signed RPMs performed to ensure nothng was missed. When doing a .Y release this is especially important. The X.Y branch may need some backported documentation changes. After backporting, you will need to do the following:

 * Update latest in _config.yml to X.Y
 * GA release announcement
 * Update the /project/katello/releases/yum/latest symlink on fedorapeople.org

### Release Api docs

On a git checkout run:
```
VERSION=3.4
$GITDIR=~/git  #directory containing theforeman.org git repo

FOREMAN_APIPIE_LANGS=en rake apipie:cache
cp -rf public/apipie-cache $GITDIR/theforeman.org/plugins/katello/$VERSION/api
# clear out json files
find $GITDIR/theforeman.org/plugins/katello/$VERSION/api -name "*.json" -type f -delete

cd $GITDIR/theforeman.org/
cp plugins/katello/nightly/api/index.md  $GITDIR/theforeman.org/plugins/katello/$VERSION/api/
sed -i "s/version: nightly/version: $VERSION/g" $GITDIR/theforeman.org/plugins/katello/$VERSION/api/index.md

cp -rf $GITDIR/theforeman.org/api/new_version_template/apidoc/* $GITDIR/theforeman.org/plugins/katello/$VERSION/api/apidoc
```

Open a PR and commit the changes

## Upgrading Candlepin

The following steps are guidelines for testing and submitting a new build of Candlepin with the intent of including it in a nightly build and ultimately marking it for inclusion in an upcoming Katello release. Candlepin is a vital component of Katello. Here's how to make sure the process goes according to plan.

### Requirements

 - Koji access
 - The Candlepin RPM you'd like to upgrade to and the SRPM from which it was built
 - Familiarality with the changes in the new Candlepin version for focused testing
 - A Katello development environment (ex: centos7-devel from Forklift) for testing the new version

### Steps

1. Install the new Candlepin RPM into your local Katello environment. Restart Katello (`katello-service restart`) and validate it. A
  thorough test of Candlepin integration includes the following:

   - Importing and refreshing a manifest
   - Performing various actions around activation keys
   - Registering a content host

   If you're aware of a particularly impactful change in the new Candlepin version be sure to test it explicitly.
   Save some time by running the glue tests in parallel: `rake test:katello:test:glue`
2. If everything checked out - great! If not - fix those broken tests and open a PR.
3. Submit the SRPM to Koji with the proper tag: `koji build katello-thirdparty-candlepin-rhel7 /path/to/srpm`

   The new Candlepin will be included in the next Katello nighty build which will subject it to even more testing.

   If the nightly build looks good (the new Candlepin RPM is present in the centos7-katello-nightly forklift box), feel free to run through the testing steps above
   in order to validate the new version even further.

4. Tag the Candlepin RPM so that it's included in the target Katello version. If you don't have sufficient Koji access, reach out to someone who
does in #theforeman-dev and ask them to tag it accordingly. Here's an example for Katello 3.5: `koji-katello tag-pkg katello-3.5-thirdparty-candlepin-rhel7 candlepin-2.1.3-1.el7`
Be sure to substitute your own version numbers for the tag name and RPM.

All done!

## Upgrading Pulp

This document describes how to upgrade to a new version of Pulp. **Benchmarks are
optional but highly recommended.**

### Requirements

This assumes you have a working Katello installation and that you've checked
out all the necessary repositories including Runcible (https://github.com/Katello/runcible).

1. We recommend capturing some benchmarks before upgrading. This is
optional though if the change in Pulp versions brings minor changes. See step 6
for a idea of what to benchmark.

2. Follow the Pulp documentation on how to install the latest version
(https://pulp-user-guide.readthedocs.org/en/latest/installation.html). If
upgrading from a prevous installation, typically a `yum update *pulp*` will
suffice.  Once you have the latest version installed, make you sure you update
or reset the database. (We recommend keeping track of all packages
installed as part of this upgrade, as it will make package tagging easier in
step 8.)

3. Upgrade Runcible by running the VCR tests in live mode
(https://github.com/Katello/runcible#testing). Fix any broken tests.
Optionally, run some manual commands from a Ruby console to test Pulp's
functionality. Once you're finished making changes, merge them into master
(going through the Pull Request process).

4. If Runcible changes were needed, release a new version of Runcible
(https://github.com/Katello/runcible#building-and-releasing) but do NOT build
new rpms in koji.

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
     * Tag into these Katello tags:
       * katello-thirdparty-pulp-rhel6
       * katello-thirdparty-pulp-rhel7
      The following packages:
       * pulp
       * pulp-rpm
       * pulp-puppet
       * gofer (if applicable)
       * Occasionally other dependencies (such as
         https://github.com/pulp/pulp/tree/master/deps) are needed.  If you
         kept track of what was updated as part of your upgrade and you noticed
         any new deps pulled in from the Pulp repositories, tag those in now.
     * In order for the client repo to be populated properly, tag the new pulp & pulp-rpm package into the following tags:
      * katello-nightly-rhel5
      * katello-nightly-rhel6
      * katello-nightly-rhel7
     * Sample tagging commands:

       ```
       koji-katello tag-pkg  katello-thirdparty-pulp-rhel6   pulp-2.4.0-0.23.beta.el6 pulp-rpm-2.4.0-0.23.beta.el6  pulp-puppet-2.4.0-0.23.beta.el6 pulp-nodes-2.4.0-0.23.beta.el6  gofer-1.3.0-1.el6
       koji-katello tag-pkg  katello-thirdparty-pulp-rhel7   pulp-2.4.0-0.23.beta.el7 pulp-rpm-2.4.0-0.23.beta.el7  pulp-puppet-2.4.0-0.23.beta.el7 pulp-nodes-2.4.0-0.23.beta.el7  gofer-1.3.0-1.el7
       koji-katello tag-pkg katello-nightly-rhel6 pulp-2.4.0-0.23.beta.el6 pulp-rpm-2.4.0-0.23.beta.el6
       koji-katello tag-pkg katello-nightly-rhel7 pulp-2.4.0-0.23.beta.el7 pulp-rpm-2.4.0-0.23.beta.el7
       koji-katello tag-pkg katello-nightly-rhel5 pulp-2.4.0-0.23.beta.el5 pulp-rpm-2.4.0-0.23.beta.el5
       ```

9. The next day when the Katello XL Pipeline runs, new Pulp rpms should have hit the Katello repos,
perform a test install to ensure there are no issues.  You may also ask in the channel for someone to kick off a pipeline run.
If the pipeline fails, determine the cause (most likely a missing dep needs tagging), and re-run the pipeline.

10. Enjoy your new Pulp build and congratulate yourself for making it this far!
