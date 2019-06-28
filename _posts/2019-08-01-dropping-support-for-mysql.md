---
layout: post
title: Dropping support for MySQL
date: 2019-09-04 16:30:00
author: Lukas Zapletal
tags:
- foreman
---

Foreman is essentially a Ruby on Rails application. A big one. And Ruby on
Rails applications usually support multiple relational databases thanks to
ActiveRecord stack. That's also the case for Foreman. But it's not that easy.

<!--more-->

Foreman currently requires one of the following databases:

* PostgreSQL 9.2 or newer
* MySQL 5.5 or newer

This is not an extensive list you might think. Supporting two databases must
not be that hard. Truth is, it's a challenge.

Those two items on the list are both relational database systems with SQL
standard, the problem is that very often behavior is different. Most of our
development team use PostgreSQL and there are dozens of things that are
different in MySQL. Therefore we need to identify those problems, find a way to
fix them and then carry extra bit of code in our codebase for life. This takes
a lot of our time we could invest in features, bugfixing or performance
improvements.

We have dicussed preferring PostgreSQL many times, but [the last time was
different](https://community.theforeman.org/t/minimum-rdbm-requirements/14127)
and we came to conclusion that dropping MySQL the right thing to do. [The
plan](https://community.theforeman.org/t/rfc-dropping-support-for-mysql/14185)
was then set and we are at the beginning of the journey where the first and
really difficult step is on you, our users:

**Foreman 1.24 will be the last version with MySQL support.**

The upcoming versions 1.23 and 1.24 will also send a notification to all
administrators in case it's running on MySQL. Don't worry, we will let you
close the warning as soon as you see it, but we want to communicate this
properly and in advance. We highly recommend to do the database migration to
PostgreSQL right after upgrade to version 1.23 because if there is a blocker
bug that prevents from migrating to MySQL, there is still a backup plan of
holding off migration and staying on MySQL for one more release until we come
up with a version which will be PostgreSQL only. This is important:

**Do not wait with the migration for Foreman 1.24.**

Along with the 1.23 release, we will provide official [migration
documentation](/manuals/1.23/index.html#3.7MigratingtoPostgreSQL), and
mention it in our Release Notes as well. If you do such testing, please come
back to us with time estimation so we can tell our users in advance what to
expect.

It was not easy decision, we tried hard in the past to support both databases.
If you search for [PRs containing
MySQL](https://github.com/theforeman/foreman/pulls?page=3&q=is%3Apr+mysql)
you'll find countless workarounds, fixes and endless discussions about how to
solve problems in a way that doesn't break for PostgreSQL users. There is one
common theme everywhere: most developers do not regularly use MySQL both for
development and for production testing. This is compounded by the fact that the
two commercial products based on Foreman, Red Hat Satellite and Atix
Orcharhino, only support PostgreSQL, and many of the Foreman developers are
employed by them. As none of their customers use MySQL, there is less testing
and usage of it leading to longer times until bugs are discovered and fixed.
Also, one of the biggest and most popular plugins, Katello, does not support
MySQL, so many community users are not using it either.

We also think that dropping MySQL support is big enough reason to bump the
major release version to 2.0. Chances are that PostgreSQL only version will not
be versioned 1.25 but 2.0. The final decision will be made before the release
process starts, but we wanted to let you know in advance.

We don't stop here, we already have ideas for more improvements we could do
once PostgreSQL is the only supported RDBM. For example:

* hash indexes to save disk space and memory
* macaddr, macaddr6, ip, ip6 types
* JSON/JSONB type
* data partitioning
* full text search
* stored procedures or functions
* other performance optimalizations

There are many ways we can make Foreman better and stronger. Maybe you have
your own ideas! We want feedback, visit us at https://community.theforeman.org
and drop a comment.
