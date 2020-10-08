---
layout: post
title: How to write a new Foreman Ansible module in 20 lines of code
date: 2020-10-08 11:29:55
author: Evgeni Golov
tags:
- foreman
---

Some time ago, we were asked ([twice](https://bugzilla.redhat.com/show_bug.cgi?id=1856401)) to [add a module for managing HTTP proxies in Foreman](https://github.com/theforeman/foreman-ansible-modules/issues/867) to the Foreman Ansible Modules collection. Given the limited scope of the module, it's a perfect fit for a guide how to write new modules utilizing the abstraction we have developed in Foreman Ansible Modules!

<!--more-->

## What does the ~~fox~~ API say?

The first step when planning to implement a new module should always be to consult the [API documentation](https://theforeman.org/api/2.1/). In this case, we're interested in the [HTTP Proxies endpoint](https://theforeman.org/api/2.1/apidoc/v2/http_proxies.html) which describes how to show, create, update and destroy HTTP Proxies in Foreman, especially in the [fields required when creating a new](https://theforeman.org/api/2.1/apidoc/v2/http_proxies/create.html) or [update an existing](https://theforeman.org/api/2.1/apidoc/v2/http_proxies/update.html) proxy:

* `name`, required for create, optional for update
* `url`, required for create, optional for update
* `username`, optional
* `password`, optional
* `location_ids`, optional
* `organization_ids`, optional

We also see that there are no other actions besides list, show, create, update, and delete.

## Creating a minimal module

A regular Ansible module always starts with an instance of `AnsibleModule`.

In Foreman Ansible Modules, we have several classes based on this basic one, so we need to decide which base class from [`foreman_helper`](https://github.com/theforeman/foreman-ansible-modules/blob/develop/plugins/module_utils/foreman_helper.py) we should take.

HTTP Proxies inside of Foreman are stateful (can be created and deleted) entities that can have taxonomies (Organizations and Locations), so we're taking the [`ForemanTaxonomicEntityAnsibleModule`](https://theforeman.github.io/foreman-ansible-modules/develop/api.html#foreman_helper.ForemanTaxonomicEntityAnsibleModule) class, which will provide us with the `state`, `organizations`, and `locations` parameters and automatic handling of those. Please refer to the [`foreman_helper` documentation](https://theforeman.github.io/foreman-ansible-modules/develop/api.html) for other possible base classes and their use-cases.

```python
from ansible_collections.theforeman.foreman.plugins.module_utils.foreman_helper import ForemanTaxonomicEntityAnsibleModule
```

As the helper decides which API endpoint to talk to based on the class name, we create a minimal class:

```python
class ForemanHttpProxyModule(ForemanTaxonomicEntityAnsibleModule):
    pass
```

Now we need to add the other fields the API supports as parameters. We'll mark the `name` parameter as `required` because that's the one we'll be using for finding existing proxies -- the API has it as `optional` because it uses the ID of the proxy as the primary identification, but nobody wants to write static ids in Ansible playbooks. The `url` parameter is only required for *new* proxies, so we'll mark it as `optional` in the module parameters and document the requirement for creation. As our modules already have `username` and `password` parameters for authenticating against Foreman, we'll have to name the parameters for those fields differently -- `proxy_` seems like a good prefix to add here. And last but not least, `password` parameters should be marked as `no_log=True` so that Ansible skips them when printing debugging information about the module invocation:

```python
    module = ForemanHttpProxyModule(
        foreman_spec=dict(
            name=dict(required=True),
            url=dict(),
            proxy_username=dict(flat_name='username'),
            proxy_password=dict(no_log=True, flat_name='password'),
        ),
    )
```

`flat_name` is telling our abstraction layer that the field name in the API differs from the Ansible parameter name. See the [specification of the `foreman_spec`](https://theforeman.github.io/foreman-ansible-modules/develop/developing.html#specification-of-the-foreman-spec) for details how it works and extends Ansible's `argument_spec`.

At this point, we can add the code for the API connection and parameter processing and would have a working module:


```python
    with module.api_connection():
        module.run()
```

However, as noted above, the `url` parameter is only optional when modifying an existing proxy, but we marked it as optional for any module invocation because Ansible doesn't know if it's creating a new proxy or modifying an existing one *before* the API connection has been established. To accommodate for that, we need to manually execute the "search for entity" step and then raise the appropriate error message if the user is trying to create a proxy without specifying the URL:

```python
    with module.api_connection():
        entity = module.lookup_entity('entity')

        if not module.desired_absent:
            if 'url' not in module.foreman_params:
                if not entity:
                    module.fail_json(msg="The 'url' parameter is required when creating a new HTTP Proxy.")
                else:
                    module.foreman_params['url'] = entity['url']

        module.run()
```

And that's it from a code perspective, we now have a working module to manage HTTP Proxies in Foreman!

## Adding Ansible documentation to the code

While the code is done, the documentation is not. And documentation is important! Our CI runs `ansible-test sanity` on the modules, and that requires all parameters to be properly documented.

The most interesting part of the `DOCUMENTATION` stanza is the `extends_documentation_fragment` section. As we have several parameters coming from our base class, we also have documentation fragments that document these parameters:

```yaml
extends_documentation_fragment:
  - theforeman.foreman.foreman
  - theforeman.foreman.foreman.entity_state
  - theforeman.foreman.foreman.taxonomy
```

`theforeman.foreman.foreman` adds the most basic parameters for the API connection, `theforeman.foreman.foreman.entity_state` adds the `state` parameter for our entity and finally `theforeman.foreman.foreman.taxonomy` adds `organizations` and `locations` parameters to describe the taxonomy.

The rest of the `DOCUMENTATION` section is basic [Ansible module documentation](https://docs.ansible.com/ansible/latest/dev_guide/developing_modules_documenting.html), so we'll omit it here.

## Tests!

Writing tests is tedious and annoying, but at the same time, a lot of bugs can be prevented if you have tests. Or could have been prevented, if there would have been tests ;-)

In Foreman Ansible Modules, we mostly do integration tests -- unit testing modules is not really feasible. Those integration tests consist of an Ansible playbook that executes the module multiple times and analyses the results and a set of recorded API calls that can be used to replay the tests without having a full Foreman running, which saves a lot of resources when running the tests and allows the tests to run in parallel.

To write a test, just drop a new playbook into `tests/test_playbooks/` called `<module_name>.yml` -- so in our case `http_proxy.yml`. As this playbook will call the same module over and over again, we have established the practice to have a `tasks/<module_name>.yml` file with the whole module invocation and then simply include it in the main playbook using `import_tasks`.

For the HTTP Proxy module, the tasks file looks like this:

```yaml
---
- name: "Create/Update/Delete HTTP Proxy"
  vars:
    http_proxy_state: "present"
  http_proxy:
    username: "{{ foreman_username }}"
    password: "{{ foreman_password }}"
    server_url: "{{ foreman_server_url }}"
    validate_certs: "{{ foreman_validate_certs }}"
    name: "{{ http_proxy_name }}"
    url: "{{ http_proxy_url | default(omit) }}"
    proxy_username: "{{ http_proxy_username | default(omit) }}"
    proxy_password: "{{ http_proxy_password | default(omit) }}"
    locations: "{{ http_proxy_locations | default(omit) }}"
    organizations: "{{ http_proxy_organizations | default(omit) }}"
    state: "{{ http_proxy_state }}"
  register: result
- assert:
    fail_msg: "Ensuring http_proxy is {{ http_proxy_state }} failed! (expected_change: {{ expected_change | default('unknown') }})"
    that:
      - result.changed == expected_change
  when: expected_change is defined
...
```

In this task file, there are two tasks. The first one calls the `http_proxy` module, passing in the connection information and the module-specific parameters, most of which have `default(omit)` specified, which means these parameters won't be passed to the module if the variable isn't set -- super useful when you need to test the module with different sets of parameters. And the second one that ensures that the module reported the `changed` attribute correctly.

Now the main playbook (`http_proxy.yml`) is a bit longer, so we won't paste it verbatim here, but discuss the individual sections.

First, it has a play with `hosts: localhost` to prepare the test environment: setup organizations, locations and whatever else might be needed.

This is followed by a long play with `hosts: tests` that contains the actual test steps.
Those steps follow a pattern: do something and expect a change to happen (`expected_change: true`), do the same thing again and expect no change to happen (`expected_change: false`). This ensures idempotency of the module.

The "things to do" again follow a pattern: create a proxy with minimal information, update a proxy, delete a proxy. This ensures the common workflows of a user are covered.

At last, it has another play with `hosts: localhost` to tear down anything that has been prepared for this specific test to run.

The differentiation between `hosts: localhost` and `hosts: tests` allows us to execute the `localhost` steps only when we're recording a new set of API interactions and the `tests` steps always, as there is no need for the setup and teardown when running the tests against the recorded data.

The last missing piece between us and working tests is a symlink. To keep the recorded API data clean of the big apidoc JSON and also allow easier updates when the apidoc changes, we keep copies of the JSON in `tests/fixtures/apidoc`. However, we keep only `foreman.json`, `katello.json` and `luna.json` as real files while all the others are symlinks. As the HTTP Proxy is a Foreman feature, we will create a symlink from `http_proxy.json` to `foreman.json`. Would it have been a Katello feature, the link would have been to `katello.json`. And for any other plugin, it's `luna.json` as that's essentially "Foreman with all the nice plugins".

Having all pieces in place (and a running Foreman instance somewhere), we can run `make record_http_proxy` which it will execute our playbook and record the API interactions in `tests/test_playbooks/fixtures`.
The record step can be re-run as often as required. You can also execute `make livetest_http_proxy` to execute the whole test playbook *without* recording the interactions.

## Full code

This post only contains code snippets, you can read the full code of the added [`http_proxy` module on GitHub](https://github.com/theforeman/foreman-ansible-modules/blob/develop/plugins/modules/http_proxy.py).
