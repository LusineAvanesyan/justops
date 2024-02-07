# 1. go to the backend folder in linux
# 2. run docker build command to create the docker image with name lus and with tag 1.0
docker build -t lus:1.0 .

# 3. run docker run command to run the docker container from the image
docker run -d lus:1.0

# 4. make sure that the docker container is running
docker ps

# 5. identiy what is the docker container's IP with docker inspect command where frosty_banach is the name of container
docker inspect frosty_banach

# 6. make sure the container works and the webservice returns appropriate "barev vonc es" text for test where 172.18.0.2 IP is taken from the inspected docker container json
 curl http://172.18.0.2:5000/barev




 # 7. in case you need to delete all not running images and containers
  docker system prune -a