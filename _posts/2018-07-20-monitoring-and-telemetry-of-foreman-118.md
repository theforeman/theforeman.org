---
layout: post
title: Monitoring and telemetry of Foreman 1.18
date: 2018-07-20 13:26:15
author:
  name: Lukáš Zapletal
  uri: lzap
tags:
- foreman
- telemetry
---

Performance Co-Pilot (PCP) is an open source framework and toolkit for monitoring and analyzing live and historical system performance. It provides high-resolution live monitoring from local or remote hosts (with optional auto-discovery) and instrumented software. PCP can be integrated with monitoring solutions like Graphite (Carbon/Whisper), InfluxDB, Zabbix or Nagios, or configured to store historical data into archive files which is a unique feature we want to take advantage from.

PCP follows UNIX tradition by providing a relatively large collection of small utilities which do their job well. There are several APIs available to write collecting agents called PMDAs or to instrument existing applications to gather "telemetry" data. APIs are available mostly in C, Python and Perl out of box with extra wrappers or native libraries in Java, Rust and Golang. PCP is a compact package (under one megabyte) with minimum dependencies and part of standard RHEL7 base repositories.


The article covers PCP installation, basic operating system monitoring configuration with extra monitoring of key processes and PostgreSQL and Apache httpd. It also shows how to setup Foreman Ruby on Rails monitoring to read internal metrics from Foreman 1.18 core application. Major areas covered:

- basic system monitoring (load, memory, IO)
- hot processes (memory and cpu utilization)
- Apache httpd monitoring
- PostgreSQL monitoring
- Foreman Rails application instrumentation
- all relevant metrics archival for retrospective troubleshooting

Second part of the article covers analysis of results using PCP CLI and web UI tools and retrospective analysis.

<!--more-->

If you'd like to watch a video of this process, you can view that [on YouTube](https://youtu.be/Zgg6Ta5tO9A)

