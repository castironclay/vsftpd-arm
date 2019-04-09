# Docker container for vsftpd on ARM
# Original creation date April 9, 2019

FROM arm32v7/alpine

MAINTAINER Clay Coppage <https://github.com/castironclay>

ENV FTP_USER=ftpuser \
    FTP_PASS=supersecret \
    FTP_HOME=default \
    FTP_UID=1000 \
    ONLY_UPLOAD=NO \
    ONLY_DOWNLOAD=NO \
    PASV_ENABLE=NO \
    PASV_MIN=21100 \
    PASV_MIN=21100 \
    UMASK=022

RUN apk update
RUN apk add --no-cache \
    bash=4.4.19-r1 \
    openrc=0.39.2-r3 \
    vsftpd=3.0.3-r6

ADD vsftpd.conf /etc/vsftpd/vsftpd.conf
ADD configs/entrypoint.sh /usr/sbin/

RUN rc-update add vsftpd default \
    && chmod a+x /usr/sbin/entrypoint.sh

CMD /usr/sbin/entrypoint.sh
