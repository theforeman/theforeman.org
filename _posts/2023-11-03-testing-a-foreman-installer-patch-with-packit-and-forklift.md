---
layout: post
title: Testing a foreman-installer patch with Packit and forklift
date: 2023-11-03 11:41:32
author: Evgeni Golov
tags:
- foreman
- packit
---

Today I was working on a potential fix for the issue that [Puppetserver doesn't start when deployed with fapolicyd in enforcing mode](https://github.com/theforeman/foreman-fapolicyd/issues/7).

I knew that the potential fix is to set `PrivateTmp=true` in the systemd unit, so the [patch](https://github.com/theforeman/puppet-puppet/pull/892) was quickly written, but how would one verify it end to end?

<!--more-->

In Foreman, our releases (and nightlies!) are tested using [forklift](https://github.com/theforeman/foreman), a combination of [Vagrant](https://www.vagrantup.com/) for managing VMs and [Ansible](https://www.ansible.com/) for deploying Foreman in them and running [bats](https://github.com/bats-core/bats-core).

We can run the installation pipeline for Foreman nightly on CentOS Stream 8 like this:

```console
% ansible-playbook pipelines/install_pipeline.yml -e pipeline_os=centos8-stream -e pipeline_version=nightly -e pipeline_type=foreman
…
TASK [bats : Run bats] *************************************************************************************************************
changed: [pipe-foreman-server-nightly-centos8-stream] => (item=fb-verify-packages.bats)
changed: [pipe-foreman-server-nightly-centos8-stream] => (item=fb-test-foreman.bats)
changed: [pipe-foreman-server-nightly-centos8-stream] => (item=fb-test-puppet.bats)
changed: [pipe-foreman-server-nightly-centos8-stream] => (item=fb-test-backup.bats)
changed: [pipe-foreman-server-nightly-centos8-stream] => (item=fb-verify-selinux.bats)
…
PLAY RECAP *************************************************************************************************************************
localhost                  : ok=5    changed=2    unreachable=0    failed=0    skipped=5    rescued=0    ignored=0
pipe-foreman-server-nightly-centos8-stream : ok=62   changed=19   unreachable=0    failed=0    skipped=37   rescued=0    ignored=1
pipe-foreman-smoker-nightly-centos8-stream : ok=17   changed=12   unreachable=0    failed=0    skipped=3    rescued=0    ignored=0
```

As we see, the tests pass and everyone is happy.

We can destroy the setup again, and continue with our tasks:

```console
% ansible-playbook pipelines/install_pipeline.yml -e pipeline_os=centos8-stream -e pipeline_version=nightly -e pipeline_type=foreman -e forklift_state=destroy
```

The tests passed because we do not deploy fapolicyd by default as the integration is not yet fully ready.

To test the integration, there is a feature flag: [`foreman_fapolicyd`](https://github.com/theforeman/forklift/pull/1724) and if we enable it, the overall installation fails as expected:

```console
% ansible-playbook pipelines/install_pipeline.yml -e pipeline_os=centos8-stream -e pipeline_version=nightly -e pipeline_type=foreman -e foreman_fapolicyd=true
…
TASK [foreman_installer : Run installer] *******************************************************************************************
fatal: [pipe-foreman-server-nightly-centos8-stream]: FAILED! => changed=true
…
    Error 1: Puppet Service resource 'puppetserver' failed. Logs:
      /Service[puppetserver]
        Starting to evaluate the resource (993 of 1266)
        Skipping restart; service is not running
        Triggered 'refresh' from 2 events
        The container Class[Puppet::Server::Service] will propagate my refresh event
        Evaluated in 9.75 seconds
      /Stage[main]/Puppet::Server::Service/Service[puppetserver]/ensure
        change from 'stopped' to 'running' failed: Systemd start for puppetserver failed!
    journalctl log for puppetserver:
    -- Logs begin at Fri 2023-11-03 08:53:57 UTC, end at Fri 2023-11-03 09:01:28 UTC. --
    Nov 03 09:01:19 pipe-foreman-server-nightly-centos8-stream.tanso.example.com systemd[1]: Starting puppetserver Service...
    Nov 03 09:01:22 pipe-foreman-server-nightly-centos8-stream.tanso.example.com puppetserver[48125]: WARNING: abs already refers to: #'clojure.core/abs in namespace: medley.core, being replaced by: #'medley.core/abs
    Nov 03 09:01:28 pipe-foreman-server-nightly-centos8-stream.tanso.example.com puppetserver[48125]: Execution error (ClassNotFoundException) at java.net.URLClassLoader/findClass (URLClassLoader.java:387).
    Nov 03 09:01:28 pipe-foreman-server-nightly-centos8-stream.tanso.example.com puppetserver[48125]: org.jruby.ext.psych.PsychLibrary
    Nov 03 09:01:28 pipe-foreman-server-nightly-centos8-stream.tanso.example.com puppetserver[48125]: Full report at:
    Nov 03 09:01:28 pipe-foreman-server-nightly-centos8-stream.tanso.example.com puppetserver[48125]: /tmp/clojure-5697285534509071746.edn
    Nov 03 09:01:28 pipe-foreman-server-nightly-centos8-stream.tanso.example.com puppetserver[48098]: Background process 48125 exited before start had completed
    Nov 03 09:01:28 pipe-foreman-server-nightly-centos8-stream.tanso.example.com systemd[1]: puppetserver.service: Control process exited, code=exited status=1
    Nov 03 09:01:28 pipe-foreman-server-nightly-centos8-stream.tanso.example.com systemd[1]: puppetserver.service: Failed with result 'exit-code'.
    Nov 03 09:01:28 pipe-foreman-server-nightly-centos8-stream.tanso.example.com systemd[1]: Failed to start puppetserver Service.

    1 error was detected during installation.
    Please address the errors and re-run the installer to ensure the system is properly configured.
    Failing to do so is likely to result in broken functionality.

    The full log is at /var/log/foreman-installer/foreman.log
  stdout_lines: <omitted>

PLAY RECAP *************************************************************************************************************************
localhost                  : ok=5    changed=2    unreachable=0    failed=0    skipped=5    rescued=0    ignored=0
pipe-foreman-server-nightly-centos8-stream : ok=47   changed=12   unreachable=0    failed=1    skipped=28   rescued=0    ignored=1
```

Now that we know that we can reproduce the reported issue, let's try to deploy the fix and see if it *actually* fixes things.

The [patch](https://github.com/theforeman/puppet-puppet/pull/892) is against our Puppet module that is responsible for deploying the Puppetserver, but our installation procedure doesn't call Puppet directly, it uses `foreman-installer` which under the hood uses Puppet. So to test the fix we need to build `foreman-installer` with the patched module and deploy the result during the installation pipeline, before Ansible calls the installer.

This sounds tedious and error prone, but luckily we have [Packit](https://packit.dev/) integration in our `foreman-installer` repository and in `forklift`. That means that we need to create a [PR](https://github.com/theforeman/foreman-installer/pull/897) against the installer repository, temporarily pointing at the patched Puppet module and once Packit has built the package can [instruct `forklift` to use that Packit repository during deployment](https://theforeman.github.io/forklift/development/#packit-pr-builds), validating the fix:


```console
% ansible-playbook pipelines/install_pipeline.yml -e pipeline_os=centos8-stream -e pipeline_version=nightly -e pipeline_type=foreman -e foreman_fapolicyd=true -e '{"packit_prs":["theforeman/foreman-installer/897"]}'
…
TASK [packit : setup packit copr] **************************************************************************************************
changed: [pipe-foreman-server-nightly-centos8-stream] => (item=theforeman/foreman-installer/897)
…
TASK [bats : Run bats] *************************************************************************************************************
changed: [pipe-foreman-server-nightly-centos8-stream] => (item=fb-verify-packages.bats)
changed: [pipe-foreman-server-nightly-centos8-stream] => (item=fb-test-foreman.bats)
changed: [pipe-foreman-server-nightly-centos8-stream] => (item=fb-test-puppet.bats)
changed: [pipe-foreman-server-nightly-centos8-stream] => (item=fb-test-backup.bats)
changed: [pipe-foreman-server-nightly-centos8-stream] => (item=fb-verify-selinux.bats)
…
```

And this is the story of how I could validate the fix while drinking a coffee instead of thinking how to inject the manually built package at the right time into the automated installation test.
