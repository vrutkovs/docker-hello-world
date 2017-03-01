FROM rhel7
LABEL name=vrutkovs/docker-hello-world \
      version=1.0.vrutkovs \
      com.redhat.component=docker-hello-world
ADD server.py /server.py
CMD ["python", "/server.py"]
