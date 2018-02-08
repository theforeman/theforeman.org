---
layout: post
title: Upgrading from 1.6 to 1.7 - templates
date: 2017-05-02 12:34:34
author: Shim Shtein
tags:
- foreman
- upgrade
- templates
---

I was tasked with a mission to upgrade an already running Foreman 1.6 instance
to something more recent. Since the recommended way to upgrade is from one minor
to the next one, I have started with 1.6 to 1.7 upgrade. My first obstacle were
the provisioning templates.

<!--more-->

So after an upgrade try, I found out that our provisioning templates can no
longer work in 1.7 due to changes in host object. So now I needed to upgrade
those templates to something that will suit the new properties.
The problem is that we did some custom changes to those templates, and I want
to preserve them. So I needed a way to identify custom code from template's
base.

### Attempt 1

So my initial action plan was to compare templates from existing Foreman to
those from [github](https://github.com/theforeman/foreman/tree/1.6-stable/app/views/unattended)
and see how it goes.

I have started with an extraction script:

``` sh
wget --method GET -O templates.json  --header 'authorization: Basic XXX' 'https://actual_foreman.com/api/v2/config_templates/?per_page=200'

```

That returned me a list of all my templates (which is nice):

``` json
{
  "total":0,
  "subtotal":0,
  "page":1,
  "per_page":1,
  "search":null,
  "sort":{
    "by":null,
    "order":null
  },
  "results":[
    {
      "id":70,
      "name":"Alterator default",
      "template_kind_id":3,
      "template_kind_name":"provision",
      "snippet":false,
      "audit_comment":null,
      "created_at":"2015-07-05T13:49:38Z",
      "updated_at":"2015-07-05T13:49:38Z"
    }
  ]
}
```

For the snip, I have limited the results to a single template, the actual output
contained all templates that I had.

Now I was able to extract the templates to files using hammer command:

``` ruby
templates = JSON.parse(File.read('templates.json'))['results']

templates.map { |t| "cd ../hammer_cli; hammer template dump --id #{t['id']} > \"../lab_templates/#{t['name']}.txt\"" }.each { |cmd| system(cmd) }

```
I have hammer installed from git, this is why I needed to change directories. If
you install Foreman from packages, you probably won't need that.

Now I got nice list of files to compare:

```
$ ls ../lab_templates -l
total 340
-rw-rw-r--. 1 shim shim   521 Apr 26 21:21 'Alterator default finish.txt'
-rw-rw-r--. 1 shim shim   646 Apr 26 21:21 'Alterator default PXELinux.txt'
-rw-rw-r--. 1 shim shim  1673 Apr 26 21:21 'Alterator default.txt'
-rw-rw-r--. 1 shim shim   189 Apr 26 21:21 alterator_pkglist.txt
-rw-rw-r--. 1 shim shim   179 Apr 26 21:21 'AutoYaST default PXELinux.txt'
-rw-rw-r--. 1 shim shim  2444 Apr 26 21:21 'AutoYaST default.txt'
-rw-rw-r--. 1 shim shim  4791 Apr 26 21:21 'AutoYaST SLES default.txt'
-rw-rw-r--. 1 shim shim  3287 Apr 26 21:21 'Centos 7 kickstart.txt'
-rw-rw-r--. 1 shim shim   848 Apr 26 21:21 centos7-repo.txt
-rw-rw-r--. 1 shim shim  1650 Apr 26 21:21 change_eth0.txt
-rw-rw-r--. 1 shim shim   144 Apr 26 21:21 epel7.txt
-rw-rw-r--. 1 shim shim   644 Apr 26 21:21 epel.txt
-rw-rw-r--. 1 shim shim   333 Apr 26 21:21 fedora-repo.txt
-rw-rw-r--. 1 shim shim   431 Apr 26 21:21 fix_hosts.txt
-rw-rw-r--. 1 shim shim  1109 Apr 26 21:22 'FreeBSD (mfsBSD) finish.txt'
```

And here came the first problem: I could not find how to correlate names of
those templates to the names in github (unless I do header parsing manually).

### Attempt 2

Hmmmm, I need to make the extraction process for the baseline to be as close as
possible to the original process. OK, let's install Foreman 1.6 on my local
machine and run the same script against it:

``` sh
git checkout foreman-public/1.6-stable
rvm use ruby-1.9
bundle
rake db:migrate
rake db:seed
rails s
```

Failed miserably, since most of the gems don't work with Ruby < 2.0 and foreman
1.6 does not work with Ruby >= 2.0...

So I had to pin gems to a latest available version, which ended up as a pretty
[big diff](https://gist.github.com/ShimShtein/713c416e2d3d4bfa0e6912b9043204f4).

After pinning all versions, I was able to start my local empty instance and
extract templates from it.

Still without success. The template were different even in the header lines.

In the baseline:
``` HTML+ERB
<?xml version="1.0" encoding="UTF-8"?>
<%#
kind: provision
name: AutoYaST default
%>
```

In actual Foreman:

``` HTML+ERB
<?xml version="1.0" encoding="UTF-8"?>
<%#
kind: provision
name: Community AutoYaST
%>
```

### Attempt 3

Oh, yes, this is easily explained: our Foreman was not installed from scratch -
it was upgraded from 1.4!
We need to do the same to create a baseline. Fortunately, the version pins from
the previous attempt were enough for 1.4 too, so I have used the same patch to
pin gem versions. Now, after erasing my local DB, I can simulate the upgrade
process on my local Foreman:

``` sh
rvm use ruby-1.9
git checkout foreman-public/1.4-stable
git stash pop # I have stashed my diff, so applying versions pin.
bundle
rake db:migrate
rake db:seed
git stash
# Let's upgrade to 1.5
git checkout foreman-public/1.5-stable
git stash pop # I have stashed my diff, so applying versions pin.
bundle
rake db:migrate
rake db:seed
git stash
# And now finally to 1.6
git checkout foreman-public/1.6-stable
git stash pop # I have stashed my diff, so applying versions pin.
bundle
rake db:migrate
rake db:seed
rails s

```

And voila! The templates look quite similar. Now it's possible to compare the
templates and extract manual changes, so it would be possible to apply them
after migration.

### Summary

1. Extract templates using script from attempt 1
2. Create local foreman that mimics you real foreman upgrade path, as described
in attempt 3. Don't forget the
[versions pin](https://gist.github.com/ShimShtein/713c416e2d3d4bfa0e6912b9043204f4).
3. Run the script from step 1 with proper modifications (a different folder
would be nice, and of course the server name in hammer).

Now you should be able to diff between the folders, and detect manual changes
for templates.
