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
 * [Upgrading Pulp](/plugins/katello/developers.html#upgrading-pulp)


## Triage Process

The Katello bug triage process is designed to address Redmine issues that have been opened by the community and developers in order to target the releases that these issues will be included in. This should be done on a weekly basis and in the following order of items to be addressed:

  * [Open Recycle Bin](http://projects.theforeman.org/projects/katello/issues?utf8=%E2%9C%93&set_filter=1&f%5B%5D=status_id&op%5Bstatus_id%5D=o&f%5B%5D=release_id&op%5Brelease_id%5D=%3D&v%5Brelease_id%5D%5B%5D=166&f%5B%5D=&c%5B%5D=tracker&c%5B%5D=status&c%5B%5D=priority&c%5B%5D=subject&c%5B%5D=author&c%5B%5D=assigned_to&c%5B%5D=updated_on&c%5B%5D=category&c%5B%5D=fixed_version&c%5B%5D=position&group_by=fixed_version)
  * [Untriaged High Priority](http://projects.theforeman.org/projects/katello/issues?utf8=%E2%9C%93&set_filter=1&f%5B%5D=release_id&op%5Brelease_id%5D=%21*&f%5B%5D=subproject_id&op%5Bsubproject_id%5D=%21*&f%5B%5D=priority_id&op%5Bpriority_id%5D=%3D&v%5Bpriority_id%5D%5B%5D=5&v%5Bpriority_id%5D%5B%5D=6&v%5Bpriority_id%5D%5B%5D=7&f%5B%5D=&c%5B%5D=tracker&c%5B%5D=status&c%5B%5D=priority&c%5B%5D=subject&c%5B%5D=author&c%5B%5D=assigned_to&c%5B%5D=updated_on&c%5B%5D=category&c%5B%5D=fixed_version&group_by=)
  * [Untriaged Closed](http://projects.theforeman.org/projects/katello/issues?utf8=%E2%9C%93&set_filter=1&f%5B%5D=release_id&op%5Brelease_id%5D=%21*&f%5B%5D=subproject_id&op%5Bsubproject_id%5D=%21*&f%5B%5D=status_id&op%5Bstatus_id%5D=c&f%5B%5D=&c%5B%5D=tracker&c%5B%5D=status&c%5B%5D=priority&c%5B%5D=subject&c%5B%5D=author&c%5B%5D=assigned_to&c%5B%5D=updated_on&c%5B%5D=category&c%5B%5D=fixed_version&group_by=)
  * [Untriaged Open](http://projects.theforeman.org/projects/katello/issues?utf8=%E2%9C%93&set_filter=1&f%5B%5D=release_id&op%5Brelease_id%5D=%21*&f%5B%5D=subproject_id&op%5Bsubproject_id%5D=%21*&f%5B%5D=status_id&op%5Bstatus_id%5D=o&f%5B%5D=&c%5B%5D=tracker&c%5B%5D=status&c%5B%5D=priority&c%5B%5D=subject&c%5B%5D=author&c%5B%5D=assigned_to&c%5B%5D=updated_on&c%5B%5D=category&c%5B%5D=fixed_version&group_by=)
  * [Untriaged Ready for Testing](http://projects.theforeman.org/projects/katello/issues?utf8=%E2%9C%93&set_filter=1&f%5B%5D=release_id&op%5Brelease_id%5D=%21*&f%5B%5D=subproject_id&op%5Bsubproject_id%5D=%21*&f%5B%5D=status_id&op%5Bstatus_id%5D=%3D&v%5Bstatus_id%5D%5B%5D=7&f%5B%5D=&c%5B%5D=tracker&c%5B%5D=status&c%5B%5D=priority&c%5B%5D=subject&c%5B%5D=author&c%5B%5D=assigned_to&c%5B%5D=updated_on&c%5B%5D=category&c%5B%5D=fixed_version&group_by=)


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

The first step to any release is warning the community of impending branching prior to the branch date to give them time to push on any pull requests that are pending. The email should be sent no less than 2 weeks prior to the intended branch date and ideally when Foreman sends their branching announcement.

### Step 2: Stable Pulp Build

Prior to branching the Katello repositories, the release nanny should figure out what the current stable version of Pulp is and if not already tagged and built, do so. Please see the [Upgrading Pulp Guide](http://www.katello.org/developers/upgrade_pulp.html).

### Step 3: Setup Your Environment

There are a number of repositories that will need to be tagged and branched throughout the process. We recommend organizing this before hand so that you have a common place to reference and work through these tasks within throughout the release process. Clone the following:

```
git clone https://github.com/Katello/katello
git clone https://github.com/Katello/katello-installer.git
git clone https://github.com/Katello/katello-misc
git clone https://github.com/Katello/katello-agent
git clone https://github.com/Katello/hammer-cli-katello
```

Note that some repositories contain multiple spec-files and thus packages:

```
katello
  rubygem-katello.spec
  deploy/katello.spec

katello-misc
  certs-tools/katello-certs-tools.spec
  repos/katello-repos.spec
  utils/katello-utils.spec

katello-agent
  katello-agent.spec

katello-installer
  katello-installer.spec

hammer-cli-katello
  rubygem-hammer_cli_katello.spec
```

### Step 4: Get Your Branch On

On the date and time you previously warned the community branching would occur on, do the following for each repository EXCEPT `hammer-cli-katello`.

The first step is to create the X.Y branch. Take a moment to review the layout of each repository from Step 3. The idea with this step is to checkout the master branch for a given repository, ensure its set to the current upstream master, set a tag point for where you are going to branch for EACH spec file (aka package) that lives in a given repository and then create the branch. For example, the katello repository contains two packages (spec files) at `/` and `/deploy` (likewise, again, looking back at Step 3, katello-misc contains multiple packages):

```
cd katello
git fetch origin
git checkout master
git reset origin/master --hard
tito tag
cd deploy/
tito tag
git checkout -b KATELLO-X.Y
```

Update the releasers and tito configuration for each package (some repositories contain multiple packages, see Step 3 for list):

```
VER=X.Y sed -i "s#/katello-nightly-rhel/#/katello-$VER-rhel/#g" rel-eng/*
git commit -a -m 'Updating rel-eng for X.Y'
git push origin KATELLO-X.Y
```

Now we set master to start from the version after the one we are working on releasing X.Y+1, for each package, ensuring you are in the directory the spec file exists:

```
git checkout master
```

For any of the gems, update the gem version file and the spec file to X.Y.0 and make sure to reset the release to 1. For example,

```
vim lib/katello/version.rb
vim rubygem-katello.spec
git commit -a -m 'Version bump to X.Y.0'
```

Now for all of the repositories including the gems, tag and push the starting place for the next version:

```
tito tag --use-version=X.Y+1.0
git push origin master && git push --tags
```

For `hammer-cli-katello`:

1. If there are no changes since last version do nothing
2. If there are changes, bump the version, release the gem, tag and build in koji

Lastly, branch documentation

Now we are ready to branch the documentation. This is done separately from the other branching due to the fact that we do not tag or generate an RPM of the documentation website.

```
git clone https://github.com/Katello/katello.org
cd katello.org
git checkout -b KATELLO-X.Y
git push origin KATELLO-X.Y
```

Check that the CI job that builds the site (http://ci.theforeman.org/job/deploy_katello_site/) has been kicked off or kick it off manually if needed. Once it passes, visit [http://www.katello.org](http://www.katello.org) and check that X.Y is available from the drop down list. If it did not build correctly, you will need to checkout the `deploy` branch and test it locally.

Congratulations, you have successfully branched all of the repositories and prepared them for release. We recommend double checking each repository ensuring that the branch exists in the upstream repository, that the top of the commit stack in that branch includes the tag you created prior to branching (so that you have an initial tag point that represents the branch point) and that the tag itself exists. The last part of this step is to send to a follow up email letting the community know that everything has been branched.

### Step 5. Pin katello-installer puppet modules for release

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

### Step 6: Configure Koji

Note that to perform this step, Foreman must have generated it's Koji build targets for the targeted Foreman release. This is due to how Katello tags inherit from some Foreman tags. Coordinate with the Foreman release nanny on when they plan to do that step and wait to do this step until then. Koji needs to have configuration added specific to the tags that the release will occur under. The first step is to add new build roots and tags using the following script:

```
https://github.com/Katello/katello-misc/blob/master/rel-eng/koji_create_buildroots.sh
```

We recommend running this script in logical chunks instead of attempting to run the entire thing at once.

### Step 7: Setup Mash Scripts

In order to generate the release repositories on Koji, a mash script for the version being released needs to be added. If you do not have direct access to the koji.katello.org box, you can request access or ask someone who does to perform this step for you.

Copy previous mash script to new one

```
cp /usr/local/bin/katello-mash-split.py /usr/local/bin/katello-mash-split-2.1.py
```

Open new mash script and replace the version with the new one

```
sed -i "s#/nightly/#/2.1/#g" /usr/local/bin/katello-mash-split-2.1.py
```

Now do the same for all of the 2.0 mash files in `/etc/mash`, copying them to 2.1 files and updating the contents from 2.0 to 2.1. Finally, generate the first set of X.Y repositories on koji:

```
/usr/local/bin/katello-mash-split-2.1.py
```

The mash can be run via the release_mash_katello Jenkins job. However, the job first needs to be updated for the new version you are building by adding the Foreman and Katello versions to the configuration of the job through the Jenkins Web UI.

### Step 8: Verify Repos

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

### Step 10: Update Repos RPM

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

### Step 11: Release X.Y Release Candidate RPMs

For this step we'll need to update the Jenkins job that pushes RPMs to fedorapeople and run the job. Go to `http://ci.theforeman.org/view/Katello%20Pipeline/job/release_push_rpm_katello/configure` and add X.Y to the list of RELEASE choices and save the configuration. Now head to `http://ci.theforeman.org/view/Katello%20Pipeline/job/release_push_rpm_katello/build?delay=0sec`, choose the X.Y version you just added and click `Build`. This will run a script that copies the RPMs from Koji to fedorapeople.

### Step 12: Update katello-deploy

We maintain a deployment tool, katello-deploy, for easily testing and deploying Katello versions. You'll want to clone the repository (https://github.com/Katello/katello-deploy.git) and update the following:

1. Edit the README to indicate the new version and the OSes it works with.
1. Update the foreman version matcher - https://github.com/Katello/katello-deploy/blob/master/setup.rb#L10
1. Add new boxes for X.Y - https://github.com/Katello/katello-deploy/blob/master/Vagrantfile#L28

### Step 13: Test

Use the newly updated katello-deploy to spin up an X.Y box and test for the following:

* Installation
* UI
* Repository sync and content view publish
* Can install katello-agent for el5,6, 7 from the client repo (without the need of the main katello repo enabled)
* Run a full bats test with content

### Step 14: Announce RC

Now you are ready to announce the RC by sending an email to the foreman-users and foreman-dev mailing lists pointing users at the installation instructions. You should also open a PR to `katello.org` to update the news section with an announcement of the RC release.

### Step 15: Fix Bugs

As users test the RC, they may find and file issues. In addition, the RC may have been released with issues still to be fixed. As these issues are identified and fixed, they will need to be backported. The tool_belt tooling can be used to identify issues that need cherry picking across the various repositories. See the tool belt [README](https://github.com/ehelms/tool_belt/blob/master/README.md) for information on how to setup and configure it.

### Step 16: Release!

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
