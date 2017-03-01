FROM rhel7

MAINTAINER Ben Parees <bparees@redhat.com>

ENV HOME=/home/jenkins

USER root
# Install headless Java
RUN curl -L http://file.brq.redhat.com/~vrutkovs/buildroot_7.3.repo -o /etc/yum.repos.d/rhel7.repo && \
    yum clean all && \
    yum install -y http://download.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-9.noarch.rpm && \
    INSTALL_PKGS="bc gettext git java-1.8.0-openjdk-headless lsof nss_wrapper rsync tar unzip which zip" && \
    OSBS_PKGS="koji rhpkg python-behave ansible1.9 python-pip python-nose" && \
    yum install -y --setopt=tsflags=nodocs $INSTALL_PKGS $OSBS_PKGS && \
    rpm -V $INSTALL_PKGS $OSBS_PKGS && \
    yum clean all && \
    mkdir -p /home/jenkins && \
    chown -R 1001:0 /home/jenkins && \
    chmod -R g+w /home/jenkins && \
    set -o pipefail && curl -L https://github.com/openshift/origin/releases/download/v1.4.1/openshift-origin-client-tools-v1.4.1-3f9807a-linux-64bit.tar.gz | \
    tar -zx && \
    mv openshift*/oc /usr/local/bin && \
    rm -rf openshift-origin-client-tools-*

# Copy the entrypoint
ADD contrib/bin/* /usr/local/bin/

# Run the Jenkins JNLP client
ENTRYPOINT ["/usr/local/bin/run-jnlp-client"]
