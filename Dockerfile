FROM vrutkovs/cowsay:latest
LABEL name=vrutkovs/cowthink
LABEL version=1.0
LABEL com.redhat.component=cowthink
ENTRYPOINT ["/usr/bin/cowthink", "-e", "oO", "-T", "\/"]
CMD ["hi"]
