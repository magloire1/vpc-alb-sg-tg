#!/bin/bash
sudo su
yum update -y
yum install httpd -y
systemctl start httpd
systemctl enable httpd 
echo "<html><head><style>body { background-color: purple; color: white; }</style></head><body><h1><p> Welcome to Utokitrainning. This is Toki and i'm happy you visiting this cite.<br> You are redirected tp ${HOSTNAME} to see how the load balancer is sharing the traffic.</p></h1></body></html>" > /var/www/html/index.html
