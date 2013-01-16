---
layout: default
title: Contributing to Foreman
---

The Foreman is an open-source project that's licensed under the GNU Public License version 3. Contributions of all types are gladly accepted!

## Code-related contributions
These types of tasks generally require a familiarity with Ruby (on Rails) development or RPM/Debian packaging. If you are still new to Rails, community members can help you if you get stuck with something or have any other questions.

You will need to download a copy of the current development-code. [The
official code repository](https://github.com/theforeman) is located
on Github.

### Please note that there are two important branches:
* Master - latest stable release code
* Develop - new features and bug fixes

**Master is frozen between major releases.**

### Setup test environment for unit/functional test development
First, make sure you are a member of the [Foreman Developers](https://groups.google.com/forum/?fromgroups#!forum/foreman-dev) mailing list.

Patches to fix bugs or add new features are always appreciated. If you are going to work on a specific issue, make a note in the issue details so the developers will know what you're working on.

We try to keep a one commit per bug/feature policy, please try to create an issue which is specific for your patch details.

### Submit Patches
Please make sure there is a Redmine issue open for the change you are going to submit, as you will want to reference it in your commit message; this is very helpful when generating release notes.

1. Fork [theforeman/foreman](https://github.com/theforeman/foreman) to a personal github account. This will create a "foreman" repo under your Github username.
2. Clone the fork you just created to your development system: `git clone https://github.com/<username>/foreman.git`
3. Reference theforeman/foreman as upstream:

    * `cd foreman`
    * `git remote add upstream https://github.com/theforeman/foreman.git`
    * `git fetch upstream`

4. Create a feature/topic branch

    * `git checkout -b <branchName>` - Example: git checkout -b 1656-add_TB_support

5. Make changes and commit. Please reference the Redmine issue this commit addresses via "refs" or "fixes" #issueid in the commit message. 

    * `git add <modifiedFile(s)>; git commit -m 'fixes #<bug> <message>'`

6. Push topic branch to your fork:

    * `git push origin <branchName>` - Example: git push origin 1656-add_TB_support

7. [Issue a pull request](https://help.github.com/articles/using-pull-requests)

Once you have followed this process once, it becomes much simpler to add future patches!

### Merge upstream develop to local develop
* git fetch upstream
* git checkout develop
* git merge upstream/develop develop
* git push origin develop

Now follow step 5 to the end from above.

## Non-code related contributions
These don't require any software development experience, just some time and the desire to help.

### User support
Helping out other users in the "Forums" is always useful. Frequent problems or questions should be brought up so the wiki can be updated to help future users.

Testing is also *very* welcome, for any issue encountered, please open a bug / feature request.

### Issue triage
Sometimes issues are reported without all the information needed by a developer. Getting the details of the bug or feature from the reporter and the community will help everyone understand what is needed. Our issue tracker can be found here: http://wiki.theforeman.org/projects/foreman/issues

### Design and User interface
Foreman has a very basic design and user interface. Any improvements to it including new themes, skinning, or interface adjustments could help every user.
