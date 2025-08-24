FROM alpine:latest
MAINTAINER Torben Jaeger <jicken@gmail.com>

RUN /sbin/apk add offlineimap && \
      addgroup -g 1000 imap && \
      adduser -D -h /home/imap -G imap -u 1000 imap

USER imap
ENV HOME /home/imap
VOLUME ["/config"]

CMD ["offlineimap", "-c", "/config/offlineimaprc"]
