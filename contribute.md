---
layout: contribute
title: Contributing to Foreman
---

## Contributing Code

The Foreman is an open-source project that's licensed under the GNU General Public License version 3. Contributions of all types are gladly accepted! Before setting up your development environment, check out our [issue tracker](https://projects.theforeman.org/projects). We have a list of [trivial or easy](https://projects.theforeman.org/projects/foreman/issues?query_id=42) issues in the Foreman core project. Similar queries can be done in other projects on the issue tracker.

Before writing any code, read the Foreman [handbook](/handbook.html) for some code guidelines and recommendations. You can find us on both our forum and Matrix.org if you run into trouble when selecting issues or setting up your development environment. See our [Support](/support) page for all the details on how to come chat with us.

### Setting up a development environment

These types of tasks generally require a familiarity with Linux, Ruby, Ruby on Rails, Javascript and React development. If you are still new to Rails, community members can help you if you get stuck with something or have any other questions.

To get you started, we've prepared a short video demonstrating the process of both documented options.

<iframe width="560" height="315" src="https://www.youtube.com/embed/rtTw6xqFtIE" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

#### Option A: Preconfigured virtual machine

You will need to download a copy of the current development code. [The
official code repository](https://github.com/theforeman) is located
on GitHub. All changes are made in the `develop` branch.

There is a tool called [Forklift](https://github.com/theforeman/forklift) that can be used to automate deploying Foreman development environments. This will work on Linux, MacOS or even Windows and the only required tools are Vagrant (virtual machine manager and image deployment tool), Ansible (configuration management tool) and a host with virtualization capabilities.

There are couple of installation profiles available, namely:

* centos7-katello-devel: Git clones of foreman, remote execution and katello plugins and all required backend systems running on CentOS 7.
* centos7-luna-devel: Git clones of foreman and all plugins which are shipped as Red Hat Satellite product running on CentOS 7.
* centos7-foreman-nightly: Installation of nightly build of Foreman from RPM packages running on CentOS Linux 7. This can be used for evaluation or pilot installation. You can substitute `centos7` with `centos8`, `centos8-stream`, `debian10` or `ubuntu1804` to get another base OS. Similarly, `nightly` can be replaced by `2.4` or any other supported version. Instead of `foreman`, `katello` can also be used.

Follow instructions from the Forklift github repository README, in short it is as easy as:

```
host# git clone https://github.com/theforeman/forklift.git
host# cd forklift
host# vagrant up --provision centos7-katello-devel
host# vagrant ssh centos7-katello-devel
```

The last command connects as user `vagrant` with sudo permissions, then start foreman as usual:

```
cd foreman/
bundle install
npm install
bundle exec foreman start
```

Although you will see a message from Rails (Puma web server) about listening on port `5000`, there is an Apache httpd listening on 443 configured under virtual host named `VAGRANT_NAME.HOSTNAME.example.com` (e.g. for `myserver` host it is `centos7-katello-devel.myserver.example.com`). In order to connect from browser, a DNS or `/etc/hosts` entry will be required.

Sign in as admin with password `changeme`. See the following instructions on how to change admin's password if you forget it.

When dependencies are changed after `git pull`, the following commands will be necessary if you encounter error with unresolved Ruby or JavaScript depdenencies:

```
bundle install
npm install
```

#### Option B: Setting up from git manually

This option is more suitable when planning to work on Foreman core, the main Ruby on Rails application, core user interface components or pages or pre-configured templates which are shipped with Foreman. It is also possible to clone and enable plugin repositories, however we do not recommend to manually install the Katello plugin which require number of backend systems to be installed and configured.

This chapter assumes a Linux OS preferably with Fedora or CentOS 8. For other Linux distributions, some instructions might differ. If you are on MacOS, there is an unofficial [guide](https://community.theforeman.org/t/foreman-development-setup-on-mac/22906) available. Windows is not supported as Foreman requires UNIX-compabitle OS.

First of all, clone our upstream repository:

```
git clone https://github.com/theforeman/foreman
cd foreman
```

If you plan to file pull requests on Github, then it's better to fork our repository, clone your fork and add the original as an upstream repo:

```
git clone https://github.com/MYUSERNAME/foreman
cd foreman
git remote add upstream https://github.com/theforeman/foreman
```

Some people prefer checking out the upstream repo as origin and add their forks under username:

```
git clone https://github.com/theforeman/foreman
cd foreman
git remote add MYUSERNAME https://github.com/MYUSERNAME/foreman
```

The choice is yours.

#### Supported Ruby versions

In general, any Ruby version supported by Rails version required by Foreman will work. However, if you are just starting out, you might want to develop against one of the versions that we test against to reduce the chances of you hitting an unexpected issue, although this is not required.

The Rails version is found by opening the [Gemfile](https://github.com/theforeman/foreman/blob/develop/Gemfile) and searching for `gem 'rails'` line. Then find out which Ruby versions are supported for that particular Ruby on Rails version. Another, perhaps faster way, is to visit our [Jenkins CI server](http://ci.theforeman.org/view/Foreman%20pipeline/job/test_develop) to see matrix of supported versions. Then pick any version from that list.

Instructions for Fedora, CentOS 8, CentOS 8 Stream or Red Hat Enterprise Linux 8:

```
dnf module enable ruby:2.7
dnf install ruby ruby-devel
```

#### Supported Node.js versions

In general, the latest stable Node.js should work. However if you are just starting out, you might want to develop against one of the versions that we test against to reduce the chances of you hitting an unexpected issue, although this is not required.

You can view our [Github Actions configuration](https://github.com/theforeman/foreman/blob/develop/.github/workflows/js_tests.yml) to see supported NodeJS versions. Any version from that list will do. For populating the node_modules folder, npm version 4 or later is required. Alternatively, [yarn](https://yarnpkg.com) can also be used.

Instructions for Fedora, CentOS 8, CentOS 8 Stream or Red Hat Enterprise Linux:

```
dnf module enable nodejs:14
dnf install nodejs
```

#### Supported PostgreSQL versions

In general, the latest version of PostgreSQL will work. Minimum version is currently 10, anything newer than that will do the job.

Instructions for Fedora, CentOS 8, CentOS 8 Stream or Red Hat Enterprise Linux:

```
dnf module enable postgresql:12
dnf install postgresql-server
```

#### Libraries and database

Some Ruby libraries (rubygems) require development tools (compilers, make), libraries and header files and Chrome driver to be present on the host. Instructions for Fedora, CentOS 8, CentOS 8 Stream or Red Hat Enterprise Linux:

```
dnf groupinstall "Development Tools"
dnf install libvirt-devel postgresql-devel openssl-devel libxml2-devel sqlite-devel libxslt-devel zlib-devel readline-devel systemd-devel libcurl-devel krb5-devel
dnf install chromedriver
```

Foreman requires PostgreSQL, even for development. SQLite is no longer supported and will not work. Instructions for Fedora, CentOS 8, CentOS 8 Stream or Red Hat Enterprise Linux:

```
postgresql-setup --initdb
```

Configure security, for development purposes you can turn off authentication completely and let all users in on local sockets or loopback network interfaces. If you choose to use passwords, make sure to set them later:

```
grep trust /var/lib/pgsql/data/pg_hba.conf
local   all             all                                     trust
host    all             all             127.0.0.1/32            trust
host    all             all             ::1/128                 trust
```

Start the service and create databases:

```
systemctl enable --now postgresql
sudo -u postgres createuser --superuser $USERNAME
sudo -u postgres createdb foreman
sudo -u postgres createdb foreman-test
```

#### Configure Foreman

In the Foreman git repository, create and review necessary configuration files. If you named the databases "foreman" and "foreman-test" then no change is actually needed, but we do recommend to review configuration files because a change will be necessary depending on what you are planning to work on:

```
cp config/settings.yaml.example config/settings.yaml
cp config/database.yml.example config/database.yml
```

Install the required Ruby gems. If you encounter a compilation error during rubygems installation, you are probably missing either development tools or library or headers. See above.

```
bundle config set --local path vendor/
bundle install
```

It is possible to skip some rubygems when you don't plan using specific features, although this is not recommended. You can probably use this if you cannot figure out what library are you missing:

```
bundle config set --local without "journald ec2 ovirt vmware openstack libvirt gce"
```

Install the required Javascript modules:

```
npm install
```

You can delete at any point `vendor/ruby` or `npm_modules` directories if you run into some issues and reinstall all libraries from scratch.

To run integration tests, it's best to install the **chromedriver** package from your distribution as it comes with compatible chromium headless browser. See the previous section for instructions on how to do this for Fedora and Red Hat compatible distributions. If you don't do this, npm will install chromedriver that might be not compatible with your Chrome or Chromium browser which can lead to error "Chrome version must be between XX and YY."

When using the system chromedriver, set the correct path to it via a variable. For Fedora that would be: `TESTDRIVER_PATH=/usr/bin/chromedriver`.

#### Create and seed database

Create database tables and seed the initial data. New administrator password, initial organization, location and other needed resources will be created. Use the following environmental variables to customize the default values:

* SEED_ADMIN_USER
* SEED_ADMIN_PASSWORD
* SEED_ADMIN_FIRST_NAME
* SEED_ADMIN_LAST_NAME
* SEED_ADMIN_EMAIL
* SEED_ADMIN_LOCALE
* SEED_ADMIN_TIMEZONE
* SEED_ORGANIZATION
* SEED_LOCATION

```
bundle exec rake db:migrate
SEED_ADMIN_PASSWORD=changeme bundle exec rake db:seed
```

The seed process will print a random admin password that you need to remember or copy. If you want to set your own admin password:

```
bundle exec rake permissions:reset password=changeme
```

#### Start up Foreman

Start the Ruby on Rails and Webpack application servers:

```
bundle exec foreman start
```

Navigate to `https://centos7-katello-devel.$HOSTNAME.example.com` and login as `admin` with the password from the db:seed step earlier.

#### Running tests

To run the whole test suite:

```
bundle exec bin/rake test
```

To run a single test:

```
bundle exec bin/rake test TEST=test/functional/your_test.rb
```

Once done, stop any background processes with `bundle exec spring stop` ([more info](/handbook.html#UsingtheSpringpreloaderindevelopment))

#### Adding plugins

Foreman plugins are Ruby on Rails Engines and most of them have similar installation procedures. Make sure to read plugin documentation and README in the git repository for more details, but generally the procedure as follows:

```
cd foreman
cat >bundler.d/webhooks.local.rb <<EOF
gem "foreman_webhooks", path: "../foreman_webhooks/"
EOF

git clone https://github.com/theforeman/foreman_webhooks ../foreman_webhooks

bundle exec rake db:migrate
bundle exec rake db:seed
```

#### Foreman proxy (smart-proxy)

Installation and configuration of smart-proxy is pretty straight-forward:

```
git clone https://github.com/theforeman/smart-proxy
cd smart-proxy
cp config/settings.yml.example config/settings.yml
bundle install
```

By default, smart-proxy does not listen on any port and SSL is not configured, so uncomment the `http_port` configuration value:

```
grep http_port config/settings.yaml
:http_port: 8000
```

To elevate authorization for Foreman, either the remote IP address or DNS hostname, or both, must be in the `trusted_hosts` list. This depends on how your system connects to the proxy (IPv4 or IPv6) and also on how the remote IP address is reverse-resolved. The following list of trusted entries should do the trick:

```
grep -A10 trusted_hosts config/settings.yaml
:trusted_hosts:
- localhost
- localhost4
- localhost6
- 127.0.0.1
- ::1
- your_host_name
- your_host_name.with.full.domain.com
```

To start the smart proxy:

```
bundle exec bin/smart-proxy
```

Add the smart-proxy in the foreman user interface as `http://localhost:8000`.

##### SSL (optional)

To configure SSL, generate a CA cert, a server cert and a client cert with a common name listed in trusted hosts configuration. Assuming the following files:

* `ca.crt` - CA cert
* `server.{crt,pem,key}` - server SSL cert
* `client-localhost.{crt,pem,key}` - client SSL cert

Then configure Foreman (via Administer - Settings) as follows:

* SSL CA cert: `ca.pem`
* SSL cert: `client-localhost.pem`
* SSL key: `client-localhost.key`

And configure smart-proxy as:

```
grep ^:ssl config/settings.yml
:ssl_ca_file: "ca.pem"
:ssl_certificate: "server.pem"
:ssl_private_key: "server.key"

grep ^:https_port config/settings.yml
:https_port: 8443
```

Then you can add smart proxy in Foreman UI as `https://localhost:8443`.

#### Enabling proxy features and plugins

Smart proxy starts with almost no features enabled. Each feature must be individually configured. Most of the features (which are essentially build-in plugins) and external plugins (these live in separate git repositories) require some backend system configuration so this is out of scope for this guide.

Here is how you can enable a simple feature which requires no configuration or a backend system:

```
cd smart-proxy
cp config/settings.d/logs.yml.example config/settings.d/logs.yml
grep :enabled config/settings.d/logs.yml
:enabled: true
```

And here is how you can enable a simple (external) plugin without a backend system:

```
cd smart-proxy
grep shellhooks bundler.d/shellhooks.local.rb
gem "smart_proxy_shellhooks", path: "../smart_proxy_shellhooks/"

git clone https://github.com/theforeman/smart_proxy_shellhooks ../smart_proxy_shellhooks
cp ../smart_proxy_shellhooks/settings.d/shellhooks.yml.example \
  config/settings.d/shellhooks.yml
grep enabled config/settings.d/shellhooks.yml
:enabled: true
```

### Submitting Patches

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
