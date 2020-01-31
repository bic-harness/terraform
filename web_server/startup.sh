#!/bin/bash

sudo yum install httpd git curl unzip -y
sudo systemctl enable httpd
sudo systemctl start httpd