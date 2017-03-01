FROM rhel7
LABEL name=vrutkovs/docker-hello-world \
      version=1.0 \
      com.redhat.component=rsyslog-docker
ADD server.py /server.py
CMD ["python", "/server.py"]
