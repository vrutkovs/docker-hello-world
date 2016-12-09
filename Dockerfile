FROM rhel7

LABEL name=vrutkovs/flatpak-builder
LABEL com.redhat.component=osbs-buildroot-docker
LABEL version=1.0.vrutkovs
LABEL release=1

RUN yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm && \
    curl -kLs https://copr.fedorainfracloud.org/coprs/amigadave/flatpak-epel7/repo/epel-7/amigadave-flatpak-epel7-epel-7.repo -o /etc/yum.repos.d/flatpak.repo

RUN yum install git flatpak flatpak-builder elfutils -y && \
    yum clean all

ADD build.sh /build.sh
RUN chmod +x /build.sh

CMD ["bash", "/build.sh"]

