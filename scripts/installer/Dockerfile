FROM quay.io/centos/centos:stream9

RUN dnf -y install https://yum.puppetlabs.com/puppet7-release-el-9.noarch.rpm

ARG FOREMAN_VERSION
RUN dnf -y install https://yum.theforeman.org/releases/$FOREMAN_VERSION/el9/x86_64/foreman-release.rpm
RUN dnf -y install foreman-installer
