---
layout: post
title: Using SAML for Single Sign-on to Foreman through Keycloak
date: 2018-06-15 10:45:00
author: Pep Turró Mauri
tags:
- foreman
- authentication
- saml
- sso
excerpt: |
  Foreman supports delegation of authentication to external providers, letting
  Apache handle user authentication through one of its authentication modules.
  One of such modules is `mod_auth_mellon`. It authenticates users against a
  SAML 2.0 IdP. Here we explore how to configure it to bring SAML to Foreman
  using Keycloak as the IdP and the assistance of the
  `keycloak-httpd-client-install` tool, which helps a lot in the often challenging
  task of configuring `mod_auth_mellon`.

---


Foreman supports delegation of authentication to external providers, and there's
documentation that explains how to use it to
[authenticate against a FreeIPA server](https://www.theforeman.org/manuals/1.17/index.html#5.7ExternalAuthentication).
External sources of authentication also include LDAP and Active Directory.

However, there is no official support yet for Single Sign-On (SSO) using
SAML. An [enhancement request](http://projects.theforeman.org/issues/16916)
exists for SAML authentication support in Foreman.  While the official support
gets implemented, here we're going to explain how to use the delegation
mechanism to configure Single Sign-On (SSO) via Apache's `mod_auth_mellon` to
provide SAML-based authentication.

To illustrate the example we will use [Keycloak](https://www.keycloak.org/) as
the SAML identity provider, with the assistance of the
`keycloak-httpd-client-install` tool to help us configure both Foreman and
Keycloak.


# Preparation

This example builds upon some pre-requisites:

-   A working installation of [Foreman](https://theforeman.org/) at `https://foreman.example.com`. Foreman is
    our SAML service provider. This example was developed with Foreman 1.17
    running on RHEL 7.4.

-   A working installation of [Keycloak](https://www.keycloak.org/) at `https://sso.example.com`, which will be
    our SAML identity provider. This example was developed using Red Hat Single
    Sign-on 7.2 (a downstream productized version of Keycloak) on top of RHEL 7.4.

In the Foreman system we are going to use the
[mod\_auth\_mellon](https://www.keycloak.org/docs/latest/securing_apps/index.html#_mod_auth_mellon)
Apache module, and we'll configure it with the help of the
[keycloak-httpd-client-install tool](https://github.com/jdennis/keycloak-httpd-client-install)
([man](https://www.mankier.com/8/keycloak-httpd-client-install)). The tool will
register Foreman as a client in Keycloak and will generate the initial
`mod_auth_mellon` configuration files for Foreman's Apache web server. We will
use a realm in Keycloak called *Example*.

First we need to install the required packages in `foreman.example.com`:

    yum install mod_auth_mellon keycloak-httpd-client-install

Then make sure that the systems involved have properly synchronized time using
NTP. A difference of seconds between the Foreman and Keycloak's clocks can
prevent SSO to work.


# Configure Foreman

We have to configure Foreman to allow delegation of user authentication to an
external provider. This requires the following settings:

1.  Enable external user authentication by setting `authorize_login_delegation` to `true`.

2.  Enable auto-creation of users from external authentication providers:
    `authorize_login_delegation_auth_source_user_autocreate` to `External`.

3.  Set `login_delegation_logout_url` to
    `https://foreman.example.com/saml2/logout?ReturnTo=https://foreman.example.com/users/extlogout`
    (replace the two occurrences of `foreman.example.com` with your
    Foreman's hostname). Without this, logging out from Foreman will not properly
    terminate your SSO session.

These can be set in foreman settings (`/etc/foreman/settings.yaml`) or via the
web UI (Administer &rarr; Settings &rarr; Authentication).


# Configure Apache mod\_auth\_mellon

As mentioned we will use the `keycloak-httpd-client-install` tool to generate the
initial configuration for SAML authentication:

    KEYCLOAK_URL=https://sso.example.com
    KEYCLOAK_REALM=Example
    KEYCLOAK_USER=admin
    
    keycloak-httpd-client-install \
       --app-name foreman \
       --keycloak-server-url $KEYCLOAK_URL \
       --keycloak-admin-username $KEYCLOAK_USER \
       --keycloak-realm $KEYCLOAK_REALM \
       --keycloak-admin-realm master \
       --keycloak-auth-role root-admin \
       --client-originate-method descriptor \
       --mellon-endpoint saml2 \
       -l /saml2 \
       -l /users/extlogin \
       --tls-verify false

Notes:

-   Do not put a / at the end of the `KEYCLOAK_URL`.

-   This assumes a user with admin rights to Keycloak's *master* realm. It's also
    possible to run the tool with less privileges over Keycloak, although it might
    require a few more options and/or some manual configuration steps.

-   Production environments should avoid the `--tls-verify false` setting. This
    example was developed in a test environment without proper TLS certificates.

This will generate, among others, this configuration file:

    # cat /etc/httpd/conf.d/foreman_mellon_keycloak_${KEYCLOAK_REALM}.conf
    <Location />
        MellonEnable info
        MellonEndpointPath /saml2/
        MellonSPMetadataFile /etc/httpd/saml2/foreman_sp_metadata.xml
        MellonSPPrivateKeyFile /etc/httpd/saml2/foreman.key
        MellonSPCertFile /etc/httpd/saml2/foreman.cert
        MellonIdPMetadataFile /etc/httpd/saml2/foreman_keycloak_Example_idp_metadata.xml
        MellonIdP IDP
    </Location>
    
    <Location /saml2>
        AuthType Mellon
        MellonEnable auth
        Require valid-user
    </Location>
    
    <Location /users/extlogin>
        AuthType Mellon
        MellonEnable auth
        Require valid-user
    </Location>

The referenced files in `/etc/httpd/saml2` are also generated by the tool, and a
new client will be registered on Keycloak under the specified realm.


# Additional configuration

At this point we should already be able to use single sign on, but there are still
a few items to improve.


## Allowing local/internal logins

The default configuration for `mod_auth_mellon` generated by the client
configuration tool assumes that all the locations in Foreman will use SAML auth
information. However, if we want to keep local (internal) user login —so we can
use an existing local administrator user, for example— we want to narrow down
the locations where `mod_auth_mellon` authentication is enabled to only the
external login URL (`/users/extlogin`) and the `mod_auth_mellon` endpoints under
`/saml2`.

Therefore, we will restrict the `MellonEnable` settings to these two locations:

-   *auth* for `/users/extlogin`
-   *info* for `/saml2`

We will keep a section with `Location /` to set common configuration parameters,
like certificate files that will be used in both locations.

With this configuration in place, users that want to log in using SSO will have
to go to this URL:

    https://foreman.example.com/users/extlogin

Users that want to log in using a local/internal user account will have to use
this URL instead:

    https://foreman.example.com/users/login

By default (e.g. when accessing `https://foreman.example.com`) users will be
directed to the external login process (Keycloak) for authentication.


## Attribute mapping

We need to tell both Keycloak and Foreman which attributes will be shared about the
authenticated users and how to map them.

In Keycloak, login as a realm administrator to the *Example* realm, go to
*Clients* and select the Foreman client that was registered by the
`keycloak-httpd-client-install` tool<sup><a id="fnr.1" class="footref" href="#fn.1">1</a></sup>. Then select the *Mappers* tab and
*Create* the following mappers, all of them with *Mapper Type = User Property*
and *SAML Attribute NameFormat = Basic*:

<table class="table table-bordered table-striped">

<colgroup>
<col  class="org-left" />
<col  class="org-left" />
<col  class="org-left" />
<col  class="org-left" />
</colgroup>

<thead>
<tr>
<th scope="col" class="org-left">Name</th>
<th scope="col" class="org-left">Property</th>
<th scope="col" class="org-left">Friendly Name</th>
<th scope="col" class="org-left">SAML Attribute Name</th>
</tr>
</thead>

<tbody>
<tr>
<td class="org-left">username</td>
<td class="org-left">username</td>
<td class="org-left">username</td>
<td class="org-left">username</td>
</tr>

<tr>
<td class="org-left">email</td>
<td class="org-left">email</td>
<td class="org-left">email</td>
<td class="org-left">email</td>
</tr>

<tr>
<td class="org-left">first\_name</td>
<td class="org-left">firstName</td>
<td class="org-left">First Name</td>
<td class="org-left">givenname</td>
</tr>

<tr>
<td class="org-left">last\_name</td>
<td class="org-left">lastName</td>
<td class="org-left">Last Name</td>
<td class="org-left">surname</td>
</tr>
</tbody>
</table>

In addition to these maps there should already be an existing one to pass on
group membership information; if it doesn't exist, create it too:

<table class="table table-bordered table-striped">

<colgroup>
<col  class="org-left" />
<col  class="org-left" />
<col  class="org-left" />
<col  class="org-left" />
<col  class="org-left" />
</colgroup>

<thead>
<tr>
<th scope="col" class="org-left">Name</th>
<th scope="col" class="org-left">Mapper Type</th>
<th scope="col" class="org-left">Friendly Name</th>
<th scope="col" class="org-left">Group Attribute Name</th>
<th scope="col" class="org-left">Full group path</th>
</tr>
</thead>

<tbody>
<tr>
<td class="org-left">group list</td>
<td class="org-left">username</td>
<td class="org-left">List of groups</td>
<td class="org-left">groups</td>
<td class="org-left">OFF</td>
</tr>
</tbody>
</table>

In the `mod_auth_mellon` configuration we will pass on the SAML attributes as
environment variables so that Foreman can consume them:

    MellonSetEnvNoPrefix "REMOTE_USER" username
    MellonSetEnvNoPrefix "REMOTE_USER_EMAIL" email
    MellonSetEnvNoPrefix "REMOTE_USER_FIRSTNAME" givenname
    MellonSetEnvNoPrefix "REMOTE_USER_LASTNAME" surname
    MellonSetEnvNoPrefix "REMOTE_USER_GROUP" groups

The *groups* attribute can have multiple values, and in this case Foreman
expects an env var with the number of groups (`REMOTE_USER_GROUP_N`) and a
`REMOTE_USER_GROUP_X` env var for each of the values, with `X` starting at 1. We
can ask Mellon to provide these with this additional configuration:

    MellonEnvVarsSetCount On
    MellonEnvVarsIndexStart 1


## Modified configuration file

The resulting `mod_auth_mellon` configuration file after all the changes above
have been applied looks like this:

    # cat /etc/httpd/conf.d/foreman_mellon_keycloak_${KEYCLOAK_REALM}.conf
    <Location />
        MellonEndpointPath /saml2/
        MellonSPMetadataFile /etc/httpd/saml2/foreman_sp_metadata.xml
        MellonSPPrivateKeyFile /etc/httpd/saml2/foreman.key
        MellonSPCertFile /etc/httpd/saml2/foreman.cert
        MellonIdPMetadataFile /etc/httpd/saml2/foreman_keycloak_Example_idp_metadata.xml
        MellonIdP IDP
        MellonEnvVarsSetCount On
        MellonEnvVarsIndexStart 1
        MellonSetEnvNoPrefix "REMOTE_USER" username
        MellonSetEnvNoPrefix "REMOTE_USER_EMAIL" email
        MellonSetEnvNoPrefix "REMOTE_USER_FIRSTNAME" givenname
        MellonSetEnvNoPrefix "REMOTE_USER_LASTNAME" surname
        MellonSetEnvNoPrefix "REMOTE_USER_GROUP" groups
    </Location>
    
    <Location /saml2>
        MellonEnable info
    </Location>
    
    <Location /users/extlogin>
        AuthType Mellon
        MellonEnable auth
        Require valid-user
    </Location>

If we compare it with the original file that the `keycloak-httpd-client-install`
tool generated, the differences are:

```diff
# diff -u1bB /etc/httpd/conf.d/foreman_mellon_keycloak_${KEYCLOAK_REALM}.conf{.orig,}
--- /etc/httpd/conf.d/foreman_mellon_keycloak_Example.conf.orig 2018-06-01 11:18:08.008972176 -0400
+++ /etc/httpd/conf.d/foreman_mellon_keycloak_Example.conf      2018-06-13 06:26:44.598612347 -0400
@@ -1,3 +1,2 @@
 <Location />
-    MellonEnable info
     MellonEndpointPath /saml2/
@@ -8,2 +7,9 @@
     MellonIdP IDP
+    MellonEnvVarsIndexStart 1
+    MellonEnvVarsSetCount On
+    MellonSetEnvNoPrefix "REMOTE_USER" username
+    MellonSetEnvNoPrefix "REMOTE_USER_EMAIL" email
+    MellonSetEnvNoPrefix "REMOTE_USER_FIRSTNAME" givenname
+    MellonSetEnvNoPrefix "REMOTE_USER_LASTNAME" surname
+    MellonSetEnvNoPrefix "REMOTE_USER_GROUP" groups
 </Location>
@@ -11,5 +17,3 @@
 <Location /saml2>
-    AuthType Mellon
-    MellonEnable auth
-    Require valid-user
+    MellonEnable info
 </Location>
```


# Conclusion

Foreman has the ability to delegate authentication to external providers, and in
this case it trusts Apache authentication modules to perform user authentication
and pass on user details via the environment.

Apache has various modules for user authentication. Foreman officially supports
and documents the usage of `mod_auth_pam` and `mod_auth_kerb`. By using
`mod_auth_mellon` we can easily add SAML based Single Sign-On to Foreman.

The `keycloak-httpd-client-install` tool facilitates the configuration of
`mod_auth_mellon` and its integration with Keycloak as a SAML identity provider.
With the help of that tool and a few changes to the automatically generated
configuration to adapt it to Foreman's needs, adding Single Sign-On capabilities
to Foreman via SAML is simple.


# Footnotes

<sup><a id="fn.1" href="#fnr.1">1</a></sup> which would be called
`https://foreman.example.com/saml2/metadata` as created by the
`keycloak-httpd-client-install` command above
