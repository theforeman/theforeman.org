---
layout: post
title: Debian Packaging, the Transparent way
date: '2012-11-01T20:17:00.000+02:00'
author: Greg Sutcliffe
tags:
- community
- debian
- packaging
modified_time: '2012-11-01T20:19:47.388+02:00'
blogger_id: tag:blogger.com,1999:blog-6789674575954398874.post-497357445063370416
blogger_orig_url: http://blog.theforeman.org/2012/11/debian-packaging-transparent-way.html
---
  
So I've been managing the Debian packages for about 8 months now, and
every so often I get asked if there's anything people can do to help. I
have to answer "Not really" because the way we're building the
Debian packages is somewhat arcane.  
  
At least, it was. This blog is to tell you all about how it's now much
more open.  
  
<!--more-->

### Packaging in the open

The first piece of the puzzle starts with our foreman-rpms repo
([github.com/theforeman/foreman-rpms](http://github.com/theforeman/foreman-rpms))  
in this repo we store all the packaging data for the foreman packages,
both deb and rpm. In the case of Debian, you'll see a structure like:  
  
    debian/&lt;distro&gt;/&lt;type&gt;/&lt;package&gt;  
  
For example, the foreman-proxy nightly package for squeeze is at:  
  
   
[debian/squeeze/nightly/foreman-proxy](https://github.com/theforeman/foreman-rpms/tree/master/debian/squeeze/nightly/foreman-proxy)  
  
Now, the eagle-eyed and quick-witted among you will already have thought
"That's quite a lot of code duplication". You're absolutely correct, but
this method allows us to package each distro in it's own way, if need
be. At the moment, it's all very similar, but it might not stay that
way. It also makes it trivial to add in more distributions later (say,
quantal or wheezy).  
  
So, now you know where our package data is, you'll want to know; how
does it get used? Well, here we turn to the king of automation -
Jenkins.  
  

### Jenkins

You can find our Jenkins server at
[ci.theforeman.org](http://ci.theforeman.org/). In there, you will find
a set of interesting packaging jobs, specifically:  
  
    packaging\_build\_foreman-proxy\_matrix  
    packaging\_build\_foreman\_matrix  
    packaging\_build\_foreman-proxy\_individual  
    packaging\_build\_foreman\_individual  
  
There's two types of jobs here. Let's start with the "individual" jobs.
These are what they sound like - they take a set of parameters about
what package the are building and build the required package(s). For
example, if I feed it the options  
  
    arch = 64bit  
    distro = squeeze  
    type = nightly  
  
Then it checks out the foreman-rpms repo, and changes to the appropriate
directory in the repo, according to those options. It then runs
'build.sh' found in the packaging directory, which uses
[Pbuilder](http://www.netfort.gr.jp/~dancer/software/pbuilder-doc/pbuilder-doc.html) to
build the package for the requested settings. At the end of the job (if
it built successfully) the package is uploaded to our Debian repository
at [deb.theforeman.org](http://deb.theforeman.org/)  
  
The matrix jobs, as you can guess, call the individual jobs many times
over - once for all the possible combinations of the options. Thus we
can have the matrix job track the Foreman git repo, and rebuild the
devel packages whenever a commit is made.  
  

### How to get involved

Now that things are more open, it's easy to get involved. Here's a
workflow you could  
use:  

#### 1. Get a build box

You don't have to go through the trouble we did of configuring pbuilder.
Just build a  
machine with the OS you'd like to run the packages on  

#### 2. Install basic packages

You'll need 'build-essential' and 'devscripts' as a minimum (well, on
Squeeze  
anyway :P)  

#### 3. Check out the repo

Fork the foreman-rpms repo and check it out to your buildbox. If you're
not trying  
to update an existing distro, copy the closest match to a new repo.  

#### 4. Build the package

You don't need to use 'build.sh' for this (that's crafted towards
pbuilder and other  
small automated task we need to do in the final packages). Just run
"debuild -us -uc"  
and see if it builds. If it doesn't either  
  a. Install the missing build-dependencies, or  
  b. Fix the broken packaging  

#### 5. Test

You can either test on your buildbox, or for best results, on another
machine with  
the same OS installed. Hopefully the package will install and work ;)  

#### 6. Contribute

Commit your changes to your repo and send us a pull request on
foreman-rpms. We'll  
test your changes and merge if it looks good.  
  

### Conclusion

Hopefully that demystifies our package building architecure a bit. If
nothing else,  
this blog serves to remind me how we set it all up when I can't remember
in six  
months time ;)  
  

### Epilogue

If anyone is interested in replicating the whole chain, you can get our
pbuilder  
puppet configuration from our infrstructure repo at
[github.com/theforeman/foreman-infra](http://github.com/theforeman/foreman-infra)  
  
This repo contains the puppet code we use to build the various parts of
our  
infrastructure, including the Debian build slaves for Jenkins. The only
thing you won't  
find there is the GPG key to sign the packages, for obvious reasons ;)
