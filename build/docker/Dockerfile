FROM vindevoy/centos8-openresty:latest

LABEL maintainer = "Yves Vindevogel (vindevoy) - yves.vindevogel@asynchrone.com"

ENV GIT_PROTOCOL=https
ENV GIT_URL=github.com/vindevoy/docker-centos8-ansible-project-info.git
ENV GIT_ACCESS_TOKEN=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
ENV GIT_BRANCH=develop
ENV HOSTS_FILE=/var/opt/ansible/src/sample/site.yml

COPY resources/* /root/

RUN set -x && \ 
    dnf install -y --nodocs epel-release && \ 
    dnf update -y --nodocs && \ 
    dnf install -y --nodocs dnf-plugins-core && \ 
    dnf config-manager --set-enabled powertools && \ 
    dnf update -y --nodocs && \ 
    dnf install -y --nodocs ansible git moreutils jq && \ 
    echo "#!/bin/bash"                              >   /root/env.sh && \ 
    echo ""                                         >>  /root/env.sh && \ 
    echo "GIT_PROTOCOL="${GIT_PROTOCOL}             >>  /root/env.sh && \ 
    echo "GIT_URL="${GIT_URL}                       >>  /root/env.sh && \ 
    echo "GIT_ACCESS_TOKEN="${GIT_ACCESS_TOKEN}     >>  /root/env.sh && \ 
    echo "GIT_BRANCH="${GIT_BRANCH}                 >>  /root/env.sh && \ 
    echo "HOSTS_FILE="${HOSTS_FILE}                 >>  /root/env.sh && \ 
    echo ""                                         >>  /root/env.sh && \ 
    echo "export GIT_PROTOCOL"                      >>  /root/env.sh && \ 
    echo "export GIT_URL"                           >>  /root/env.sh && \ 
    echo "export GIT_ACCESS_TOKEN"                  >>  /root/env.sh && \ 
    echo "export GIT_BRANCH"                        >>  /root/env.sh && \ 
    echo "export HOSTS_FILE"                        >>  /root/env.sh && \ 
    chmod +x /root/*.sh && \ 
    git config --global  pull.rebase true

EXPOSE 80

CMD ["/bin/bash", "-c", "/root/openresty.sh"]
