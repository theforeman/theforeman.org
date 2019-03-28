---
layout: post
title: "Foreman Proxy Registration Protocol v2 explained"
author: "Ewoud Kohl van Wijngaarden"
date: "2019-04-24"
tags:
  - foreman
  - foreman-proxy
  - smart-proxy
---

# Foreman Proxy Registration Protocol v2 explained

In Foreman 1.22 the Proxy registration protocol changed. This blog takes a look at how it was, how it'll be and why this is an improvement.

## Classic Foreman Proxy registration

Before diving in, there are some things one must know. First of all, there is our main application Foreman. For this it doesn't matter which plugins are installed, including Katello. It is a [Ruby on Rails](https://rubyonrails.org/) application. It's typically deployed via HTTPS on a URL like `https://foreman.example.com`. Some features also need HTTP (`http://foreman.example.com`) but that's out of scope for this blog. When using the foreman-installer it defaults to using the Puppet CA for certificates, but this is out of historical convenience. In the Katello scenario a custom CA implementation is used instead.

Then there is also Foreman Proxy, a [Sinatra](http://sinatrarb.com/) application, written in Ruby, presenting a REST API. It's known under multiple names. The git repository is named smart-proxy and Katello has known it as Capsule. You may also see a reference to Content Proxy. For this blog we can consider these mostly the same. The difference is typical deployment. Where Foreman defaults to HTTPS on port 8443 (`https://proxy.example.com:8443`) and HTTP on port 8000 (`http://proxy.example.com:8000`), Katello changes the HTTPS port to 9090 because of a conflict with Candlepin. Like Foreman itself, the Proxy is deployed using the same certificate stack. That means Puppet CA or the Katello generated certificates. It is important to know because client certificates are used to authenticate.

Classic registration starts with the `/features` REST endpoint. You can easily query it since there's no authentication. Using `curl -s https://$(hostname -f):8443/features | jq` we get the following result:

```json
[
  "logs",
  "puppet",
  "tftp"
]
```

This is also what Foreman does: it queries the features. These are translated into Foreman's internal representation (`Logs`, `Puppet` and `TFTP` in this case) and stored in its database. Later when creating a host, the list of possible Puppet servers is the list of Proxies with the feature `Puppet`. Similarly domains use the `DNS` feature to select potential servers where subnets use have a `DHCP` selection (for IP delegation) and `DNS` for reverse DNS. This is the heart of provisioning orchestration in Foreman.

The last (optional) component is the installer, which defaults to registering freshly installed Proxies. For this there are three critical parameters: a Foreman URL and an oauth consumer secret and its key. This is used to authenticate to the Foreman REST API. It ensures the proxy exists with the correct features. The Proxy starts up even if some features fail to initialize. Because the installer knows which features should be present, this is a way to detect which features failed. It reports an error if a mismatch is found.

## Version 2

In Foreman Proxy 1.22 a new `/v2/features` REST endpoint is introduced. This is a data structure which allows to relay a lot more internal information. Because of this, it is required to authenticate using client certificates. Using `$ curl -s https://$(hostname -f):9090/v2/features --cert /etc/foreman-proxy/foreman_ssl_cert.pem --key /etc/foreman-proxy/foreman_ssl_key.pem | jq` we get:

```json
{
  "facts": {
    "http_enabled": false,
    "https_enabled": false,
    "settings": {},
    "state": "disabled",
    "capabilities": []
  },
  "dns": {
    "http_enabled": false,
    "https_enabled": false,
    "settings": {
      "use_provider": null
    },
    "state": "disabled",
    "capabilities": []
  },
  "templates": {
    "http_enabled": true,
    "https_enabled": true,
    "settings": {},
    "state": "running",
    "capabilities": []
  },
  "tftp": {
    "http_enabled": false,
    "https_enabled": true,
    "settings": {
      "tftp_servername": null
    },
    "state": "running",
    "capabilities": []
  },
  "dhcp": {
    "http_enabled": false,
    "https_enabled": false,
    "settings": {
      "use_provider": null
    },
    "state": "disabled",
    "capabilities": []
  },
  "puppetca": {
    "http_enabled": false,
    "https_enabled": false,
    "settings": {
      "use_provider": null
    },
    "state": "failed",
    "capabilities": []
  },
  "puppet": {
    "http_enabled": false,
    "https_enabled": true,
    "settings": {
      "puppet_url": "https://puppet.example.com:8140",
      "use_provider": [
        "puppet_proxy_puppet_api"
      ]
    },
    "state": "running",
    "capabilities": []
  },
  "bmc": {
    "http_enabled": false,
    "https_enabled": false,
    "settings": {},
    "state": "disabled",
    "capabilities": []
  },
  "realm": {
    "http_enabled": false,
    "https_enabled": false,
    "settings": {
      "use_provider": null
    },
    "state": "disabled",
    "capabilities": []
  },
  "logs": {
    "http_enabled": false,
    "https_enabled": true,
    "settings": {},
    "state": "running",
    "capabilities": []
  },
  "httpboot": {
    "http_enabled": false,
    "https_enabled": false,
    "settings": {},
    "state": "disabled",
    "capabilities": []
  }
}
```

As can be seen, it is now a mapping of the feature name to another map representing the feauture's state.

`http_enabled` and `https_enabled` are the result of `enabled` in the feature's setting file. Its value can be `http`, `https`, `true` (both `http` and `https`) or `false` (disabled). The installer configures most features using `https` for increased security, but some features need to listen on HTTP. `Templates` and `HTTPBoot` are examples of this because connecting clients wouldn't be able to verify HTTPS or not deal with it at all.

Where we previously relied on the installer to verify, the new datastructure exposes `state`. The current known values for this are `uninitialized`, `loaded`, `starting`, `running`, `disabled` and `failed`. As can be seen in the example, it's mostly `disabled` or `running`. The interesting one is `failed`. Now the Foreman application itself can detect misconfigurations although this hasn't been implemented. In the above output the puppetca feature has failed which is also why it wasn't present in the classic registration. At this moment the state is the internal state of the proxy and hasn't been formalized.

### Exposing settings

Every feature can have settings. They all have their own settings file. While working with the proxy, it turns out these are useful to know from the Foreman side. One example is TFTP server name. The Foreman needs to know this to properly create the DHCP record so a REST API call was created. This does mean that during provisioning we do an API call for a fairly static value. The templates plugin has a similar API to get the external server name. There were some others that did the same thing. The settings allow us to create a unified API and with a bonus that it doesn't need to call out.

This does come at the cost that you have to refresh the registration after changing the config. Currently this is mitigated by the installer since it refreshes the registration after config files change. In the future automatic refreshing can be implemented. With the classic registration that could cause problems because it was impossible to know if a feature failed or was explicitly removed. The new API exposes sufficient information to make intelligent choices here, like not removing an existing but failed feature while not adding an unknown failed feature.

The observant reader also notices that features that can have multiple providers (implementations) expose which one is active. This is mostly intended for debugging or informational purposes. Foreman should not make any decission based on a provider.

Providers also have their own config files and exposing those settings also works. It does mean a provider can't expose a setting from its parent.

Implementing this in a feature is easy by using `expose_setting` in the Proxy Plugin DSL:

```ruby
module Proxy::TFTP
  class Plugin < ::Proxy::Plugin
    plugin :tftp, ::Proxy::VERSION

    # ...

    expose_setting :tftp_servername
  end
end
```

This allows some more advanced use cases as well. Let's consider the Puppet support. When a host has a Puppet Proxy assigned, it has a Puppet server hostname. Right now this is the same hostname that Foreman uses to connect to the Proxy. In multi-homing setups this breaks. [Issue #26194](https://projects.theforeman.org/issues/26164) describes it in more detail, but the short summary is that if there's a management LAN just for Foreman and its proxies and a WAN where clients reside, it currently means that clients need to connect to the management LAN interface, even if the Proxy connects to the WAN IP. Obviously this is undesired. By exposing the `puppet_url` setting on the Puppet Proxy plugin to the Foreman, it can provide the correct hostname to clients. Since URLs can contain ports, we can also support non-standard ports. As part of the Pulp 3 effort, [smart_proxy_pulp](https://github.com/theforeman/smart_proxy_pulp) started to expose this information. In the future this can also be used to provide services that are on external servers that are otherwise unreachable to the Foreman server.

While this part wasn't part of my initial design, the new datastructure easily allowed this almost for free.

### Showing capabilities

This was the original reason for the whole change, which is why I still think of this as the capabilities effort. Interestingly enough the other fields have seen more use. Exposing failed modules has allowed a colleague to write a script assisting in debugging installations. Exposing settings has seen adoption in a few places. This is because they're very easy to use. Capabilities require much more support on the Foreman side.

My initial desire was to expand the DNS implementation. Some providers are capable of managing zones themselves. PowerDNS and Infoblox provide full APIs for this and these could be used. However, in the classic scenario there was no way of knowing whether the Proxy actually supported this other than trying. This is not a good user experience. If the Proxy could tell if it had the `DNS_ZONE_MANAGEMENT` capability, we could tell the user the domain was actually created. If it didn't we could warn the user they needed to manually ensure the domain was created. Perhaps more fine grained access is also possible, but the idea is still that simple strings indicate a capability.

Luckily Justin, who actually did the hard work of making my proof of concept code production ready, uses this in `smart_proxy_pulp`. The use case for Pulp 3 was various file types. In Katello with Pulp 2 there's a static configuration in `katello.yaml`, but with Pulp 3 we can query the Pulp API for supported file types and communicate this. Less configuration and more autodetection is a good user experience.

Implementation is straight forward using the `capability` in the Proxy Plugin DSL. The static example is not actually in the code, but it illustrates the initial design.

```ruby
module PulpProxy
  class Pulp3Plugin < ::Proxy::Plugin
    plugin "pulp3", ::PulpProxy::VERSION

    # ...

    # Static capability
    capability :pulp3

    # Dynamic capability that returns a single symbol or a list of symbols
    capability lambda { Pulp3Client.capabilities }
  end
end
```

This relies on a definition elsewhere that queries the Pulp API.

```ruby
module PulpProxy
  class Pulp3Client
    # ...

    def self.capabilities
      body = JSON.parse(get("api/v3/status/").body)
      body['versions'].map{ |item| item['component'] }
    rescue => e
      logger.error("Could not fetch capabilities: #{e.message}")
      []
    end
  end
end
```

As always, relying on a separate service can cause failures. In this case, we assume the Pulp 3 API is reliable. Unlucky timing could hide all capabilities. A more advanced solution would regularly poll Pulp 3 and cache the result. When implementing capabilities, it is advisable to use this but out of scope for this blog.

## Updating Foreman

The Foreman registration also needed to be updated. Previously it stored a Smart Proxy entity with Feature entities. To deal with the new datastructures the Feature entity was expanded to store a JSON serialized array of capabilities and a JSON serialized hash of settings. When refreshing features it first tries the `/v2/features` endpoint. Older proxies will return a 404 and the older `/features` endpoint is queried. In this case no settings nor capabilities are available.

Note that plugins can implement dynamic capabilities that call into backend services which can have an impact on the availability. For now it's best to not call this too often, but time will better indicate requirements in this area.

## Conclusion

The new registration framework allows communicating much more information and allow new solutions. I'm looking forward to what the developers come up with.
