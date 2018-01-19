---
layout: post
title: Security of Foreman's templating endpoint
date: 2018-01-19  8:53:39
author: Foreman
tags:
- foreman
- satellite
- templates
---

Foreman has a powerful templating API that can be often leveraged in many ways. But in order to be able to use this endpoint, it is important to understand all concepts and limitations.

<!--more-->

Foreman template API lives at `/unattended` URL this endpoint is available both under HTTP and HTTPS protocols unlike rest of the application. Next element in the URL is template kind, for example to get "finish" template use `/unattended/finish` form. Typical examples of template kinds are provision, PXELinux, PXEGrub2, iPXE, finish, user_data or script. And finally, there are couple of possible options in the form of `?key=value` as we all know it.

First concept to understand is _build mode_. Templates can only be rendered when a host is in build mode. This is essential and first step in protecting sensitive data - templates can only be downloaded in short windows during operating system installation. When a host is in build mode, security _token_ (unique string, hard to guess) is generated and clock starts ticking 6 hours expiration time. This can be changed in Administer - Settings via option named Token duration, setting this value to zero disables tokens completely.

There is one global setting that enables accessing templates without build mode. It is called Access unattended without build. It's disabled by default.

To download any kind of template, use the token to access the contents: `/unattended/provision?token=XXX`. Foreman does not expose tokens via UI or API/CLI, the only way to read token is via PXELinux/Grub template preview or by accessing the database or via `foreman-rake console` command `Host.find().token`. When host is not found, unattended controller returns Not found (404) response.

Tokens are viable option for OS installers which support passing HTTP arguments. There is a fallback mechanism when tokens are disabled or for provisioning workflows not supporting it. First mechanism is X_RHN_PROVISIONING_MAC header which is automatically sent by Anaconda installer in Fedora or Red Hat compatible distributions. It is actually list of MAC addresses, Foreman tries to match this with MAC addresses of provisioning interfaces.

Second mechanism is similar, remote IP address is matched with provisioning interfaces of hosts. To use this technique, make sure the host requesting the data from Foreman has IP address of a host that must be matched. Keep in mind when behind NAT, this will not work.

For hosts behind NATs or in different unreachable subnets, Foreman provides Smart Proxy component with its Templates module. When enabled, it acts like a simple HTTP/HTTPS proxy and it also respects Anaconda HTTP header. Similarly to generic HTTP proxies, it also sets X_FORWARDED_FOR header which can be used to match client IP address from inaccessible subnets. To use this feature, set Remote Address global setting. It's a regular expression that must match remote IP address of Smart Proxy (do not use hostname).

There is one special way of getting templates which is called spoofing. When `?spoof=hostname` parameter is present, Foreman will search for host by name. This is used in template previews, but keep in mind unlike all other ways described above, this requires authorization, therefore expect redirect to login page if username and password are not set.

When a host finishes provisioning, there's special "call home" endpoint `/unattended/built` which uses the same API but it's not a template at all. This way, clients inform Foreman to exit build mode. Client IP address can optionally be updated as well when Update IP from built request global setting is set.

With this knowledge, it is possible to take advantage of Foreman's extensive ERB templating capabilities. We've seen primitive configuration management, post processing action or trivial remote execution via finish or script template kinds. The sky is the limit.
