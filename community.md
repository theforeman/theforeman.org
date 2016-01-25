---
layout: community
title: Community
---

# Foreman Community Information
------------------------------

## Troubleshooting & Support

### Gathering information

To get appropriate support, you need to provide sufficient information about
your operating system, environment and setup. You can utilize the
foreman-debug tool - for more info see the [manual](/manuals/latest/index.html#7.3GettingHelp).

### ![Redmine icon](static/images/redmine.png) [Issue tracker](http://projects.theforeman.org/projects/foreman/issues)

If you wish to report bugs - this is the place.

### ![IRC icon](static/images/freenode.png) [IRC](https://kiwiirc.com/client/irc.freenode.net/?#theforeman)
A great place to get real-time help with The Foreman is our IRC channel: [#theforeman](https://kiwiirc.com/client/irc.freenode.net/?#theforeman)
on [irc.freenode.net](http://webchat.freenode.net/). There are
usually many helpful people there in addition to some of the Foreman
developers. For development discussions, there is also [#theforeman-dev](https://kiwiirc.com/client/irc.freenode.net/?#theforeman-dev).

Please read and understand [this fantastic guide](http://workaround.org/getting-help-on-irc)
to getting help for open-source projects on irc before diving in. All of the
points there apply to #theforeman, especially "Don't repeat yourself", "Don't
ask to ask", and "Stick around".  #theforeman in particular has concentrations
of people in Europe (CEST) and East-coast US (EST), so asking your question
when those time zones are in business hours is more likely to get a good
result.

Be aware that the IRC channel is not an official support channel, it's an ad
hoc group of people (some of whom work on Foreman for a living) self-organizing
to help each other out. If you do not receive an answer to your question,
(especially if you have not followed the getting help on IRC best practices!),
that doesn’t mean you are out of options; the software may [have a
bug](http://projects.theforeman.org/projects/foreman/issues), the docs may be
lacking, or it's possible Foreman doesn't yet support your use case. It just
means you need to keep troubleshooting to find out which.

We also have a few IRC-specific guidelines:

* Don't be a jerk: Treat people with respect and consideration.
* Be helpful: Be patient with new people and be willing to jump in to answer questions.
* Stay calm: The written word is always subject to interpretation, so give people the benefit of the doubt and try not to let emotions get out of control.
* Don't post chunks: Avoid posting big chunks of text - use a [pastebin](http://pastie.org/) or similar service to shorten it to a link. Likewise, try not to spam the channel with many messages, it breaks the flow of other conversations.
* Be patient: Folks might not be around when you ask a question, so wait a while for someone to speak before leaving.
* Search first: Believe it or not, your question might not be new or you might be able to find someone who has already asked or answered your question. Do a thorough search of the [Manual](http://theforeman.org/), the [Redmine Issues](http://projects.theforeman.org/projects/foreman/issues), and the [Mailing List](https://groups.google.com/forum/#!forum/foreman-users) to see if it has been answered before.
* Don't private message: Ask permission before you send someone a private message (PM). Not everyone likes them. Also, by keeping it in public, others with similar issues can see the solution you were given.
* Don't highlight specific people unless you are already discussing something with them. Highlighting a specific user with your opening question makes it far less likely others will respond.
* Try to keep conversations on-topic where possible - going off on a tangent doesn't solve anyone's problem.

More information: This [IRC primer](http://irchelp.org/irchelp/ircprimer.html) for new users and the [general IRC guidelines, from freenode](http://freenode.net/channel_guidelines.shtml), are also useful resources.

(*Thanks to the [Puppet Labs IRC Guidelines](http://docs.puppetlabs.com/community/community_guidelines.html#irc-guidelines) for the original document*)

### ![Google groups icon](static/images/google-groups.png) Mailing lists
If you can't get real time help from IRC, then a post on our mailing lists is the next step, although it may take a little while for people to reply. Mailing lists are available via Google Groups. Much like IRC, we have a general users (support, Q/A, etc) lists and a development list:

* [foreman-users](https://groups.google.com/forum/?fromgroups#!forum/foreman-users) or email `foreman-users+subscribe@googlegroups.com`
* [foreman-dev](https://groups.google.com/forum/?fromgroups#!forum/foreman-dev) or email `foreman-dev+subscribe@googlegroups.com`

There is also a low-traffic list dedicated to release and security announcements:

* [foreman-announce](https://groups.google.com/forum/?fromgroups#!forum/foreman-announce) or email `foreman-announce+subscribe@googlegroups.com`

### ![Stack overflow icon](static/images/stackoverflow.png) [Server Fault](http://serverfault.com/questions/tagged/foreman)
Ask questions about how to use Foreman on Server Fault, so anyone can benefit from the answers. Tag your questions with ['foreman'](http://serverfault.com/questions/tagged/foreman).

## Videos and other media

### Blog

The [Blog](/blog) is on the main navigation bar, but is also open for
contributions of guest posts and corrections via our website [GitHub
repository](https://github.com/theforeman/theforeman.org) - the *\_posts*
directory has the raw markdown of the blog entries. See
[below](community.html#Documentationandwebsite) for more details.

### Media

Please see [this page](/media.html) for all our various videos, slide decks and other media.

### ![YouTube icon](static/images/youtube.png) [YouTube channel](https://www.youtube.com/channel/UCCo7AZ1oG6TbG0-dwjRqCmw)
Please subscribe to our [YouTube channel](https://www.youtube.com/channel/UCCo7AZ1oG6TbG0-dwjRqCmw). We regularly upload deep dives on Foreman features, screencasts to learn how to use the different features and plugins of Foreman, discussions and much more.

### ![GooglePlus icon](static/images/googleplus.png) [Google+ Community](https://plus.google.com/102496134326414788199)
Our G+ community regularly hosts live hangouts on a variety of topics. Become a member of the community and you will be notified about these events, so you can ask questions to the presenters and join the conversation.

## Contributing

The Foreman is an open-source project that's licensed under the GNU Public License version 3.<br>
Contributions of all types are gladly accepted!

### Read the Foreman [handbook](/handbook.html)

### Code-related contributions
These types of tasks generally require a familiarity with Ruby (on Rails) development or RPM/Debian packaging. If you are still new to Rails, community members can help you if you get stuck with something or have any other questions.

You will need to download a copy of the current development-code. [The
official code repository](https://github.com/theforeman) is located
on Github.

** Please note that there are two important branches:**

* Master - latest stable release code
* Develop - new features and bug fixes

Master is frozen between major releases.

#### Setup development environment
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

#### Setup test environment
1. Copy `config/database.yml.example` to `config/database.yml`
1. Create your database: `rake db:migrate`
1. Run all the tests: `rake test`
1. Or a single test: `ruby -Itest test/functional/your_test.rb` (if you didn't run all tests before, you need to prepare the test environment with `rake db:test:prepare` the first time).

#### Startup foreman
1. Follow steps 1, 2 and 3 from the section "setup test environment" if you haven't done so already
1. Populate database: `rake db:seed` and take note of the password it generates
1. Startup the server: `rails server`
1. Navigate to `localhost:3000`
1. Login as `admin` with the password from the db:seed step earlier (or reset it with `rake permissions:reset`)

#### Submit Patches
First, make sure you are a member of the [Foreman Developers](https://groups.google.com/forum/?fromgroups#!forum/foreman-dev) mailing list.

Patches to fix bugs or add new features are always appreciated. If you are going to work on a specific issue, make a note in the issue details so the developers will know what you're working on.

We try to keep a one commit per bug/feature policy, please try to create an issue which is specific for your patch details.

Please make sure there is a [Redmine issue](http://projects.theforeman.org/projects/foreman/issues) open for the change you are going to submit, as you will want to reference it in your commit message; this is very helpful when generating release notes.

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

### Non-code related contributions
These don't require any software development experience, just some time and the desire to help.

#### User support
Helping out other users in the "Forums" is always useful. Frequent problems or questions should be brought up so the wiki can be updated to help future users.

Testing is also *very* welcome, for any issue encountered, please open a bug / feature request.

#### Issue triage
Sometimes issues are reported without all the information needed by a developer. Getting the details of the bug or feature from the reporter and the community will help everyone understand what is needed. Our issue tracker can be found here: [http://projects.theforeman.org/projects/foreman/issues](http://projects.theforeman.org/projects/foreman/issues)

#### Translations

The Foreman application has been translated into a number of languages, which require regular updates as strings are added and changed in each release.  We're also on the lookout for new translations if you speak a language that Foreman isn't yet available for.  Join in the effort on [our Transifex project](https://www.transifex.com/projects/p/foreman/).

#### Documentation and web site
We're trying to maintain high quality, authoritative documentation in the Foreman manual as part of this web site.  Any contributions, such as adding content, removing outdated information or improving the style and layout are greatly appreciated.

Both the manual and the web site are contained in our [theforeman.org repository](https://github.com/theforeman/theforeman.org).  See the README.md to get started.  Contributions to this project are licensed under Creative Commons Attribution-ShareAlike 3.0.

#### Design and User interface
Foreman has a very basic design and user interface. Any improvements to it including new themes, skinning, or interface adjustments could help every user.

#### Hosted hardware

We have an ever-growing number of contributions and other plugins and projects that require computing power, mostly in our Jenkins CI environment.  We also have package builders, web hosting and other services to run.

Foreman has a number of generous sponsors who provide hosted, publicly accessible servers (usually virtual machines) or cloud accounts that we can use.  Please see the [sponsors page](/sponsors.html) for more details.

## Projects & mentoring

Please see [this page](/mentoring.html) for details on our currrent mentoring
projects. Note that familiarity with the project is expected before applying
for an mentoring project - at the very least, followed the
[setup steps](/community.html#Code-relatedcontributions) for writing and
contributing patches as detailed above.
