#!/bin/bash
sudo -i
yum -y update
amazon-linux-extras install docker
service docker start
usermod -a -G docker ec2-user
gpasswd -a ec2-user docker
echo "jenkins ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
newgrp docker
exit