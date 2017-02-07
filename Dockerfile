FROM busybox
LABEL Name=vrutkovs/docker-hw-base \
      Version=1.0 \
      Release=2 \
      BZComponent=docker-hello-world

CMD ["exit", "0"]
