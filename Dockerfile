FROM rhel7
LABEL Name=rawhide/docker-hello-world \
      Version=1.0 \
      BZComponent=rsyslog-docker
CMD ["exit", "0"]
