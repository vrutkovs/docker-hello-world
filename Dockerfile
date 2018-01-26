FROM fedora:27
LABEL name=vrutkovs/cowsay
LABEL version=3.04
LABEL com.redhat.component=cowsay
RUN dnf install -y cowsay && \
    dnf clean all
ENTRYPOINT ["/usr/bin/cowsay"]
CMD ["hi"]
