FROM datt/datt-archlinux
EXPOSE 22
RUN echo 'root:4rchl1nux' |chpasswd
RUN pacman -Syu --noconfirm
RUN pacman -S --noconfirm --needed base base-devel openssh
RUN mkdir /var/run/sshd
RUN /usr/bin/ssh-keygen -A
RUN /usr/bin/sshd -D
