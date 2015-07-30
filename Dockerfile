FROM debian:wheezy

MAINTAINER Adam Veldhousen <adam@veldhousen.ninja>

ENV LANG en_US.UTF-8 
ENV LANGUAGE en_US:en 
ENV LC_ALL en_US.UTF-8 

RUN mkdir -p /var/run/sshd && apt-get update && apt-get install -y openssh-server tor adduser tmux sudo
RUN useradd -m -s /bin/bash torhost -p debian-tor && mkdir -p /home/torhost && chown -R torhost /home/torhost

COPY ./sshd_config /etc/ssh/sshd_config
COPY ./keys/id_rsa.pub /home/torhost/.ssh/authorized_keys
COPY ./startup.sh /home/torhost/startup.sh

WORKDIR /home/torhost

EXPOSE 22 9050 8118

ENTRYPOINT ["./startup.sh"]
