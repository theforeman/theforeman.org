---
layout: plugin
title: Foreman Statistics 1.0 Manual
version: 1.0
# uncomment for older versions than stable or nightly
#robots: noindex
---

<div class="bs-callout-warning bs-callout">
  <h4>This is a Work in progress</h4>
  Plugin will be available only in the next major release!
</div>

# 1. {{ page.title }}

This plugin enables Foreman to show a nice statistics dashboard and create Trend charts.


## 1.1 Compatibility

The plugin is compatible with all platforms supported by Foreman.
Until Foreman version 2.1 the Trends and statistics were part of the core project,
so this plugin has only value with Foreman 2.2 onwards.

# 2. Installation

## 2.1 Plugin Installation

### Foreman Installer

You can install the plugin using foreman-installer like this

    foreman-installer --enable-foreman-plugin-statistics

The installer will install the package and setup the foreman_statistics service which allows background processing of tasks.

### Manual Installation

In case you want to install the package manually on an existing Foreman, use the following steps.

Install the packages appropriate for your operating system:

RPM:

    yum install tfm-rubygem-foreman-statistics

DEB:

    apt-get install ruby-foreman-statistics

# 3. User guide

## 3.1 Trends

Trends in Foreman allow you to track changes in your infrastructure over time. It allows you to track both Foreman related information and any puppet facts. The Trend pages give a graph of how the number of hosts with that value have changed over time, and the current hosts list.

There are two pieces to the Trends area, the Trends to track and their corresponding counters. To define trend counters, use the "Add Trend Counter" button on the '/trends' page. Optionally set the "Name" field to over-ride odd puppet fact names to be more readable. Once created you can optionally 'Edit' the Trend to change the display names of the underlying values.

Next, to start collecting trend data, set a cron job to execute 'foreman-rake trends:counter'. Each time the rake task executes it will create 1 tick on the graphs, so you can fine tune the granularity with your cron job. We recommend using the same as your puppet run interval (30 minutes). Here's an example to run once per hour:

{% highlight sh %}
0 * * * * /usr/sbin/foreman-rake trends:counter
{% endhighlight %}

Finally note that these trends are the same for all users. So if you delete a Trend category you will loose all history for that trend and the trackers will start all over again. So please be careful when deleting.
