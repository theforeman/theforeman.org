---
layout: plugin
title: Foreman Tasks 0.8 Manual
version: 0.8
# uncomment for older versions than stable or nightly
#robots: noindex
---

# 1. {{ page.title }}

This plugin is a platform for running, monitoring, debugging and auditing any kind of task within Foreman or its plugins. By task we mean a job, a process, an action or whatever that deserves to have its own name, progress or should simply keep history. Both synchronous and asynchronous tasks are supported. 

There are two types of users that use this plugin, first is a developer, who needs a better control of their task flow, second is a regular Foreman user, who wants to know, what's happening in their Foreman instance. This manual focuses on both groups, keeping the info in separate chapters. We highly recommend developers to start with user guide first.
 
## 1.1 Compatibility

The plugin is compatible with all platforms supported by Foreman. Since foreman-tasks depends on Dynflow, Ruby 1.9+ is required. 

# 2. Installation

## 2.1 Plugin Installation

Note that since Foreman 1.14, foreman-tasks became a dependency of the core project and is installed automatically.

### With Foreman Installer

You can install the plugin using foreman-installer like this

    foreman-installer --enable-foreman-plugin-tasks

The installer will install the package and setup the foreman-tasks service which allows background processing of tasks.

### Manual Installation

In the case you want to install the package manually on an existing Foreman, use the following steps.

Install the packages appropriate for your operating system:

RPM:

    yum install tfm-rubygem-foreman-tasks

DEB:

    apt-get install ruby-foreman-tasks

Foreman tasks provides a service that is used for background processing, make sure you have it running by executing following

    service foreman-tasks start

# 3. User guide

## 3.1 Listing tasks

One of the most important plugin page is list of all tasks. You can find it in Monitor -> Tasks. The table lists all tasks with their statuses. Note that the task name can vary based on how it was triggered. Each task type has unique label, which can be used to search all tasks of a given type. The search query might look like this

    label =  Actions::Foreman::Report::Import
 
You can also search by task status and result

    state = paused
    state = running
    state = stopped
    
    result = error
    result = pending
    result = warning
    result = success
    
    state = stopped and result = failed

as well as start and end time, to find tasks started after December 1st or finished after the same date, you can use following

     start_at > 2016-12-01
     ended_at > 2016-12-01 

To get a quick overview of tasks status, you can use two dashboard widgets provided by the plugin.

![Widget](/plugins/foreman_tasks/{{page.version}}/dashboard1.png)
![Widget](/plugins/foreman_tasks/{{page.version}}/dashboard2.png)

## 3.2 Task in detail

Each task has following attributes


- **Name** - human readable name of the task, it may differ per task of the same type since task inputs can be used for customization of the value 
- **Result** - one of *success*, *error*, *warning*, *pending*, while success and error are probably clear, warning and pending is sometimes source of a confusion. *pending* means we can't tell yet since the task hasn't finished yet, *warning* means that some error occurred, user fixed the error and resumed the task that finished successfully afterwards. In other words, the warning means that someone had to do a manual step to finish the task. 
- **State** - one of *running*, *stopped*, *paused*, running tasks are tasks that are actively being performed. If an error occurres during the run, based on the task rescue strategy, it can be paused or switched to stopped. Paused tasks can be resumed making them running again. After all task steps are finished the task state is stopped. Stopped tasks can't be resumed. 
- **Triggered by** - user who started the task
- **Execution type** - possible values are *immediate* and *delayed*, delayed tasks are usually scheduled to start at specific time in future, to determine the execution type, attributes *start_at* and *started_at* are compared

- **Start at** - indicates the time when the task should start
- **Started at** - indicates the time when the task really started
- **End at** - indicates the time when the task stopped
- **Start before** - indicates the deadline after which the task should not start if it hasn't started yet

- **Progress** - the task may consist of multiple steps or sub-tasks, the progress is calculated based on percentage of finished steps/sub-tasks

Note that you get more information by hovering some of the attribute values.

### 3.2.1 Results and State related Q&A

- Q: Why do I see paused task?
- A: When a task is paused  it means it encountered an error which it can't solve on its own and needs the user to either cancel it or fix the issue and resume it. Not every task is pause on error, only tasks that were programmed to pause do. To find more information, check what you see in *Errors* field on task page or red box under the Errors tab.

- Q: What is the pending result exactly?
- A: While the task is in progress we can't tell what the result will be, in such case the result is denoted as *pending*. E.g. if we're in the middle of puppet report importing, we can't tell if it will succeed or fail until it's fully processed. If we ran out of HDD space before the last line was saved in DB, it would fail at the very last step.

