FROM arm32v7/alpine
MAINTAINER Clay Coppage
RUN apk update
RUN apk add --no-cache \
    bash \
    vsftpd