The article assumes a Red Hat based distro (Centos etc), version 7.6+. It will likely work for older versions, or other distros such as Debian, with appropriate changes to the paths (e.g. where the Apache config files are located, etc.). Due to a [known bug](https://bugzilla.redhat.com/show_bug.cgi?id=1586051) PCP 4.1+ is recommended.

The following packages needs to be installed and enabled:

    yum -y install pcp pcp-pmda-apache pcp-pmda-postgresql

Make sure there is enough space for `/var/log/pcp`. Our testing showed about 100-500 MB per archive file (per day) but on busy servers this can go up to several gigabytes per day. Default PCP retention policy is to keep 14 days of compressed archives, the article shows how to change this setting below. We recommend at least 20 GB of free space and continuous monitoring for the first few weeks.

By default, PCP collects basic system metrics but not all processes, to get memory information from key processes let's configure hotproc monitoring which will include CPU time spent, RSS, swap and virtual memory, file descriptors opened and bytes read and written:

    cat >/var/lib/pcp/pmdas/proc/hotproc.conf <<EOF
    #pmdahotproc
    Version 1.0

    fname == "java" ||
    fname ~ /(qdrouterd|qpidd)/ ||
    (fname == "postgres" && psargs ~ /-D/) ||
    fname == "mongod" ||
    fname ~ /^dynflow/ ||
    psargs ~ /Passenger RackApp/ ||
    fname ~ /^wsgi:pulp/ ||
    psargs ~ /celery (beat|worker)/ ||
    psargs ~ /pulp_streamer/ ||
    psargs ~ /smart-proxy/ ||
    psargs ~ /squid.conf/
    EOF

In the next step, we will make sure those metrics also gets logged into archive files.

    mkdir -p /var/lib/pcp/config/pmlogconf/foreman-hotproc
    cat >/var/lib/pcp/config/pmlogconf/foreman-hotproc/summary << EOF
    #pmlogconf-setup 2.0
    ident   foreman hotproc metrics
    probe   hotproc.control.config != "" ? include : exclude
            hotproc.psinfo.psargs
            hotproc.psinfo.cnswap
            hotproc.psinfo.nswap
            hotproc.psinfo.rss
            hotproc.psinfo.vsize
            hotproc.psinfo.cstime
            hotproc.psinfo.cutime
            hotproc.psinfo.stime
            hotproc.psinfo.utime
            hotproc.io.write_bytes
            hotproc.io.read_bytes
            hotproc.schedstat.cpu_time
            hotproc.fd.count
    EOF

Enable proc agent to collection more per-process details.

    cd /var/lib/pcp/pmdas/proc
    ./Install

The above configuration only stores interesting process data, it does not archive any details from Apache or PostgreSQL agents. Use `pminfo` to list all available metrics and add those to the summary configuration file when needed.

Apache agent collects basic information from Apache, but it needs the `mod_status` plugin to be enabled in Apache (which requires restart of the service). PostgreSQL agent gets basic information about SQL server health, it does not need any restart to be enabled.

    cd /var/lib/pcp/pmdas/apache
    ./Install
    cd /var/lib/pcp/pmdas/postgresql
    ./Install

For Apache PMDA to work, extended status Apache module must be loaded. Only perform this if you installed the apache PMDA above:

    cat >/etc/httpd/conf.d/01-status.conf <<EOF
    ExtendedStatus On
    LoadModule status_module modules/mod_status.so

    <Location "/server-status">
    PassengerEnabled off
    SetHandler server-status
    Order deny,allow
    Deny from all
    Allow from localhost
    </Location>
    EOF

Foreman installer (Puppet) will delete this file, to prevent this from happening add the following line into `/etc/foreman-installer/custom-hiera.yaml`:

    apache::purge_configs: false

Restart of Apache is needed for this, again this can be skipped if Apache PMDA is not being installed.

    systemctl restart httpd pmcd pmlogger

Foreman Rails application provides telemetry data via two endpoints - prometheus and statsd. The former one can be only used in single process environment at the moment, in our case we will configure Rails workers to send metrics via statsd protocol into pcp-mmvstatsd daemon which will provide aggregation and export into PCP MMV API. Monitoring will work the following way:

    pmcd -> pmda-mmv -> memory mapped file <- pcp-mmvstatsd <- PassengerWorker(s)

Install required packages:

    yum -y install foreman-telemetry pcp-mmvstatsd

Enable telemetry support in Foreman settings file /etc/foreman/settings.yaml:

    :telemetry:
      :prefix: 'fm_rails'
      :statsd:
        :enabled: true
        :host: '127.0.0.1:8125'
        :protocol: 'statsd'
      :prometheus:
        :enabled: false
      :logger:
        :enabled: false
        :level: 'INFO'

Keep other exporters (prometheus, logger) disabled and note the port is 8125. Do not use host names in the host setting, make sure it's set to localhost via IP address 127.0.0.1 for optimal performance. Starting from Foreman 1.19, foreman-installer is getting puppet parameters and CLI options for setting up all options in the settings.yaml file.

Enable and start the statsd aggregation service:

    systemctl enable pcp-mmvstatsd pmcd pmlogger
    systemctl start pcp-mmvstatsd

Apache httpd (Passenger) may now be restarted to reload Foreman new configuration - at this point, telemetry data is started to be collected.

    systemctl restart httpd

Note the pcp-mmvstatsd daemon listens on all interfaces by default, this can be further hardened via /etc/default/pcp-mmvstatsd or via firewall.

Dynamic metrics won't appear automatically in archive files until pmlogger is told to start logging them. This can be performed daily, it's a fast operation. We recommend to run this on a daily basis:

    cat >/etc/cron.daily/refresh_mmv <<EOF
    #!/bin/bash
    echo "log mandatory on 1 minute mmv" | /usr/bin/pmlc -P
    EOF
    chmod +x /etc/cron.daily/refresh_mmv

## User interface and exporting options

Metrics can now be listed via `pminfo` command. Along with other system metrics like CPU, memory, kernel, xfs, disk or network, there are the following metrics which were configured above:

- `hotproc.*` - basic metrics of key processes configured above
- `apache.*` - apache httpd server metrics (if configured)
- `postgresql.*` - basic postgresql statistics (if configured)
- `mmv.fm_rails_*` - Foreman Rails metrics

Optionally, to get lists of metrics reported from Rails with descriptions:

    foreman-rake telemetry:metrics

Resulting table markdown-formatted, here is the result:

| Metric name | Labels | Type | Description |
| ----------- | ------ | ---- | ----------- |
| fm_rails_activerecord_instances | class | counter | Number of instances of ActiveRecord models |
| fm_rails_bruteforce_locked_ui_logins |  | counter | Number of blocked logins via bruteforce protection |
| fm_rails_failed_ui_logins |  | counter | Number of failed logins in total |
| fm_rails_http_request_db_duration | controller,action | histogram | Time spent in database for a request |
| fm_rails_http_request_total_duration | controller,action | histogram | Total duration of controller action |
| fm_rails_http_request_view_duration | controller,action | histogram | Time spent in view for a request |
| fm_rails_http_requests | controller,action | counter | A counter of HTTP requests made |
| fm_rails_importer_facts_count_input | type | counter | Number of facts before imports starts per importer type |
| fm_rails_importer_facts_count_interfaces | type | counter | Number of changed interfaces per importer type |
| fm_rails_importer_facts_count_processed | type,action | counter | Number of facts processed per importer type |
| fm_rails_importer_facts_import_duration | type | histogram | Duration of fact import (ms) per importer type |
| fm_rails_importer_facts_populate_duration | type | histogram | Duration of fields population (ms) per importer type |
| fm_rails_proxy_api_duration | method | histogram | Time spent waiting for Proxy (ms) |
| fm_rails_proxy_api_response_code | code | counter | Number of Proxy API responses per HTTP code |
| fm_rails_ruby_gc_allocated_objects | controller,action | counter | Ruby GC statistics per req (total_allocated_objects) |
| fm_rails_ruby_gc_count | controller,action | counter | Ruby GC statistics per request (count) |
| fm_rails_ruby_gc_freed_objects | controller,action | counter | Ruby GC statistics per request (total_freed_objects) |
| fm_rails_ruby_gc_major_count | controller,action | counter | Ruby GC statistics per request (major_gc_count) |
| fm_rails_ruby_gc_minor_count | controller,action | counter | Ruby GC statistics per request (minor_gc_count) |
| fm_rails_successful_ui_logins |  | counter | Number of successful logins in total |

There are three types of metrics reported by Rails (this only applies to mmv.\* metrics):

- counter - increasing counter, PCP converts this to rate (hits per second)
- gauge - value observation
- duration - approximation of time spent using HDR histogram algorithm with instances: mean, min, max, variance and standard_deviation

Use PCP tools to monitor deployment live or offline via recorded archive files. A couple of examples now follow. To see instance creation rate of ActiveRecord object User at rate of instancer per second (counter metric):

    pmval mmv.fm_rails_activerecord_instances.User

To see minimum, maximum and average (mean) total duration of dashboard controller index action (duration metric):

    pmval mmv.fm_rails_http_request_total_duration.dashboard_controller.index

To access remotely, a port needs to be opened:

    firewall-cmd --add-port=44321/tcp
    firewall-cmd --permanent --add-port=44321/tcp

Then connect remotely (no authorization by default - SSL or password can be set):

    pminfo -h remote.host.example.com

There are several existing web apps available for PCP to monitor live or archived data using standard web browser: Grafana and Vector. Although PCP core application is in base repository, the web applications are in "optional" repository:

    subscription-manager repos --enable rhel-7-server-optional-rpms
    yum -y install pcp-webapi pcp-webapp-grafana pcp-webapp-vector
    systemctl start pmwebd
    systemctl enable pmwebd
    firewall-cmd --add-port=44323/tcp
    firewall-cmd --permanent --add-port=44323/tcp

To access the applications, visit the following URLs:

- http://foreman:44323/grafana
- http://foreman:44323/vector

All three applications are static JavaScript only apps accessing PCP archival data via a web API - it will only show metrics which are configured to be archived via pmlogger. Beware, Foreman sets HTST flag which forces browsers to HTTPS which is not supported by the built in PCP web server. To workaround that, use different browser or make a DNS alias in order to access those web apps.

Vector app connect to PCP daemon directly and only shows live data while Grafana app reads archive files and shows historical data up to one year back. For this reason, there is a slight lag of several minutes until values appear in Grafana. Dynamic metrics (MMV) will not appear in archives until refresh_mmv cron job mentioned above is executed.

PCP data can be exported into external Graphite, InfluxDB or Zabbix applications, consult RHEL and PCP.IO documentation on how to configure that (packages named pcp-export-pcp2graphite, pcp-export-pcp2influxdb and pcp-export-zabbix-agent).

There is a powerful engine called pmie for taking actions on various events (e.g. process is utilizing CPU or memory too much). This can be used to send e-mails or trigger events (e.g. restart process). Read more about it in the PCP documentation (man pmie).

Collector daemon and all agents are logging into individual files, check those for errors. Note these log files are not archives of metric data, these are text files where you can find possible configuration errors or warnings:

    tail /var/log/pcp/pmcd/*.log

Logging daemon also has its own log file:

    less /var/log/pcp/pmlogger/$(hostname)/pmlogger.log

Let's summarize all key daemons which were configured so far:

    systemctl status pmcd pmlogger pcp-mmvstatsd pmwebd

These are:

- pmcd - collector daemon
- pmlogger - archiving daemon
- pcp-mmvstatsd - statsd to MMV PCP aggregator
- pmwebd - web API with Grafana/Vector (optional)

The rest of the article introduces PCP and its tools in more detail.

## Introduction to PCP and its tools

By default, the PCP pmcd daemon collects a reasonable number of system metrics (load, memory, processes, I/O, XFS). Other collector agents (also called PMDAs) can be installed as separate packages. The default probing rate is one second for live monitoring, but when no client utility is connected pmcd idles in the background and consumes effectively no resources.

When pmlogger daemon is running, the most important metrics are being archived into /var/log/pcp directory, for each day new archive file is created and old files are rotated. One day archive is roughly 25 MB in size (uncompressed data) with most metrics being sampled at one minute interval by default. By default PCP compresses the data and rotates archives every two weeks, highly loaded servers may consume up to 10 GB of historical data.

To display PCP version, list of enabled agents and active logging archive:

    pcp

To display all currently available metrics from the current host:

    pminfo

All metrics are stored in a tree-like structure, to view available metrics under specific subtree, let's say all network related information, provide node on the command line:

    pminfo network

Each metric can be either a single value or a list of values called instances. Kernel load is typical example of metric with three instances (1, 5 and 15 minute average load). To display detailed information about a metric including its types and instances:

    pminfo -dfmtT kernel.all.load

Unique feature of PCP is metric metadata, extra information which is available for every metric. This includes expected things like description or data type, but also units and dimensions. This metadata allows one to correctly display data or create correct graphs combining various metrics together. For example, network interface speed has a unit of megabytes per second:

    pminfo -dfmtT network.interface.speed

A counter is monotonic increasing or decreasing integer. Thanks to the metadata, PCP can even convert counter values into rates. To monitor live disk write operations per partition using fixed point notation as a rate (operations per second):

    pmval -f 1 disk.partitions.write

To see raw counter values instead of rates:

    pmval -r disk.partitions.write

Process data is captured by the proc PMDA (installed and enabled by default). Process ID is the instance name in this case. To monitor the number of open file descriptors of the process with PID 1 every two seconds:

    pmval -t 2sec 'proc.fd.count[1]'

Let's take a look on other utilities from the additional package called pcp-system-tools. Monitor system metrics in a top-like window:

    yum -y install pcp-system-tools
    pcp atop

Monitor CPU-related system metrics and memory in a sar-like (System Activity Report) manner:

    pcp atopsar -cm

Monitor system metrics in a sar-like fashion with two second interval:

    pmstat -t 2sec

Monitor system metrics in an iostat-like fashion with two second interval:

    pmiostat -t 2sec

Most of these tools operate on archives too, which is a unique feature. It is so easy to "go back in time" and inspect a system with pmstat-like or iostat-like experience easily. The key argument to remember is --archive or -a:

    pmstat -a /var/log/pcp/pmlogger/$(hostname)/20180503.08.58
    pcp atop --archive /var/log/pcp/pmlogger/$(hostname)/20180503.08.58

Another interesting feature leveraged for monitoring of Foreman servers is “hotproc”, or hot processes monitoring. In short, it is possible to set up rules to start monitoring some processes in greater detail. The conditions can be as simple as "all java applications" or "all processes consuming more than 2 GB of memory". There is a configuration file to store these rules, but it is also possible to enable these on the fly without restarting the PCP daemon:

    pmstore hotproc.control.config 'fname == "java"'
    pminfo -f hotproc

Hot process monitoring and logging into archives are flexible features of PCP. An example configuration below starts watching of all java applications running on the server and storing one key metric in archives (RSS memory):

    cat >/var/lib/pcp/pmdas/proc/hotproc.conf <EOF
    #pmdahotproc
    Version 1.0
    fname == "java"
    EOF

    mkdir -p /var/lib/pcp/config/pmlogconf/my-hotproc
    cat >/var/lib/pcp/config/pmlogconf/my-hotproc/summary << EOF
    #pmlogconf-setup 2.0
    ident   my-hotproc metrics
    probe   hotproc.control.config != "" ? include : exclude
            hotproc.psinfo.rss
    EOF

    systemctl restart pmcd pmlogger

To see a list of currently archived metrics, do:

    less /var/log/pcp/pmlogger/$(hostname)/pmlogger.log

The log file also contains estimation on size, in the example above it is around 13 megabytes per day of uncompressed data. To identify currently active archive file, simply start command "pcp" which also shows other interesting information like number of CPUs, memory, pcp version and timezone.

There is a low-level control utility for pmlogger that can interactively query current status or change what should be logged:

    echo status | pmlc -P
    echo "query mmv" | pmlc -P

### Logging interval, retention and compression

The default logging (sampling) interval is 60 seconds. This interval was chosen as a balance between logging volume and the level of detail needed for long term monitoring. To change that setting, edit /etc/pcp/pmlogger/control.d/local and append -t XXs to the line for LOCALHOSTNAME, and restart the pmlogger service.

The default retention policy is to keep archives for the last 14 days, compressing archives older than one day with xz. To change these settings, edit /etc/cron.d/pcp-pmlogger file and use -x and -k options. For example, "-x 4 -k 7" options on the first line will compress archives after 4 days and delete after 7 days.

### Retrospective Performance Analysis

PCP archive logs are located under /var/log/pcp/pmlogger/$(hostname) and they can be easily transferred for offline inspection. A simple utility which is able to dump raw data from archives is available. To check the host and the time period an archive covers:

    AVE=/var/log/pcp/pmlogger/$(hostname)/20170918.13.59
    pmdumplog -l $AVE

Check PCP configuration at the time when an archive was created:

    pcp -a $AVE

Display all enabled performance metrics at the time when an archive was created:

    pminfo -a $AVE

Display detailed information about a performance metric at the time when an archive was created:

    pminfo -a $AVE -df mem.freemem

Dump past disk write operations per partition in an archive using fixed point notation:

    pmval -a $AVE -f1 disk.partitions.write

Dump RSS memory consumed by two particular processes configured via hotproc above (the PIDs will be likely different):

    pmval -a $AVE hotproc.psinfo.rss -i 000768 -i 000977

Replay past disk write operations per partition in an archive with two second interval using fixed point notation between 14:00 and 14:15:

    pmval -a $AVE -d -t 2sec -f 3 disk.partitions.write -S @14:00 -T @14:15

Print subnet controller index action average total processing time with number of instances created for Subnet and Setting models and total number of Ruby allocation objects for the same controller and action (all on one line)

    pmrep mmv.statsd.fm_rails_http_request_total_duration.subnets_controller.index mmv.statsd.fm_rails_activerecord_instances.Subnet mmv.statsd.fm_rails_activerecord_instances.Setting mmv.statsd.fm_rails_ruby_gc_allocated_objects.subnets_controller.index

Calculate average values of performance metrics in a time interval using tabular formatting including the time of minimum/maximum value and the actual minimum/maximum value:

    pmlogsummary -HlfiImM -S @14:00 -T @14:30 $AVE disk.partitions.write mem.freemem

Replay past system metrics in an archive in a top-like window starting at 2 PM:

    pcp -a $AVE -S @14:00 atop

Most of the PCP utilities supports -a (--archive) option, including pmstat, pmiostat or pmchart, an interactive GUI application written in QT with plotting capabilities. A REST API exposing live or historical data can be installed for integration with other applications.

The utility atop also supports hot processes via an explicit option which is very handy back-in-time top-like experience:

    pcp -a $AVE -S @14:00 atop --hotproc

One important command can deliver quick calculation of average, min and max values:

    pmlogsummary archive_name

The pmdiff utility uses pmlogsummary to compare archives or time windows of interest, and reports those metric whose values have changed the most in the times being compared.

PCP ships with a powerful GUI utility for plotting live or offline graphs called pmchart. It works under Linux and MacOS.

We have just scratched the surface, PCP offers derived metrics via simple arithmetics, PMIE (metrics inference engine) for alerting (sending emails or executing arbitrary commands), application instrumentation and tracing APIs. For more information, use the official RHEL or PCP documentation.

- https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/performance_tuning_guide/sect-red_hat_enterprise_linux-performance_tuning_guide-performance_monitoring_tools-performance_co_pilot_pcp
- https://access.redhat.com/articles/1145953
- http://pcp.io/docs/guide.html
- https://access.redhat.com/articles/2450251
- https://access.redhat.com/videos/898313
