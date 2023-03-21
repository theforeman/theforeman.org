---
layout: post
title: Integrating Foreman with Event-Driven Ansible
date: 2023-04-13  8:00:00
author: Evgeni Golov
tags:
- foreman
- ansible
---

[Event-Driven Ansible](https://www.ansible.com/use-cases/event-driven-automation) is a new way of automation where your automation can dynamically react to events that happen in your environment.
Today, we want to show you how you can integrate that with Foreman using the [Foreman Webhooks plugin](https://github.com/theforeman/foreman_webhooks).

<!--more-->

As workflows and events one might want to react to will vary across different setups, we'll show one example integration and let everyone adopt it to their needs.
The workflow in this example is to have machines in a group update once their content has been updated in Katello.
You can find a full list of [available Webhook Events in the documentation](https://docs.theforeman.org/nightly/Administering_Project/index-katello.html#webhooks-available-events_admin).

First of all, we need a Katello installation with the Foreman Webhooks plugin enabled.
This can be achieved by calling `foreman-installer --enable-foreman-plugin-webhooks` on an existing setup or passing `--enable-foreman-plugin-webhooks` during the initial installation.

Second, we need a place to run Ansible and Ansible-Rulebook.
An empty CentOS Stream 8 machine where we follow the [ansible-rulebook installation](https://ansible-rulebook.readthedocs.io/en/stable/installation.html) and the [ansible.eda collection installation](https://github.com/ansible/event-driven-ansible) guides will do:

```console
[root@eda] # dnf install java-17-openjdk python39-pip
[user@eda ~]$ export JAVA_HOME=/usr/lib/jvm/jre-17-openjdk
[user@eda ~]$ python3.9 -m venv ./eda-venv
[user@eda ~]$ . ./eda-venv/bin/activate
(eda-venv) [user@eda ~]$ pip install ansible-rulebook ansible ansible-runner
(eda-venv) [user@eda ~]$ ansible-galaxy collection install ansible.eda
(eda-venv) [user@eda ~]$ pip install -r ~/.ansible/collections/ansible_collections/ansible/eda/requirements.txt
```
The only difference to the official guides is that we explicitly used Python 3.9, as the default Python in CentOS Stream 8 is Python 3.6 and that is too old for `ansible-rulebook` and `ansible-runner`.

Quickly check that the `ansible-rulebook` CLI is working:

```console
(eda-venv) [user@eda ~]$ ansible-rulebook --help
usage: ansible-rulebook [-h] [-r RULEBOOK] [-e VARS] [-E ENV_VARS] [-v] [--version] [-S SOURCE_DIR] [-i INVENTORY] [-W WEBSOCKET_ADDRESS] [--id ID] [-w] [-T PROJECT_TARBALL] [--controller-url CONTROLLER_URL]
                        [--controller-token CONTROLLER_TOKEN] [--controller-ssl-verify CONTROLLER_SSL_VERIFY] [--print-events] [--shutdown-delay SHUTDOWN_DELAY] [--gc-after GC_AFTER]

optional arguments:
  -h, --help            show this help message and exit
  -r RULEBOOK, --rulebook RULEBOOK
                        The rulebook file or rulebook from a collection
  -e VARS, --vars VARS  Variables file
  -E ENV_VARS, --env-vars ENV_VARS
                        Comma separated list of variables to import from the environment
  -v, --verbose         Causes ansible-rulebook to print more debug messages. Adding multiple -v will increase the verbosity, the default value is 0. The maximum value is 2. Events debugging might require -vv.
  --version             Show the version and exit
  -S SOURCE_DIR, --source-dir SOURCE_DIR
                        Source dir
  -i INVENTORY, --inventory INVENTORY
                        Inventory
  -W WEBSOCKET_ADDRESS, --websocket-address WEBSOCKET_ADDRESS
                        Connect the event log to a websocket
  --id ID               Identifier
  -w, --worker          Enable worker mode
  -T PROJECT_TARBALL, --project-tarball PROJECT_TARBALL
                        A tarball of the project
  --controller-url CONTROLLER_URL
                        Controller API base url, e.g. https://host1:8080 can also be passed via the env var EDA_CONTROLLER_URL
  --controller-token CONTROLLER_TOKEN
                        Controller API authentication token, can also be passed via env var EDA_CONTROLLER_TOKEN
  --controller-ssl-verify CONTROLLER_SSL_VERIFY
                        How to verify SSL when connecting to the controller, yes|no|<path to a CA bundle>, default to yes for https connection.can also be passed via env var EDA_CONTROLLER_SSL_VERIFY
  --print-events        Print events to stdout, redundant and disabled with -vv
  --shutdown-delay SHUTDOWN_DELAY
                        Maximum number of seconds to wait after issuing a graceful shutdown, default: 60. The process will shutdown if all actions complete before this time period
  --gc-after GC_AFTER   Run the garbage collector after this number of events. It can be configured with the environment variable EDA_GC_AFTER
```

Now that we have Foreman/Katello and ansible-rulebook working, we need to integrate the two together.

The [`ansible.eda` collection](https://github.com/ansible/event-driven-ansible/) comes with an [`ansible.eda.webhook`](https://github.com/ansible/event-driven-ansible/blob/main/plugins/event_source/webhook.py) event source plugin, which we can use as the receiver of the webhooks that Foreman Webhooks will send.
For that we create a new [rulebook](https://ansible-rulebook.readthedocs.io/en/latest/rulebooks.html) (`rulebook.yml`) that configures the webhook and how to proceed with the received events:

```yaml
---
- name: Listen for events on a webhook
  hosts: all

  ## Define our source for events

  sources:
    - ansible.eda.webhook:
        host: 0.0.0.0
        port: 5000

  ## Define the conditions we are looking for

  rules:
    - name: check which content view was updated
      condition: event.payload.content_view_name == "dev"

  ## Define the action we should take should the condition be met

      action:
        run_playbook:
          name: update.yml
```

This rulebook means we start the `ansible.eda.webhook` plugin on `0.0.0.0:5000` and every time an event happens that has the `content_view_name` field in the payload set to `dev` we execute the `update.yml` playbook.

The `update.yml` playbook is rather short, just calling the `ansible.builtin.dnf` module on the `foreman_dev` group to update packages:

```yaml
---
- hosts: foreman_dev
  tasks:
    - name: Upgrade all packages
      ansible.builtin.dnf:
        name: "*"
        state: latest
```

Ideally, the `foreman_dev` group would come from the [`theforeman.foreman.foreman` inventory plugin](https://github.com/theforeman/foreman-ansible-modules/blob/develop/plugins/inventory/foreman.py) we provide, but [`ansible-rulebook` does not yet support inventory plugins](https://github.com/ansible/ansible-rulebook/issues/344).
Instead, we create a static YAML inventory (`inventory.yml`):

```yaml
---
foreman_dev:
  hosts:
    dev01.example.com
```

We can now start `ansible-rulebook`:

```console
(eda-venv) [user@eda ~]$ ansible-rulebook --inventory inventory.yml --rulebook rulebook.yml --verbose
2023-04-13 07:55:11,974 - ansible_rulebook.app - INFO - Starting sources
2023-04-13 07:55:11,974 - ansible_rulebook.app - INFO - Starting rules
2023-04-13 07:55:11,974 - ansible_rulebook.engine - INFO - run_ruleset
2023-04-13 07:55:11,974 - drools.ruleset - INFO - Using jar: /home/user/eda-venv/lib/python3.9/site-packages/drools/jars/drools-ansible-rulebook-integration-runtime-1.0.0-SNAPSHOT.jar
2023-04-13 07:55:12,308 - ansible_rulebook.engine - INFO - ruleset define: {"name": "Listen for events on a webhook", "hosts": ["all"], "sources": [{"EventSource": {"name": "ansible.eda.webhook", "source_name": "ansible.eda.webhook", "source_args": {"host": "0.0.0.0", "port": 5000}, "source_filters": []}}], "rules": [{"Rule": {"name": "check which content view was updated", "condition": {"AllCondition": [{"EqualsExpression": {"lhs": {"Event": "payload.content_view_name"}, "rhs": {"String": "dev"}}}]}, "actions": [{"Action": {"action": "run_playbook", "action_args": {"name": "update.yml"}}}], "enabled": true}}]}
2023-04-13 07:55:12,317 - ansible_rulebook.engine - INFO - load source
2023-04-13 07:55:12,621 - ansible_rulebook.engine - INFO - load source filters
2023-04-13 07:55:12,621 - ansible_rulebook.engine - INFO - loading eda.builtin.insert_meta_info
2023-04-13 07:55:12,909 - ansible_rulebook.engine - INFO - Calling main in ansible.eda.webhook
2023-04-13 07:55:12,911 - ansible_rulebook.engine - INFO - Waiting for all ruleset tasks to end
2023-04-13 07:55:12,911 - ansible_rulebook.rule_set_runner - INFO - Waiting for actions on events from Listen for events on a webhook
2023-04-13 07:55:12,911 - ansible_rulebook.rule_set_runner - INFO - Waiting for events, ruleset: Listen for events on a webhook
2023-04-13 07:55:12 912 [drools-async-evaluator-thread] INFO org.drools.ansible.rulebook.integration.api.io.RuleExecutorChannel - Async channel connected
```

A quick `curl` call shows us that things are responding -- don't worry about the "Method Not Allowed", `curl` does a `GET` here, but the endpoint only accepts `POST`:

```console
% curl http://eda.example.com:5000/endpoint
405: Method Not Allowed
```

With the Ansible side done, we can move on to Foreman.

While Foreman Webhooks comes with a few [example webhook templates](https://github.com/theforeman/foreman_webhooks/tree/master/app/views/foreman_webhooks/webhook_templates),
none of these generate a JSON representation of a Content View Promotion event, so we need to create one ourselves under "Administer > Webhook Templates":

```erb
<%#
name: Katello Promote JSON
description: JSON payload for actions.katello.content_view.promote_suceeded
snippet: false
model: WebhookTemplate
-%>
<%=
  payload({
    "content_view_id": @object.content_view_id,
    "content_view_name": @object.content_view_name,
    "content_view_label": @object.content_view_label,
  })
-%>
```

Once the template is created, we can create we webhook under "Administer > Webhooks", using it:

![new webhook button](/static/images/blog_images/2023-04-13-integrating-foreman-with-event-driven-ansible/create_webhook.png)

![new webhook form](/static/images/blog_images/2023-04-13-integrating-foreman-with-event-driven-ansible/create_webhook_form.png)

* Subscribe to: Actions Katello Content View Promote Succeeded
* Name: ansible inform cv promote
* Target URL: `http://eda.example.com:5000/endpoint`
* Template: Katello Promote JSON
* HTTP Method: POST
* Enabled: true

Now, every time *any* content view is promoted, a webhook is sent to `eda.example.com`, which then filters based on the name of the content view and executes the `update.yml` playbook if the name was `dev`:

```
2023-04-13 08:11:00,856 - aiohttp.access - INFO - 192.168.122.149 [13/Apr/2023:08:11:00 +0000] "POST /endpoint HTTP/1.1" 200 177 "-" "Ruby"
2023-04-13 08:11:00 937 [main] INFO org.drools.ansible.rulebook.integration.api.rulesengine.RegisterOnlyAgendaFilter - Activation of effective rule "check which content view was updated" with facts: {m={payload={content_view_id=2, content_view_name=dev, webhook_id=1, context={request=e86e61df-548b-4572-9c20-d534d2addad6, user_admin=true, org_id=1, org_label=Default_Organization, user_login=admin, loc_name=Default Location, org_name=Default Organization, loc_id=2}, content_view_label=dev, event_name=actions.katello.content_view.promote_succeeded.event.foreman}, meta={headers={Accept=*/*, X-Session-Id=c38e182d-b6bc-4ceb-9cc4-c8ad36dbbda2, X-Request-Id=e86e61df-548b-4572-9c20-d534d2addad6, User-Agent=Ruby, Connection=close, Host=centos8-stream-eda.tanso.example.com:5000, Accept-Encoding=gzip;q=1.0,deflate;q=0.6,identity;q=0.3, Content-Length=386, Content-Type=application/json}, endpoint=endpoint, received_at=2023-04-13T08:11:00.856103Z, source={name=ansible.eda.webhook, type=ansible.eda.webhook}, uuid=0bef4d63-df1c-4be1-b1f1-4956d2e6529b}}}
2023-04-13 08:11:00,962 - ansible_rulebook.rule_generator - INFO - calling check which content view was updated
2023-04-13 08:11:00,964 - ansible_rulebook.rule_set_runner - INFO - call_action run_playbook
2023-04-13 08:11:00,964 - ansible_rulebook.rule_set_runner - INFO - substitute_variables [{'name': 'update.yml'}] [{'event': {'payload': {'content_view_id': 2, 'content_view_name': 'dev', 'webhook_id': 1, 'context': {'request': 'e86e61df-548b-4572-9c20-d534d2addad6', 'user_admin': True, 'org_id': 1, 'org_label': 'Default_Organization', 'user_login': 'admin', 'loc_name': 'Default Location', 'org_name': 'Default Organization', 'loc_id': 2}, 'content_view_label': 'dev', 'event_name': 'actions.katello.content_view.promote_succeeded.event.foreman'}, 'meta': {'headers': {'Accept': '*/*', 'X-Session-Id': 'c38e182d-b6bc-4ceb-9cc4-c8ad36dbbda2', 'X-Request-Id': 'e86e61df-548b-4572-9c20-d534d2addad6', 'User-Agent': 'Ruby', 'Connection': 'close', 'Host': 'centos8-stream-eda.tanso.example.com:5000', 'Accept-Encoding': 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Content-Length': '386', 'Content-Type': 'application/json'}, 'endpoint': 'endpoint', 'received_at': '2023-04-13T08:11:00.856103Z', 'source': {'name': 'ansible.eda.webhook', 'type': 'ansible.eda.webhook'}, 'uuid': '0bef4d63-df1c-4be1-b1f1-4956d2e6529b'}}}]
2023-04-13 08:11:00,964 - ansible_rulebook.rule_set_runner - INFO - action args: {'name': 'update.yml'}
2023-04-13 08:11:00,964 - ansible_rulebook.builtin - INFO - running Ansible playbook: update.yml
2023-04-13 08:11:00,977 - ansible_rulebook.builtin - INFO - ruleset: Listen for events on a webhook, rule: check which content view was updated
2023-04-13 08:11:00,977 - ansible_rulebook.builtin - INFO - Calling Ansible runner

PLAY [foreman_dev] *************************************************************

TASK [Gathering Facts] *********************************************************
ok: [dev01.example.com]

TASK [Upgrade all packages] ****************************************************
changed: [dev01.example.com]

PLAY RECAP *********************************************************************
dev01.example.com          : ok=2    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
2023-04-13 08:13:57,332 - ansible_rulebook.builtin - INFO - Ansible Runner Queue task cancelled
2023-04-13 08:13:57,333 - ansible_rulebook.builtin - INFO - Playbook rc: 0, status: successful
2023-04-13 08:13:57,333 - ansible_rulebook.rule_set_runner - INFO - Task action::run_playbook::Listen for events on a webhook::check which content view was updated finished, active actions 0
```
