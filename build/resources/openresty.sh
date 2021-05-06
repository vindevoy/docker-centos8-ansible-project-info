#/bin/bash

PATH=/usr/local/openresty/nginx/sbin:$PATH
export PATH

if [ ! -d /var/opt/ansible ]
then
    mkdir -p /var/opt/ansible;
    git clone $GIT_PROTOCOL://$GIT_ACCESS_TOKEN@$GIT_URL /var/opt/ansible; 
fi

/usr/local/openresty/nginx/sbin/nginx -g 'daemon off;' -c /root/openresty.conf