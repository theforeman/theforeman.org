---
layout: post
title: foremanctl 1.0 - deploying Foreman in Containers reaches first milestone
date: 2025-10-06  7:47:50
author: Archana Kumari
tags:
- foreman
- foremanctl
- containers
- quadlet
- podman
- systemd
- release
- katello
- pulp
---

Over the past few months, we’ve been working on a new way to deploy and manage Foreman and its components (like Katello, Candlepin, and Pulp) using **containers**.
Today, we’re happy to share that **foremanctl 1.0** has been tagged, marking our first milestone toward a fully containerized Foreman experience.

<!--more-->

### What You Can Do with 1.0

With this first release, you can already:

- Set up a basic Foreman + Katello environment using containers.
- Use an external database configuration.
- Manage services with systemd and Quadlet, making it easier to start, stop, and maintain the setup.

Under the hood, `foremanctl` generates **Podman Quadlet** units that integrate directly with **systemd**, providing a consistent and declarative way to run Foreman services as containers — without relying on traditional installer RPMs.

If you’d like to try it out, follow the updated [Quickstart Guide for 3.16](https://docs.theforeman.org/3.16/Quickstart/index-katello.html), which now includes step-by-step instructions for installing and running `foremanctl`. For detailed changes and improvements, see the [1.0.0 release notes](https://github.com/theforeman/foremanctl/releases/tag/1.0.0).

---

### What’s Still in Progress

This release is an important first step, but it’s not yet a full replacement for the traditional installer setup. We’re continuing to work on:

- Containerizing Smart Proxy  
- Adding support for managing plugins (currently static list)  
- Improving SELinux and networking integration  
- Extending system requirement checks and configuration flexibility  

> **Note:** Smart Proxy services (like REX, Ansible, and DNS/DHCP) are not yet available in the release.

You can follow progress and upcoming work items in the [foremanctl milestone 2.0 roadmap](https://github.com/theforeman/foremanctl/milestone/2).

Upcoming releases are expected to build on this foundation: **3.16** serving as an *alpha milestone*, **3.17** as *beta*, and **3.18** aimed to be a *GA-ready containerized deployment flow*.
(Please note that these plans reflect our current goals and may evolve as development continues.)

---

### Try It Out and Share Feedback

We’d love for you to experiment with [foremanctl](https://github.com/theforeman/foremanctl), try out the containerized setup, and tell us what works (and what doesn’t). Your feedback helps us smooth the rough edges and shape the next iterations.

Please share your experiences, questions, and feedback in the dedicated [foremanctl 1.0 feedback thread](https://community.theforeman.org/t/foremanctl-1-0-feedback-and-discussion/44669) on the [Foreman Community Forum](https://community.theforeman.org/).

You can also open issues directly in the [foremanctl repository](https://github.com/theforeman/foremanctl/issues) if you encounter specific bugs or setup problems.

**`foremanctl 1.0`** is our first tangible step toward running Foreman in a modern, containerized way.
By building on systemd and Podman Quadlet, we’re making deployments more flexible, maintainable, and easier to evolve — while keeping the same Foreman you know and rely on.

Big thanks to everyone testing, contributing, and providing feedback. This is just the start — and we’re excited to see where it goes from here! \o/
