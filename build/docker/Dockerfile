FROM vindevoy/centos8-openresty:latest

LABEL maintainer = "Yves Vindevogel (vindevoy) - yves.vindevogel@asynchrone.com"

ENV GIT_PROTOCOL=https
ENV GIT_URL=github.com/vindevoy/docker-centos8-ansible-project-info.git
ENV GIT_ACCESS_TOKEN=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
ENV GIT_BRANCH=develop
ENV INVENTORY_FILE=src/sample/site.yml

COPY resources/* /root/

RUN set -x && \ 
    dnf install -y --nodocs epel-release && \ 
    dnf update -y --nodocs && \ 
    dnf install -y --nodocs dnf-plugins-core && \ 
    dnf config-manager --set-enabled powertools && \ 
    dnf update -y --nodocs && \ 
    dnf install -y --nodocs ansible git moreutils jq && \ 
    chmod +x /root/*.sh && \ 
    git config --global  pull.rebase true

EXPOSE 80

CMD ["/bin/bash", "-c", "/root/openresty.sh"]
