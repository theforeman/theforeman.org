FROM centos:7

RUN yum -y install epel-release https://yum.puppetlabs.com/puppet5/puppet5-release-el-7.noarch.rpm

ARG FOREMAN_VERSION
RUN yum -y install https://yum.theforeman.org/releases/$FOREMAN_VERSION/el7/x86_64/foreman-release.rpm
RUN yum -y install foreman-installer
