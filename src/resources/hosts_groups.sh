#!/bin/bash

OUTPUT_DIR=/var/www/openresty
HOSTS_FILE=hosts.json
GROUPS_FILE=groups.json
OUTPUT_FILE=hosts_groups.json

echo Generating output: $OUTPUT_DIR/$OUTPUT_FILE

echo "["                        >   $OUTPUT_DIR/$OUTPUT_FILE
cat $OUTPUT_DIR/$HOSTS_FILE     >>  $OUTPUT_DIR/$OUTPUT_FILE
echo ","                        >>  $OUTPUT_DIR/$OUTPUT_FILE
cat $OUTPUT_DIR/$GROUPS_FILE    >>  $OUTPUT_DIR/$OUTPUT_FILE
echo "]"                        >>  $OUTPUT_DIR/$OUTPUT_FILE

cat $OUTPUT_DIR/$OUTPUT_FILE | jq 'flatten' | sponge $OUTPUT_DIR/$OUTPUT_FILE

echo "Hosts+groups request done"