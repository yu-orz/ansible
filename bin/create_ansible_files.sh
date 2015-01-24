#!/bin/bash

# Create ansible Best Practice directory
# http://docs.ansible.com/playbooks_best_practices.html#directory-layout
# 2014/02/19
# version 0.1

CREATE_ROLES_DIR="common apache nginx postfix mariadb powerdns"

echo "# inventory file for production servers" > production
echo "# inventory file for stage environment" > stage
mkdir group_vars
echo "# here we assign variables to particular groups" > group_vars/group1
mkdir host_vars
echo "# if systems need specific variables, put them here" > host_vars/hostname1
echo "# master playbook" > site.yml
echo "# playbook for webserver tier" > webservers.yml
echo "# playbook for dbserver tier" > dbservers.yml
echo "# playbook for mailserver tier" > mailservers.yml

# this hierarchy represents a "role"
for ROLES_DIR in ${CREATE_ROLES_DIR}
do
  mkdir -p roles/${ROLES_DIR}/{tasks,handlers,templates,files,vars}
  echo "# tasks file can include smaller files if warranted" > roles/${ROLES_DIR}/tasks/main.yml
  echo "# handlers file" > roles/${ROLES_DIR}/handlers/main.yml
  echo "# templates end in .j2" > roles/${ROLES_DIR}/templates/templates.j2
  echo "# variables associated with this role" > roles/${ROLES_DIR}/vars/main.yml
done

exit
