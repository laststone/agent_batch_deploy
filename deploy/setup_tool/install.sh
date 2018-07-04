#!/bin/bash

# ------------ config section ------------ #
#ssh_private_key_file=pz400.pem # key file; leave this line empty is use password
#remote_user=ec2-user  # user for ssh login
#remote_user=root  # user for ssh login
#become_user=root     # user to run sudo, normally is "root"
#become_user=root     # user to run sudo, normally is "root"
org_id=2
sys_id=2
port=4243
token=9c43fce52bcf44dcc55e8ee6a4288c8ccbf29125
metric=192.168.1.204
alertd=192.168.1.204:5001
os=RedHat # allowed values: Debian | Ubuntu | RedHat

# ---------------------------------------- #

update=""
if [[ "$#" == 1 && $1 == "-update" ]]; then
   update="update=1"
fi

connect="--ask-pass --ask-become-pass"
if [[ -n ${ssh_private_key_file} ]]; then
  connect="--private-key=${ssh_private_key_file}"
fi

/opt/cloudwiz-agent/altenv/bin/ansible-playbook agent_setup.yaml -v -i hosts   --extra-vars "org_id=${org_id} sys_id=${sys_id} token=${token} metric=${metric} alertd=${alertd} os=${os} PORT=${port} ${update}"
#./altenv/bin/ansible-playbook agent_setup.yaml -v -i hosts ${connect} --user=${remote_user} --become-user=${become_user} --extra-vars "org_id=${org_id} sys_id=${sys_id} token=${token} metric=${metric} alertd=${alertd} os=${os} ${update}"

