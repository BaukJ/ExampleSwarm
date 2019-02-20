FROM bauk/jenkins-ssh_slave

RUN curl -fsSL https://get.docker.com | sh
#RUN usermod -o -aG docker 1000

RUN yum install -y git

ENV SSH_USER_GROUPS=docker

