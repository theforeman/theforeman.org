---
title: Troubleshooting Content Hosts
---

# Troubleshooting Content Hosts


## Registration Issues

Starting with Katello 3.12, content hosts are required to have a unique UUID reported by subscription-manager when registering. This UUID comes from the BIOS or virtualization layer and is unique in most cases. If a registering host reports a UUID that matches an existing registration an error will be received on the client:

```
The DMI UUID of this host (ABF18D4C-2708-11B2-A85C-AA9890D228CC) matches other registered hosts: host-a.example.com, host-b.example.com
```

Action should be taken in order to ensure that the reported UUID is unique. However, Katello provides two mechanisms to provide a temporary solution so that the content host can be registered and receive updates while the underlying cause is resolved.

### Client-side DMI UUID override

The DMI UUID can be overridden on the content host itself by setting a custom fact value which will be uploaded by subscription-manager.

First, generate a new UUID:

```
[root@myhost ~]$ uuidgen
eae7fe44-8256-4072-813f-0e1d691f093c
```

Take the generated UUID and place it into a JSON structure and save it to a file where subscription-manager can find it:

```
echo '{"dmi.system.uuid": "eae7fe44-8256-4072-813f-0e1d691f093c"}' > /etc/rhsm/facts/uuid_override.facts
```

subscription-manager will now report this value to the Katello server

```
subscription-manager facts | grep dmi.system.uuid
dmi.system.uuid: eae7fe44-8256-4072-813f-0e1d691f093c
```

Registration should be successful at this point.

### Server-side BIOS UUID override
If overriding the BIOS UUID from the client side (preferred) is not an option, Katello can be configured to automatically generate a suitable UUID at registration-time. In order to do so, the problematic UUID must be noted from the registration error received by the client. It can also be found in the server production.log

With the DMI UUID handy, navigate to Administer -> Settings -> Content in the UI. Find the setting named 'Host Duplicate DMI UUIDs' and edit its value. The value must be in array format, ex: ['ABF18D4C-2708-11B2-A85C-AA9890D228CC'] Multiple values can be separated by commas.

After saving, any content hosts with the UUID(s) applied in the setting will have a new DMI UUID created when registering that will persist when the host checks in. However, this value exists on the server only and is not pushed to the client.
