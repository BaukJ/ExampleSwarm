FROM centos/systemd
# TODO: Sort these into better order
RUN yum -y install openssh-server java-1.8.0-openjdk
RUN systemctl enable sshd


COPY ssh_setup.service /etc/systemd/system/
RUN chmod +x /etc/systemd/system/ssh_setup.service
RUN systemctl enable ssh_setup

COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh
# ENTRYPOINT ["/entrypoint.sh"]
# CMD []

RUN yum install -y git
