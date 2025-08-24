FROM alpine:latest
MAINTAINER Torben Jaeger <jicken@gmail.com>

RUN /sbin/apk add offlineimap python3 && \
      addgroup -g 1000 imap && \
      adduser -D -h /home/imap -G imap -u 1000 imap

USER imap
ENV HOME /home/imap
VOLUME ["/config"]

CMD ["offlineimap", "-c", "/config/offlineimaprc"]
