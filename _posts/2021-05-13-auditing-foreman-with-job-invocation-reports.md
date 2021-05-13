---
layout: post
title: Auditing Foreman with Job Invocation Reports
date: 2021-05-14 10:55:06
author: Melanie Corr
tags:
- foreman
---

Over the last few years, the reporting capabilities in Foreman have gone from strength to strength. You can now use a wide range of report templates, and also customize or write your own templates to suit your needs. If you're new to reporting in Foreman and want to learn more, you can watch [@marek_hulan](https://community.theforeman.org/u/marek_hulan/summary) give an introduction and [deep dive](https://youtu.be/XTeNHMq_VxA) into the Foreman reporting engine.

<!--more-->

The latest feature to be added is the ability to generate a report for a job invocation. This feature is particularly useful if you are deploying hundreds, thousands, or tens of thousands of errata to hosts that you manage with Foreman. By generating job invocation reports, you can archive the results of every job outside of the Foremam database. These reports can then be further processed as you need for your own auditing requirements. 

With this feature, you can now generate a report by job ID. This is the ID of the Job Invocation itself. To make this as user-friendly as possible, a new **Create Report** button has been added to the to the Job Invocation page in the Foreman web UI. When you click this button, it automatically fills the report template with the job ID. Alternatively, you can use enter any job ID you want into a report.

If the particular job that you want to generate a report for is invoked on many hosts and if you want reports on only a subset of those hosts, in this same form, you can filter the lists of hosts that you generate reports for. You can filter hosts by a wide range of common criteria.

You can receive the output in several different formats. For example, if you select **CSV**, you receive a file in `.CSV` format. You can also select JSON, CSV, HTML, and YAML output. You can find example output of a CSV file from a remote execution job using Ansible [here](https://docs.google.com/spreadsheets/d/1oUJbEyO5CMzpNeqDQEe6P27eIZMGKfBnT55zK0sKQmw/edit?usp=sharing).

By default, the job invocation report contains the following output:

1. **Host** - The name of host
2. **Result** - The result of a task for each host. It's the same result as you see in the Foreman web UI. `success` or `failure` print to here.
3. **Type** - Type of output - stdout (Standard output), stderr (Standard error), stdebug (Standard debug).
4. **Message** - Any message from the executed program is collected here


If you need to collect more or different data, you're free to customize the Job Invocation Report to suit your exact requirements. To do so, you would need to clone the report and then add in your own customizations. If you do this, and think it might be a useful usecase for others, please add it to our [templates](https://github.com/theforeman/foreman/tree/develop/app/views/unattended/report_templates)!


For more information about generating reports in Foreman, check out our [docs](https://docs.theforeman.org/nightly/Managing_Hosts/index-foreman-el.html#using_report_templates). You can also watch [@dmatoulek](https://community.theforeman.org/u/dmatoulek) demo this on our last community demo:

<iframe width="560" height="315" src="https://www.youtube.com/embed/O-azZjKOraY?start=1094" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

Currently, you can try this feature in the Foreman nightly and 2.5 release candidates. Please check out our [release announcements page](https://community.theforeman.org/c/release-announcements/8) section of our community Discourse for more up-to-date information.

If you've tried this feature, or have any comments or questions, please let us know what you think!
