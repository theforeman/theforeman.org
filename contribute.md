---
layout: contribute
title: Contributing to Foreman
---

## Where to find us
You can find us on both our forum and IRC. See our [Support](/support)
page for all the details on how to come chat with us.

### Attend some [Events](/events)
The Foreman has a growing list of community events - check the [events
page](/events) for more details. If there's nothing suitable in your area, why
not consider [creating an event](https://github.com/theforeman/theforeman.org/blob/gh-pages/_data/events.yml)!

## Contributing Code

### Read the Foreman [handbook](/handbook.html)
The Foreman is an open-source project that's licensed under the GNU General Public License version 3.<br>
Contributions of all types are gladly accepted!

### Setting up a development environment
These types of tasks generally require a familiarity with Ruby (on Rails) development or RPM/Debian packaging. If you are still new to Rails, community members can help you if you get stuck with something or have any other questions.

You will need to download a copy of the current development code. [The
official code repository](https://github.com/theforeman) is located
on GitHub. All changes are made in the `develop` branch.

There is a tool called [Forklift](https://github.com/theforeman/forklift) that can be used to automate deploying Foreman development environments.

#### Supported Ruby versions
In general the latest Ruby should work. However if you are just starting out, you may want to develop against one of the
versions that we test against to reduce the chances of you hitting an unexpected issue, although this is not required.

You can see what versions we are currently testing against on our Jenkins CI server here:
[http://ci.theforeman.org/view/Foreman%20pipeline/job/test_develop/](http://ci.theforeman.org/view/Foreman%20pipeline/job/test_develop/)

Any version of Ruby that is older than those listed is not supported.

#### Supported Node.js versions
In general, the latest stable Node.js should work. However if you are just starting out, you may want to develop against
one of the versions that we test against to reduce the chances of you hitting an unexpected issue, although this is not
required.

You can see what versions we are currently testing against on our Travis CI runs in the .travis.yml file in the foreman
repository.

Any version of Node.js that is older than those listed is not supported.

For populating the node_modules folder, npm version 4 or later is required. Alternatively,
[yarn](https://yarnpkg.com) can also be used.

#### Setup development environment

Installing the latest development code is useful for testing latest and
greatest features or development.

Foreman uses Bundler to install dependencies and get up and running. This is
the preferred way to get Foreman if you want to benefit from the latest
improvements. By using the git repository you can also upgrade more easily. You
will need to have Bundler installed manually for now (check your distribution
repositories, or install it via rubygems).

Foreman will run with the following requirements (aside from rubygem dependencies):

* Ruby 2.5 or newer
* NodeJS 10 or newer
* NPM 3.0 or newer

You will want to make sure that you have *postgresql-devel* installed so the database
gems can install properly. Also, you would also need *gcc*, *ruby-devel*,
*libxml-devel*, *libxslt-devel*, *libvirt-devel*, *nodejs*, and *npm* packages.

For RHEL7 or clones, you can issue the following commands to install *all*
required packages:

    yum groupinstall "Development Tools" "Development Libraries"
    yum -y install gcc-c++ git ruby ruby-devel rubygems \
        libvirt-devel postgresql-devel openssl-devel \
        libxml2-devel libxslt-devel zlib-devel \
        readline-devel systemd-devel tar nodejs npm libcurl-devel

Additionally, it is important that `config/database.yml` is set to use
the correct database in the "production" block. Rails (and subsequently
Foreman) will use these connection settings under "production" to manage
the database it uses and setup the necessary schema.

* Fork [theforeman/foreman](https://github.com/theforeman/foreman) to your GitHub account. This will create a "foreman" repo under your GitHub username.
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
* Copy `config/database.yml.example` to `config/database.yml`
* Install all required gems and node modules:
{% highlight bash %}
bundle install --path vendor
npm install
{% endhighlight %}

You may get some failures when installing the required gems due to some native
libraries being required (notably libvirt-devel & postgresql-devel) so you will
need to install these via your distributions normal package manager. Refer to
the "Installing from Source" section above for more details.

You can also exclude some features by using `bundle install --without libvirt
postgresql` etc (groups are under bundler.d/).

To run integration tests, it's best to install chromedriver package from your
distribution as it comes with compatible chromium headless browser. For example
in Fedora do this: `yum install chromedriver`. If you don't do this, npm will
install chromedriver that might be not compatible with your Chrome or Chromium
browser which can lead to error "Chrome version must be between XX and YY."

When using system chromedriver, set the correct path to it via variable. For
Fedora that would be: `TESTDRIVER_PATH=/usr/bin/chromedriver`.

#### Start up foreman

1. Follow steps from the section "Setup development environment" if you haven't done so already
1. Create your database: `bundle exec bin/rake db:migrate`
1. Populate database: `bundle exec bin/rake db:seed` and take note of the password it generates
1. Start up the server: `bundle exec foreman start`
1. Navigate to [http://localhost:5000](http://localhost:5000)
1. Login as `admin` with the password from the db:seed step earlier

The autogenerated password can be changed later via:

    bundle exec rake permissions:reset password=changeme

#### Setup test environment

1. Run all the tests: `bundle exec bin/rake test`
1. Or a single test: `bundle exec bin/rake test TEST=test/functional/your_test.rb`
1. Once done, stop any background processes with `bundle exec spring stop` ([more info](/handbook.html#UsingtheSpringpreloaderindevelopment))

#### CLI environment (Hammer)

To install hammer from git checkouts, you will just need <code>rake</code> installed
on your system. Clone and install CLI core

{% highlight bash %}
$ git clone https://github.com/theforeman/hammer-cli.git
$ cd hammer-cli
$ rake install
$ cd ..
{% endhighlight %}

and clone plugin with foreman commands

{% highlight bash %}
$ git clone https://github.com/theforeman/hammer-cli-foreman.git
$ cd hammer-cli-foreman
$ rake install
$ cd ..
{% endhighlight %}

You can install other hammer plugins via any of the methods mentioned above.

#### Submit Patches
First, make sure you are aware of the [Foreman Development board](https://community.theforeman.org/c/development) on our forum.

Patches to fix bugs or add new features are always appreciated. If you are going to work on a specific issue, make a note in the issue details so the developers will know what you're working on.

We try to keep a one commit per bug/feature policy, please try to create an issue which is specific for your patch details.

Please make sure there is a [Redmine issue](/contribute.html#Bugreporting) open for the change you are going to submit, as you will want to reference it in your commit message; this is very helpful when generating release notes.

* Create a feature/topic branch

{% highlight bash %}
git checkout -b <branchName> # Example: git checkout -b 1656-add_TB_support
{% endhighlight %}

*  Make changes and commit. Please reference the Redmine issue this commit
addresses via "Refs" or "Fixes" in the commit message. See [Coding
Standards](handbook.html#Codingstandards) guide for more details.

{% highlight bash %}
git add <modifiedFile(s)>
git commit -m 'Fixes #<bug> - <message>'
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
Please see [this page](/mentoring.html) for details on our current projects.

## Other types of contribution
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

### Feature requests
If you're submitting a feature request or user story, please provide the context for the feature, especially the problem you're trying to solve, and your preferred implementation (if you have one). This will lead to a clear record of the discussion and eventual decision.

It's acceptable to head over to the [Development board](https://community.theforeman.org/c/development) on our forum to start a discussion if you have an idea you'd like more input on, before submitting tickets. Be sure to mention the appropriate thread in the ticket, so the context can be found in the future.

### Issue triage
Sometimes issues are reported without all the above information needed. Getting the details of the bug or feature from the reporter and the community will help everyone understand what is needed. Our issue tracker can be found here: [http://projects.theforeman.org/projects/foreman/issues](http://projects.theforeman.org/projects/foreman/issues), and see the above section for issue guidelines.

### Translations
The Foreman application has been translated into a number of languages, which require regular updates as strings are added and changed in each release.  We're also on the lookout for new translations if you speak a language that Foreman isn't yet available for.  Join in the effort on [our Transifex project](https://www.transifex.com/projects/p/foreman/).

### Documentation and web site
We're trying to maintain high quality, authoritative documentation in the Foreman manual as part of this web site.  Any contributions, such as adding content, removing outdated information or improving the style and layout are greatly appreciated.

Both the manual and the web site are contained in our [theforeman.org repository](https://github.com/theforeman/theforeman.org).  See the README.md to get started.  Contributions to this project are licensed under Creative Commons Attribution-ShareAlike 3.0.

### Design and User interface
Foreman 1.11 and above uses [Patternfly](http://patternfly.org/) as its base design. Any improvements or suggestions on how to implement this better, or on re-implementing particular pages are very welcome, and could help every user. Design discussion should happen on the[Development board](https://community.theforeman.org/c/development) on our forum.

### Hosted hardware
We have an ever-growing number of contributions and other plugins and projects that require computing power, mostly in our Jenkins CI environment.  We also have package builders, web hosting and other services to run.

Foreman has a number of generous sponsors who provide hosted, publicly accessible servers (usually virtual machines) or cloud accounts that we can use.  Please see the [sponsors page](/sponsors.html) for more details.
