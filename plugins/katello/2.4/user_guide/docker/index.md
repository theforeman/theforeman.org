---
layout: plugins/katello/documentation
title: Docker Management
version: 2.4
sidebar: sidebars/documentation.html
---

# Docker Management

Katello can be used to manage and deploy [Docker](https://www.docker.com/) content. Katello can retreive Docker content from a variety of sources such as Docker hub, private Docker registries, the Red Hat CDN, and so forth. Docker content can then be published and promoted via [Content Views](/plugins/katello/{{ page.version }}/user_guide/docker/content_views.html) and then pulled or proivisioned to a server running Docker.

## What is Docker?

Docker is a tool used to manage Linux containers. To read more about Docker, [check out the official Docker site](https://www.docker.com/what-docker/). Docker repositories, which contain images and tags, can be retrieved, stored, managed, and deployed from Katello.

## How to sync a Docker repository

The easiest way to get Docker content into Katello is to sync it in. You can either sync Docker content from the Red Hat CDN (if you have subscriptions for the content) or from a registry such as Docker Hub.

### Red Hat Docker Images

Content can be synced into Katello using a Red Hat manifest in much the same way as yum content. See [our guide on how to manage Red Hat content for more information](/plugins/katello/{{ page.version }}/user_guide/red_hat_content/index.html).

### Docker Hub/Docker Registry

To sync content from a Docker registry such as Docker Hub (which is the official Docker-run registry), simply start by creating a new Repository.

![New Docker Repository](/plugins/katello/{{ page.version }}/user_guide/docker/docker_repo.png)

On the new Repository screen, select "Docker" as the content type. Once you do that, you'll be given two options: upstream name and URL. The URL will be the registry URL; for Docker Hub, this would be `https://registry.hub.docker.com`.

For the upstream name, you want to use the fully qualified upstream name which also includes any namespace such as the username. This can be just "busybox" if the Repository is an official Docker Hub Repository or it can be something like "fedora/ssh" where "fedora" is the username/namespace.

Then click save and then sync the Repository as you normally would. Katello will fetch all the images and tags contained within that Repository.

## How to Upload Docker Images

As an alternative to syncing content, Docker images can be uploaded directly into Katello either by the UI or the CLI. These images can either be added to Repositories which have been synced from an external source such as Docker Hub, or they can be uploaded into Repositories which have no external source. For the latter, you can create a Repository in Katello with no upstream name or registry URL. This is handy if you just want to create a repository from only Docker images you plan to upload.

In order to upload a Docker image, you'll first need to export it from Docker. To do this, you'll use the Docker `save` command.

```
docker save centos:latest > centos_latest.tar
```

This tar file can now be directly uploaded into Katello.

To upload an image in the UI, simply visit the Repository details page for the Repository. On the page, there's a section "Upload Docker Image." In this section, click the file field and select your image(s) and click upload. You should get a response indicating whether the file upload has succeeded or failed.

To upload images from the CLI, you must have [hammer and hammer-cli-katello installed and configured](/plugins/katello/{{ page.version }}/cli/index.html). After hammer is properly setup and configured, the follow command can be used to upload your image:

```
$ hammer repository upload-content --path centos_latest.tar --id 6
```

## How to Publish and Promote Docker Content

Docker content can be published and promoted via Content Views much like yum or puppet content.

![Adding Docker Repositories to a Content View](/plugins/katello/{{ page.version }}/user_guide/docker/docker_cv.png)

After creating a Content View, visit the Docker Content tab. Here you can select any Docker repositories you want to add to your Content View. After you've added Docker Repositories to your view, you may proceed as normal. Visit [the Content View user guide for more information](/plugins/katello/{{ page.version }}/user_guide/content_views/content_views.html).

## How to View and Pull Docker Content

To view Docker content contained with Katello, visit the Docker Tags page. This can be accessed under the Content menu at the top of any page.

![Docker Tags Page](/plugins/katello/{{ page.version }}/user_guide/docker/docker_tags.png)

On the Docker Tags page, you can see a list of Docker Tags grouped by Repository in Katello. This shows you Tags grouped across Content Views and Lifecycle Environments. Suppose I wanted to pull the latest Tag from my redis repository, I would click the latest row for my redis repository.

![Docker Tags Page](/plugins/katello/{{ page.version }}/user_guide/docker/docker_redisv_tag.png)

I can see here that my redis Repository has been added to a published Content View called redisv. If I want to use the tag from that Content View, I would just copy the Published At URL and then on my docker server I would run:

```
$ docker pull localhost:5000/default_organization-library-redisv-Tester-redis:latest
Pulling repository localhost:5000/default_organization-library-redisv-Tester-redis...
```

## How to Provision Docker Content

See how to provision content in the documentation in the [foreman-docker documentation](http://theforeman.org/plugins/). Provisioning content from Katello works in much the same way.

First, proceed to the new Container page by accessing it from the Containers menu at the top. Then, select the Local Content tab on the second step. This will allow you to select a Docker image from a published Katello repository which is in an environment/content view/capsule. Then just proceed in the wizard as per the Foreman Docker instructions. When you are finished, you should have a new container running from an image in Katello.
