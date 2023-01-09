#Create a bridge network in Docker using the following docker network create command:
sudo docker network create jenkins
echo "setup 01: docker network is created."

#In order to execute Docker commands inside Jenkins nodes, download and run the docker:dind Docker image using the following docker run command:
sudo docker run --name jenkins-docker --rm --detach \
  --privileged --network jenkins --network-alias docker \
  --env DOCKER_TLS_CERTDIR=/certs \
  --volume jenkins-docker-certs:/certs/client \
  --volume jenkins-data:/var/jenkins_home \
  --publish 2376:2376 \
  docker:dind --storage-driver overlay2
echo "step 02: docker:bind container is up."


#Build a new docker image from this Dockerfile and assign the image a meaningful name, e.g. "myjenkins-blueocean:2.361.4-1":
sudo docker build -t myjenkins-blueocean:2.361.4-1 docker-setup
echo "step 03: myjenkins-blueocean:2.361.4-1 custom image build is completed."


#Run your own myjenkins-blueocean:2.361.4-1 image as a container in Docker using the following docker run command:
sudo docker run --name jenkins-blueocean --restart=on-failure --detach \
  --network jenkins --env DOCKER_HOST=tcp://docker:2376 \
  --env DOCKER_CERT_PATH=/certs/client --env DOCKER_TLS_VERIFY=1 \
  --publish 8080:8080 --publish 50000:50000 \
  --volume jenkins-data:/var/jenkins_home \
  --volume jenkins-docker-certs:/certs/client:ro \
  myjenkins-blueocean:2.361.4-1
echo "step 04: jenkins-blueocean container is up."

#to print the password in the console without having to exec into the container. (required for initial Jenkins setup.)
docker exec jenkins-blueocean cat /var/jenkins_home/secrets/initialAdminPassword
echo "step 05: ^^^^initialAdminPassword for Jenkins server^^^"


