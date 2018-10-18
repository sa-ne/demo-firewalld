#!/bin/bash

# Cleanup all demo changes
echo -e "Cleaning up, removing apache and firewall changes ..."
yum remove -y httpd
firewall-cmd --remove-service=http --remove-service=https --permanent
firewall-cmd --remove-port=8080/tcp --permanent
firewall-cmd --reload

firewall-cmd --list-all
