FROM jenkins/jenkins:lts

USER root
RUN curl -fsSL https://get.docker.com | sh
RUN usermod -aG docker jenkins
# RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
# RUN apt-get update && apt-get install docker-ce && apt-get clean
USER jenkins

ENV JAVA_OPTS="-Djenkins.install.runSetupWizard=false"

COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

# TODO: If starting to do slaves
#RUN mkdir /var/jenkins_home/ssh-keys
#COPY test_rsa /ssh-keys/jenkins

#COPY init.groovy.d/* /usr/share/jenkins/ref/init.groovy.d/



