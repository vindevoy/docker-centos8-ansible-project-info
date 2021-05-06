#!/bin/bash

source /root/env.sh 

ANSIBLE_DIR=/var/opt/ansible
OUTPUT_DIR=/var/www/openresty
OUTPUT_FILE=groups.json

mkdir -p $OUTPUT_DIR

cd $ANSIBLE_DIR
git checkout $GIT_BRANCH    
git pull origin $GIT_BRANCH  

echo Generating output: $OUTPUT_DIR/$OUTPUT_FILE

ansible-inventory -i $HOSTS_FILE --list | jq .all.children | jq '[ .[] | select(. != "ungrouped") ]' | sponge $OUTPUT_DIR/$OUTPUT_FILE

echo "Groups request done"