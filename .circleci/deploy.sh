#!/usr/bin/env bash

echo "stopping running application"
ssh jason@40.78.97.72 'sudo docker stop nginx'
ssh jason@40.78.97.72 'sudo docker rm nginx'

echo "pulling latest version of the code"
ssh jason@40.78.97.72 'sudo docker pull coolkoo/nginx_image:latest'

echo "starting the new version"
ssh jason@40.78.97.72 'sudo docker run -d --restart=always --name nginx -p 80:80 coolkoo/nginx_image:latest'

echo "success!"

exit 0
