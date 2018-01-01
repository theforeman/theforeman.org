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

The Katello bug triage process is designed to address Redmine issues that have been opened by the community and developers in order to target the releases that these issues will be included in. This should be done on a weekly basis and in the following order of items to be addressed:

  * [Open Recycle Bin](http://projects.theforeman.org/projects/katello/issues?utf8=%E2%9C%93&set_filter=1&f%5B%5D=status_id&op%5Bstatus_id%5D=o&f%5B%5D=release_id&op%5Brelease_id%5D=%3D&v%5Brelease_id%5D%5B%5D=166&f%5B%5D=&c%5B%5D=tracker&c%5B%5D=status&c%5B%5D=priority&c%5B%5D=subject&c%5B%5D=author&c%5B%5D=assigned_to&c%5B%5D=updated_on&c%5B%5D=category&c%5B%5D=fixed_version&c%5B%5D=position&group_by=fixed_version)
  * [Untriaged High Priority](http://projects.theforeman.org/projects/katello/issues?utf8=%E2%9C%93&set_filter=1&f%5B%5D=release_id&op%5Brelease_id%5D=%21*&f%5B%5D=subproject_id&op%5Bsubproject_id%5D=%21*&f%5B%5D=priority_id&op%5Bpriority_id%5D=%3D&v%5Bpriority_id%5D%5B%5D=5&v%5Bpriority_id%5D%5B%5D=6&v%5Bpriority_id%5D%5B%5D=7&f%5B%5D=&c%5B%5D=tracker&c%5B%5D=status&c%5B%5D=priority&c%5B%5D=subject&c%5B%5D=author&c%5B%5D=assigned_to&c%5B%5D=updated_on&c%5B%5D=category&c%5B%5D=fixed_version&group_by=)
  * [Untriaged Closed](http://projects.theforeman.org/projects/katello/issues?utf8=%E2%9C%93&set_filter=1&f%5B%5D=release_id&op%5Brelease_id%5D=%21*&f%5B%5D=subproject_id&op%5Bsubproject_id%5D=%21*&f%5B%5D=status_id&op%5Bstatus_id%5D=c&f%5B%5D=&c%5B%5D=tracker&c%5B%5D=status&c%5B%5D=priority&c%5B%5D=subject&c%5B%5D=author&c%5B%5D=assigned_to&c%5B%5D=updated_on&c%5B%5D=category&c%5B%5D=fixed_version&group_by=)
  * [Untriaged Open](http://projects.theforeman.org/projects/katello/issues?utf8=%E2%9C%93&set_filter=1&f%5B%5D=release_id&op%5Brelease_id%5D=%21*&f%5B%5D=subproject_id&op%5Bsubproject_id%5D=%21*&f%5B%5D=status_id&op%5Bstatus_id%5D=o&f%5B%5D=&c%5B%5D=tracker&c%5B%5D=status&c%5B%5D=priority&c%5B%5D=subject&c%5B%5D=author&c%5B%5D=assigned_to&c%5B%5D=updated_on&c%5B%5D=category&c%5B%5D=fixed_version&group_by=)
  * [Untriaged Ready for Testing](http://projects.theforeman.org/projects/katello/issues?utf8=%E2%9C%93&set_filter=1&f%5B%5D=release_id&op%5Brelease_id%5D=%21*&f%5B%5D=subproject_id&op%5Bsubproject_id%5D=%21*&f%5B%5D=status_id&op%5Bstatus_id%5D=%3D&v%5Bstatus_id%5D%5B%5D=7&f%5B%5D=&c%5B%5D=tracker&c%5B%5D=status&c%5B%5D=priority&c%5B%5D=subject&c%5B%5D=author&c%5B%5D=assigned_to&c%5B%5D=updated_on&c%5B%5D=category&c%5B%5D=fixed_version&group_by=)

### Triage Runner

The runner is the person in charge of following the procedures here and generally conducting the meeting.

### Frequency

Triage is done once a week for an hour. As long as a week is not skipped, this has been enough time to get through every issue and leave 5-15 minutes extra. When a release is pending, or a new release has been sent out the volume does spike.

### Issue States

There are a few important states that issues can be in that are worth knowing about before going into the process:

  * New: Unassigned issue
  * Assigned: Developer has taken responsibility
  * Needs more information: User who filed the issue has been asked for further information to help triage or debug the issue
  * Needs design: The issue requires investigation by a developer
  * Ready for Testing: An issue has an open PR
  * Closed: An issue has been fixed

### Release States

There are a few important states the issue can be in with respect to the 'Release' field within Redmine. These release states have an impact not only a release itself but the triage process as a whole. A quick definition of each that will make more sense in the process section:

  * Empty: No release has been set, this is the "untriaged" bucket
  * Katello Backlog: Issues that have been put on the backlog and not scheduled for a release due to any number of reasons
  * Katello Recycle Bin: Issues that have been rejected, or are a duplicate, or have been in 'Needs more information' for longer than a week
  * Katello X.Y.Z: Standard releases for issues to be targeted at

### Process

The triage runner starts the meeting by going through sets of issues broken down into different groups by priority of the grouping. This is so that if time were to run out, the most critical categories of issues are triaged. The runner is in charge of ensuring the flow of the meeting, and updating issues or ensuring that someone on the call takes responsibility for updating an issue. This latter part sometimes occurs if a duplicate needs to be looked up, or another developer on the call can explain/ask the user for more information more clearly than the runner.

### Recycle Bin

The first on the list is our 'recycle bin'. This the place to put issues that don't fit into a release, or were filed by a user who has since gone dark on the issue. Another way to look at it is a place for unresolvable issues. Issues are moved onto the recycle bin if there has been no activity by a user for a week. And they are closed if a week on the recycle bin goes by without any further updates.

#### General Flow for New or Needs More Information

The general flow is to open an issue and the runner to exam the issue, typically reading the general idea aloud. This allows for any developers with knowledge to chime in with any relevant info. The runner attempts to answers the following questions:

    * Does this issue need more information from the user?
        * If yes, leave a comment asking for that information
    * Does this issue need a developer to investigate it further to properly triage it?
        * If yes, set status to 'Needs Design'
    * What release should the issue be targeted for? (e.g. next z-stream, current release, next release, backlog)
    * Does any developer want to own it?
        * If yes, assign it
    * Issue category?

#### General Flow for Ready for Testing

  * Will this PR get completed by the next release?
  * What release should the issue be targeted for? (e.g. next z-stream, current release, next release, backlog)

#### General Flow for Closed

  * Should this issue be targeted at the next z-stream? Current RC phase? Or just throw it in the "next" release (aka develop or master)

### Notes

A few notes about some automatic operations that are performed by the prprocessor that help facilitate this workflow.

  * All issues are set to an empty release, which again represents "untriaged"
  * Any issues on the backlog that a PR is opened for has its release set to 'empty' to ensure that it flows through the triage process
  * Developers that believe an issue should be considered for a release, should set the release to 'empty' and show up to triage to argue their case

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

## How to Release Katello

This guide covers how to peform a community release of Katello. The guide will reference the term 'X.Y' which reprsents the major and minor version that you are releasing. Throughout the guide we will use 2.0 and 2.1 as examples to represent the currently released community version (2.0) and the version that you are working on releasing (2.1).

### Step 0: Code Name

Pick a release code name based on a style of beer previously unused. Examples from previous releases are Oktoberfest and Winter Warmer.

### Step 1: Warn Community of Branching

The first step to any release is warning the community of impending branching prior to the branch date to give them time to push on any pull requests that are pending. The notification should be sent no less than 2 weeks prior to the intended branch date and ideally when Foreman sends their branching announcement.

### Step 2: Stable Pulp Build

Prior to branching the Katello repositories, the release nanny should figure out what the current stable version of Pulp is and if not already tagged and built, do so. Please see the [Upgrading Pulp Guide](http://www.katello.org/developers/upgrade_pulp.html).

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

### Step 6. Pin katello-installer puppet modules for release

On the katello-installer's KATELLO-X.Y branch, we need to pin the modules to a minor release.

First, we take the pinned Foreman modules in the Puppetfile from the most current release, e.g. https://github.com/theforeman/foreman-installer/blob/1.9-stable/Puppetfile.  Overwrite the Foreman section in katello-installer's Puppetfile with these locked down versions.

Next, we'll lock down the Katello modules. First, Check out all the puppet modules:

```bash
for module in candlepin certs capsule common elasticsearch gutterball katello crane service_wait pulp
do
  git clone git@github.com:Katello/puppet-${module}.git
done
```

Review the modules for releasing - we should be keeping them up to date when making incompatible changes, but do any need bumps of the major or minor version? If so, do so now.

Consider the changes that have been made to the module since the last release, do we need a new release?
Use [blacksmith](https://github.com/maestrodev/puppet-blacksmith) to push to forge.

```bash
rake module:release
```

Now, lock down Katello versions to the appropriate minor, e.g. if you release `puppet-katello 0.2.0` or the latest is 0.2.0, then in the Puppetfile

```
mod 'katello',   '>= 0.2.0 < 0.3.0'
```

### Step 7: Configure Koji

Note that to perform this step, Foreman must have generated it's Koji build targets for the targeted Foreman release. This is due to how Katello tags inherit from some Foreman tags. Coordinate with the Foreman release nanny on when they plan to do that step and wait to do this step until then. Koji needs to have configuration added specific to the tags that the release will occur under. The first step is to add new build roots and tags. Note that you will need access to koji. Contact the Development forum board to request access.

```
./tools koji configs/katello_XY.yaml # Make sure it looks good
./tools koji --commit configs/katello_XY.yaml
```

### Step 8: Setup Mash Scripts

In order to generate the release repositories on Koji, a mash script for the version being released needs to be added. If you do not have direct access to the koji.katello.org box, you can request access or ask someone who does to perform this step for you.

```
./tools mash-scripts config/katello_XY.yaml # Make sure it looks good
./tools mash-scripts --commit config/katello_XY.yaml
```

The generated mash scripts should be committed to tool_belt and a pull request opened. The scripts will then need to be copied onto the Koji box itself. If you do not have access, please contact someone that does or request this action on the Development forum board.

### Step 9: Verify Repos

At this point we want to verify the updates we made to the version branches by mashing and checking the repositories generated on koji.

```
/usr/local/bin/katello-mash-split-X.Y.py
```

View the generated repositories at `http://koji.katello.org/releases/yum/katello-X.Y` and ensure none of the packages have a git hash within the package name.

### Step 9: Build Fresh X.Y Packages

For each repository that was branched, and for each package within a given repository (e.g. katello has both the katello and rubygem-katello packages) we do a tito release koji. For example, the Katello repository:

```
cd katello/
tito release koji
cd deploy/
tito release koji
```

NOTE: This step can only be done after you have created the X.Y tags.

### Step 11: Update Repos RPM

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

### Step 12: Release X.Y Release Candidate RPMs

For this step we'll need to update the Jenkins job that pushes RPMs to fedorapeople and run the job. Go to `http://ci.theforeman.org/view/Katello%20Pipeline/job/release_push_rpm_katello/configure` and add X.Y to the list of RELEASE choices and save the configuration. Now head to `http://ci.theforeman.org/view/Katello%20Pipeline/job/release_push_rpm_katello/build?delay=0sec`, choose the X.Y version you just added and click `Build`. This will run a script that copies the RPMs from Koji to fedorapeople.

### Step 13: Update forklift

We maintain a deployment tool, forklift, for easily testing and deploying Katello versions. You'll want to clone the repository (https://github.com/theforeman/forklift) and update the following:

1. Edit the [README](https://github.com/theforeman/forklift/blob/master/docs/production.md#vagrant-box-installation) to indicate the new version and the OSes it works with.
1. Update the foreman version mappings - https://github.com/theforeman/forklift/blob/master/config/versions.yaml
1. Verify the boxes exist with `vagrant status`
1. Create pipeline playbooks for the new version - https://github.com/theforeman/forklift/tree/master/pipelines
  - This should include a playbook to install the version fresh as well as
    upgrading from the two versions prior.

### Step 14: Test

Use the newly updated forklift pipeline playbooks to test the X.Y release:

```sh
ansible-playbook pipelines/pipeline_katello_XY.yml -e "forklift_state=up"
```

Generally, we should test the fresh install pipeline before moving on to the upgrade pipelines. Once all pipelines are passing locally, the release in koji is ready to be published to https://fedorapeople.org/groups/katello/releases. Contact a senior engineer in theforeman-dev to complete this step.

### Step 15: Announce RC

Now you are ready to announce the RC by sending an post to the Release Announcements forum board, pointing users at the installation instructions. You should also open a PR to `katello.org` to update the news section with an announcement of the RC release.

### Step 16: Fix Bugs

As users test the RC, they may find and file issues. In addition, the RC may have been released with issues still to be fixed. As these issues are identified and fixed, they will need to be backported. The tool_belt tooling can be used to identify issues that need cherry picking across the various repositories. See the tool belt [README](https://github.com/theforeman/tool_belt/blob/master/README.md) for information on how to setup and configure it.

### Step 17: Release!

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
    --passphrase-fd 3 --no-secmem-warning -u "%{_gpg_name}" \
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
