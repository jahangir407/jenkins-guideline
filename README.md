# jenkins-guideline

01. docker installtion guideline ref: https://www.jenkins.io/doc/book/installing/docker/

01. run setup.sh script (make sure current user is added in the docker group. ref: https://docs.docker.com/engine/install/linux-postinstall/)

03.  to print the password in the console without having to exec into the container. (required for initial Jenkins setup.)
     - sudo docker exec ${CONTAINER_ID or CONTAINER_NAME} cat /var/jenkins_home/secrets/initialAdminPassword
         - docker exec jenkins-blueocean cat /var/jenkins_home/secrets/initialAdminPassword

04. 