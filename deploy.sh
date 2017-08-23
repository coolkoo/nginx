#!/usr/bin/env bash

echo "stopping running application"
ssh root@distelli.cloudapp.net 'docker stop $(docker ps -a -q)'
ssh root@distelli.cloudapp.net 'docker rm $(docker ps -a -q)'

echo "pulling latest version of the code"
ssh root@distelli.cloudapp.net 'docker pull coolkoo/nginx_image:latest'

echo "starting the new version"
ssh root@distelli.cloudapp.net 'docker run -d --restart=always --name nginx -p 8081:80 coolkoo/nginx_image:latest'

echo "Docker Deployed"
echo "=============================================="
echo ""

echo "deploying HAproxy with Chef"
ssh root@distelli.cloudapp.net 'chef-client'

exit 0
