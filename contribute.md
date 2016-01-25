---
layout: contribute
title: Contributing to Foreman
---

# Contributing

## Read the Foreman [handbook](/handbook.html)

The Foreman is an open-source project that's licensed under the GNU Public License version 3.<br>
Contributions of all types are gladly accepted!

## Code-related contributions

These types of tasks generally require a familiarity with Ruby (on Rails) development or RPM/Debian packaging. If you are still new to Rails, community members can help you if you get stuck with something or have any other questions.

You will need to download a copy of the current development-code. [The
official code repository](https://github.com/theforeman) is located
on Github.

Please note that there are two important branches:

* Master - latest stable release code
* Develop - new features and bug fixes

Master is frozen between major releases.

### Setup development environment
* Fork [theforeman/foreman](https://github.com/theforeman/foreman) to a personal GitHub account. This will create a "foreman" repo under your GitHub username.
* Clone the fork you just created to your development system:
{% highlight bash %}
git clone https://github.com/<username>/foreman.git
{% endhighlight %}
* Reference theforeman/foreman as upstream:
{% highlight bash %}
cd foreman
git remote add upstream https://github.com/theforeman/foreman.git
git fetch upstream
{% endhighlight %}
* Copy `config/settings.yaml.example` to `config/settings.yaml`
* Install all required gems:
{% highlight bash %}
bundle install
{% endhighlight %}

You may get some failures when installing the required gems due to some
native libraries being required (notably libvirt-devel &
postgresql-devel) so you will need to install these via your distributions
normal package manager (e.g. `yum install libvirt-devel postgresql-devel`
for RHEL/Fedora based distributions).

You can also exclude these features by using `bundle install --without libvirt postgresql` etc (groups are under bundler.d/).

If you experience problems related to therubyracer or libv8, you can install without the therubyracer bundler group but make sure node.js is installed.

### Setup test environment
1. Copy `config/database.yml.example` to `config/database.yml`
1. Create your database: `rake db:migrate`
1. Run all the tests: `rake test`
1. Or a single test: `ruby -Itest test/functional/your_test.rb` (if you didn't run all tests before, you need to prepare the test environment with `rake db:test:prepare` the first time).

#### Supported Ruby versions

In general the latest Ruby should work. However if you are just starting out, you may want to develop against one of the versions that we test against to reduce the chances of you hitting an unexpected issue, although this is not required.

You can see what versions we are currently testing against on our Jenkins CI server here: [http://ci.theforeman.org/view/Foreman%20pipeline/job/test_develop/](http://ci.theforeman.org/view/Foreman%20pipeline/job/test_develop/)

Any version of Ruby that is older than those listed is not supported.

### Startup foreman
1. Follow steps 1, 2 and 3 from the section "setup test environment" if you haven't done so already
1. Populate database: `rake db:seed` and take note of the password it generates
1. Startup the server: `rails server`
1. Navigate to `localhost:3000`
1. Login as `admin` with the password from the db:seed step earlier (or reset it with `rake permissions:reset`)

### Submit Patches
First, make sure you are a member of the [Foreman Developers](https://groups.google.com/forum/?fromgroups#!forum/foreman-dev) mailing list.

Patches to fix bugs or add new features are always appreciated. If you are going to work on a specific issue, make a note in the issue details so the developers will know what you're working on.

We try to keep a one commit per bug/feature policy, please try to create an issue which is specific for your patch details.

Please make sure there is a [Redmine issue](/contribute.html#Bugreporting) open for the change you are going to submit, as you will want to reference it in your commit message; this is very helpful when generating release notes.

* Create a feature/topic branch

{% highlight bash %}
git checkout -b <branchName> # Example: git checkout -b 1656-add_TB_support
{% endhighlight %}

*  Make changes and commit. Please reference the Redmine issue this commit addresses via "refs" or "fixes" #issueid in the commit message.

{% highlight bash %}
git add <modifiedFile(s)>
git commit -m 'fixes #<bug> <message>'
{% endhighlight %}

* Push topic branch to your fork:

{% highlight bash %}
git push origin <branchName> # Example: git push origin 1656-add_TB_support
{% endhighlight %}

* [Issue a pull request](https://help.github.com/articles/using-pull-requests)

**Once you have followed this process once, it becomes much simpler to add future patches!**

Merge upstream develop to local develop

{% highlight bash %}
git fetch upstream
git checkout develop
git merge upstream/develop develop
git push origin develop
{% endhighlight %}

Now follow step 4 to the end from above.

### Projects / mentoring

Please see [this page](/mentoring.html) for details on our currrent projects.

## Non-code related contributions
These don't require any software development experience, just some time and the desire to help.

### User support
Helping out other users in the "Forums" is always useful. Frequent problems or questions should be brought up so the wiki can be updated to help future users.

Testing is also *very* welcome, for any issue encountered, please open a bug / feature request.

### Bug reporting
Even the simplest of bugs reported helps us make the project better. The issue tracker is located at [http://projects.theforeman.org/projects/foreman/issues](http://projects.theforeman.org/projects/foreman/issues), and you should follow these guidelines:

* Ensure the correct project is selected - the link above is for the Foreman UI itself, you can use [this list](http://projects.theforeman.org/projects) for the other projects.
* Use an understandable, descriptive title, e.g. "Clicking the Template review button gives a 500 server error" rather than "Template review is broken"
* Provide whatever context you can - your host operating system, Foreman version(s), ruby version, etc
* State what you were trying to achieve - provide steps to reproduce your problem where possible
* State what happened in more detail than the title - provide logs where possible
* State what you expected to happen - this helps us correct misinterpretations of features

#### Feature requests
If you're submitting a feature request or user story, please provide the context for the feature, especially the problem you're trying to solve, and your preferred implementation (if you have one). This will lead to a clear record of the discussion and eventual decision.

It's acceptable to head over to the [dev mailing list](/support.html#Mailinglists) to start a discussion if you have an idea you'd like more input on, before submitting tickets. Be sure to mention the appropriate thread in the ticket, so the context can be found in the future.

### Issue triage
Sometimes issues are reported without all the above information needed. Getting the details of the bug or feature from the reporter and the community will help everyone understand what is needed. Our issue tracker can be found here: [http://projects.theforeman.org/projects/foreman/issues](http://projects.theforeman.org/projects/foreman/issues), and see the above section for issue guidelines.

### Translations

The Foreman application has been translated into a number of languages, which require regular updates as strings are added and changed in each release.  We're also on the lookout for new translations if you speak a language that Foreman isn't yet available for.  Join in the effort on [our Transifex project](https://www.transifex.com/projects/p/foreman/).

### Documentation and web site
We're trying to maintain high quality, authoritative documentation in the Foreman manual as part of this web site.  Any contributions, such as adding content, removing outdated information or improving the style and layout are greatly appreciated.

Both the manual and the web site are contained in our [theforeman.org repository](https://github.com/theforeman/theforeman.org).  See the README.md to get started.  Contributions to this project are licensed under Creative Commons Attribution-ShareAlike 3.0.

### Design and User interface
Foreman 1.11 and above uses [Patternfly](http://patternfly.org/) as its base design. Any improvements or suggestions on how to implement this better, or on re-implementing particular pages are very welcome, and could help every user. Design discussion should happen on [the dev mailing list](/support.html#Mailinglists).

### Hosted hardware

We have an ever-growing number of contributions and other plugins and projects that require computing power, mostly in our Jenkins CI environment.  We also have package builders, web hosting and other services to run.

Foreman has a number of generous sponsors who provide hosted, publicly accessible servers (usually virtual machines) or cloud accounts that we can use.  Please see the [sponsors page](/sponsors.html) for more details.
