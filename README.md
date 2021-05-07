# docker-centos8-ansible-project-info

Retrieves information on an Ansible project over HTTP (using OpenResty)

## Usage:

Set the following environment variables before launching (below settings for this repo):

- GIT_PROTOCOL=https
- GIT_URL=github.com/vindevoy/docker-centos8-ansible-project-info.git  
- GIT_ACCESS_TOKEN=PUT_YOUR_TOKEN_HERE
- GIT_BRANCH=develop
- INVENTORY_FILE=src/sample/site.yml  (relative path, without starting slash !!)

When the image starts, the git directory will be cloned and used.  

Upon restart, it will clone again, allowing change of parameters.

## URLs:

- [ROOT]/hosts: all the hosts found in the inventory file
- [ROOT]/groups: all the groups found in the inventory file
- [ROOT]/hosts_groups: all the hosts and groups found in the inventory file (combines /hosts and /groups)
