#!/usr/bin/env bash

echo "stopping running application"
ssh root@40.78.97.72 'docker stop $(docker ps -a -q)'
ssh root@40.78.97.72 'docker rm $(docker ps -a -q)'

echo "pulling latest version of the code"
ssh root@40.78.97.72 'docker pull coolkoo/nginx_image:latest'

echo "starting the new version"
ssh root@40.78.97.72 'docker run -d --restart=always --name nginx -p 8081:80 coolkoo/nginx_image:latest'

echo "success!"


echo "deploying HAproxy with Chef"
ssh root@40.78.97.72 'chef-client'

exit 0
