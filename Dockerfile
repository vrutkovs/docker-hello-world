FROM busybox
LABEL Name=vrutkovs/docker-hello-world \
      Version=1.0 \
      BZComponent=rsyslog-docker
CMD ["exit", "0"]
