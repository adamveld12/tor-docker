FROM debian:wheezy

MAINTAINER Adam Veldhousen <adam@veldhousen.ninja>


ENV LANG en_US.UTF-8 
ENV LANGUAGE en_US:en 
ENV LC_ALL en_US.UTF-8 


RUN mkdir -p /var/run/sshd && apt-get update && apt-get install -y openssh-server tor adduser
RUN useradd torhost -p debian-tor && mkdir -p /home/torhost && chown -R torhost /home/torhost


COPY ./sshd_config /etc/ssh/sshd_config
COPY ./keys/id_rsa.pub /root/.ssh/authorized_keys
COPY ./keys/id_rsa.pub /home/torhost/.ssh/authorized_keys

EXPOSE 22 9050 8118

ENTRYPOINT ["/usr/sbin/sshd", "-D"]

