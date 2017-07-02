# vim:set ft=dockerfile:
FROM alpine:latest

MAINTAINER Jean-Paul github.com/jpduyx

RUN apk add --update less curl sngrep ngrep \
      asterisk asterisk-curl asterisk-speex asterisk-sample-config \
      asterisk-sounds-en asterisk-sounds-moh \
&&  rm -rf /usr/lib/asterisk/modules/*pjsip* \
&&  rm -rf /var/cache/apk/* /tmp/* /var/tmp/*

# start asterisk so it creates missing folders and initializes astdb
RUN asterisk && sleep 5

ADD docker-entrypoint.sh /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["/usr/sbin/asterisk", "-vvvdddf", "-T", "-W", "-U", "root", "-p"]
