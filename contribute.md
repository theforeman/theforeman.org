---
layout: contribute
title: Contributing to Foreman
---

The Foreman is an open-source project that's licensed under the GNU Public License version 3. Contributions of all types are gladly accepted!

## Code-related contributions
These types of tasks generally require a familiarity with Ruby (on Rails) development or RPM/Debian packaging. If you are still new to Rails, community members can help you if you get stuck with something or have any other questions.

You will need to download a copy of the current development-code. [The
official code repository](https://github.com/theforeman) is located
on Github.

** Please note that there are two important branches:**

* Master - latest stable release code
* Develop - new features and bug fixes

Master is frozen between major releases.

### Setup development environment
1. Fork [theforeman/foreman](https://github.com/theforeman/foreman) to a personal GitHub account. This will create a "foreman" repo under your GitHub username.
2. Clone the fork you just created to your development system: `git clone https://github.com/<username>/foreman.git`
3. Reference theforeman/foreman as upstream:

    * `cd foreman`
    * `git remote add upstream https://github.com/theforeman/foreman.git`
    * `git fetch upstream`

4. Copy `config/settings.yaml.example` to `config/settings.yaml`
5. Install all required gems: `bundle install`

You may get some failures when installing the required gems due to some
native libraries being required (notably libvirt-devel &
postgresql-devel) so you will need to install these via your distributions
normal package manager (e.g. `yum install libvirt-devel postgresql-devel`
for RHEL/Fedora based distributions).

You can also exclude these features by using `bundle install --without libvirt postgresql` etc (groups are under bundler.d/).

### Setup test environment
1. Copy `config/database.yml.example` to `config/database.yml`
2. Create your database: `rake db:migrate`
3. Run all the tests: `rake test`
4. Or a single test: `ruby -Itest test/functional/your_test.rb` (if you didn't run all tests before, you need to prepare the test environment with `rake db:test:prepare` the first time).

### Startup foreman
1. Follow steps 1 and 2 from the section "setup test environment" if you haven't done so already
2. Populate database: `rake db:seed`
3. Startup the server: `rails server`
4. Navigate to `localhost:3000`
5. Login with `admin/changeme`

### Submit Patches
First, make sure you are a member of the [Foreman Developers](https://groups.google.com/forum/?fromgroups#!forum/foreman-dev) mailing list.

Patches to fix bugs or add new features are always appreciated. If you are going to work on a specific issue, make a note in the issue details so the developers will know what you're working on.

We try to keep a one commit per bug/feature policy, please try to create an issue which is specific for your patch details.

Please make sure there is a [Redmine issue](http://projects.theforeman.org/projects/foreman/issues) open for the change you are going to submit, as you will want to reference it in your commit message; this is very helpful when generating release notes.

1. Create a feature/topic branch

    * `git checkout -b <branchName>` - Example: git checkout -b 1656-add_TB_support

2. Make changes and commit. Please reference the Redmine issue this commit addresses via "refs" or "fixes" #issueid in the commit message. 

    * `git add <modifiedFile(s)>; git commit -m 'fixes #<bug> <message>'`

3. Push topic branch to your fork:

    * `git push origin <branchName>` - Example: git push origin 1656-add_TB_support

4. [Issue a pull request](https://help.github.com/articles/using-pull-requests)

**Once you have followed this process once, it becomes much simpler to add future patches!**

Merge upstream develop to local develop

* git fetch upstream
* git checkout develop
* git merge upstream/develop develop
* git push origin develop

Now follow step 4 to the end from above.

## Non-code related contributions
These don't require any software development experience, just some time and the desire to help.

### User support
Helping out other users in the "Forums" is always useful. Frequent problems or questions should be brought up so the wiki can be updated to help future users.

Testing is also *very* welcome, for any issue encountered, please open a bug / feature request.

### Issue triage
Sometimes issues are reported without all the information needed by a developer. Getting the details of the bug or feature from the reporter and the community will help everyone understand what is needed. Our issue tracker can be found here: [http://projects.theforeman.org/projects/foreman/issues](http://projects.theforeman.org/projects/foreman/issues)

### Translations

The Foreman application has been translated into a number of languages, which require regular updates as strings are added and changed in each release.  We're also on the lookout for new translations if you speak a language that Foreman isn't yet available for.  Join in the effort on [our Transifex project](https://www.transifex.com/projects/p/foreman/).

### Documentation and web site
We're trying to maintain high quality, authoritative documentation in the Foreman manual as part of this web site.  Any contributions, such as adding content, removing outdated information or improving the style and layout are greatly appreciated.

Both the manual and the web site are contained in our [theforeman.org repository](https://github.com/theforeman/theforeman.org).  See the README.md to get started.  Contributions to this project are licensed under Creative Commons Attribution-ShareAlike 3.0.

### Design and User interface
Foreman has a very basic design and user interface. Any improvements to it including new themes, skinning, or interface adjustments could help every user.
