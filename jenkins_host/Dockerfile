FROM jenkins/jenkins

USER root

RUN apt-get update && \ 
    apt-get -y install python3 && \
    apt-get -y install python3-pip

# Install ansible
#RUN curl "https://bootstrap.pypa.io/get-pip.py" -o "get-pip.py" && python get-pip.py

RUN pip3 install -U ansible

# Install Docker

RUN apt-get update && \
apt-get -y install apt-transport-https \
     ca-certificates \
     curl \
     gnupg2 \
     software-properties-common && \
curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg > /tmp/dkey; apt-key add /tmp/dkey && \
add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") \
   $(lsb_release -cs) \
   stable" && \
apt-get update && \
apt-get -y install docker-ce

# COmpose

RUN curl -L "https://github.com/docker/compose/releases/download/1.22.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && chmod +x /usr/local/bin/docker-compose

RUN usermod -aG docker jenkins

#ssh-keygen sometimes work, sometimes the key files are lost in the container. alternative is to rerun these commends after spinning up the container.  
#RUN ssh-keygen -f /tmp/remote-key
#RUN cat /tmp/remote-key
#RUN ssh-keygen -p -f /tmp/remote-key -m pem -P passphrase -N passphrase
#RUN cat /tmp/remote-key

#USER jenkins

