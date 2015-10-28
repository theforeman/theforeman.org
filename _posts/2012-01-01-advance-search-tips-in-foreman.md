---
layout: post
title: Advance Search tips in Foreman
date: '2012-01-01T10:04:00.000+02:00'
author: Ohad Levy
tags:
- foreman
modified_time: '2012-02-01T15:53:30.015+02:00'
blogger_id: tag:blogger.com,1999:blog-6789674575954398874.post-4847405917653550482
blogger_orig_url: http://blog.theforeman.org/2012/01/advance-search-tips-in-foreman.html
---

Foreman uses the wonderful [scoped\_search gem written by Willem van
Bergen and Amos Benari](http://scopedsearch.wordpress.com/), and while
the search auto completer is pretty good, there are cases where it's
worth knowing about some of the extra features.

Foreman Search functionality can be used both in the web interface, and
via the API, in a follow up blog I'll describe how to use the API and
search via puppet directly as an alternative to storeconfigs -
UPDATED: [here](http://blog.theforeman.org/2012/01/getting-foreman-search-results-into.html)

<!--more-->

**Search Per Page**

First of all, each page gets its own search field, looking at page in
the host tab is not the same as in the reports tab, make sure you look
at the options the auto completer suggest.

**Bookmarks**

Foreman supports the ability to make search bookmarks, allows users to
quickly jump to predefined search conditions.

Once a bookmark is saved (make sure you save it via the bookmark icon
next to the search bar), it would appear as a drop down under the main
tab.

We provide a few bookmarks by default, you can try using them already by
clicking on the dropdowns in the main tabs, for example under hosts or
reports.

Bookmarks can be label as public, this would mean other users would see
them as well.

**Free text**

If you ignore the auto completer, and just type stuff, Foreman would try
searching for that attribute as free text across multiple fields.

for example, if you just typed <span
style="background-color: yellow;">12</span><span
style="background-color: white;"> in the hosts page, that would search
for all hosts with 12 in their ip address, mac address or maybe name, in
general we try to keep the fields we search for to a sane list for
performance reasons, if you know you are searching for an ip address,
you probably want to type </span><span
style="background-color: yellow;">ip ~ 12</span><span
style="background-color: white;">.</span>

**Case sensitivity**

When querying using <span style="background-color: yellow;">=</span> and
<span style="background-color: yellow;">!=</span><span
style="background-color: white;"> </span>the we are looking for an exact
match, the match is case sensitive. When running <span
style="background-color: yellow;">~</span> (like) and <span
style="background-color: yellow;">!~</span> (unlike) the match is case
insensitive.

**Using quotes**

In the search syntax white spaces are used as a delimiter. Here are some
examples of the way a query will be interpreted:

-   <span style="background-color: yellow;">description ~ “created
    successfully”</span> =&gt; list all notifications that contains
    “created successfully”
-   <span style="background-color: yellow;">description ~ created
    successfully</span> =&gt; list all notifications that contains
    “created” and at least one of it’s text fields contains
    “successfully”
-   <span style="background-color: yellow;">description !~ created
    successfully</span> =&gt; list all notifications
    that doesn't contains “created” and at least one of it’s text fields
    contains “successfully”

In the second and third example <span
style="background-color: yellow;">successfully</span> is an additional
term that is interpreted as a free text search

**Wildcard ‘<span style="background-color: yellow;">\_</span>’, ‘<span
style="background-color: yellow;">%</span>’ and ‘<span
style="background-color: yellow;">\*</span>’**

The search terms are translated to SQL queries. ~’ -&gt; LIKE ‘!~’ -&gt;
NOT LIKE

LIKE statement supports two wildcards ‘\_’ and ‘%’.

 ’\_’ is a wildcard for a single character replacement. For example the
search <span style="background-color: yellow;">name ~ fo\_</span> will
match both ‘foo’ and ‘for’.

The ‘%’ and ‘\*’ wildcard will replace any number of characters
including 0. For example the search <span
style="background-color: yellow;">name ~ corp%</span> will match both
‘corp’ and ‘corporation’. The more common ‘\*’ wildcard is not an SQL
wildcard but can be used in the search.

When the ‘like’ or ‘unlike’ search is processed, a ‘%’ wildcard is added
at the beginning and the end of a value if it isn’t there in the first
place.

For example: The search <span style="background-color: yellow;">name ~
foo</span> will become “name LIKE ‘%foo%’” The search <span
style="background-color: yellow;">name ~ foo%</span> will become “name
LIKE ‘foo%’”

**Date-time search query syntax**

We can handle many time and date formats, here are some examples of the
date and time formats that scoped\_search accepts:

“30 minutes ago” , ”1 hour ago” , ”2 hours ago”, Today, Yesterday

“3 weeks ago” , ”1 month ago” , ”6 days ago” , ”July 10,2011″

The date can have different separators, “10-July-2011″ is going to read
the same as “10/July/2010″ or “10 July 2011″

Month name could be the full name or a three letter abbreviation, Jan
will read the same as January.

Many other formats are also acceptable, however it is not recommended to
use ambiguous formats such as “3/4/2011″

The date time operators are ‘=’, ‘&lt;’ and ‘&gt;’ the operators should
be read as ‘at’, ‘before’ and ‘after’. This is how the search term
interpeted:

The right hand part of a date-time condition is parsed and translated
into a specific date-time, “<span style="background-color: yellow;">30
minutes ago</span>” is translated to “now – 30 minutes”.

<span style="background-color: yellow;">last\_report &gt; "2011-07-01
12:57:18 EDT</span>” should be read as created after this time.

Note that in the same way: <span
style="background-color: yellow;">last\_report &gt; “30 minutes
ago</span>”, should read “created after 30 minutes ago” not “created
more then 30 minutes ago”.

A search query like <span
style="background-color: yellow;">installed\_at = Yesterday</span> is
translated into a period query, it will be translated in run time to the
respective dates. For example, if running on Jan 1, it could be
translated into “(installed\_at &gt;= Jan 1,2012 00:00) and
(installed\_at &lt; Dec 31,2011 00:00)”.

**Searching for NULL values**

if you are searching for hosts without hostgroups, you could try:
<span style="background-color: yellow;">not has hostgroup</span>
