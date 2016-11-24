FROM rhel7
ENV MY_NAME=rawhide/docker-hello-world \
    MY_VERSION=1.0 \
    MY_RELEASE=1
LABEL Name=$MY_NAME \
      Version=$MY_VERSION \
      Release=$MY_RELEASE \
      BZComponent=hello
CMD printf "I am $MY_NAME-$MY_VERSION-$MY_RELEASE\n"
