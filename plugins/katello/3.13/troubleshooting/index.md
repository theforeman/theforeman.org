---
title: Troubleshooting
---

# Katello Troubleshooting

For general support information, see [here](/support.html).

## Table of Contents

 * [Sub-service Status](/plugins/katello/{{ page.version }}/troubleshooting/index.html#sub-service-status)
 * [Tasks](/plugins/katello/{{ page.version }}/troubleshooting/index.html#tasks)
 * [Debug Certificate](/plugins/katello/{{ page.version }}/troubleshooting/index.html#debug-certificate)
 * [FAQ](/plugins/katello/{{ page.version }}/troubleshooting/index.html#frequently-asked-questions)

## Sub-services status

Katello uses a set of back-end services to perform the actual job. The status of these services can negatively influence the whole system and it's one of the first things to check when some errors occur.

The status of back-end services can be found either from the Web UI on the `/about` page:

![Backend systems status](/plugins/katello/{{ page.version }}/troubleshooting/backend-systems-status.png)

Alternatively, the `hammer ping` command can be used to get this information.

`foreman-maintain` tool can be used to restart Katello related services. See `foreman-maintain --help` for more details.

## Tasks

Katello uses [Foreman Tasks](https://github.com/theforeman/foreman-tasks) for orchestration between the underlying services (local database, Pulp, Candlepin…). The tasks are modeled as [Dynflow](https://github.com/Dynflow/dynflow) processes. When something goes wrong (and there might be many reasons for this happening), Dynflow gives us the tools to recover from these errors to get to the consistent state.

### Health checking

There are two properties used for identifying issues with a task:

- **state** - what phase of execution is the task in, possible values are:
  - **planning** - the planning phase of the task is performed: the operations performed in this phase shouldn't modify anything outside Katello's database. The execution of this phase happens in the web-process thread and usually should not take more than few seconds
  - **planned** - the planning phase finished and the task is waiting for the executor process (`foreman-tasks service`) to pick it up
  - **running** - the executor is performing the orchestration action, modifying the state of external services to converge to the final state
  - **paused** - something went wrong during running the task and it's waiting for the resolution (further details below)
  - **stopped** - the execution of the task finished (the success is determined by the **result** value)
  - **result** - how the task ended up (or is going to end up if we already know it)
  - **pending** - task is in the process of executing
  - **success** - no errors occurred during the execution
  - **error** - unresolved errors occurred during the execution
  - **warning** - there were errors during the execution, but they did not prevent the task from finishing or were skipped manually (further details below).

To see all the tasks in the system, one can go to ``/foreman_tasks/tasks`` page. To see all the tasks that failed, one can search on `result = error`:

![Failed tasks](/plugins/katello/{{ page.version }}/troubleshooting/tasks-result-error.png)

Failed tasks include those in the 'stopped' or 'paused' state. The stopped tasks are already considered as resolved, there is no risk of inconsistency. The tasks in the 'stopped' state and the 'error' result are usually those failed during the planning phase (usually locking error or bad input data).

To see all the tasks requiring further assistance, filter on ``state = paused``:

![Paused tasks](/plugins/katello/{{ page.version }}/troubleshooting/tasks-state-paused.png)

### Dealing with paused task

Once the paused task is identified, one can investigate the problem causing the errors:

![Task error details](/plugins/katello/{{ page.version }}/troubleshooting/task-error-details.png)

The resolution of the problem is dependent on the error details. The task may be resolvable by resuming the task: make sure the sub-services are running (see [Sub-services status](/plugins/katello/{{ page.version }}/troubleshooting/index.html#sub-services-status) for more details) and then click 'Resume' within the web interface.

If this still doesn't help, one possible step is going to a Dynflow console (the button from task details takes you there):

![Dynflow console](/plugins/katello/{{ page.version }}/troubleshooting/dynflow-console.png)

**Caution: Dynflow console is considered a low-level tool and should be used very carefully, ideally discussing other options before using its features**

If the failed task was taken care of by other means (performing the failed steps manually) or it was identified as not critical to the whole task, one can ``skip`` the failed step and ``resume`` the task to continue. These tasks end up with `warning` result at the end, to indicate there was some difficulty during the run.

### Dealing with Long Running Tasks

In came cases, there might be an issue with sub-services that make it appear as if the task is running for too long without any obvious evidence that something is occurring withing the task.

The first place to look in this case is filtering the tasks on ``state = running`` and looking at `Running Steps` in the task details:

![Running Steps](/plugins/katello/{{ page.version }}/troubleshooting/running-steps.png)

In this case, the ``"start_time" => nil`` indicates that the task was not picked up by Pulp, which usually means some issues with running the Pulp workers. See (see [Sub-services status](/plugins/katello/{{ page.version }}/troubleshooting/index.html#sub-services-status) for more details).

One can also go to the Dynflow console for even more details: the ``suspended`` state means that the step is waiting for the external task to finish - the ``suspended`` state itself doesn't have to indicate any error:

![Dynflow suspended step](/plugins/katello/{{ page.version }}/troubleshooting/dynflow-suspended-step.png)

If you're sure the underlying services are running fine, depending on the type of task, there might be a possibility to cancel the running step and possibly following [dealing with paused tasks](/plugins/katello/{{ page.version }}/troubleshooting/index.html#dealing-with-paused-task) instead.

### Locking

Foreman tasks provides a locking mechanism which is important to prevent the possibility of operations colliding that are being performed concurrently on the same resource (such as synchronizing and deleting a repository at the same time).

When trying to run an operation on a resource that another task is already running, one can get ``Required lock is already taken by other running tasks.``:

![Lock error](/plugins/katello/{{ page.version }}/troubleshooting/lock-error.png)

A locked resource is one where another task that is related to the same resource is already running. Thus, the task being attempted will result in that task being tried **in running or paused state**. This means that the error is triggered also in cases, where there is a task with unresolved failure (see [dealing with paused tasks](/plugins/katello/{{ page.version }}/troubleshooting/index.html#dealing-with-paused-task) for more details).

In rare cases, it might be hard to get into the stopped state. There is a possibility to unlock the resource in the ``running``/``paused`` task. This will switch the task into ``stopped`` state, freeing the resources for other tasks.  **Caution: unlocking allows running other tasks to run on potentially inconsistent data, which might lead into further errors**. It's still possible to go to the Dynflow console and resume the tasks, even after using the unlock feature. There are two unlock-related buttons:
``Unlock`` and ``Force Unlock``. The only difference between these two is the second one is allowed even when the task is in ``running`` state, and therefore is potentially even more dangerous than the ``Unlock`` button. See [dealing with tasks running too long](/plugins/katello/{{ page.version }}/troubleshooting/index.html#dealing-with-long-running-tasks) before attempting to use the ``Force Unlock`` option.

## Debug Certificate

Debug certificates (also called Ueber Certificates) can be used to unlock all the content for a given Organization. These are meant to be used by sysadmins who are debugging issues with the Katello install.

### Generating a Debug Certificate

To generate a debug certificate for a given Organization from the UI, navigate to the organizations page and click on the organization for which you want a debug certificate. Click on the button to generate and download the certificate as highlighted below:

![Generate Debug Certificate](/plugins/katello/{{ page.version }}/troubleshooting/debug_certificate.png)

To generate a debug certificate using the API see the API docs located on your server running at `/apidoc`.

In either case, you will get the Private Key and Certificate returned to you in a format such as :

```
Key:  -----BEGIN RSA PRIVATE KEY-----
<<<<DER ENCODED TEXT>>>>
-----END RSA PRIVATE KEY-----

Cert: -----BEGIN CERTIFICATE-----
<<<<DER ENCODED TEXT>>>>
-----END CERTIFICATE-----
```

### Using Firefox to browse content

If you wish to use the certificate to browse content via Firefox, do the following:

 1. Copy the contents of the above file from `-----BEGIN RSA PRIVATE KEY-----` to `-----END RSA PRIVATE KEY-----` inclusive to a file called key.pem
 1. Copy the contents of the above file from `-----BEGIN CERTIFICATE-----` to `-----END CERTIFICATE-----` inclusive to a file called cert.pem
 1. Run the following command to create a pkcs12 file:
```
openssl pkcs12 -keypbe PBE-SHA1-3DES -certpbe PBE-SHA1-3DES -export -in cert.pem -inkey key.pem -out [NAME].pfx -name [NAME]
```
 1. Provide a password when prompted.
 1. Using the preferences tab, import the resulting pfx file into your browser (Edit->Preferences->Advanced Tab -> View Certificates -> Import)
 1. Point your browser at http://[FQDN]/pulp/repos/[ORG_NAME]

To use curl to access the repository, you can provide --cert and --key options. Provided the cert is in `~/cert.pem` and key in `~/key.cert`, the following command will let you access any repository data in the organization. To check the access to a repository, checking the availability of repodata/repomd.xml is usually a good idea (make sure key.pem and cert.pem are '''absolute paths''' otherwise it silently fails):

```
curl -k --cert ~/cert.pem --key ~/key.pem https://katello.example.com/pulp/repos/test/Dev/custom/zoo/base-two/repodata/repomd.xml
```

## Frequently Asked Questions

### Can I use pulp-admin with Katello?

We do not encourage the use of pulp-admin because it has the potential to get data out of sync. However, pulp-admin can be useful when troubleshooting Katello.

1.  Install needed packages

    ```
    yum install -y pulp-admin-client pulp-rpm-admin-extensions
    ```
1.  Edit /etc/pulp/admin/admin.conf
1.  Uncomment the 'host:' line and add your server's hostname: 

    ```
    host: katello-hostname.example.com
    ```
1.  Run `grep default_password /etc/pulp/server.conf` to lookup the admin password

        sudo grep default_password /etc/pulp/server.conf
        # default_password: default password for admin when it is first created; this
        default_password: rGox3G9QhfCRD8fTsNR7FxqdgbvfJfSJ

1.  Use pulp-admin by specifying the admin username and password:

    ```
    pulp-admin -u admin -p rGox3G9QhfCRD8fTsNR7FxqdgbvfJfSJ repo list
    ```

#### Using pulp-admin without password #####

Using the 'pulp-admin login' command does not function and is not supported with Katello in an attempt to limit access to the certificate authoriity generated at installation time.

Katello 3.0 generates a client cert at installation time which allows usage of pulp-admin without specifying the username and password.  To use this:

1.  mkdir ~/.pulp/
1.  Copy the public client cert and private key to a file together:

    ```
    # sudo cat /etc/pki/katello/certs/pulp-client.crt /etc/pki/katello/private/pulp-client.key > ~/.pulp/user-cert.pem
   ```
1.  Run pulp-admin without username and password:

    ```
    pulp-admin repo list
    ```

### How can I sync a repository like Katello does directly from the console?

Sometimes you want to debug why a synchronization of a repository from Katello is failing and rather than dig through log files and error messages it can often be easier to try to sync the repo with the ''grinder'' tool which is what Katello uses to download repositories.  The tool can be ran from a terminal on your Katello server:

    $ grinder yum --label=sync-test --url=https://fedorapeople.org/groups/katello/releases/yum/1.0/RHEL/6Server/x86_64/
    grinder.RepoFetch: INFO     fetchYumRepo() repo_label = sync-test, repo_url = 
    https://fedorapeople.org/groups/katello/releases/yum/1.0/RHEL/6Server/x86_64/, basepath = ./, verify_options = {}
    grinder.RepoFetch: INFO     sync-test, https://fedorapeople.org/groups/katello/releases/yum/1.0/RHEL/6Server/x86_64/, 
    Calling RepoFetch with: cacert=<None>, clicert=<None>, clikey=<None>, proxy_url=<None>, proxy_port=<3128>, proxy_user=<None>, 
    proxy_pass=<NOT_LOGGED>, sslverify=<1>, max_speed=<None>, verify_options=<{}>, filter=<None>
    ....
    grinder.ParallelFetch: INFO     5 threads are active. 8 items left to be fetched
    grinder.ParallelFetch: INFO     4 threads are active. 4 items left to be fetched
    grinder.ParallelFetch: INFO     WorkerThread deleting ActiveObject
    grinder.ParallelFetch: INFO     Thread ending
    grinder.ParallelFetch: INFO     3 threads are active. 3 items left to be fetched
    grinder.ParallelFetch: INFO     WorkerThread deleting ActiveObject
    grinder.ParallelFetch: INFO     Thread ending

You now have a directory called sync-test off of your current working directory:

    $ ls sync-test/
    converge-ui-devel-0.8.3-1.el6.noarch.rpm
    elasticsearch-0.18.4-13.el6.noarch.rpm
    katello-1.0.6-1.el6.noarch.rpm
    katello-agent-1.0.6-1.el6.noarch.rpm
    katello-all-1.0.6-1.el6.noarch.rpm
    katello-certs-tools-1.1.7-1.el6.noarch.rpm
    lucene3-contrib-3.4.0-2.el6.noarch.rpm
    repodata
    rubygem-actionmailer-3.0.10-3.el6.noarch.rpm
    ...

