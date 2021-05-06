###
#
#	Yves Vindevogel (vindevoy)
#	2021-05-06
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
COPY resources/* /root/

# Needed for ansible
RUN dnf install -y --nodocs epel-release
RUN dnf update -y --nodocs 

# Needed for dnf config-manager
RUN dnf install -y --nodocs dnf-plugins-core

# Needed for moreutils
RUN dnf config-manager --set-enabled powertools
RUN dnf update -y --nodocs 

# Install the really needed packages
RUN dnf install -y --nodocs ansible git moreutils jq

# Create env.sh with all env vars, so we can re-use them later
RUN echo "#!/bin/bash"                              >   /root/env.sh
RUN echo ""                                         >>  /root/env.sh
RUN echo "GIT_PROTOCOL="${GIT_PROTOCOL}             >>  /root/env.sh 
RUN echo "GIT_URL="${GIT_URL}                       >>  /root/env.sh 
RUN echo "GIT_ACCESS_TOKEN="${GIT_ACCESS_TOKEN}     >>  /root/env.sh 
RUN echo "GIT_BRANCH="${GIT_BRANCH}                 >>  /root/env.sh 
RUN echo "HOSTS_FILE="${HOSTS_FILE}                 >>  /root/env.sh 
RUN echo ""                                         >>  /root/env.sh
RUN echo "export GIT_PROTOCOL"                      >>  /root/env.sh 
RUN echo "export GIT_URL"                           >>  /root/env.sh 
RUN echo "export GIT_ACCESS_TOKEN"                  >>  /root/env.sh 
RUN echo "export GIT_BRANCH"                        >>  /root/env.sh 
RUN echo "export HOSTS_FILE"                        >>  /root/env.sh 

# Make sure scripts are executable
RUN chmod +x /root/*.sh 

# Set this to avoid warnings when checking out
RUN git config --global  pull.rebase true

# Running this on default port 80
EXPOSE 80

#CMD ["/bin/bash"]
CMD ["/bin/bash", "-c", "/root/openresty.sh"]

