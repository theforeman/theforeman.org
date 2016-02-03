---
layout: post
title: EC2 provisioning using Foreman - update
date: 2016-02-03 14:25:45
author: Stefan - Zipkid - Goethals, VRT.be
tags:
- ec2
- puppet
- foreman
- provisioning
- aws
- uuid
- virtualizaition
guest_post: true
guest_url: http://zipkid.eu/
---

Back in 2012 Ohad Levy wrote an excellent [blog post](http://theforeman.org/2012/05/ec2-provisioning-using-foreman.html) on this subject. The concepts and steps to perform he explains are still mainly correct and relevant but the UI has changed enough to justify a new post.

A lot of time has passed since then and many Foreman versions, with many improvements and changes, have passed.
It is time for an updated HOWTO on this subject. This post will mainly be a shameless copy-paste of his post with updated names, details and screenshots to accommodate the differences between version 0.5 and 1.10.

### Configuring AWS

Select **Infrastructure &gt; Compute Resources**. **Compute Resources** are services that can generate a host, e.g.
VMWare, libvirt, openstack etc.

Click on **New Compute Resource** and fill in the information about your
new compute resource, normally the name should represent something
meaningful to you, such as a combination of the ec2 region and the
account used.

if everything is entered correctly, you should be able to get back a
list of regions and select the region that you would like to deploy
to.

![New Compute Resource](/static/images/blog_images/2016-02-03-ec2-provisioning-using-foreman-update/Screenshot_2016-02-03_15.06.41.png)

Foreman would then automatically create a new set of SSH keypairs, which
would be used in order to configure the instance (you may remove them
later on).

Then, the next step is to define which images are allowed to use and
assign them to Foreman Operation systems / architectures.

Click on the **image** tab and select **New Image**.

![New Image](/static/images/blog_images/2016-02-03-ec2-provisioning-using-foreman-update/Screenshot_2016-02-03_15.08.23.png)

Since i am using an image that supports cloud-init i check the appropriate
box. If you don't use cloud-init, it is very important that you define
the correct user for foreman to SSH to the instance, that is configured
on the ami (normally the ubuntu user, or ec2-user) and of course, the ami id.


![Image List](/static/images/blog_images/2016-02-03-ec2-provisioning-using-foreman-update/Screenshot_2016-02-03_15.09.31.png)

### Compute profiles

Compute profiles are a way of expressing a set of defaults for VMs created on a specific compute resource that can be mapped to an operator-defined label. This means an administrator can express, for example, what "Small", Medium" or "Large" means on all of the individual compute resources present for a given installation.

Select **Infrastructure &gt; Compute Profiles** There you can either edit an existing one or select
**New Compute Profile**

![New Compute Profile](/static/images/blog_images/2016-02-03-ec2-provisioning-using-foreman-update/Screenshot_2016-02-03_15.12.16.png)

Give it a meaningful name and after submitting select the **Compute Resource** to edit the details for.

![Compute Profile List](/static/images/blog_images/2016-02-03-ec2-provisioning-using-foreman-update/Screenshot_2016-02-03_15.12.29.png)

![Compute Profile Compute Resource](/static/images/blog_images/2016-02-03-ec2-provisioning-using-foreman-update/Screenshot_2016-02-03_15.12.50.png)

Foreman is now ready to create your instance, however, in order to
automate fully puppet to load upon instance launch, we need to associate
the correct user-data, this is where the provisioning templates
comes into play.

### Configuring Provisioning Templates

Add or edit a provisioning template, **Hosts &gt; Provisioning Templates**

You can use the search box that will also suggest search terms to find the type
of template you're looking for.

![Template search](/static/images/blog_images/2016-02-03-ec2-provisioning-using-foreman-update/Screenshot_2016-02-03_15.13.41.png)

I will be using the 'Preseed default user data' template. Select the
**Association** tab

![Template Association](/static/images/blog_images/2016-02-03-ec2-provisioning-using-foreman-update/Screenshot_2016-02-03_15.14.19.png)

You need to select the Operating system this user-data can be used on.

### Operating systems

The Operating system must now be edited to use the associated template.
Go to **Hosts &gt; Operating Systems** and select the OS. There go to the
**Templates** tab. There select the wanted user_data template to use.

![Operating System](/static/images/blog_images/2016-02-03-ec2-provisioning-using-foreman-update/Screenshot_2016-02-03_15.15.19.png)

### Actual instance launch

Goto to the **Hosts** tab, click on **New Host**, among other settings,
make sure you select your compute resource,  image and hardware profile

#### Primary tab

![Primary tab](/static/images/blog_images/2016-02-03-ec2-provisioning-using-foreman-update/Screenshot_2016-02-03_15.17.36.png)

#### Interfaces tab

![Interfaces tab](/static/images/blog_images/2016-02-03-ec2-provisioning-using-foreman-update/Screenshot_2016-02-03_15.18.06.png)

#### Operating System tab

Select the correct values and click the **Resolve** button to link the template.

![Operating System tab](/static/images/blog_images/2016-02-03-ec2-provisioning-using-foreman-update/Screenshot_2016-02-03_15.18.25.png)

#### Virtual Machine tab

![Virtual Machine tab](/static/images/blog_images/2016-02-03-ec2-provisioning-using-foreman-update/Screenshot_2016-02-03_15.20.54.png)

#### Progress bar

![Progress bar](/static/images/blog_images/2016-02-03-ec2-provisioning-using-foreman-update/Screenshot_2016-02-03_15.21.58.png)

#### Completed Host

![Completed Host](/static/images/blog_images/2016-02-03-ec2-provisioning-using-foreman-update/Screenshot_2016-02-03_15.22.14.png)

#### EC2 Console

![Progress bar](/static/images/blog_images/2016-02-03-ec2-provisioning-using-foreman-update/Screenshot_2016-02-03_15.31.02.png)

Now your host is ready for use. :-)
