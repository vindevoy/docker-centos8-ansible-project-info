# docker-centos8-ansible-project-info

Retrieves information on an Ansible project over HTTP (using OpenResty).  This Docker image runs on CentOS 8.

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


## Version history

- 1.0.2 (2020-05-07): bugfix, nulls in hosts when using subgroups
- 1.0.1 (2020-05-07): minor bugfix, prevents problem detected in Debian image
- 1.0.0 (2020-05-07): first version providing [ROOT]/hosts, [ROOT]/groups, [ROOT]/hosts_groups