- Q: Where do I find the error that I should report if the task failed?
- A: The best place to look is the task detail page. In the first tab, you will see the human readable message based on the exception that was raised. The format depends on author of the task. If the task is based on Dynflow, you can find more information by navigating to the Errors tab on the same page. If you report an issue, make sure you attach the content of this tab with other logs. Note that the input and output fields may contain sensitive data so make sure you clean all such data while uploading it.

- Q: There is a task with state *paused* and result *error*, what does that mean?
- A: This indicates that the task was paused because of some error occurred. In task detail you should see question mark at *Result* field but in table, we display the value matching to what the result of the task would be, if we stopped it right now. Thanks to this you can also easily search tasks that needs attention by filtering on result value. The same applies for warning result. The pending value is displayed only if we don't have any information yet.  

### 3.2.2 Other task data

There are more tabs in task detail page. They are mostly used during debugging.
 
- **Running steps** - you can see steps actively being performed for a running task, after the task is stopped this tab is empty.
- **Errors** - if there was an error during the run and the task was performed by Dynflow, you will find all important information about it on this tab, most importantly, the failing Dynflow action name *Action*, the input and output of it and the whole trace.
- **Locks** - tasks can lock resources preventing other tasks to access them. There are two types of locks, *exclusive* and *non-exclusive* sometimes called *link*. If the author of the task locks some resource e.g. bank account, other task trying to lock the same bank account will fail with error that the resource is locked. If the tasks supports resuming, you can wait for the first task to finish and them resume the failed one. If there's no other conflicting task, it should finish, moving it's state to stopped and setting state to warning. The warning is there since there was some error during the task execution. Non-exclusive locks are only links to resources. They do not block any access and serve only for referring purpose.
- **Raw**- This tab is mostly for developers who debug errors. You can find internal information such as unique ID of the task, task type denoted as *Label*, duration of the execution, input and output in machine readable form. If the task mirrors external task in some external service, you can find id of this external task here as well. 
  
## 3.3 Task manipulation

### 3.3.1 Resuming a task

If you have a task that's in a paused state because of some error, you can fix the error and resume the task execution. After the error is fixed and the task is resumed, the task will continue to run from the place, where the error occurred. If the error prevails, chances are that the task will fail again with the same error. To resume paused task, navigate to its detail page and click the resume button. If the button is disabled, the state is no longer paused. Stopped tasks can't be resumed, they are finished completely. The error might appear because of some unexpected conditions, e.g. connectivity problems during communication with external service, or simply because there's a bug in the task itself. If it's the later case, it's up to the author of the task to fix the code, deliver the new version of the task definition to the user who can then resume the execution.

### 3.3.2 Cancelling the task

Some tasks can be cancelled. Cancellation support is determined by the author and so far only Dynflow based tasks can be cancelled. Most of the tasks can be cancelled if they were scheduled in future and they were not started yet or they are running and the author of the task allowed cancelling. How exactly cancellation behaves is depending on task type, common practice is that it cancels all steps that have not been executed yet.  

### 3.3.3 Locks, unlocking and force unlocking

As mentioned above, foreman-tasks supports locking mechanism. This is useful if tasks can't access the same resource at the same time, e.g. if they would write the same file. Each task can have multiple locks, each lock having its own name (usually derived from the operation) and resource. Exclusive locks prevent all other tasks to lock the same resource for the same operation. Task that destroy some resource usually lock all operations on a resource being deleted, since we don't want any other task to touch deleted resource.

Non-exclusive lock is a link that only adds a reference to the resource, it does not prevent any other task from locking or linking the same resource. Each task usually has a link to the user who triggered it.

