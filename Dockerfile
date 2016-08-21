# This extends the basic Debian image to add Spinnaker
FROM ubuntu:14.04
MAINTAINER Chris Shepherd <thesheps@gmail.com>

# Inform the container there is no tty
ENV DEBIAN_FRONTEND noninteractive

# Enable auto-starting of scripts
RUN echo "#!/bin/sh\nexit 0" > /usr/sbin/policy-rc.d
RUN touch /etc/init.d/systemd-logind

# Install downstream dependencies
RUN apt-get -qq update
RUN apt-get -f install
RUN apt-get -qq -y install apt-transport-https
RUN apt-get -qq -y install software-properties-common
RUN apt-get -qq -y install curl

# Download and execute InstallSpinnaker script
RUN curl -s https://spinnaker.bintray.com/scripts/InstallSpinnaker.sh | bash /dev/stdin
