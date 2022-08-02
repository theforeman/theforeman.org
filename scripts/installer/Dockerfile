FROM quay.io/centos/centos:stream8

RUN dnf -y install https://yum.puppetlabs.com/puppet7/puppet7-release-el-8.noarch.rpm

ARG FOREMAN_VERSION
RUN dnf -y install https://yum.theforeman.org/releases/$FOREMAN_VERSION/el8/x86_64/foreman-release.rpm
RUN dnf -y module enable foreman:el8
RUN dnf -y install foreman-installer