Now think of a situation where a task locks a resource and fails because of some error. Such task will keep the resource locked preventing all new tasks to work with this resource, since when they try to lock it, they will receive a conflict. To fix this state, the original task must finish first so it unlocks the resource. See [Resuming a task](/plugins/foreman_tasks/{{page.version}}/index.html#3.3.1Resumingatask) section for more details about resuming paused tasks. If you for some reason can't fix the failing task, you can force the unlock of locked resources. Since this is potentially dangerous action which will leave the system in inconsistent state, it's not enabled by default. It can be enabled by dynflow_allow_dangerous_actions setting. For more information about settings, please see [Settings](/plugins/foreman_tasks/{{page.version}}/index.html#3.6Settings) chapter.

After you enable dangerous action you can see two new buttons in task detail - *Unlock* and *Force Unlock*. They are only active under specific circumstances. You can use *Unlock* only for paused task. After clicking the button and confirming you understand the consequences, the task is moved to stopped state. This effectively unlocks all resources locked by the task. The task can still be resumed later even it's state is stopped, this allows you to recover from inconsistent state if the original issue was fixed. If the task is resumed, it can fail again, remain paused and therefore lock the resource again. *Force Unlock* is similar to *Unlock* but can be used for tasks in any state other than *stopped*. This can be useful for tasks that got stuck in *running* state and will never stop which happens very rarely.  

### 3.3.4 Debugging with Dynflow console

If the task uses dynflow as a an execution backend you might navigate to corresponding dynflow task from the task detail page. This is only possible if *dynflow_enable_console* setting is enabled. Please note that the dynflow console is low-level debugging tool and should not be used or exposed to regular user. If you enable the dynflow console, it's a good idea to also set *dynflow_console_require_auth* to Yes, which allows only admin users to access it. In dynflow console you can find information about the dynflow tasks, dynflow execution plans and executor statuses.

## 3.4 Recurring logics

Some tasks can be set to repeat based on regular basis. Recurring logic is the definition of such repeating. Note that the task is a single run, recurring logic creates new task instance for every iteration. Existing recurring logics can be found under Monitor -> Recurring Logics. Following list explains the logic attributes.

- **Cron line** - recurring representation in cron-like syntax 
- **Action** - human readable name of the task that is being repeated 
- **Current iteration** - how many times has the task already run  
- **Iteration limit** - if the task has been configured to run specific number of times, the number is displayed here 
- **Repeat until** - another way of specifying when the recurring should stop is configuring a deadline, it can be combined with iteration limit in which case the first that happens stops the repetition
- **State** - one of *Active*, *Finished*, *Cancelled*, *Failed*. Normally the recurring logic starts in *Active* state, once the last iteration is finished it moves to *Finished*. There can be a logic without any stop date so it can remain *Active* forever. If user decides to stop recurring before the logic would finish, he can cancel the logic. In this case the logic state is set to *Cancelled*. *Failed* state means that there was some internal failure.

- **Last occurrence** - indicates last task run time 
- **Next occurrence** - indicates when next task should be run
  
## 3.5 Permissions

Foreman tasks plugin adds new permissions to Foreman core permission system. The new resources you can find in filter form are *Foreman tasks/recurring logic* and *Foreman tasks/task*. Both support granular filters so you can specify a subset of resources that the permission is granted for. E.g. to create a filter permitting to view and edit only tasks of a specific type, you can use a filter with condition such as `label = Actions::Foreman::Report::Import`. The filter search field uses the same syntax as task searching so for more examples, see [Listing tasks](/plugins/foreman_tasks/{{page.version}}/index.html#3.1Listingtasks). The edit tasks permission allows resuming, cancelling, unlocking and dynflow console access.

## 3.6 Settings

Under Administer -> Settings you can find ForemanTasks tab which allows you
to customize plugin behavior. Here is the list of settings and their meaning.

<table class="table table-bordered table-condensed">
  <tr>
    <th>Parameter name</th>
    <th>Description</th>
  </tr>
  <tr>
    <td>dynflow_allow_dangerous_actions</td>
    <td>Enables unlocking tasks. Note that this might leave the system in inconsistent state and is highly discouraged. Please see locking explanation chapter before allowing this.</td>
  </tr>
  <tr>
    <td>dynflow_console_require_auth</td>
    <td>If dynflow console is enabled, require user to be authenticated as user with admin rights when accessing dynflow console</td>
  </tr>
  <tr>
    <td>dynflow_enable_console</td>
    <td>Enable the dynflow console (/foreman_tasks/dynflow) for debugging</td>
  </tr>
  <tr>
    <td>foreman_tasks_proxy_action_retry_count</td>
    <td>Number of attempts to start a task on the smart proxy before failing</td>
  </tr>
  <tr>
    <td>foreman_tasks_proxy_action_retry_interval</td>
    <td>Time in seconds between retries</td>
  </tr>
  <tr>
    <td>foreman_tasks_proxy_action_start_timeout</td>
    <td>Time in second during which a task has to be started on the proxy</td>
  </tr>
</table>

## 3.7 Deletion of old tasks

Although, the history of tasks has an auditing value, some kinds of tasks can grow up in number quite soon. Therefore there is a mechanism how to clean the tasks, using a rake command. When running without any arguments, the tasks are deleted based on the default parameters defined in the code.

    foreman-rake foreman_tasks:cleanup

To see what tasks would be deleted, without actually deleting the records, you can run

    foreman-rake foreman_tasks:cleanup NOOP=true

By default, only the actions explicitly defined with expiration time in the code, will get cleaned. One can configure new actions, or override the default configuration inside the configuration config/settings.plugins.d/foreman_tasks.yaml, such as:

    :foreman-tasks:
      :cleanup:
    # the period after witch to delete all the tasks (by default all tasks are not being deleted after some period)
        :after: 365d
    # per action settings to override the default defined in the actions (cleanup_after method)
        :actions:
          - :name: Actions::Foreman::Host::ImportFacts
            :after: 10d

The foreman_tasks:cleanup script also accepts additional parameters to specify the search criteria for the cleanup manually:

- **TASK_SEARCH** - scoped search filter (example: 'label = "Actions::Foreman::Host::ImportFacts"')
- **AFTER** - delete tasks created after AFTER period. Expected format is a number followed by the time unit (s, h, m, y), such as 10d for 10 days (applicable only when the TASK_SEARCH option is specified)
- **STATES** - comma separated list of task states to touch with the cleanup, by default only stopped tasks are affected (applicable only when the TASK_SEARCH option is specified)
- **NOOP** - set to "true" if the task should not actually perform the deletion, only report the actions the script would perform
- **VERBOSE** - set to "true" for more verbose output
- **BATCH_SIZE** - the size of batches the tasks get processed in (1000 by default)

To see the current configuration (what actions get cleaned automatically and what is their after period), this script can be used:

    foreman-rake foreman_tasks:cleanup:config

## 3.8 Exporting

If you want to share the the history of tasks with someone else who does not have access to your Foreman instance, there's a tool to do the export. This is especially useful when developers asks you for some debugging data. To do the export, use to following rake task provided by the plugin

    foreman-rake foreman_tasks:export_tasks

This will create gzipped tar file in temp directory containing html page for each exported task. The path to the file is printed after the export is finished. These data contains tasks information stored in database from last 7 days by default. To change how old tasks should be part of the export, use following variables when running the export.

- **TASK_SEARCH** - scoped search filter (example: 'label = "Actions::Foreman::Host::ImportFacts"')
- **TASK_DAYS** - number of days to go back

To explicitly name the export, you can use **TASK_FILE** variable. The following example would export all facts importing tasks from last week into file /tmp/last_week_importing.tar.gz

    foreman-rake foreman_tasks:export_tasks TASK_SEARCH='label = "Actions::Foreman::Host::ImportFacts"' \
      TASK_FILE=/tmp/last_week_importing.tar.gz TASK_DAYS=7

If you prefer CSV format instead of HTML pages, you use use **TASK_FORMAT** variable and change to format to csv. Only html and csv formats are available at the moment. The CSV format does not generate the gzipped tarball but plain CSV file that contains limited information of matched tasks. The information includes task id, state, type, label, result, parent_task_id, started_at and ended_at attributes.


# 4. Developer guide

We don't have the developer guide yet. At the moment we recommend to read the code in the [repository](https://github.com/theforeman/foreman-tasks). Please consider contributing.

<!--
Let's book the number 4 for developer guide for now, suggested structure of developer guide:

Define your first task
  path, namespace
Dynflow based task
 shortly on structure
Triggering the task synchronously
Triggering the task on background
Task UI customization
  Human task output
  Human task input
  Human task error
Locks
Subscribing
Error handling
Rescue strategies
Testing
Sub tasks
-->

# 5. Help

Please follow our [standard procedures and contacts]({{site.baseurl}}support.html).

# 6. Getting involved

## 6.1 Troubleshooting

If you find a bug, please file it in
[Redmine](http://projects.theforeman.org/projects/foreman_remote_execution/issues/new).

See the [troubleshooting section](/manuals/latest/index.html#7.2GettingHelp)
in the Foreman manual for more info.


## 6.2 Contributing

Follow the [same process as Foreman](/contribute.html#SubmitPatches)
for contributing.

# 7. Links

* foreman-tasks plugin [https://github.com/theforeman/foreman-tasks](https://github.com/theforeman/foreman-tasks)
* issue tracker [http://projects.theforeman.org/projects/foreman-tasks](http://projects.theforeman.org/projects/foreman-tasks)
