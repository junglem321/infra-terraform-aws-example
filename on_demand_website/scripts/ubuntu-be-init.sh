#!/bin/bash

# update packages
apt install update -y
apt install upgrade -y
apt install apache2 -y

sed -i "s/80/${PORT}/g" /etc/apache2/ports.conf
sed -i "s/*:80/*:${PORT}/g" /etc/apache2/sites-enabled/000-default.conf

service apache2 reload

echo "<h1>Hello World from $(hostname) in backend</h1><h1>Target = ${target_dns}:${target_port}</h1>" > /var/www/html/index.html