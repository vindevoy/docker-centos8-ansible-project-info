#!/bin/bash

OUTPUT_DIR=/var/www/openresty
HOSTS_FILE=hosts.json
GROUPS_FILE=groups.json
OUTPUT_FILE=hosts_groups.json

echo Generating output: $OUTPUT_DIR/$OUTPUT_FILE

echo "["                        >   $OUTPUT_DIR/$OUTPUT_FILE.tmp
cat $OUTPUT_DIR/$HOSTS_FILE     >>  $OUTPUT_DIR/$OUTPUT_FILE.tmp
echo ","                        >>  $OUTPUT_DIR/$OUTPUT_FILE.tmp
cat $OUTPUT_DIR/$GROUPS_FILE    >>  $OUTPUT_DIR/$OUTPUT_FILE.tmp
echo "]"                        >>  $OUTPUT_DIR/$OUTPUT_FILE.tmp

#debug
#cat $OUTPUT_DIR/$OUTPUT_FILE.tmp

cat $OUTPUT_DIR/$OUTPUT_FILE.tmp | jq 'flatten' | sponge $OUTPUT_DIR/$OUTPUT_FILE
rm -f $OUTPUT_DIR/$OUTPUT_FILE.tmp

#debug
#cat $OUTPUT_DIR/$OUTPUT_FILE

echo "Hosts+groups request done"