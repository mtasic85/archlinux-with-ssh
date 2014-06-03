FROM base/arch
MAINTAINER Marko Tasic <mtasic85@gmail.com>
EXPOSE 22

RUN pacman -Syu --noconfirm
RUN pacman -S --noconfirm --needed base openssh vim sudo
RUN rm -r /var/cache/pacman/pkg/*

RUN mkdir /var/run/sshd
RUN /usr/bin/ssh-keygen -A
RUN /usr/bin/sshd

RUN echo 'root:4rchl1nux' | chpasswd
RUN echo "exec >/dev/tty 2>/dev/tty </dev/tty" > /root/run.sh;
CMD /bin/bash --init-file /root/run.sh
