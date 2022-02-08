# Docker image for developing with Visual Studio
FROM microblinkdev/clang-devenv:13.0.1

LABEL description="Container for use with Visual Studio"

# install dependencies required for Visual Studio

RUN yum -y install openssh-server rsync gdb procps psmisc

# configure SSH for communication with Visual Studio

RUN mkdir -p /var/run/sshd

RUN echo 'PasswordAuthentication yes' >> /etc/ssh/sshd_config && \
   ssh-keygen -A

# expose port 22
EXPOSE 22

# define password for SSH access
RUN echo root:microblink | chpasswd

CMD /usr/sbin/sshd -D
