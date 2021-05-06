
# ABOVE THIS LINE, THE NEEDED VARS ARE SET FROM THE DOCKERFILE
# DO NOT TOUCH BELOW, AFTER DEVELOPMENT

ANSIBLE_DIR=/var/opt/ansible
OUTPUT_DIR=/var/www/openresty
OUTPUT_FILE=request.json

mkdir -p $OUTPUT_DIR
touch $OUTPUT_DIR/$OUTPUT_FILE


cd $ANSIBLE_DIR
git checkout $GIT_BRANCH    
git pull origin $GIT_BRANCH  

echo Generating output: $OUTPUT_DIR/$OUTPUT_FILE

ansible-inventory -i $HOSTS_FILE --list | sponge $OUTPUT_DIR/$OUTPUT_FILE

echo "Request done"