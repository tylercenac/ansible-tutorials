

## Test Ad hoc commands and ssh command comparison

# ssh node01 "hostname -f"
# ansible node01   -a "hostname -f"

# ssh node01 "mkdir /home/ec2-user/mytestdir"
ansible node00  -a "mkdir /home/ec2-user/testdirAnsible"
ansible node00 -m copy -a "src=inventory/ansible-nodes dest=/tmp/ansible-nodes"
ansible node00 -m shell -a "cat /tmp/ansible-nodes" 
ansible node00 -b -m yum -a "name=httpd state=present"
ansible node00 -b -m yum -a "name=git state=present"
ansible node00 -b -m git -a "repo=https://github.com/becloudready/prometheus_monitoring.git dest=/tmp version=HEAD"

# Using Ansible modules in ad-hoc commands

ansible -m service -a "name=nginx state=started enabled=yes" node00 --become
ansible -m file -a "path=/home/ec2-user/usingAnsible state=directory" node00 --become
ansible -m copy -a "src=Vagrantfile dest=/tmp" node00 --become

#1

ansible all -m shell -a "date"

#2 create db group and add remote node to it. verify.
ansible all -m group -a "name=db"


#3
ansible all -m shell -a "yum install python3 git -y && yum remove python3 git -y"


#4
ansible all -m user -a "name=joe home=/root/"#2

#5 clone github repo
  
ansible all -b -m git -a "repo=https://github.com/becloudready/ansible-tutorials.git dest=/tmp version=HEAD"



#6 fetch .bash_profile from remote node and store it on controller in home directory as remote_node_profile


