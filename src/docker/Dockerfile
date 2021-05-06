###
#
#	Yves Vindevogel (vindevoy)
#	2021-05-05
#
#	Uses a GIT repo containing an Ansible project and returns information on it
#
###

FROM vindevoy/centos8-openresty:latest

LABEL maintainer = "Yves Vindevogel (vindevoy) - yves.vindevogel@asynchrone.com"

ENV GIT_PROTOCOL=https
ENV GIT_URL=github.com/vindevoy/docker-centos8-ansible-project-info.git  
ENV GIT_ACCESS_TOKEN=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
ENV GIT_BRANCH=develop
ENV HOSTS_FILE=/var/opt/ansible/src/sample/site.yml

# This automatically overwrites the existing files from the base image
COPY resources/openresty.sh /root/openresty.sh
COPY resources/openresty.conf /root/openresty.conf
COPY resources/request.sh /root/request.tmp

# Needed for ansible
RUN dnf install -y --nodocs epel-release
RUN dnf update -y --nodocs 

# Needed for dnf config-manager
RUN dnf install -y --nodocs dnf-plugins-core

# Needed for moreutils
RUN dnf config-manager --set-enabled powertools
RUN dnf update -y --nodocs 

# Install the really needed packages
RUN dnf install -y --nodocs ansible git moreutils

# See if we will ever use it
RUN dnf install -y --nodocs jq

# Set the header of the request.sh file, containing the ENV vars
RUN echo "#!/bin/bash"                  >   /root/request.sh 
RUN echo ""                             >>  /root/request.sh 
RUN echo "HOSTS_FILE="${HOSTS_FILE}     >>  /root/request.sh 
RUN echo "GIT_BRANCH="${GIT_BRANCH}     >>  /root/request.sh 
RUN echo ""                             >>  /root/request.sh 
RUN cat /root/request.tmp               >>  /root/request.sh    

# Make sure scripts are executable
RUN chmod +x /root/*.sh 

# Cleanup
RUN rm -f /root/*.tmp

# Set this to avoid warnings when checking out
RUN git config --global  pull.rebase true

# Running this on default port 80
EXPOSE 80

CMD ["/bin/bash"]
#CMD ["/bin/bash", "-c", "/root/openresty.sh"]

