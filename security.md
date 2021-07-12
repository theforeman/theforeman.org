---
layout: security
title: Security
---

## Security process

We take security issues seriously and welcome responsible disclosure from researchers discovering vulnerabilities in Foreman.  Please email [foreman-security@googlegroups.com](mailto:foreman-security@googlegroups.com) (a private address for the security team) with all reports. If you notice the security issue is related to a particular plugin, please mention the plugin within the body of the email to help us in routing the issue to the most authoritative source.

We will endeavour to resolve high severity issues in the current stable release and lower severity issues in the next major release.  Announcements of security issues will be made on [foreman-announce](https://groups.google.com/forum/#!forum/foreman-announce) when a release containing a fix is available to end users and credit will be given to the researcher if desired.

The policy of the project is to treat all newly reported issues as private, and after evaluation, low to medium severity issues will be made public while high severity issues will be fixed under an embargo.  Typically the project supports only one major (x.y) release at a time, though high severity issues may also be fixed in the previous release if it was only recently superseded.

## Security advisories

All security advisories made for Foreman are listed below with their corresponding [CVE identifier](https://cve.mitre.org/).

* [CVE-2021-3584: Remote code execution through Sendmail configuration](#2021-3584)
* [CVE-2021-20259: Proxmox compute resource password leak](#2021-20259)
* [CVE-2021-3413: Azure compute resource secret_key leak](#2021-3413)
* [CVE-2020-14335: World readable dhcp OMAPI secret](security.html#2020-14335)
* [CVE-2020-14380: Users can gain elevated rights when logging in with SSO accounts](security.html#2020-14380)
* [CVE-2020-14334: World readable cache directory on RPM installs](security.html#2020-14334)
* [CVE-2019-14825: Registry credentials are captured in plain text in dynflow task during repository discovery](security.html#2019-14825)
* [CVE-2019-10198: Information disclosure in foreman tasks plugin](security.html#2019-10198)
* [CVE-2019-3845: Lack of access control around Qpid message broker](security.html#2019-3845)
* [CVE-2019-3893: Compute resource credentials exposed during deletion on API](security.html#2019-3893)
* [CVE-2018-14664: Persisted XSS on all pages that use breadcrumbs](security.html#2018-1097)
* [CVE-2018-1097: oVirt credetials exposed by power API](security.html#2018-1097)
* [CVE-2018-1096: SQL injection on dashboard](security.html#2018-1096)
* [CVE-2017-15100: Stored XSS in fact charts](security.html#2017-15100)
* [CVE-2017-7535: Stored XSS when assigning unassigned hosts to organization/location](security.html#2017-7535)
* [CVE-2017-7505: User scoped in organization with permissions for user management can manage administrators that are not assigned to any organization](security.html#2017-7505)
* [CVE-2017-2672: audit log stores plain text compute resource image passwords](security.html#2017-2672)
* [CVE-2017-2667: Hammer CLI does not verify server SSL certificate](security.html#2017-2667)
* [CVE-2016-9593: foreman-debug collects sensitive data](security.html#2016-9593)
* [CVE-2016-8639: settings dropdown menus may run stored XSS in org/location name](security.html#2016-8639)
* [CVE-2016-8634: organizations/locations wizard may run stored XSS in name](security.html#2016-8634)
* [CVE-2016-7078: user with no organizations or locations can see all resources](security.html#2016-7078)
* [CVE-2016-7077: information disclosure from association lists shown without authorization](security.html#2016-7077)
* [CVE-2016-6320: network interface device identifiers may contain stored XSS on host form](security.html#2016-6320)
* [CVE-2016-6319: Foreman form helpers do not escape JS when rendering label](security.html#2016-6319)
* [CVE-2016-5390: API host interfaces data not restricted by view_hosts filters](security.html#2016-5390)
* [CVE-2016-4995: information disclosure through unauthorized template previews](security.html#2016-4995)
* [CVE-2016-4475: Privilege escalation in Organization and Locations API and UI](security.html#2016-4475)
* [CVE-2016-4451: Privilege escalation through Organization and Locations API](security.html#2016-4451)
* [CVE-2016-3728: remote code execution in smart proxy TFTP API](security.html#2016-3728)
* [CVE-2016-3693: application information leakage through templates](security.html#2016-3693)
* [Ruby code execution via Discovery settings](security.html#2016-discovery-settings)
* [CVE-2016-2100: private bookmarks can be viewed and edited](security.html#2016-2100)
* [CVE-2015-7518: parameter information popup allows stored XSS](security.html#2015-7518)
* [SQL injection via facts search terms](security.html#2015-facts-sql)
* [CVE-2015-5282: parameter hide checkbox allows stored XSS during change](security.html#2015-5282)
* [CVE-2015-5246: Active Directory login works with old password after change](security.html#2015-5246)
* [CVE-2015-5233: reports show/destroy not restricted by host authorization](security.html#2015-5233)
* [CVE-2015-5152: require_ssl does not enforce HTTPS on API](security.html#2015-5152)
* [CVE-2015-3235: edit_users permission allows changing of admin passwords](security.html#2015-3235)
* [CVE-2015-3199: Discovery: auto provision rule not enforcing org/locations](security.html#2015-3199)
* [CVE-2015-3155: session cookie set without secure flag on HTTPS](security.html#2015-3155)
* [CVE-2015-1844: users are not restricted to organizations/locations](security.html#2015-1844)
* [CVE-2015-1816: SSL certificate not verified on LDAP connections](security.html#2015-1816)
* [CVE-2014-3691: SSL certificate verification bypass in smart proxy](security.html#2014-3691)
* [CVE-2014-3653: stored cross site scripting (XSS) in template previews](security.html#2014-3653)
* [CVE-2014-3590: user logout vulnerable to CSRF](security.html#2014-3590)
* [CVE-2014-3531: stored cross site scripting (XSS) in operating system names](security.html#2014-3531)
* [CVE-2014-3492: stored cross site scripting (XSS) in YAML preview](security.html#2014-3492)
* [CVE-2014-3491: stored cross site scripting (XSS) in notification dialogs](security.html#2014-3491)
* [CVE-2014-0007: TFTP boot file fetch API permits remote code execution](security.html#2014-0007)
* [CVE-2014-0208: stored cross site scripting (XSS) in search auto-completion](security.html#2014-0208)
* [CVE-2014-0192: provisioning template previews are world-readable](security.html#2014-0192)
* [CVE-2014-0135: Kafo leaves world-readable default_values.yaml file](security.html#2014-0135)
* [CVE-2014-0090: session fixation, new session IDs are not generated on login](security.html#2014-0090)
* [CVE-2014-0089: stored cross site scripting (XSS) on 500 error page](security.html#2014-0089)
* [CVE-2013-4386: SQL injection in host/host group parameter overrides](security.html#2013-4386)
* [CVE-2013-4182: hosts API privilege escalation](security.html#2013-4182)
* [CVE-2013-4180: DoS via hosts controller input conversion](security.html#2013-4180)
* [CVE-2013-2121: bookmarks remote code execution](security.html#2013-2121)
* [CVE-2013-2113: admin user creation, privilege escalation](security.html#2013-2113)
* [CVE-2013-0210: Arbitrary command execution risk in Foreman proxy](security.html#2013-0210)
* [CVE-2013-0187: XMLHttpRequest bypasses authorization](security.html#2013-0187)
* [CVE-2013-0174: exposed hashed root passwords can be retrieved by unauthenticated remote users](security.html#2013-0174)
* [CVE-2013-0173: insecure fixed salt "foreman" for passwords](security.html#2013-0173)
* [CVE-2013-0171: import allows unauthenticated YAML uploads/parsing leading to arbitrary code execution](security.html#2013-0171)
* [CVE-2012-5648: SQL injection through search mechanism](security.html#2012-5648)
* [CVE-2012-5477: world writable files in proxy](security.html#2012-5477)

### Disclosure details

#### <a id="2021-3584"></a>CVE-2021-3584: Remote code execution through Sendmail configuration

Sendmail location and arguments, available via Administer - Settings, both accept arbitrary strings and pass them into shell. By default, only Foreman super administrator can access settings.

*Mitigation 1:* Verify the both settings and remove edit_settings permissions to all roles and users until fixed.

*Mitigation 2:* Create entries in `settings.yaml` to override UI settings and make them read-only. Note that the installer will revert these changes. [#32827](https://projects.theforeman.org/issues/32827) will add options to the installer which makes it supported.

```yaml
:sendmail_location: "/usr/sbin/sendmail"
:sendmail_arguments: "-i"
```

* Affects Foreman version 1.15 and higher
* Fix released in Foreman 2.4.1, 2.5.1 and higher
* Redmine issue [#32753](https://projects.theforeman.org/issues/32753)

The issue was reported by Jakub Heba from AFINE.

#### <a id="2021-20259"></a>CVE-2021-20259: Proxmox compute resource password leak

Proxmox compute resource credentials (`password`) were visible to any user with `view_compute_resource` permission in the API under `/api/compute_resources/` and `/api/compute_resources/:id/`.

* Affects Foreman Fog Proxmox 0.11.0 and higher
* Fix released in Foreman Fog Proxmox 0.13.1 and higher

#### <a id="2021-3413"></a>CVE-2021-3413: Azure compute resource secret_key leak

Azure compute resource credentials (`secret_key`) were visible to any user with `view_compute_resource` permission in the API under `/api/compute_resources/` and `/api/compute_resources/:id/`.

* Affects Foreman Azure RM 2.0.1 and higher
* Fix released in Foreman Azure RM 2.2.0 and higher
* Redmine issue [#31938](https://projects.theforeman.org/issues/31938)

#### <a id="2020-14335"></a>CVE-2020-14335: World readable dhcp OMAPI secret could expose dhcp API access

OMAPI key used to secure dhcp API access could have been read by anyone with access to the hosting system.

*Mitigation:* override `/etc/dhcp/dhcpd.conf` file mode to `0640` and ensure access to the file for user `foreman-proxy` by other means.

On Red Hat based systems, acls are used by default, so you need to only set less permissive mode and you should be set.
On Debian based systems, you need to install acls and set read access to the `/etc/dhcp` directory by acls.
To set correct acls install `acl` package and use `setfacl -R -m u:foreman-proxy:rx /etc/dhcp`.

In case the system may have been accessed locally by an un-trusted user, it may be prudent to change the OMAPI secret for dhcp.

* Affects foreman-proxy installations with dhcp feature protected by `dhcp_key_secret` since Foreman 1.0
* Fix released in Foreman 2.2.0 and 2.1.3 and higher
* Redmine issue [#30489](https://projects.theforeman.org/issues/30489)

#### <a id="2020-14380"></a>CVE-2020-14380: Users can gain elevated rights when logging via external authentication

Users that are authenticated using `external` authentication methods such as Kerberos, OpenID Connect or Apache SSO can gain the rights of an `internal` user. This is possible only when the username of an internal and external user is the same.

- Affects external user authentication since Foreman 1.4
- Fix released in Foreman 2.2.0, 2.1.3 and 2.0.3 and higher
- Redmine issue [#30739](https://projects.theforeman.org/issues/30739)

#### <a id="2020-14334"></a>CVE-2020-14334: World readable cache could expose sensitive settings
Even encrypted settings have their raw values cached. Too permissive mode on cache dir caused, that anyone with access to the hosting system could read this encrypted settings.

*Mitigation:* override `/run/foreman` directory mode to `0750`.
To do so in a manner that survives reboot, update the file `/usr/lib/tmpfiles.d/foreman.conf`.
```
d /run/foreman 0750 foreman foreman -
```
For the change to have effect immediatelly run `systemd-tmpfiles --create`.

In case the system may have been accessed locally by an un-trusted user, it may be prudent to change any secrets stored in the settings, such as OAuth keys or remote execution passwords.

* Affects RPM installations using file cache since Foreman 1.3
* Fix released in Foreman 2.2.0, 2.1.1 and 2.0.2 and higher
* Redmine issue [#30490](https://projects.theforeman.org/issues/30490)

#### <a id="2019-14825"></a>CVE-2019-14825: Registry credentials are captured in plain text in dynflow task during repository discover
A cleartext password storage issue was discovered in Katello. Registry credentials used during container image discovery were inadvertently logged without being masked. This could expose the registry credentials to other privileged users.

* Affects Katello 3.4 and higher.
* Fix released in Katello 3.14.0 and higher.
* Redmine issue [#27485](https://projects.theforeman.org/issues/27485)

#### <a id="2019-10198"></a>CVE-2019-10198: Authorization bypass in foreman tasks plugin
The Foreman tasks plugin allowed authenticated users to view task details even if they lack the permission to do so. This bypass requires prior knowledge of the task UUID, which can not be easily guessed.

* Affects Foreman tasks 0.7.8 and higher.
* Fix released in Foreman tasks 0.15.7 and higher.
* Redmine issue [#27275](https://projects.theforeman.org/issues/27275)

#### <a id="2019-3845"></a>CVE-2019-3845: Lack of access control around Qpid message broker
Katello installations include the Apache Qpid message broker and dispatch router services. It was found that due to the lack of access permissions around the message broker and router, clients using the katello-agent for package management could invoke QMF (QPid Management Framework) actions against the broker. QMF enables broker settings, queues, exchanges, etc. to be manipulated and those actions could compromise communication between hosts and the server, or allow undesired katello-agent actions to be invoked across clients. This issue was reported by Pavel Moravec.

* Affects Katello 1.4 and higher.
* Fix released with Foreman 1.20.3 (Katello 3.10.1), Foreman 1.21.3 (Katello 3.11.1) and higher.
* Redmine issue [#26571](https://projects.theforeman.org/issues/26571)

#### <a id="2019-3893"></a>CVE-2019-3893: Compute resource credentials exposed during deletion on API

When deleting a compute resource via the API, the API responded with details of the compute resource, including credentials in clear text. Users not able to upgrade should ensure the `delete_compute_resource` permission is not granted to users not trusted with the credentials.

* Affects Foreman 1.1 and higher.
* Fix released with Foreman 1.21.1.
* Redmine issue [#26450](https://projects.theforeman.org/issues/26450)

#### <a id="2018-14664"></a>CVE-2018-14664: Persisted XSS on all pages that use breadcrumbs

If user has the permission to edit resource which attribute is user in the breadcrumbs bar, it's not properly escaped allowing attacker to store code, that will be executed on client side. E.g. create a domain with name test.com, the go to it's edit form. See the breadcrumb didn't escape the HTML code.

* Affects Foreman 1.18 and higher
* Fix released with Foreman 1.18.3
* Redmine issue [#25169](https://projects.theforeman.org/issues/25169)

#### <a id="2018-1097"></a>CVE-2018-1097: oVirt credentials exposed by power API

When sending a power action to a host provisioned on an oVirt compute resource, the API responded with details of the compute resource, including credentials in clear text.

* Affects Foreman 1.3 and higher.
* Fix released with Foreman 1.16.1.
* Redmine issue [#22546](https://projects.theforeman.org/issues/22546)

#### <a id="2018-1096"></a>CVE-2018-1096: SQL injection on dashboard

One of the parameters passed when saving dashboard widget positions was not properly escaped, leading to possibility of SQL injection attack. Due to the nature of the query the impact is limited to possible information disclosure and does not allow modifications to the database.

This issue was reported by Martin Povolný of Red Hat.

* Affects Foreman 1.9 and higher.
* Fix released with Foreman 1.16.1.
* Redmine issue [#23028](https://projects.theforeman.org/issues/23028)

#### <a id="2017-15100"></a>CVE-2017-15100: Stored XSS on fact related charts

Facts reported by hosts that contain HTML code in their fact name or value could cause said HTML to be executed by users' browser when hovering over fact distribution charts on the facts page, on the statistic page and on the trends page.

This issue was reported by Roman Mueller.

* Affects Foreman 1.2 and higher.
* Fix released with Foreman 1.16.0
* Redmine issue [#21519](https://projects.theforeman.org/issues/21519)

#### <a id="2017-7535"></a>CVE-2017-7535: Stored XSS when assigning unassigned hosts to organization/location

An organization or location named e.g. `<script>do_evil();</script>` may cause the script to be executed if a user tries to assign selected or all unassigned hosts to said organization or location.

This issue was reported by Sanket Jagtap.

* Affects Foreman 1.1 and higher.
* Fix released with Foreman 1.16.0
* Redmine issue [#20963](https://projects.theforeman.org/issues/20963)

#### <a id="2017-7505"></a>CVE-2017-7505: User scoped in organization with permissions for user management can manage administrators that are not assigned to any organization

User with `*_users` permissions who is assigned to some organization(s) can do all operations granted by these permissions on all administrator user objects. We considered admin to effectively be present in all organizations.

The issue was reported by David Caplan.

* Affects Foreman 1.5 and higher
* Fix released with Foreman 1.15.1
* Redmine issue [#19612](https://projects.theforeman.org/issues/19612)

#### <a id="2017-2672"></a>CVE-2017-2672: audit log stores plain text compute resource image passwords

Compute resource images added/registered in Foreman with username and password credentials will have the password stored in plain text in the audit log. A user with permission to view the audit log can view the password and may gain access to newly provisioned hosts.

This issue was reported by Daniel Kimsey.

* Affects Foreman 1.4 and higher
* Fix released with Foreman 1.15.0-RC2
* Redmine issue [#19169](https://projects.theforeman.org/issues/19169)

#### <a id="2017-2667"></a>CVE-2017-2667: Hammer CLI does not verify server SSL certificate

HTTPS connections initiated by Hammer CLI to the API server do not perform validation of the server SSL/TLS certificate, allowing for a man-in-the-middle attack against the user.

This issue was reported by Tomas Strachota.

* Affects all versions of Hammer CLI
* Fix released in Hammer CLI 0.10.0 (with Foreman 1.15.0)
* Redmine issue [#19033](https://projects.theforeman.org/issues/19033)

#### <a id="2016-9593"></a>CVE-2016-9593: foreman-debug collects sensitive data

It was found that foreman-debug did not obfuscate sensitive information (such as passwords, answer and configuration options) from the foreman-installer log file, allowing a user authorized to access the archives created by foreman-debug to gain access to potentially sensitive information.

This issue was reported by Pavel Moravec.

* Affects Foreman 1.2.0 up to and including 1.14.x
* Fix released with Foreman 1.15.0-RC1
* Redmine issue [#17005](https://projects.theforeman.org/issues/17005)

#### <a id="2016-8639"></a>CVE-2016-8639: settings dropdown menus may run stored XSS in org/location name

If an organization or location is created with a name containing HTML, then the administrator-only Settings page will render the HTML as part of a dropdown menu.

This may permit a stored XSS attack if an organization/location with HTML in the name is created, then an administrator attempts to change the default organization/location settings.

_Mitigation:_ restrict permissions to organization and location creation, use the API or CLI instead to change the default organization/location settings.

_Note:_ this CVE identifier has been assigned retrospectively, to describe a vulnerability that was fixed during a refactoring of the affected code.

This issue was reported by Sanket Jagtap.

* Affects Foreman 1.11.0 to 1.12.4
* Fix released in Foreman 1.13.0
* Redmine issue [#15037](https://projects.theforeman.org/issues/15037)

#### <a id="2016-8634"></a>CVE-2016-8634: organizations/locations wizard may run stored XSS in name

When creating an organization or location in Foreman, if the name contains HTML then the second step of the wizard will render the HTML. This occurs in the alert box on the page.

This may permit a stored XSS attack if an organization/location with HTML in the name is created, then a user is linked directly to this URL.

_Mitigation:_ restrict permissions to organization and location creation, don't follow untrusted links to Foreman.

This issue was reported by Sanket Jagtap.

* Affects Foreman 1.1 and higher
* Fix released in Foreman 1.14.0-RC1
* Redmine issue [#17195](https://projects.theforeman.org/issues/17195)

#### <a id="2016-7078"></a>CVE-2016-7078: user with no organizations or locations can see all resources

A user account that is associated to no organizations or locations is able to view resources from all organizations/locations in the web UI or API, when either the organization or location feature is enabled. The user remains subject to permissions and filters on their assigned roles.

_Mitigation:_ ensure all users are assigned to at least one organization or location, or disable the feature if unused.

This issue was reported by Daniel Lobato Garcia.

* Affects all known Foreman versions
* Fix released in Foreman 1.15.0-RC1
* Redmine issue [#16982](https://projects.theforeman.org/issues/16982)

#### <a id="2016-7077"></a>CVE-2016-7077: information disclosure from association lists shown without authorization

Lists of associated resources, such as operating systems associated to a new architecture, are not restricted to listing resources that the user is authorized to view, when rendering with fewer than six items. The list will show all possible associated resources, disclosing their names.

This issue was reported by Jitendra Yejare.

* Affects Foreman 1.1 and higher, but was first mitigated against in Foreman 1.9.0 for some cases
* Fix released in Foreman 1.14.0-RC1
* Redmine issue [#16971](https://projects.theforeman.org/issues/16971)

#### <a id="2016-6320"></a>CVE-2016-6320: network interface device identifiers may contain stored XSS on host form

Network interface identifiers stored for hosts may contain HTML or JavaScript that allows a stored XSS (cross-site scripting) vulnerability when later viewing the host edit form.

This issue was reported by Sanket Jagtap.

* Affects Foreman 1.8.0 and higher
* Fix released in Foreman 1.12.2
* Redmine issue [#16022](https://projects.theforeman.org/issues/16022)

#### <a id="2016-6319"></a>CVE-2016-6319: Foreman form helpers do not escape JS when rendering label

Label parameter of all form helpers was not escaped allowing XSS (cross-site scripting). The Foreman itself did not contain exploitable code but other plugins that relied on form helpers could be vulnerable. One known vulnerable plugin is Remote Execution. All versions of this plugin are affected.

* Affects Foreman 1.6.0 and higher
* Fix released in Foreman 1.12.2
* Redmine issue [#16024](https://projects.theforeman.org/issues/16024)

#### <a id="2016-5390"></a>CVE-2016-5390: API host interfaces data not restricted by view_hosts filters

Non-admin users with the view_hosts permission containing a filter are able to access API routes beneath "hosts" such as GET /api/v2/hosts/secrethost/interfaces without the filter being taken into account. This allows users to access network interface details (including BMC login details) for any host.

The filter is only correctly used when accessing the main host details (/api/v2/hosts/secrethost). Access to the "nested" routes, which includes interfaces, reports, parameters, audits, facts and Puppet classes, is not authorized beyond requiring any view_hosts permission.

* Affects Foreman 1.10.0 and higher
* Fix released in Foreman 1.12.1 and 1.11.4
* Redmine issue [#15653](https://projects.theforeman.org/issues/15653)

#### <a id="2016-4995"></a>CVE-2016-4995: information disclosure through unauthorized template previews

Users who are logged in with permissions to view some hosts are able to preview provisioning templates for any host by specifying its hostname in the URL, as the specific view_hosts permissions and filters aren't checked.

If the organization or location features are enabled, the user will still be restricted to their associated orgs/locs.

* Affects Foreman 1.11.0 and higher
* Fix released in Foreman 1.12.1 and 1.11.4
* Redmine issue [#15490](https://projects.theforeman.org/issues/15490)

#### <a id="2016-4475"></a>CVE-2016-4475: Privilege escalation in Organization and Locations API and UI

When accessing Foreman as a user limited to specific organization or location, these are not taken into account in the API or parts of the UI. This allows a user to view, edit and delete organizations and locations they are not associated with if they have the requisite permissions.

*Mitigation:* make sure you have filters restricted to organizations or locations when you limit user by assigning them to particular organizations or locations.

* Affects Foreman 1.1 and higher
* Fix released in Foreman 1.12.0-RC3 and 1.11.4
* Redmine issue [#15268](https://projects.theforeman.org/issues/15268)

#### <a id="2016-4451"></a>CVE-2016-4451: Privilege escalation through Organization and Locations API

When accessing Foreman as a user limited to specific organization, if users know other organization id and have unlimited filters they can access/modify other organization data. They just have to set the id as API parameter.

*Mitigation:* make sure you have filters restricted to organizations or locations when you limit user by assigning him particular organization or location.

* Affects Foreman 1.7 and higher
* Fix released in Foreman 1.12.0-RC1 and 1.11.3
* Redmine issue [#15812](https://projects.theforeman.org/issues/15182)

#### <a id="2016-3728"></a>CVE-2016-3728: remote code execution in smart proxy TFTP API

The smart proxy TFTP API is vulnerable to arbitrary remote code execution, as it passes untrusted user input (the PXE template type) to the eval() function causing it to be executed.

Thanks to Lukas Zapletal for reporting the issue.

*Mitigation:* ensure `trusted_hosts` is set in `/etc/foreman-proxy/settings.yml`, HTTPS is in use and `/etc/foreman-proxy/settings.d/tftp.yml` is configured for `https` only (if enabled).

* Affects Foreman 0.2 and higher
* Fix released in Foreman 1.11.2 and 1.10.4
* Redmine issue [#14931](https://projects.theforeman.org/issues/14931)

#### <a id="2016-3693"></a>CVE-2016-3693: application information leakage through templates

A provisioning template containing `inspect` will expose sensitive information about the Rails controller and application when rendered when using Safemode rendering (the default setting). This includes the application secret token, possibly permitting a privilege escalation.

Thanks to Ivan Necas for reporting the issue.

As a precaution, the security token may be regenerated with:

1. `chown foreman /usr/share/foreman/config/initializers/local_secret_token.rb`
1. `foreman-rake security:generate_token`
1. `chown root /usr/share/foreman/config/initializers/local_secret_token.rb`

*Mitigation:* remove edit_provisioning_templates from untrusted users.

* Affects all known Foreman versions
* Fix released in Foreman 1.11.1
* Redmine issue [#14635](https://projects.theforeman.org/issues/14635)

#### <a id="2016-discovery-settings"></a>Ruby code execution via Discovery settings

It is possible to run arbitrary Ruby code entering it on the Administer -
Settings - Discovery and then visiting a discovered host detail page where it
gets rendered.

* Affects Foreman Discovery 4.2.0 to 5.0.1 (gem releases only, rc and nightly builds)
* Discovery plugin 4.1 series (shipped with Foreman 1.10) was *not* affected.
* Fixed in Discovery plugin 5.0.2
* Redmine issue [#14140](https://projects.theforeman.org/issues/14140)

#### <a id="2016-2100"></a>CVE-2016-2100: private bookmarks can be viewed and edited

Bookmarks set to 'private' can be viewed by any user, and edited or deleted by any user granted the edit or destroy_bookmarks permissions.

*Mitigation:* remove edit_bookmarks and destroy_bookmarks from untrusted users, remove private information from bookmark searches.

* Affects Foreman 0.3 and higher
* Fix released in Foreman 1.11.0-RC2 and 1.10.3
* Redmine issue [#13828](https://projects.theforeman.org/issues/13828)

#### <a id="2015-7518"></a>CVE-2015-7518: parameter information popup allows stored XSS

The popup boxes next to global parameters, smart class parameters and smart variables on the host and host group edit forms can allow stored XSS to be executed in the browser from the parameter description etc.

*Mitigation:* do not click on the information popup box next to parameters in the host/group forms, and/or remove permission to edit Puppet classes from untrusted users.

* Affects all known Foreman versions
* Fix released in Foreman 1.10.0
* Redmine issue [#12611](https://projects.theforeman.org/issues/12611)

#### <a id="2015-facts-sql"></a>SQL injection via facts search terms

The search for facts and also hosts by facts is vulnerable to SQL injection by breaking out of quotes in either the fact name or the fact value.

No CVE identifier will be assigned to this vulnerability as it affects only release candidates.

* Affects Foreman 1.10.0-RC1 and higher
* Fix released in Foreman 1.10.0-RC3
* Redmine issue [#12458](https://projects.theforeman.org/issues/12458)

#### <a id="2015-5282"></a>CVE-2015-5282: parameter hide checkbox allows stored XSS during change

The parameter management UI has a checkbox to mark values as hidden to mask them from casual viewing. The checkbox that hides/shows the value fails to handle HTML properly and so is vulnerable to an XSS issue where HTML can be stored in a parameter, and executed by another user if they later tick/untick the hide box.

* Affects Foreman 1.7.0 and higher
* Fix released in Foreman 1.10.0-RC1
* Redmine issue [#11859](https://projects.theforeman.org/issues/11859)

#### <a id="2015-5246"></a>CVE-2015-5246: Active Directory login works with old password after change

*This CVE identifier was assigned before realizing that this was not a bug in Foreman, but a feature of Active Directory.  It will remain assigned for future reference only.  See [the Active Directory password changes](/manuals/latest/index.html#4.1.1LDAPAuthentication) section of the manual or [Microsoft KB906305](https://support.microsoft.com/en-us/kb/906305) for more details.*

When using an Active Directory instance to log into Foreman (via an LDAP authentication source), it is possible to log into Foreman for up to one hour after a password change in AD using the old password.

* Fix to Foreman not required, reconfigure Active Directory
* Redmine issue [#11471](https://projects.theforeman.org/issues/11471)

#### <a id="2015-5233"></a>CVE-2015-5233: reports show/destroy not restricted by host authorization

Users with view_reports or destroy_reports permissions allows a user to view or delete reports from any host without taking their view_hosts permission into account.

The reports list and other views combine the reports and hosts permissions to only show reports for hosts that a user can view, but the individual report show/delete pages and APIs do not apply the hosts permissions.

*Mitigation:* remove view_reports and destroy_reports permissions from users until a fix is available, or add a search query to the role filter to restrict it.

* Affects Foreman 1.5.0 and higher
* Fix released in Foreman 1.9.1 and 1.8.4
* Redmine issue [#11579](https://projects.theforeman.org/issues/11579)

#### <a id="2015-5152"></a>CVE-2015-5152: require_ssl does not enforce HTTPS on API

The "require_ssl" setting in /etc/foreman/settings.yml should enforce that web requests sent to Foreman over HTTP are redirected to HTTPS, but this was found not to happen with API requests (e.g. from Hammer CLI). Foreman will process API requests over HTTP, but should have redirected.

Redirection won't help with credentials having already been sent, but should give some notification that the user/app is using the wrong URL.

*Mitigation:* add the following to the Apache HTTP VirtualHost, e.g. in `/etc/httpd/conf.d/05-foreman.d/api_request.conf`:

    RewriteEngine On
    RewriteRule ^/api/(.*) https://%{SERVER_NAME}/api/$1 [R,L]

* Affects Foreman 1.1 and higher
* Fix released in Foreman 1.9.0-RC1
* Redmine issue [#11119](https://projects.theforeman.org/issues/11119)

#### <a id="2015-3235"></a>CVE-2015-3235: edit_users permission allows changing of admin passwords

A user with the edit_users permission (e.g. with the Manager role) is allowed to edit admin users. This allows them to change the password of the admin user's account and gain access to it.

*Mitigation:* change roles of users with the edit_users permission, remove the *Unlimited* flag and set a search query of `admin = false`.

* Affects all known Foreman versions
* Fix released in Foreman 1.9.0-RC1
* Redmine issue [#10829](https://projects.theforeman.org/issues/10829)

#### <a id="2015-3199"></a>CVE-2015-3199: Discovery: auto provision rule not enforcing org/locations

*This CVE identifier was assigned before realizing that no released versions of Foreman Discovery were affected.  It will remain assigned for future reference only.*

The Foreman Discovery plugin auto provisioning rules do not enforce that the rule and the assigned host group are in the same organization and location.  This can allow a rule to be configured with mismatched orgs/locations, and for another user who has access to the rule but not the host group, to run it and provision a host into a group in a different org/location to their own.

* Affects no released versions of Foreman Discovery
* Fix released in Foreman Discovery 4.0.0
* Redmine issue [#10469](https://projects.theforeman.org/issues/10469)

#### <a id="2015-3155"></a>CVE-2015-3155: session cookie set without secure flag on HTTPS

The session cookie created when accessing the Foreman web UI over HTTPS is not set with the 'secure' flag, which may lead to session hijacking.

If a user successfully logs into Foreman, then accesses Foreman over HTTP (which redirects to HTTPS, but with a window of opportunity), the session ID will be sent unencrypted and the session may be hijacked by an attacker.

* Affects all known Foreman versions
* Fix released in Foreman 1.8.1
* Redmine issue [#10275](https://projects.theforeman.org/issues/10275)

#### <a id="2015-1844"></a>CVE-2015-1844: users are not restricted to organizations/locations

When a non-admin user is associated to organizations or locations, their access is not correctly restricted.  API access allows access to resources in any org/location, and UI access when the user is associated to more than one org/location is not restricted.

This allows users to read, edit and perform actions on resources (e.g. hosts) outside of the organizations or locations they have been assigned to.

* Affects Foreman 1.2.0 (TBC) and higher
* Fix released in Foreman 1.8.0-RC3 and 1.7.5
* Redmine issue [#9947](https://projects.theforeman.org/issues/9947)

#### <a id="2015-1816"></a>CVE-2015-1816: SSL certificate not verified on LDAP connections

When making an SSL connection to an LDAP authentication source in Foreman, the remote server certificate is accepted without any verification against known certificate authorities.

This can allow the LDAP connection between Foreman and the LDAP server to be attacked, and a different LDAP server could be contacted to authenticate users to Foreman.

* Affects Foreman 1.3.0 and higher
* Fix released in Foreman 1.7.4 and 1.8.0-RC2
* Redmine issue [#9858](https://projects.theforeman.org/issues/9858)

#### <a id="2014-3691"></a>CVE-2014-3691: SSL certificate verification bypass in smart proxy

The smart proxy (foreman-proxy) fails to block connections when no client SSL certificate is supplied, instead permitting any request.  Typically the smart proxy is configured to receive HTTPS requests with a client SSL certificate that is signed by the same CA (certificate authority) as its own, preventing unauthorized access to manage services such as DHCP, DNS and the Puppet CA.

It is strongly recommended to mitigate the problem by restricting access to the smart proxy.  More information on [foreman-announce](https://groups.google.com/forum/#!topic/foreman-announce/jXC5ixybjqo).

Thanks to Michael Moll, Jon McKenzie and Michael Messmore for reporting the issue.

* Affects all known Foreman versions
* Fix released in Foreman 1.6.2 and 1.5.4
* Redmine issue [#7822](https://projects.theforeman.org/issues/7822)
* Red Hat Bugzilla [#1150879](https://bugzilla.redhat.com/show_bug.cgi?id=CVE-2014-3691)

#### <a id="2014-3653"></a>CVE-2014-3653: stored cross site scripting (XSS) in template previews

Provisioning templates can store HTML and then evaluate HTML or JS content when using the editor's preview function.

Thanks to Aaron Stone for reporting this issue.

* Affects all known Foreman versions
* Fix released in Foreman 1.6.1
* Redmine issue [#7483](https://projects.theforeman.org/issues/7483)
* Red Hat Bugzilla [#1145398](https://bugzilla.redhat.com/show_bug.cgi?id=CVE-2014-3653)

#### <a id="2014-3590"></a>CVE-2014-3590: user logout vulnerable to CSRF

The user logout function could be triggered through cross-site request forgery (e.g. a redirect), causing a user to be logged out and lose their active session.

Thanks to Jan Hutař of Red Hat for discovering this issue.

* Affects all known Foreman versions
* Fix released in Foreman 1.6.1
* Redmine issue [#6999](https://projects.theforeman.org/issues/6999)
* Red Hat Bugzilla [#1128108](https://bugzilla.redhat.com/show_bug.cgi?id=CVE-2014-3590)

#### <a id="2014-3531"></a>CVE-2014-3531: stored cross site scripting (XSS) in operating system names

Operating system names and descriptions could store and cause evaluation of HTML in page views, allowing a cross site scripting (XSS) attack against the user.

Thanks to Jan Hutař of Red Hat for discovering this issue.

* Affects all known Foreman versions
* Fix released in Foreman 1.5.2
* Redmine issue [#6580](https://projects.theforeman.org/issues/6580)
* Red Hat Bugzilla [#1108745](https://bugzilla.redhat.com/show_bug.cgi?id=CVE-2014-3531)

#### <a id="2014-3492"></a>CVE-2014-3492: stored cross site scripting (XSS) in YAML preview

The host YAML page, used to preview the Foreman response for the Puppet ENC, will evaluate HTML stored in any host data such as parameters or comments, allowing a cross site scripting (XSS) attack against the user.

* Affects all known Foreman versions
* Fix released in Foreman 1.4.5 and 1.5.1
* Redmine issue [#6149](https://projects.theforeman.org/issues/6149)
* Red Hat Bugzilla [#1108241](https://bugzilla.redhat.com/show_bug.cgi?id=CVE-2014-3492)

#### <a id="2014-3491"></a>CVE-2014-3491: stored cross site scripting (XSS) in notification dialogs

When resources (e.g. a host group) were saved or deleted through the web UI, the name of the resource would be evaluated unsafely inside the notification popup, allowing a cross site scripting (XSS) attack against the user changing the resource.

Thanks to Adam Salah of the Red Hat Satellite 6 QE Team for discovering this issue.

* Affects all known Foreman versions
* Fix released in Foreman 1.4.5 and 1.5.1
* Redmine issue [#5881](https://projects.theforeman.org/issues/5881)
* Red Hat Bugzilla [#1100313](https://bugzilla.redhat.com/show_bug.cgi?id=CVE-2014-3491)

#### <a id="2014-0007"></a>CVE-2014-0007: TFTP boot file fetch API permits remote code execution

The Smart Proxy API for downloading boot files from installation media to the TFTP server was vulnerable to remote code execution exploits.

Thanks to Lukas Zapletal of the Red Hat Foreman Team for discovering this issue.

* Affects all known Foreman versions
* Fix released in Foreman 1.4.5 and 1.5.1
* Redmine issue [#6086](https://projects.theforeman.org/issues/6086)
* Red Hat Bugzilla [#1105369](https://bugzilla.redhat.com/show_bug.cgi?id=CVE-2014-0007)

#### <a id="2014-0208"></a>CVE-2014-0208: stored cross site scripting (XSS) in search auto-completion

The search auto-completion was vulnerable to a stored cross site scripting (XSS) attack via completion of (global/host) parameters in search keys.

Thanks to Jan Hutař of Red Hat for discovering this issue.

* Affects all known Foreman versions
* Fix released in Foreman 1.4.4 and 1.5.0
* Redmine issue [#5471](https://projects.theforeman.org/issues/5471)
* Red Hat Bugzilla [#1094642](https://bugzilla.redhat.com/show_bug.cgi?id=CVE-2014-0208)

#### <a id="2014-0192"></a>CVE-2014-0192: provisioning template previews are world-readable

Provisioning templates previews ("spoof") are accessible without authentication when used with the hostname parameter.

* Affects Foreman 1.4.0 to 1.4.3 inclusive
* Fix released in Foreman 1.4.4 and 1.5.0
* Redmine issue [#5436](https://projects.theforeman.org/issues/5436)
* Red Hat Bugzilla [#1092354](https://bugzilla.redhat.com/show_bug.cgi?id=CVE-2014-0192)

#### <a id="2014-0135"></a>CVE-2014-0135: Kafo leaves world-readable default_values.yaml file

When Kafo (used in the Foreman installer) runs, a /tmp/default_values.yaml file is written to and created with world readable permissions.  This is prone to race-condition attacks and contains default values for all parameters, such as autogenerated passwords.

* Affects all known Kafo versions
* Fix released in Kafo 0.3.17 and 0.5.2 (to Foreman 1.4 and 1.5 repos respectively)
* Redmine issue [#4648](https://projects.theforeman.org/issues/4648)
* Red Hat Bugzilla [#1076335](https://bugzilla.redhat.com/show_bug.cgi?id=CVE-2014-0135)

#### <a id="2014-0090"></a>CVE-2014-0090: session fixation, new session IDs are not generated on login

Upon successful login, a new session ID was not generated for the user, so an attacker who had set the session ID in the request from the user's browser would be able to exploit the escalated session with the user's privileges.

Thanks to Jeremy Choi and Keqin Hong of the Red Hat HSS Pen-Test Team for discovering this issue.

* Affects all known Foreman versions
* Fix released in Foreman 1.4.2
* Redmine issue [#4457](https://projects.theforeman.org/issues/4457)
* Red Hat Bugzilla [#1072151](https://bugzilla.redhat.com/show_bug.cgi?id=CVE-2014-0090)

#### <a id="2014-0089"></a>CVE-2014-0089: stored cross site scripting (XSS) on 500 error page

The 500 error page was vulnerable to stored cross site scripting attacks, where the error message was rendered without HTML encoding.  In addition, bookmarks could be saved by any user with HTML in the name which caused an error when rendering the bookmark list, leading to a 500 error and execution of the HTML in the browser.

Thanks to Jeremy Choi and Keqin Hong of the Red Hat HSS Pen-Test Team for discovering this issue.

* Affects Foreman 1.4.0 to 1.4.1 inclusive
* Fix released in Foreman 1.4.2
* Redmine issue [#4456](https://projects.theforeman.org/issues/4456)
* Red Hat Bugzilla [#1071741](https://bugzilla.redhat.com/show_bug.cgi?id=CVE-2014-0089)

#### <a id="2013-4386"></a>CVE-2013-4386: SQL injection in host/host group parameter overrides

Host and host group parameter overrides (lookup_values) allowed SQL injection from the host FQDN or host group label.

* Fix released in Foreman 1.2.3
* Redmine issue [#3160](https://projects.theforeman.org/issues/3160)
* Red Hat Bugzilla [#1013076](https://bugzilla.redhat.com/show_bug.cgi?id=CVE-2013-4386)

#### <a id="2013-4182"></a>CVE-2013-4182: hosts API privilege escalation

The /api/hosts API was found to provide access to all hosts without checking whether the current user has privileges to view a particular host.

Thanks to Daniel Lobato Garcia of CERN IT-PES-PS for discovering this issue.

* Fix released in Foreman 1.2.2
* Redmine issue [#2863](https://projects.theforeman.org/issues/2863)
* Red Hat Bugzilla [#990374](https://bugzilla.redhat.com/show_bug.cgi?id=CVE-2013-4182)

#### <a id="2013-4180"></a>CVE-2013-4180: DoS via hosts controller input conversion

Power and IPMI boot actions converted user input to symbols, which could lead to memory exhaustion.

Thanks to Marek Hulan of the Red Hat Foreman Team for discovering this issue.

* Fix released in Foreman 1.2.2
* Redmine issue [#2860](https://projects.theforeman.org/issues/2860)
* Red Hat Bugzilla [#989755](https://bugzilla.redhat.com/show_bug.cgi?id=CVE-2013-4180)

#### <a id="2013-2121"></a>CVE-2013-2121: bookmarks remote code execution

Bookmarks could be created in Foreman containing data that was later executed arbitrarily when reading the bookmark.

Thanks to Ramon de C Valle of the Red Hat Product Security Team for discovering this issue.

* Fix released in Foreman 1.2.0
* Redmine issue [#2631](https://projects.theforeman.org/issues/2631)
* Red Hat Bugzilla [#968166](https://bugzilla.redhat.com/show_bug.cgi?id=CVE-2013-2121)

#### <a id="2013-2113"></a>CVE-2013-2113: admin user creation, privilege escalation

Non-admin user with permissions to create or edit other users were able to change the admin flag, or assign roles that they themselves do not have, enabling a privilege escalation.

Thanks to Ramon de C Valle of the Red Hat Product Security Team for discovering this issue.

* Fix released in Foreman 1.2.0
* Redmine issue [#2630](https://projects.theforeman.org/issues/2630)
* Red Hat Bugzilla [#966804](https://bugzilla.redhat.com/show_bug.cgi?id=CVE-2013-2113)

#### <a id="2013-0210"></a>CVE-2013-0210: Arbitrary command execution risk in smart proxy

Requests to the smart proxy Puppet run API were not properly escaped when running the Puppet command, leading to possible arbitrary command execution.

* Fix released in Foreman 1.2.0

#### <a id="2013-0187"></a>CVE-2013-0187: XMLHttpRequest bypasses authorization

XMLHttpRequest or AJAX requests to Foreman were not subject to authorization checks, enabling privilege escalation for authenticated users.

* Fix released in Foreman 1.1

#### <a id="2013-0174"></a>CVE-2013-0174: exposed hashed root passwords can be retrieved by unauthenticated remote users

The external node classifier (ENC) API in Foreman was accessible to any remote host and the output would contain the hashed root psasword (used for unattended installation).  Authentication and authorization features were added to the ENC API to secure this data.

Thanks to Andreas Rogge for discovering this issue.

* Fix released in Foreman 1.1
* Redmine issue [#2069](https://projects.theforeman.org/issues/2069)

#### <a id="2013-0173"></a>CVE-2013-0173: insecure fixed salt "foreman" for passwords

The salt used to hash root passwords (used for unattended installation) was fixed to the string "foreman" instead of being randomized.

* Fix released in Foreman 1.1
* Redmine issue [#2069](https://projects.theforeman.org/issues/2069)

#### <a id="2013-0171"></a>CVE-2013-0171: import allows unauthenticated YAML uploads/parsing leading to arbitrary code execution

Fact and report import APIs in Foreman were accessible to any remote host and accepted YAML input, allowing arbitrary objects to be created on the Foreman server via YAML.  Authentication and authorization features were added to the import APIs to prevent this.

* Fix released in Foreman 1.1
* Redmine issue [#2121](https://projects.theforeman.org/issues/2121)

#### <a id="2012-5648"></a>CVE-2012-5648: SQL injection through search mechanism

Input to the search mechanism in Foreman was not escaped when constructing queries, enabling SQL injection into the resulting query.

* Fix released in Foreman 1.0.2

#### <a id="2012-5477"></a>CVE-2012-5477: world writable files in smart proxy

The smart proxy daemon ran with a umask of 0, causing files and directories written by it to have world-writable bits set.  Files managed by the smart proxy could be modified by local users on the same host.

* Fix released in Foreman 1.1
* Redmine issue [#1929](https://projects.theforeman.org/issues/1929)

## GPG keys

The Foreman project uses multiple GPG keys to sign packages and release artifacts.  All stable releases will be signed by one of the keys.  Nightly and plugin Debian packages will be signed, while nightly and plugin RPM packages will not (this may change in the future).

Signing for the Debian family of operating systems is via secure apt and more information, including verification steps can be found [on the Debian web site](https://wiki.debian.org/SecureApt#Debian_archive_key_expiry).  RPMs themselves are signed and can be verified using `rpm --checksig PACKAGE`.  All yum repository configs set up by foreman-release RPMs or the installer will enable GPG checking by default.

Key management is changing at the time of writing to cycle nightly keys every two years, and issue limited duration keys per stable release.

<div>
  <table class="table table-bordered table-condensed">
    <thead>
      <tr>
        <th>Key ID</th>
        <th>Fingerprint</th>
        <th>Description</th>
        <th>Created</th>
        <th>Expires</th>
        <th>Revoked</th>
        <th>Notes</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td><a href="https://pgp.mit.edu:11371/pks/lookup?op=get&search=0x1DCB15D12CA140EEF4947E5766CF053FE775FF07">E775FF07</a></td>
        <td>1DCB 15D1 2CA1 40EE F494  7E57 66CF 053F E775 FF07</td>
        <td>Foreman Archive Signing Key</td>
        <td style='white-space:nowrap'>2010-11-10</td>
        <td style='white-space:nowrap'></td>
        <td style='white-space:nowrap'><a href="https://groups.google.com/forum/#!topic/foreman-announce/BiIT784Mb7Q">2014-07-08</a></td>
        <td>Used up to Foreman 1.5.1</td>
      </tr>
      <tr>
        <td><a href="https://pgp.mit.edu:11371/pks/lookup?op=get&search=0x7059542D5AEA367F78732D02B3484CB71AA043B8">1AA043B8</a></td>
        <td>7059 542D 5AEA 367F 7873  2D02 B348 4CB7 1AA0 43B8</td>
        <td>Foreman Automatic Signing Key (2014)</td>
        <td style='white-space:nowrap'>2014-07-01</td>
        <td style='white-space:nowrap'>2016-06-30</td>
        <td style='white-space:nowrap'></td>
        <td></td>
      </tr>
      <tr>
        <td><a href="https://pgp.mit.edu:11371/pks/lookup?op=get&search=0xAE0AF310E2EA96B6B6F4BD726F8600B9563278F6">563278F6</a></td>
        <td>AE0A F310 E2EA 96B6 B6F4  BD72 6F86 00B9 5632 78F6</td>
        <td>Foreman Automatic Signing Key (2016)</td>
        <td style='white-space:nowrap'>2016-04-08</td>
        <td style='white-space:nowrap'>2018-04-08</td>
        <td style='white-space:nowrap'></td>
        <td></td>
      </tr>
      <tr>
        <td><a href="https://pgp.mit.edu:11371/pks/lookup?op=get&search=0xA91E2984667D1F07">667D1F07</a></td>
        <td>503E FA96 89AA AD57 D693  6514 A91E 2984 667D 1F07</td>
        <td>Foreman Release Signing Key (1.6)</td>
        <td style='white-space:nowrap'>2014-08-14</td>
        <td style='white-space:nowrap'>2015-08-14</td>
        <td style='white-space:nowrap'></td>
        <td></td>
      </tr>
      <tr>
        <td><a href="https://pgp.mit.edu:11371/pks/lookup?op=get&search=0x4C258BD42D762E88">2D762E88</a></td>
        <td>730A 9338 F93E E729 2EAC  2052 4C25 8BD4 2D76 2E88</td>
        <td>Foreman Release Signing Key (1.7)</td>
        <td style='white-space:nowrap'>2014-11-10</td>
        <td style='white-space:nowrap'>2016-11-09</td>
        <td style='white-space:nowrap'></td>
        <td></td>
      </tr>
      <tr>
        <td><a href="https://pgp.mit.edu:11371/pks/lookup?op=get&search=0x28F5A69D225C9B71">225C9B71</a></td>
        <td>64E3 7B1F A6C0 2416 6B53  5495 28F5 A69D 225C 9B71</td>
        <td>Foreman Release Signing Key (1.8)</td>
        <td style='white-space:nowrap'>2015-03-09</td>
        <td style='white-space:nowrap'>2016-03-08</td>
        <td style='white-space:nowrap'></td>
        <td></td>
      </tr>
      <tr>
        <td><a href="https://pgp.mit.edu:11371/pks/lookup?op=get&search=0xE05F71576E2A21BF">6E2A21BF</a></td>
        <td>BEA5 E3F6 AF59 7107 0241  4514 E05F 7157 6E2A 21BF</td>
        <td>Foreman Release Signing Key (1.9)</td>
        <td style='white-space:nowrap'>2015-06-26</td>
        <td style='white-space:nowrap'>2016-06-25</td>
        <td style='white-space:nowrap'></td>
        <td></td>
      </tr>
      <tr>
        <td><a href="https://pgp.mit.edu:11371/pks/lookup?op=get&search=0xC1B2621DBE67E9DA">BE67E9DA</a></td>
        <td>9EFD 673A 649D 77F5 C615  44AC C1B2 621D BE67 E9DA</td>
        <td>Foreman Release Signing Key (1.10)</td>
        <td style='white-space:nowrap'>2015-10-07</td>
        <td style='white-space:nowrap'>2016-10-06</td>
        <td style='white-space:nowrap'></td>
        <td></td>
      </tr>
      <tr>
        <td><a href="https://pgp.mit.edu:11371/pks/lookup?op=get&search=0x335F3A453494A06D">3494A06D</a></td>
        <td>6681 20FA 0528 3FD2 AF60  FC3A 335F 3A45 3494 A06D</td>
        <td>Foreman Release Signing Key (1.11)</td>
        <td style='white-space:nowrap'>2016-02-17</td>
        <td style='white-space:nowrap'>2017-02-16</td>
        <td style='white-space:nowrap'></td>
        <td></td>
      </tr>
      <tr>
        <td><a href="https://pgp.mit.edu:11371/pks/lookup?op=get&search=0xB507F6A67D492D06">7D492D06</a></td>
        <td>860D D70A 378A 84CE 8D47  C10E B507 F6A6 7D49 2D06</td>
        <td>Foreman Release Signing Key (1.12)</td>
        <td style='white-space:nowrap'>2016-05-31</td>
        <td style='white-space:nowrap'>2017-05-31</td>
        <td style='white-space:nowrap'></td>
        <td></td>
      </tr>
      <tr>
        <td><a href="https://pgp.mit.edu:11371/pks/lookup?op=get&search=0x4EA2F7E77DFE6FC2">7DFE6FC2</a></td>
        <td>84E7 90DF FB1D 2EAE C429  C6CD 4EA2 F7E7 7DFE 6FC2</td>
        <td>Foreman Release Signing Key (1.13)</td>
        <td style='white-space:nowrap'>2016-09-05</td>
        <td style='white-space:nowrap'>2017-09-05</td>
        <td style='white-space:nowrap'></td>
        <td></td>
      </tr>
      <tr>
        <td><a href="{{ site.baseurl }}/static/keys/F06D8950.pub">F06D8950</a></td>
        <td>AF74 2A91 BF76 6333 E9FF  5EAA BFE5 1511 F06D 8950</td>
        <td>Foreman Release Signing Key (1.14)</td>
        <td style='white-space:nowrap'>2016-12-06</td>
        <td style='white-space:nowrap'>2017-12-06</td>
        <td style='white-space:nowrap'></td>
        <td></td>
      </tr>
      <tr>
        <td><a href="{{ site.baseurl }}/static/keys/9A8DAAD5.pub">9A8DAAD5</a></td>
        <td>6610 7FC8 658F F702 E849  9AC4 17A3 FD24 9A8D AAD5</td>
        <td>Foreman Release Signing Key (1.15)</td>
        <td style='white-space:nowrap'>2017-03-29</td>
        <td style='white-space:nowrap'>2018-03-29</td>
        <td style='white-space:nowrap'></td>
        <td></td>
      </tr>
      <tr>
        <td><a href="{{ site.baseurl }}/static/keys/897740E9.pub">5245FE1D</a></td>
        <td>41EE 8815 A84C ACA4 A583  5055 9C21 BCB2 8977 40E9</td>
        <td>Foreman Release Signing Key (1.16)</td>
        <td style='white-space:nowrap'>2017-09-21</td>
        <td style='white-space:nowrap'>2018-09-21</td>
        <td style='white-space:nowrap'></td>
        <td></td>
      </tr>
      <tr>
        <td><a href="{{ site.baseurl }}/static/keys/2A8CA27B.pub">2A8CA27B</a></td>
        <td>B59D DB6C AB83 5E19 14DE  4725 F5F9 54D9 2A8C A27B</td>
        <td>Foreman Release Signing Key (1.17)</td>
        <td style='white-space:nowrap'>2017-11-21</td>
        <td style='white-space:nowrap'>2018-11-21</td>
        <td style='white-space:nowrap'></td>
        <td></td>
      </tr>
      <tr>
        <td><a href="{{ site.baseurl }}/static/keys/57CEF41F.pub">57CEF41F</a></td>
        <td>6973 3EEC D1AE 1E23 71FA  04EA 4C3D D0B3 57CE F41F</td>
        <td>Foreman Release Signing Key (1.18)</td>
        <td style='white-space:nowrap'>2018-04-10</td>
        <td style='white-space:nowrap'>2019-04-10</td>
        <td style='white-space:nowrap'></td>
        <td></td>
      </tr>
      <tr>
        <td><a href="{{ site.baseurl }}/static/keys/46020A10694FA479.pub">46020A10694FA479</a></td>
        <td>CE31 59AA C3EC 09E5 1614  7754 4602 0A10 694F A479</td>
        <td>Foreman Release Signing Key (1.19)</td>
        <td style='white-space:nowrap'>2018-07-17</td>
        <td style='white-space:nowrap'>2019-07-17</td>
        <td style='white-space:nowrap'></td>
        <td></td>
      </tr>
      <tr>
        <td><a href="{{ site.baseurl }}/static/keys/5C75B050DD0692EB042B5C822EC99767565EA533.pub">2EC99767565EA533</a></td>
        <td>5C75 B050 DD06 92EB 042B  5C82 2EC9 9767 565E A533</td>
        <td>Foreman Release Signing Key (1.20)</td>
        <td style='white-space:nowrap'>2018-10-15</td>
        <td style='white-space:nowrap'>2019-10-15</td>
        <td style='white-space:nowrap'></td>
        <td></td>
      </tr>
      <tr>
        <td><a href="{{ site.baseurl }}/static/keys/BCF45390249051C42432F7EF107BC89F19D72D85.pub">107BC89F19D72D85</a></td>
        <td>BCF4 5390 2490 51C4 2432  F7EF 107B C89F 19D7 2D85</td>
        <td>Foreman Release Signing Key (1.21)</td>
        <td style='white-space:nowrap'>2019-01-11</td>
        <td style='white-space:nowrap'>2020-01-11</td>
        <td style='white-space:nowrap'></td>
        <td></td>
      </tr>
      <tr>
        <td><a href="{{ site.baseurl }}/static/keys/9365257981403859B36B3738163F76F3B36987A9.pub">9365257981403859B36B3738163F76F3B36987A9</a></td>
        <td>9365 2579 8140 3859 B36B  3738 163F 76F3 B369 87A9</td>
        <td>Foreman Release Signing Key (1.22)</td>
        <td style='white-space:nowrap'>2019-04-23</td>
        <td style='white-space:nowrap'>2020-04-22</td>
        <td style='white-space:nowrap'></td>
        <td></td>
      </tr>
      <tr>
        <td><a href="{{ site.baseurl }}/static/keys/4674C97BD8C2A3EF63BCB20788BB5C467B5B366A.pub">4674C97BD8C2A3EF63BCB20788BB5C467B5B366A</a></td>
        <td>4674 C97B D8C2 A3EF 63BC  B207 88BB 5C46 7B5B 366A</td>
        <td>Foreman Release Signing Key (1.23)</td>
        <td style='white-space:nowrap'>2019-07-29</td>
        <td style='white-space:nowrap'>2020-07-28</td>
        <td style='white-space:nowrap'></td>
        <td></td>
      </tr>
      <tr>
        <td><a href="{{ site.baseurl }}/static/keys/D885D3D9B12FA857CDECE3F1B76498E45AA9BCAD.pub">D885D3D9B12FA857CDECE3F1B76498E45AA9BCAD</a></td>
        <td>D885 D3D9 B12F A857 CDEC  E3F1 B764 98E4 5AA9 BCAD</td>
        <td>Foreman Release Signing Key (1.24)</td>
        <td style='white-space:nowrap'>2019-10-29</td>
        <td style='white-space:nowrap'>2020-10-28</td>
        <td style='white-space:nowrap'></td>
        <td></td>
      </tr>
      <tr>
        <td><a href="{{ site.baseurl }}/static/keys/06ABEFE26C1997E0C9E56508926EA0100579BAEE.pub">06ABEFE26C1997E0C9E56508926EA0100579BAEE</a></td>
        <td>06AB EFE2 6C19 97E0 C9E5  6508 926E A010 0579 BAEE</td>
        <td>Foreman Release Signing Key (2.0)</td>
        <td style='white-space:nowrap'>2020-02-11</td>
        <td style='white-space:nowrap'>2021-02-10</td>
        <td style='white-space:nowrap'></td>
        <td></td>
      </tr>
      <tr>
        <td><a href="{{ site.baseurl }}/static/keys/0F71D9EAC889A0F2C2CD8190628005A4B6F08CCF.pub">0F71D9EAC889A0F2C2CD8190628005A4B6F08CCF</a></td>
        <td>0F71 D9EA C889 A0F2 C2CD  8190 6280 05A4 B6F0 8CCF</td>
        <td>Foreman Release Signing Key (2.1)</td>
        <td style='white-space:nowrap'>2020-05-12</td>
        <td style='white-space:nowrap'>2021-05-12</td>
        <td style='white-space:nowrap'></td>
        <td></td>
      </tr>
      <tr>
        <td><a href="{{ site.baseurl }}/static/keys/939E2FD66DF9A4104869FD182A63B068C7C509FA.pub">939E2FD66DF9A4104869FD182A63B068C7C509FA</a></td>
        <td>939E 2FD6 6DF9 A410 4869  FD18 2A63 B068 C7C5 09FA</td>
        <td>Foreman Release Signing Key (2.2)</td>
        <td style='white-space:nowrap'>2020-08-03</td>
        <td style='white-space:nowrap'>2021-08-03</td>
        <td style='white-space:nowrap'></td>
        <td></td>
      </tr>

      <tr>
        <td><a href="{{ site.baseurl }}/static/keys/1CC363863DD64AF30638DB79C101586BE0745924.pub">1CC363863DD64AF30638DB79C101586BE0745924</a></td>
        <td>1CC3 6386 3DD6 4AF3 0638  DB79 C101 586B E074 5924</td>
        <td>Foreman Automatic Signing Key (2.3)</td>
        <td style='white-space:nowrap'>2020-11-02</td>
        <td style='white-space:nowrap'>2021-11-02</td>
        <td style='white-space:nowrap'></td>
        <td></td>
      </tr>
      <tr>
        <td><a href="{{ site.baseurl }}/static/keys/643253F71B82B1BEAF2E1D4FA439BD55AC2AD9F1.pub">643253F71B82B1BEAF2E1D4FA439BD55AC2AD9F1</a></td>
        <td>6432 53F7 1B82 B1BE AF2E  1D4F A439 BD55 AC2A D9F1</td>
        <td>Foreman Automatic Signing Key (2.4)</td>
        <td style='white-space:nowrap'>2021-02-01</td>
        <td style='white-space:nowrap'>2022-02-01</td>
        <td style='white-space:nowrap'></td>
        <td></td>
      </tr>
      <tr>
        <td><a href="{{ site.baseurl }}/static/keys/7EF7E6EA4022F241BB89A149955C283E7522CC3F.pub">7EF7E6EA4022F241BB89A149955C283E7522CC3F</a></td>
        <td>7EF7 E6EA 4022 F241 BB89  A149 955C 283E 7522 CC3F</td>
        <td>Foreman Automatic Signing Key (2.5)</td>
        <td style='white-space:nowrap'>2021-04-26</td>
        <td style='white-space:nowrap'>2022-04-26</td>
        <td style='white-space:nowrap'></td>
        <td></td>
      </tr>
    </tbody>
  </table>
</div>

### Key changes in July 2014

In July 2014 after a server was compromised, the existing GPG key (0xE775FF07) was revoked and replaced with a new key (0x1AA043B8) as a precaution.  All existing packages were re-signed with the new key and thereafter, new major releases are signed with new per-release keys.

All users with the old key trusted are urged to immediately disable this as follows:

* Debian users must run `sudo apt-key del E775FF07`
* RPM users must run `sudo rpm -e gpg-pubkey-e775ff07-4cda3cf9`

More information is available in [the announcement](https://groups.google.com/forum/#!topic/foreman-announce/BiIT784Mb7Q).
