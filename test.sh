ansible webservers -b -m yum -a "name=httpd state=present"
ansible dbservers -b -m yum -a "name=mysql state=present"