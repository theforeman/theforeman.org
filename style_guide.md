---
layout: style_guide
title: Style Guide
---

## Style Guide

Please use to help guide your development when working on Foreman and it's related projects.

## Git Commit Messages

For Foreman and Katello, we ask that git commit messages are properly formatted and that they reference an issue in Redmine.

#### Format

Git commit messages should give a brief overview of the problem or feature along with a short
description of what was implemented to fix the bug or feature. Well formatted git commit messages
have two components: a short message and a long message or description.  The short message ought to
be limited to 70 characters while the long message should be wrapped at 74 or so characters.  See
below for an example. Also, you can read [Tim Pope's article about git message
formatting](http://tbaggery.com/2008/04/19/a-note-about-git-commit-messages.html).

#### Redmine

Each git commit message should contain a reference to the Redmine issue at the beginning of the
commit message. There are two way to do this. The first will simply attach the commit to the Redmine
issues:

```
Refs #123 - Improve performance of content views
```

The second type will actually close out the issue once the PR containing the commit gets merged:

```
Fixes #123 - Fix content view publish bug
```

#### Example

Below is an example of how a git commit message ought to look like:

```
Fixes #1234 - Fix content view yum publish bug

Fix a problem where content views were not being published if they
contained yum repositories. The repositories were not being referenced
correctly. To fix this, I changed the repository look up method to go to
ElasticSearch and find the attached repos.

This fix also addresses a problem with promoting that was also caused by
this bug. Promoting also has another bug though that needs to be fixed
before it works correctly.
```

#### Multi issue example

Below is an example of a pull request fixing multiple issues (pull requests should only fix a single issue in most cases)

```
Fixes #1234,#5678 - Fix content view yum publish bug

Fix a problem where content views were not being published if they
contained yum repositories. The repositories were not being referenced
correctly. To fix this, I changed the repository look up method to go to
ElasticSearch and find the attached repos.
```

## Javascript Code Conventions

This document contains conventions for programming Javascript that should be followed in an effort
to increase readability, performance and re-usability.  As builds are run against the
[JSLint Code Quality Tool](http://www.jslint.com/), an effort should be made to conform to the
guidelines set forth by JSLint.

### General
 * 4 spaces (instead of 2), no tabs
 * camelCase for variables
 * CamelCase for classes, and service names
 * Use empty lines to break up logical code chunks
 * Always use `===` for comparison
 * Place semicolons wherever they are required.  While missing semicolons may not throw an error,
   they can cause unintended behaviors.

### Javascript Libraries

A number of Javascript libraries are used within Katello.  Please refer to each libraries documentation.

  - [jQuery](http://api.jquery.com/)
  - [underscorejs](http://underscorejs.org/)
  - [AngularJS](https://angularjs.org/)

### Syntax Conventions

The following are coding conventions related to Javascript syntax in an effort to enhance
readability and adhere to the semantics of the language itself.

#### Conditional Statements

Include spaces around the argument of conditionals:

```javascript
if (condition) {
    // do something
}
```
