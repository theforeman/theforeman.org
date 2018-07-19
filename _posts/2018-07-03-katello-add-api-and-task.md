---
layout: post
title: 'Contributing to the Katello API'
date: 2018-07-03 12:00:00
author: 
  name: Christopher Duryee
  uri: Chris_Duryee 
tags:
- foreman
---


# Introduction

If you have used the Katello API a lot, you have almost certainly found areas where the API is difficult to use. Fortunately, it is easy to add a new API call, or add features to an existing call.

This tutorial will show how to add a new API, and how to add a new asynchrnous task. Adding an asynchronous task is not always needed, but is a common requirement.

You'll need to write tests for any code you commit, which is outside the scope of this document.

## Initial setup

You'll need to run through a forklift development setup. Instructions are located in the [forklift README](https://github.com/theforeman/forklift#quickstart). You'll be running `foreman start` in one terminal window, and making edits using another terminal window.

## Making an API call

The first order of business is to make an existing API call in your development environment. This will ensure that your development environment is working, and it will show an example of how to make API calls with cURL.

To make the call, simply run `curl -s -k https://admin:changeme@localhost/katello/api/v2/ping | python -mjson.tool`. You should get this back:

```
{
    "services": {
        "candlepin": {
            "duration_ms": "36",
            "status": "ok"
        },
        "candlepin_auth": {
            "duration_ms": "38",
            "status": "ok"
        },
        "foreman_tasks": {
            "duration_ms": "862",
            "status": "ok"
        },
        "pulp": {
            "duration_ms": "141",
            "status": "ok"
        },
        "pulp_auth": {
            "duration_ms": "124",
            "status": "ok"
        }
    },
    "status": "ok"
}
```

The `python -mjson.tool` command simply reformats the JSON output into a more human-readable form.

## Adding code to an existing API call

Now that we know everything is working, we can modify an existing call. If you are new at this, it's good to work through everything one step at a time. This makes it easy to figure out what happened if something is broken. Let's add a logging statement, and then see if it worked. 

In the Katello project, edit `./app/controllers/katello/api/v2/ping_controller.rb` and add a logging statement like so:

```ruby
    api :GET, "/ping", N_("Shows status of system and it's subcomponents")
    description N_("This service is only available for authenticated users")
    def index
      Rails.logger.warn("ping!") # this is the line we added
      respond_for_show :resource => Ping.ping
    end

```

After you make this change, you'll need to hit `^C` on your rails development server and reload it for the change to take effect.

After the restart is complete, run the same curl command again. You'll see this in the development server output:

```
18:26:45 rails.1   | 2018-07-03T18:26:45 [W|app|9a453] ping! 
```

## Adding a new API call

We were able to add some example code to an existing API call. Let's now add a new API call in the same controller.

*NOTE:* This example is a bit different since we are adding a URL to the top-level, as a peer to "/ping". You'll usually want to add something underneath your controller's top level URL, like "/ping/example" instead of "/example".

Pull up `./app/controllers/katello/api/v2/ping_controller.rb` again, and add this. It is copied from the `index` method, and we simply changed some references from "index" to "example":

```ruby
    api :GET, "/example", N_("An example API call")
    description N_("an example API call"
    def example
      Rails.logger.warn("example!")
      respond_for_show :resource => Ping.ping
    end
```

Save the file, restart your dev server, and run `curl -s -k https://admin:changeme@localhost/katello/api/v2/example`. Surprise! You got a 404. We need to also tell Katello about a new *route* for your new API call.

Edit `config/routes/api/v2.rb` and make a change like so:

```ruby
        api_resources :ping, :only => [:index]
        match "/status" => "ping#server_status", :via => :get
        match "/example" => "ping#example", :via => :get # this is the line we added
```

Now, restart your development server once more, run your curl command and it should return some json, along with printing the message `example!` in the log file. Congrats!


## Creating a task

You can perform work either directly in Katello's API code which will return synchronously, or via an asynchronous task. This section describes how to make a task and have it execute when your API is called.

*NOTE:* If you are unsure if you need to create a task or not, feel free to ask on the [Community Forums](https://community.theforeman.org/c/development).

## Executing an existing task via rake console

Let's kick off a task via the rake console. Just run `rails console` from the `~/foreman` directory on your development environment.

First, let's try to find a host that we can reference later. Try running `::Host::Managed.first`. It will either raise an error, or return something like this:

```
=> #<Host::Managed id: 1, name: "centos7-devel.example.com", last_compile: "2018-06-22 12:57:44", last_report: nil, updated_at: "2018-06-22 12:57:50", created_at: "2018-06-15 14:45:39", root_pass: nil, architecture_id: 1, operatingsystem_id: nil, environment_id: nil, ptable_id: nil, medium_id: nil, build: false, comment: nil, disk: nil, installed_at: nil, model_id: 1, hostgroup_id: nil, owner_id: 4, owner_type: "User", enabled: true, puppet_ca_proxy_id: nil, managed: false, use_image: nil, image_file: nil, uuid: nil, compute_resource_id: nil, puppet_proxy_id: nil, certname: nil, image_id: nil, organization_id: 1, location_id: 2, type: "Host::Managed", otp: nil, realm_id: nil, compute_profile_id: nil, provision_method: nil, grub_pass: "", content_view_id: nil, lifecycle_environment_id: nil, global_status: 1, lookup_value_matcher: "fqdn=centos7-devel.example.com", pxe_loader: nil>
```

If you get an error, it probably means that you simply need to register a host. Once a host is registered, it should work.

Now, let's kick off a task in the console:

```
ForemanTasks.async_task(::Actions::Katello::Host::GenerateApplicability, [::Host::Managed.first], false)
```

You should see a lot of output. If you go into the "tasks" page in the web UI, you'll see that the task executed. Very cool!


## Adding your own task

Now that we know how to execute tasks, we can create our own and try to run it. Create a file in `app/lib/actions/katello/content_view/example.rb` that looks something like this:

```ruby
    module Actions
      module Katello
        module ContentView
          class Example < Actions::Base
            def plan
              Rails.logger.warn("an example!")
              # without this line, the task will not go into 'run' phase after planning.
              plan_self
            end
     
            def humanized_name
              _("Example")
            end
          end
        end
      end
    end

```

Then, try this from the console:


```
ForemanTasks.async_task(::Actions::Katello::ContentView::Example)
```

If all went well, you should see your task get executed.


## Putting it all together

Now that you can create an API call, create a task and execute a task, you can put it all together into an API call that executes a task. This is left as an exercise to the reader, but one way to write the API method would be like this:

```ruby
    def example
      Rails.logger.warn("example!")
      task = async_task(::Actions::Katello::ContentView::Example)
      respond_for_async :resource => task
    end
```

Try using your curl call on this, and the task should fire. Congratulations!
