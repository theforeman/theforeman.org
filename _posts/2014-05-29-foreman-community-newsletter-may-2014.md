---
layout: post
title: Foreman Community Newsletter - May 2014
date: '2014-05-29T11:22:00.004+03:00'
author: Dominic Cleal
tags:
- plugin
- community
- newsletter
- opennebula
modified_time: '2014-05-29T11:23:08.662+03:00'
blogger_id: tag:blogger.com,1999:blog-6789674575954398874.post-1467880936542123519
blogger_orig_url: http://blog.theforeman.org/2014/05/foreman-community-newsletter-may-2014.html
---

<!--more-->

### Foreman 1.5.0 released!

Thanks to our [many
contributors](http://theforeman.org/manuals/1.5/index.html#Contributors)
and testers during the Foreman 1.5 development cycle, as with their help
we released Foreman 1.5.0 in early May.  
  
The full set of release notes are in the Foreman 1.5 manual:  

-   [Foreman 1.5 release
    notes](http://theforeman.org/manuals/1.5/index.html#Releasenotesfor1.5) 

An update release (1.5.1) is planned shortly as a follow-up for some
bugs found in the release.  
  

### Recent articles

#### Introduction to Foreman

Felix Massem has written an instructional series of articles for
codecentric introducing Foreman and showing how they carry out automated
provisioning with Foreman and Puppet.  

-   [“The Foreman” – A complete lifecycle management
    tool](https://blog.codecentric.de/en/2014/04/foreman-complete-lifecycle-management-tool/)
-   [“The Foreman” – Automatic installation of “The Foreman” with
    Puppet](https://blog.codecentric.de/en/2014/05/foreman-automatic-installation-foreman-puppet/)

#### Systemmanagement mit Puppet und Foreman (German)

Mattias Giese presented at Linux-Tage in March on the subject of Foreman
and integrating it with other systems management projects such as
Puppet, Spacewalk, Icinga and PuppetDB.  Audio and slides available in
German.  
  
Also linked below is a published paper from Mattias on the subject of
easy system administration with Foreman and Puppet.  

-   [Systemmanagement mit Puppet und
    Foreman](http://chemnitzer.linux-tage.de/2014/en/vortraege/detail/227)
-   [Komfortable Systemverwaltung mit Foreman und
    Puppet](https://www.heise.de/artikel-archiv/ix/2013/12/072_Ordnung-auf-der-Baustelle) (paywall)

  

### OpenNebula integration

Achim Ledermüller and Sebastian Saemann from NETWAYS have released an
early version of [foreman-one](https://github.com/NETWAYS/foreman-one),
a new plugin providing OpenNebula compute resource integration for
Foreman.  
  
Currently this is pending on inclusion of a patch for OpenNebula in Fog,
the cloud library that Foreman uses to work with compute resources. 
Enthusiastic users can run foreman-one with this patch in a [development
environment](http://theforeman.org/contribute.html).  We'll provide
updates as soon as this is more generally consumable.  
  
Read more in Sebastian's article on OpenNebula.org:  

-   [OpenNebula and Foreman
    integration](http://opennebula.org/foreman-integration/) (English)
-   [Foreman, Fog und
    OpenNebula](https://blog.netways.de/2014/05/20/foreman-fog-und-opennebula/) (German)

  

### Recent videos

While we've mostly been consumed by the 1.5 release, the past few weeks
added some new features to show off in the regular sprint demo.  
  
This includes changes to the admin account and installer CLI support,
improved Chef support (linking hosts to Chef proxies) and a new
drag-and-drop dashboard page for plugins to extend.  

-   [Foreman Sprint 23
    demo](https://www.youtube.com/watch?v=723hOFocd8o)

The "staypuft" plugin project is designed to extend Foreman to install
hosts running OpenStack services.  They've released a video showing the
end to end process (note, no audio).  Packages for the adventurous are
available in the nightly repositories, starting with
foreman-installer-staypuft.  

-   [Staypuft installation
    demo](https://www.youtube.com/watch?v=W1deqJz7q1w)
