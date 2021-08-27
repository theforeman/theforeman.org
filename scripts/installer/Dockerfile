FROM centos:8

RUN yum -y install https://yum.puppetlabs.com/puppet7/puppet7-release-el-8.noarch.rpm

ARG FOREMAN_VERSION
RUN yum -y install https://yum.theforeman.org/releases/$FOREMAN_VERSION/el8/x86_64/foreman-release.rpm
RUN yum -y install foreman-installer
