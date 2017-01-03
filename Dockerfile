FROM rhel7

LABEL Name=rawhide/docker-hello-world \
      Version=1.0 \
      BZComponent=rsyslog-docker \
      Release=1

CMD ["exit", "0"]
