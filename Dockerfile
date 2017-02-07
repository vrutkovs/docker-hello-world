FROM vrutkovs/docker-hw-base
LABEL Name=vrutkovs/docker-hw-app \
      Version=1.0 \
      Release=1 \
      BZComponent=docker-hello-world

CMD ["exit", "0"]
