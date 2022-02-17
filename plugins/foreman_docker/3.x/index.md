---
layout: plugin
pluginname: foreman_docker
title: Foreman Docker 3.x Manual
version: 3.x
# uncomment for older versions than stable or nightly
#robots: noindex
---

---
**NOTE**

This plugin has been discontinued. The latest release helps only with its removal. If you’re interested in taking over the maintenance, let us know.

---


# 1. {{ page.title }}

Docker is an open source project that automates the deployment of applications inside Linux Containers, and provides the capability to package an application with its runtime dependencies into a container. Linux containers enable rapid application deployment, simpler testing, maintenance, and troubleshooting while improving security.
For more information see ["What is Docker?"](https://www.docker.com/whatisdocker/)

You can find the latest version of the foreman-docker plugin [on Github](https://github.com/theforeman/foreman-docker).

## Compatibility

<table class="table table-bordered table-condensed">
  <thead>
    <tr>
      <th align="right">Foreman</th>
      <th align="right">Plugin</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td align="right">&gt;= 1.5</td>
      <td align="right">0.0.1 - 0.0.3</td>
    </tr>
    <tr>
      <td align="right">&gt;= 1.6</td>
      <td align="right">0.1.0 - 0.2.0</td>
    </tr>
    <tr>
      <td align="right">&gt;= 1.7</td>
      <td align="right">1.0.0 - 2.1.1</td>
    </tr>
    <tr>
      <td align="right">&gt;= 1.7</td>
      <td align="right">3.0.0+</td>
    </tr>
    <tr>
      <td align="right">&gt;= 1.15</td>
      <td align="right">3.1.0+</td>
    </tr>
  </tbody>
</table>

## Docker Registry API Compatibility

<table class="table table-bordered table-condensed">
  <thead>
    <tr>
      <th align="right">Plugin version</th>
      <th align="right">Registry API version</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td align="right">&lt;  3.1.0</td>
      <td align="right"><a href="http://docs.master.dockerproject.org/v1.7/reference/api/registry_api/">v1</a></td>
    </tr>
    <tr>
      <td align="right">&gt;= 3.1.0</td>
      <td align="right"><a href="http://docs.master.dockerproject.org/v1.7/reference/api/registry_api/">v1</a>, <a href="https://docs.docker.com/registry/spec/api/">v2</a><strong>*</strong></td>
    </tr>
  </tbody>
</table>

**Note:* API v2 as default and v1 as fallback.

# 2. Basics

A container in the Docker format is composed of the following parts:

`Container` (in the narrow sense of the word) is an application sandbox. Each container is based on an image that holds necessary configuration data. When you launch a container from an image, a writable layer is added on top of this image. Every time you commit a container a new image layer is added to store your changes.

`Image` is a static snapshot of the containers' configuration. Image is a read-only layer that is never modified, all changes are made in top-most writable layer, and can be saved only by creating a new image. Each image depends on one or more parent images.

`Platform image` an image that has no parent. Platform images define the runtime environment, packages and utilities necessary for containerized applications to run. The platform image is read-only, so any changes are reflected in the copied images stacked on top of it.

`Registry` is a public or private archive that contains images available for download. Some registries allow users to upload images to make them available to others. Foreman allows you to import images from local and external registries. Foreman itself can act as an image registry for hosts, however, hosts cannot push changes back to the registry, other than committed images.

`Tags` are used to differentiate images in a repository, they typically mark the version of the application stored in the image. Repositories are used to group similar images in a container registry. Images only have unique alphanumeric identifiers, so naming in form or repository:tag provides a human-readable way of identifying images.

With Foreman and Katello, you can create an on-premise registry, [import images from various sources and distribute them to containers using content views](http://www.katello.org/docs/2.2/user_guide/docker/docker.html). Foreman supports creating a Docker compute resource, that acts as a server for running containers. This way, you can import an image, start a container based on this image, monitor the container's activity, and commit it's state to a new image layer that can be further propagated.

![Containers list](static/images/plugins/foreman_docker/docker-containers-list.png)

# 3. Installation

## 3.1 Foreman Installer (recommended)
You can use the Foreman installer to install this plugin. Use the following command:
    foreman-installer --enable-foreman-plugin-docker

If you prefer not to use the installer, follow the instructions below for your operating system.

## 3.2 Red Hat, CentOS, Fedora, Scientific Linux (rpm)

Set up the repositories as explained in the [core documentation](https://theforeman.org/manuals/1.15/index.html#3.3.1RPMPackages) to install the package with:

    $ yum install tfm-rubygem-foreman_docker

## 3.3 Debian, Ubuntu (deb)

Add the repository sources as described in the [core documentation](https://theforeman.org/manuals/1.15/index.html#3.3.3DebianPackages) and install the package:

    $ apt-get install ruby-foreman-docker

## 3.4 Bundle (gem)

This method will **only** work on Foreman deployments installed from source. Please refrain from making these changes if you have installed Foreman via packages.

Add the following to bundler.d/Gemfile.local.rb in your Foreman installation directory (/usr/share/foreman by default)

    $ gem 'foreman_docker'

Then run `bundle install` and `rake db:migrate` from the same directory

--------------

To verify that the installation was successful, go to Foreman, top bar **Administer > About** and check 'foreman_docker' shows up in the **System Status** menu under the Plugins tab. You should also see a **'Containers'** button show up in the top bar, similar to the one in this image:

![](static/images/plugins/foreman_docker/docker-topbar-check.png)

# 4. Usage

## 4.1 Managing containers

The following sections show how to create, view, start, stop, and commit a container.

### 4.1.1 Prerequisites

In Foreman, you can deploy containers only on a compute resource of the Docker provider type. Therefore, when you attempt to view or create containers for the first time, Foreman prompts you to create a Docker compute resource. If you don't have a Docker host available, first create a container host as described in Procedure 1.1, “To Prepare a Container Host:”, then specify this host as a compute resource as described in Procedure 1.2, “To Create a Docker Compute Resource:”.


#### 4.1.2 Prepare a Docker Host:

1. This procedure is optional if you already have a Docker Host. Prepare a server for hosting images and enable the docker service. You can deploy the container host either on the same machine as the Foreman server or independently.

2. If you are running [Katello](http://katello.org), run the following command on the container host to install the Foreman server's CA certificate:

        $ rpm -Uvh https://[fqdn]/pub/katello-ca-consumer-latest.noarch.rpm

    Here, [fqdn] stands for the fully qualified domain name of your Foreman server. Skip this step if the container host is already registered as a Foreman host.

3. Depending on the location of the container host, perform the following tasks:
    * If the container host is on the same machine as the Foreman server, create a docker user group and add the foreman user to it:

          $ groupadd docker
          $ usermod -aG docker foreman

    * (*EL and Fedora only*) Modify the OPTIONS variable in the /etc/sysconfig/docker file as follows:

          OPTIONS='--selinux-enabled -G docker'

    * Restart the affected services to apply the changes.
        *  If your operating system uses systemd:

              $ systemctl restart docker.service

        *  If your operating system does not use systemd:

              $ service docker restart

    * If the container host is on a different machine than the Foreman server, open a port on the container host to communicate with the Foreman server. Create the file /etc/systemd/system/docker.service.d/startup_options.conf

      ```
      $ sudo mkdir -p /etc/systemd/system/docker.service.d/
      $ sudo vi /etc/systemd/system/docker.service.d/startup_options.conf
      ```
      Now paste the below content into the created file.
      ```
      [Service]
      ExecStart=
      ExecStart=/usr/bin/dockerd -H fd:// -H tcp://0.0.0.0:[PORT_NUMBER]
      ```

    * Replace [PORT_NUMBER] with a selected port number. Restart the docker service and verify your settings as follows:
        *  If your operating system uses systemd:

              $ systemctl restart docker.service
              $ systemctl status docker.service
        *  If your operating system does not use systemd:

              $ service docker restart
              $ service docker status


        *  You should see that there is an additional -H parameter after you restart docker service

              ```
              OLD:
                 CGroup: /system.slice/docker.service
                         ├─29397 /usr/bin/dockerd -H fd://
              NEW:
                 CGroup: /system.slice/docker.service
                         ├─1864 /usr/bin/dockerd -H fd:// -H tcp://0.0.0.0:5000
              ```
        * Note: This connection is accessible by http which is not secure. Follow the docker [security guide] (https://docs.docker.com/engine/security/https/) to protect the Docker daemon with HTTPS.

#### 4.1.2 To Create a Docker Compute Resource:

1. Make sure the port 5000 is enabled on the Foreman server. The container host uses this port to pull images from Content Views on the Foreman server.
2. Create the compute resource. Specify the resource URL according to the location of the container host:
    * If the container host is on the same machine as the Foreman server, set `unix://var/run/docker.sock` as the resource URL.
    * If the container host is on a different machine than the Foreman server, specify the URL in the form of:

      `http://[container_host_fqdn]:[PORT_NUMBER]`

    Here, [container_host_fqdn] and [PORT_NUMBER] stand for the fully qualified domain name of the container host and the port number opened on the container host for communication with Foreman.
3. Click Test Connection to test if the container host is available.
4. Click Submit to create the compute resource.

## 4.2. Creating a container

Once there is at least one Docker compute resource present on your Foreman, you can create containers. To create a new container, follow the steps described in Procedure 1.3, “To Create a Container:”. For instructions on how to investigate the already created containers, see Section 3.3, “Investigating Containers”.
To create a container, you first have to import an image, which can be a platform image, or a previously created layered image. Foreman supports the following image sources:

**Local content**: represented by the Katello option when creating a container. This option allows you to import an image from a repository that is already present on a capsule server in a certain content view and life cycle environment. For more information on how to create and populate a local registry, see Section 3.4, “Working with Repositories”.

**Docker Hub**: allows you to search the Docker Hub registry and pull images from there. Make sure that you pull only trusted images with verified content.

**External Registry**: allows you to import images from a previously created external registry. For more information on creating registries in Foreman, see Section 3.3, “Adding an External Registry”.

Note that you can not change the container configuration once the container is created. To alter the configuration, you have to create a replacement container with modified settings as described in Procedure 1.3, “To Create a Container:”. Therefore, make sure that containers can be easily replaced in your workflow.

### 4.2.1 Procedure

1. Navigate to Containers → New Container. Alternatively, navigate to Containers → All Containers and click New container.
2. In the Preliminary stage of container creation configure the following settings:
    * On the Compute resource tab, select the compute resource from the Deployed on drop-down menu. See [Section 5.2 of the manual](/manuals/latest/index.html#5.2ComputeResources),, “Compute Resources” for more information on compute resources.
    * On the Locations tab, select the locations where the new container will be available.
    * On the Organizations tab, select the organizations where the new container will be available.
    Click Next to proceed.
3. In the Image stage of container creation import an image that will act as a base for your container. This can be a platform image, or a previously created layered image. Select from one of the following options:
    * Select the Katello tab to import the image from a life cycle environment. Specify the life cycle environment, content view, repository, tag, and Capsule Server.
    * Select the Docker hub tab to import the image from the Docker Hub registry. Once you type the image name to the Search field, Foreman automatically searches the compute resource. Click the looking glass icon to search the Docker Hub. Select the image from the list of search results and pick a tag from the drop-down list.
    * Select the External registry tab to import the image from an existing registry. Select the registry from the drop-down menu, and search it by the image name. Foreman populates the Tag field with tags available for the selected image name. See Section 3.3, “Adding an External Registry” for details.
    Click Next to proceed.
![Image search](static/images/plugins/foreman_docker/docker-image-search.png)

4. In the Configuration stage of container creation set the following parameters:
    * Provide the container name.
    * Specify a command to run inside the container.
    * Specify an entrypoint, which is a command that is executed automatically as soon as the container starts. The default entrypoint is /bin/sh -c.
    * Assign CPUs to the container. For example, 0-2,16 represents CPUs 0, 1, 2, and 16.
    * Define the relative share of CPU time for the container.
    * Specify a memory limit for the container. For example, 512m limits the container memory usage to 512 MB.
![Container wizard config](static/images/plugins/foreman_docker/docker-config-options.png)

5. In the final stage of container creation named Environment, select if you want to allocate a pseudo-tty, attach STDIN, STDOUT, and STDERR to the container. Click Add environment variable to create a custom environment variable for the container.
![Container wizard environment](static/images/plugins/foreman_docker/docker-environment.png) - Don't forget to select the checkbox "run". Otherwise the newly created container will be in "EXITED" state after creation.

6. Click Submit to create the container.


After creating a container, Foreman displays a summary of container metadata. By default, the newly created container is inactive, for instructions how to start it see Procedure 1.5, “To Start or Stop a Container:”.

## 4.3 Investigating containers
Foreman provides means to monitor the status of containers as well as processes running inside them. Some containers can be marked as managed, which means they were created and provisioned inside the Foreman environment.
The following procedure shows how to list containers of a selected organization and how to investigate the container metadata.

### 4.3.1 Procedure

1. Navigate to Containers → All Containers.
2. On the Containers page, every Docker compute resource has a dedicated tab. Each of these tabs contains the table of available containers together with selected parameters of each container. Select the tab of the compute resource you want to inspect.
3. To view the container metadata, click the name of the container you want to inspect. Foreman displays the table of container properties.
4. On the Processes tab, you can view processes that are currently running in the container. Click on the process name to view the metadata of the process.
5. If the container is running, you can view its standard output in the Logs tab. If you selected the allocate a pseudo-tty check box when creating a container, the console is interactive. Otherwise, it displays the initial standard output produced when the container started.

![Container show page](static/images/plugins/foreman_docker/docker-container-show.png)
![Container logs](static/images/plugins/foreman_docker/docker-logs.png)

## 4.4. Starting, committing, and removing containers

A new container is by default disabled. By enabling a container, you start the processes of the containerized application in the compute resource. Hosts are then able to communicate with the container as with a web application. The following procedure shows how to start and stop a container:

### 4.4.1 Procedure to start or stop a container:

1. Navigate to Containers → All Containers to view the list of available containers.
2. Click Power On next to the container you want to start. After starting the container, the button changes to Power Off, which allows for stopping the container. These actions are equivalent to the docker start and docker stop commands.

By committing a container, you create a new image layer that stores the status of the container. The following procedure shows how to commit a container:

### 4.4.2 Procedure to commit a container:

1. Navigate to Containers → All Containers to view the list of available containers.
2. Click the name of the container you want to commit.
3. Click Commit. Foreman prompts you to provide the following information:
    * Specify a repository name. This can be a single name or combined with the user name, for example user/my-rhel-image.
    * Assign a tag to the image.
    * Provide your contact information.
    * Provide an informative comment about the image.
4. Click Submit.

![Commit a container](static/images/plugins/foreman_docker/docker-container-commit.png)

The container is then committed to the repository of the original image. For example, if the container is based on an image pulled from the Docker Hub, the committed changes are pushed back to the Docker Hub.

### 4.4.3 Procedure to remove a container:

1. Navigate to Containers → All Containers to view the list of available containers.
2. Click the name of the container you want to delete.
3. Click Delete.
4. In the alert box, click OK to remove the container.
⁠

## 4.3. Working with repositories
Follow the Katello [Docker documentation](https://theforeman.org/plugins/katello/3.4/user_guide/docker/index.html).

# 5. Help

Please follow our [standard procedures and
contacts]({{site.baseurl}}support.html).

# 6. Getting involved

## 6.1 Troubleshooting

If you find a bug, please file it in
[Redmine](http://projects.theforeman.org/projects/chef/issues/new).

See the [troubleshooting section](/manuals/latest/index.html#7.2GettingHelp)
in the Foreman manual for more info.


## 6.2 Contributing

Follow the [same process as Foreman](/contribute.html#SubmitPatches)
for contributing.

# 7. Links

* foreman-docker plugin [https://github.com/theforeman/foreman-docker/](https://github.com/theforeman/foreman-docker/)
* Issue tracker [http://projects.theforeman.org/projects/docker/issues](http://projects.theforeman.org/projects/docker/issues)
