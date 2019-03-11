---
layout: plugin
pluginname: foreman_kubevirt
title: Foreman KubeVirt 0.x Manual
version: 0.x
---

# 1. {{ page.title }}

KubeVirt is a virtualization add-on to Kubernetes. It allows you to run a VM inside of a pod/container and have that VM be managed by Kubernetes.
KubeVirt technology addresses the needs of development teams that have adopted or want to adopt Kubernetes but possess existing Virtual Machine-based workloads that cannot be easily containerized.

For more information see ["KubeVirt"](https://kubevirt.io/).

You can find the latest version of the foreman-kubevirt plugin [on Github](https://github.com/masayag/foreman_kubevirt).

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
      <td align="right">&gt;= 1.21</td>
      <td align="right">0.1.0+</td>
    </tr>
  </tbody>
</table>

## KubeVirt API Compatibility

<table class="table table-bordered table-condensed">
  <thead>
    <tr>
      <th align="right">Plugin version</th>
      <th align="right">KubeVirt API version</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td align="right">&lt;= 0.1.0</td>
      <td align="right"><a href="https://github.com/kubevirt/api-reference/tree/master/v0.13.2">v1alpha3</a></td>
    </tr>
  </tbody>
</table>

# 2. Basics

Foreman KubeVirt allows you to provision and manage your hosts in KubeVirt as virtual machines.

# 3. Installation

## 3.1 Foreman Installer (recommended)

You can use the Foreman installer to install this plugin. Use the following command:

    $ foreman-installer --enable-foreman-plugin-kubevirt

If you prefer not to use the installer, follow the instructions below for your operating system.

## 3.2 Red Hat, CentOS, Fedora, Scientific Linux (rpm)

Set up the repositories as explained in the [core documentation](https://theforeman.org/manuals/1.21/index.html#3.3.1RPMPackages) to install the package with:

    $ yum install tfm-rubygem-foreman_kubevirt

## 3.3 Debian, Ubuntu (deb)

Add the repository sources as described in the [core documentation](https://theforeman.org/manuals/1.21/index.html#3.3.3DebianPackages) and install the package:

    $ apt-get install ruby-foreman-kubevirt

## 3.4 Bundle (gem)

This method will **only** work on Foreman deployments installed from source. Please refrain from making these changes if you have installed Foreman via packages.

Add the following to bundler.d/Gemfile.local.rb in your Foreman installation directory (/usr/share/foreman by default)

    $ gem 'foreman_kubevirt'

Then run `bundle install` from the same directory

--------------

To verify that the installation was successful, go to Foreman, top bar **Administer > About** and check 'foreman_kubevirt' shows up in the **System Status** menu under the Plugins tab.

# 4. Usage

Go to **Infrastructure > Compute Resources** and click on **New Compute Resource**.
Choose the **KubeVirt provider**, and fill in all the fields.

Here is a short description of some of the fields:
* *Namespace* - the virtual cluster on kubernetes to which the user has permissions as cluster-admin.
* *Token* - a bearer token authentication for HTTP(s) calls.
* *X509 Certification Authorities* - enables client certificate authentication for API server calls.

## 4.1 Setting Compute Resource *Token* and *X509 CA* values

### Kubernetes
#### *Token*:

Either list the secrets and pick the one that contains the relevant token, or select a service account:

List of secrets that contain the tokens and set secret name instead of *YOUR_SECRET*:
```
# kubectl get secrets
# kubectl get secrets YOUR_SECRET -o jsonpath='{.data.token}' | base64 -d | xargs
```

Or obtain token for a service account named 'foreman-account':
```
# KUBE_SECRET=`kubectl get sa foreman-account -o jsonpath='{.secrets[0].name}'`
# kubectl get secrets $KUBE_SECRET -o jsonpath='{.data.token}' | base64 -d | xargs
```

#### *X509 CA*:

Taken from Kubernetes admin config file:
```
# cat /etc/kubernetes/admin.conf | grep certificate-authority-data: | cut -d: -f2 | tr -d " " | base64 -d
```

Or by retrieving from the secret, via the service account (in this example assuming its name is *foreman-account*):
```
# KUBE_SECRET=`kubectl get sa foreman-account -o jsonpath='{.secrets[0].name}'`
# kubectl get secret $KUBE_SECRET  -o jsonpath='{.data.ca\.crt}' | base64 -d
```

### OpenShift
#### *Token*:

Create a privileged account named *my-account*:
```
# cat <<EOF | kubectl create -f -
apiVersion: v1
kind: ServiceAccount
metadata:
  name: foreman-account
  namespace: default
---
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: foreman-cluster-admin
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: cluster-admin
subjects:
- kind: ServiceAccount
  name: foreman-account
  namespace: default
EOF
```
Use *oc* tool for reading the token of the *my-account* service account under *default* namespace:
`# oc sa get-token my-account -n default`

#### *X509 CA*:

Taken from OpenShift admin config file:
```
# cat /etc/origin/master/openshift-master.kubeconfig | grep certificate-authority-data: | cut -d: -f2 | tr -d " " | base64 -d
```

Or by retrieving from the secret of service account *my-account* under the *default* namespace:
```
# KUBE_SECRET=`oc get sa my-account -n default -o jsonpath='{.secrets[0].name}'`
# kubectl get secret $KUBE_SECRET -n default -o jsonpath='{.data.ca\.crt}' | base64 -d
```

## 4.2 Create Host

When creating a host on KubeVirt provider, user may decide between network based (via PXE) to image based provision.

### 4.2.1 Network Based Host Provision

When selecting *Network Based* host provision, user should add a storage for the virtual machine.
This is done by selecting a (storage class)[https://kubernetes.io/docs/concepts/storage/storage-classes/] for creating a persistent volume claim.
The user will have the option to select the storage class from a drop down list, in which the storage class name and the provisioner are shown.
A size for the persistent volume claim should be entered.
The name of the persistent volume claim will be generated by the plugin based on the vm name with suffix (i.w. vm-name-claim-01).
The persistent volume claim is being created before the VM is being created, and in case of a failure to create the VM, it will be cleared from the system.

#### Setting Local Storage Class

Here is an example of how to configure a local storage, however, it is advised to use a production level storage class [provisioner](https://kubernetes.io/docs/concepts/storage/storage-classes/#provisioner):

```
cat <<EOF | kubectl create -f -
kind: StorageClass
apiVersion: storage.k8s.io/v1
metadata:
  name: local-storage
provisioner: kubernetes.io/no-provisioner
volumeBindingMode: WaitForFirstConsumer
EOF
```

This will create the storage class definition:
```
kubectl get storageclass
NAME                PROVISIONER                    AGE
local-storage       kubernetes.io/no-provisioner   1d
```

Since this is a local storage that have no provisioner, there is a need to create the persistent volumes manually and so the mapping on the file system.
One may use the script below to generate 5 persistent volumes.
Make sure to replace `KUBEVIRT_HOST_NAME` with the actual KubeVirt host name and set the desired path for the volumes by changing `DIR_PATH_PREFIX`:

```
#!/bin/bash

KUBEVIRT_HOST_NAME=kubevirt.example.com
DIR_PATH_PREFIX=/mnt/localstorage/vol

LOCAL_PV_TEMPALTE=$(cat <<-END
apiVersion: v1
kind: PersistentVolume
metadata:
  name: local-pv-XXX
spec:
  capacity:
    storage: 10Gi
  accessModes:
  - ReadWriteOnce
  persistentVolumeReclaimPolicy: Retain
  storageClassName: local-storage
  local:
    path: DIR_PATH_PREFIX
  nodeAffinity:
    required:
      nodeSelectorTerms:
      - matchExpressions:
        - key: kubernetes.io/hostname
          operator: In
          values:
          - KUBEVIRT_HOST_NAME
END
)

for f in {1..5}
do
  local_pv=$(echo "$LOCAL_PV_TEMPALTE" | sed -e "s/XXX/$f/" -e "s/KUBEVIRT_HOST_NAME/${KUBEVIRT_HOST_NAME}/" -e "s#DIR_PATH_PREFIX#${DIR_PATH_PREFIX}$f#")
  mkdir -p ${DIR_PATH_PREFIX}$f
  echo "$local_pv" | kubectl create -f -
done
```
Once the script is completed, list the persistent volumes:

```
[root@kubevirt ~]# kubectl get pv
NAME                 CAPACITY   ACCESS MODES   RECLAIM POLICY   STATUS      CLAIM                         STORAGECLASS    REASON   AGE
local-pv-1           10Gi       RWO            Retain           Available                                 local-storage            21s
local-pv-2           10Gi       RWO            Retain           Available                                 local-storage            21s
local-pv-3           10Gi       RWO            Retain           Available                                 local-storage            21s
local-pv-4           10Gi       RWO            Retain           Available                                 local-storage            21s
local-pv-5           10Gi       RWO            Retain           Available                                 local-storage            21s
```

Now that persistent volumes are created, user can select on 'Create Host' flow the storage class and specify the size and the claim will be created as part of the host creation flow.

More information about persistent volume and persistent volume claims is available on [Kubernetes site](https://kubernetes.io/docs/concepts/storage/persistent-volumes/).


### 4.2.2 Image Based Host Provision

In order to create an *image based* host, first there is a need to create an image under the *KubeVirt* compute resource.
Go to **Infrastructure > Compute Resources**, select the *KubeVirt* provider and click on **Create Image**.
For the **Image** field, there is a need to fill the image id as appears on provider's registry.
The image ID can be obtained by using the container runtime CLI:

#### CRI-O
```
# crictl images
IMAGE                                                                TAG                 IMAGE ID            SIZE
prod.example.com:8888/tech-preview/fedora-cloud-registry-disk-demo   v1.4.0              8472ebc176051       495MB
```

The first column contains the value to be field for the **Image** text field.

#### Docker
```
# docker images

REPOSITORY                                           TAG                 IMAGE ID            CREATED             SIZE
docker.io/kubevirt/fedora-cloud-registry-disk-demo   latest              17a48bfb1229        3 months ago        420 MB
docker.io/kubevirt/cirros-registry-disk-demo         latest              89762a0ac7f7        3 months ago        200 MB
```

The first column contains the value to be field for the **Image** text field, i.e. `docker.io/kubevirt/fedora-cloud-registry-disk-demo`.

### 4.2.3 Network Interface of Provisioned Host

KubeVirt supports either connecting the virtual machine to pods network or to additional networks provided by the CNI provider.
There are two  CNI Providers supported by KubeVirt: [Multus](https://github.com/intel/multus-cni) and [Genie](https://github.com/cni-genie/CNI-Genie).
Both options are shown on the **Network Interface** dialog of **Create Host** flow.

Once selected the CNI Provider, the user will have to select a network to connect the network interface to.
However, if the user selects 'pod' as the CNI provider, there will be no option to select a network, since it connects to pod network only.
The values of the networks list for the other CNI providers are a list of available network attachment definitions. See more details about network attachment definition [here](https://kubevirt.io/2018/attaching-to-multiple-networks.html).

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

* foreman_kubevirt plugin [https://github.com/theforeman/foreman_kubevirt/](https://github.com/theforeman/foreman_kubevirt/)
* Issue tracker [http://projects.theforeman.org/projects/foreman_kubevirt/issues](http://projects.theforeman.org/projects/foreman_kubevirt/issues)
* [KubeVirt](https://kubevirt.io)