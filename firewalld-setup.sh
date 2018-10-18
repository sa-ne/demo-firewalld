#!/bin/bash

# Install apache for demo manipulation
echo -e "Installing apache ..."
yum install -y httpd
systemctl start httpd
systemctl status httpd
