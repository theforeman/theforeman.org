---
layout: post
title:
date: 2018-04-10 14:44:32
author: Lukas Zapletal
tags:
- foreman
- discovery
---

The ideal workflow for discovery is PXE booting new hardware. When it's turned on, nodes are discovered and reboot or kexec into OS installer. Hosts can be reprovisioned by simply deleting from inventory which leads to default PXE entry - discovery. But life is not black or white, let's take a closer look on other scenarios - reprovisioning in PXE-less workflow.

<!--more-->

In PXE-less world, Foreman is no longer able to maintain PXE booting (menu) and users can easily run into a situation where a host is discovered when there's already an existing managed host for it. The recommended way is simply deleting the entry from Foreman's inventory prior to rebooting the host. However, this requires manual reboot, probably accessing the server's remote shell or console. Why not leverage Foreman Remote Execution plugin to initiate the reboot? This requires the host to be present in the inventory to be able to perform the task. Some users might prefer not deleting the host explicitly.

In Foreman 1.14 (Discovery 9.x) and older, it is possible to discover an existing (managed) server, the problem arises during provisioning. With default naming convention (macAABBCCDDEEFF) provisioning will fail with "Name already taken" error, obviously the host name must be different from the existing system. This can be changed during provisioning in edit form, or by providing unique hostname pattern using a random number for example in auto provisioning rule (recent version also allows to set own discovery naming pattern). Managed DHCP can also error out with "Unable to set DHCP entry: 409 Conflict" because MAC address DHCP reservation is already present. Obviously, this workflow can only work on unmanaged DHCP, DB or static IP address management. Having said that, changing the name and not using managed DHCP makes this possible and a new host appears next to the old one after successful provisioning.

At this point, it is important to understand that provisioning tokens (Administer - Settings - Provisioning - token_duration) are required for successful OS installation. When token_duration is set to 0, incoming template request is matched via MAC address reported by Anaconda for Red Hat installer or via remote IP address for other OS installers instead of unique token. There are possible issues with multiple MAC addresses (the host is picked randomly) or multiple IP addresses (when IPAM is not integrated with DHCP). Symptoms can be different, but overall the expected host would not leave build mode in this case. It is worth mentioning that rediscovering already discovered host just refreshes node's facts and works as expected. It always worked this way.

Starting from Foreman 1.15 (Discovery 9.0) [a patch](http://projects.theforeman.org/issues/16890) prevents from discovering a node that already exist as a managed host in the inventory with error "Host already exists as managed". It turns out that this created a regression for PXE-less workflows. Therefore for Discovery 12 [we are creating](https://github.com/theforeman/foreman_discovery/pull/422) an opt-in setting to have that functionality, but by default existing PXE-less users will no longer be affected by the change. Discovery of existing hosts will work again.
