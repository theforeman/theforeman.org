---
title: Glossary
---

# Glossary

The following terms are used throughout this document, and are important for the users understanding of Katello.

**Activation Key**
: A registration token which can be used in a kickstart file to control actions at registration.  These are similar to Activation Keys in Spacewalk, but they provide a subset of features because after registration, Puppet takes control of package and configuration management.

**Application Lifecycle Environment**
: Steps in a promotion path through the Software (Development) Life Cycle (SDLC). Content (packages, puppet modules) can be moved through lifecycle environments via content view publishing/promotion. Traditionally these environments are things like Development -> Test -> Production. Channel cloning was used to implement this concept for this in Spacewalk.

**Attach**
: Associating a Subscription to a Host which provides access to RPM content.

**Capsule**
: An additional "server" that can be used in a Katello deployment to facilitate content federation and distribution in addition to other localized services (Puppet master, DHCP, DNS, TFTP, and more).

**Change Set**
: Set of packages and puppet modules which are promoted between Application Lifecycle Environments. Katello records the progress of changesets as they promoted. Katello also provides audit capabilities to review how environments have changed over time.

**Compute Profile**
: Default attributes for new virtual machines on a compute resource.

**Compute Resource**
: A virtual fabric, or cloud infrastructure, where hosts can be deployed by Katello. Examples include RHEV-M, OpenStack, EC2, and VMWare.

**Content**
: Software packages (RPMS), Package Groups, Errata, and Puppet modules. These are synced into the Library and then promoted into Lifecycle Environments via Content Views in order to be used/consumed by Hosts.

**Content Delivery Network (CDN)**
: The mechanism to deliver Red Hat content in a geographically co-located fashion. For example, content which is synced by a Katello in Europe will pull content from a source in Europe.

**Content View**
: A definition of content that combines products, packages, errata and Puppet modules, with capabilities for intelligent filtering and snapshotting. Content Views are a refinement of the combination of channels and cloning from Spacewalk.

**External Node Classifier**
: A Puppet construct that provides additional data for a Puppet master to be used for configuring Hosts. Foreman acts as an External Node Classifier to Puppet Masters in a Satellite deployment.

**Facter**
: A program that provides information (facts) about the system on which it is run (eg: total memory, operating system version, architecture, etc.) Facter facts can be used in Puppet modules in order to enable specific configurations based on Host data.

**Hammer**
: The command line tool for Katello. Hammer can be used as a standard cli (and used in scripts) and can also be used as a shell in the same way that spacecmd, virsh and others work.

**Host**
: A system, either physical or virtual, which is managed by Katello.

**Host Group**
: A template for how a Host should be built. This includes the content view (which defines the available RPMs and Puppet modules), and the Puppet classes to apply (which determines the ultimate software and configuration).

**Location**
: A collection of default settings which represent a physical place. These can be nested so that a user can set up defaults, for example, for Europe, which are refined by Tel Aviv, which are refined by DataCenter East, and then finally by Rack 22.

**Library**
: The Library is the single origin of all content which can be used. If you are an Information Technology Infrastructure Library (ITIL) shop, it is your definitive media library.

**Manifest**
: The means of transferring subscriptions from a Subscription Provider (such as the Red Hat Customer portal) to Katello. This is similar in function to certificates used with Spacewalk.

**Organization**
: A tenant in Katello. Organizations, or orgs, are isolated collections of hosts, content and other functionality within a Katello deployment.

**Permission**
: The ability to perform an action.

**Product**
: A collection of content repositories.

**Promote**
: The act of moving content from one Application Lifecycle Environment to another.

**Provisioning Template**
: User defined templates for Kickstarts, snippets and other provisioning actions. These provide similar functionality to Kickstart Profiles and Snippets in Katello.

**Puppet Agent**
: An agent that runs on a Host that applies configuration changes to that Host.

**Puppet Class**
: A Puppet Class is re-usable named block of puppet manifest, similar to a class in an object-oriented programming language. Puppet classes must be included/instantiated in order to use their functionality. Puppet Classes can be parameterized - they can take parameters when they are included/instantiated and those parameters may be used by the underlying manifest to affect the ultimate configuration.

**Puppet Manifest**
: A Manifest is a simple set of Puppet instructions. Manifests typically have the .pp extension. A manifest is much like a procedure in programming terms.

**Puppet Master**
: A Capsule component that provides Puppet manifests to Hosts for execution by the Puppet Agent.

**Puppet Module**
: A Puppet Module is a set of Puppet manifests/classes, template files, tests and other components packaged together in a specific directory format. Puppet Modules are typically associated with specific software (eg: NTP, Apache, etc) and contain various classes used to assist in the installation and configuration of that software. Puppet Labs maintains a repository of official and user-contributed modules called the Puppet Forge.

**Pulp Node**
: A Capsule component that mirrors content. This is similar to the Spacewalk Proxy in Spacewalk. The main difference is that content can be pre-staged on the Pulp Node before it is used by a Host.

**Repository**
: A collection of content (yum repository, puppet repository).

**Role**
: A collection of permissions that are applied to a set of resources (such as Hosts).

**Smart Proxy**
: A Capsule component that can integrate with external services, such as DNS or DHCP.

**Smart Variable**
: A configuration value that controls how a Puppet Class behaves. This can be set on a Host, a Host Group, an Organization, or a Location.

**Standard Operating Environment (SOE)**
: A controlled version of the operating system on which applications are deployed.

**Subscription**
: The right to receive content and service from Red Hat. This is purchased by customers.

**Syncing**
: Mirroring content from external resources into an organization's Library.

**Sync Plans**
: Scheduled execution of syncing content.

**Usergroup**
: A collection of roles which can be assigned to a collection of users. This is similar to the Role in Spacewalk.

**User**
 : A human who works in Katello. Authentication and authorization can be done via built in logic, or using external LDAP or kerberos resources.
