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
ENV HOSTS_FILE=/var/opt/ansible/site.yml

# This automatically overwrites the existing files from the base image
COPY resources/openresty.sh /root/openresty.sh
COPY resources/openresty.conf /root/openresty.conf

RUN dnf install -y --nodocs epel-release
RUN dnf update -y --nodocs 
RUN dnf install -y --nodocs ansible git jq

RUN mkdir -p /var/www/openresty

COPY resources/request.sh /root/request.sh

RUN chmod +x /root/*.sh 

EXPOSE 80

CMD ["/bin/bash"]
#CMD ["/bin/bash", "-c", "/root/openresty.sh"]

