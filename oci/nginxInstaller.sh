#!/bin/bash

sudo yum install nginx
sudo systemctl enable --now nginx.service
sudo systemctl status nginx

sudo firewall-cmd --add-service=http --permanent
sudo firewall-cmd --reload

# more on https://docs.oracle.com/en/operating-systems/oracle-linux/8/obe-nginx-install/
