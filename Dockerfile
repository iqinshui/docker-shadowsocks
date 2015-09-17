# shadowsocks
#
# VERSION 0.0.3

FROM ubuntu:14.04.2
MAINTAINER ashui from ashui.net <admin@ashui.net>

RUN apt-get update && \
    apt-get install -y python-pip python-m2crypto
RUN pip install shadowsocks==2.6.11

ENV SS_SERVER_ADDR 0.0.0.0
ENV SS_SERVER_PORT 8090
ENV SS_PASSWORD password
ENV SS_METHOD aes-256-cfb
ENV SS_TIMEOUT 300

ADD shadowsocks.json /etc/
ADD start.sh /usr/local/bin/start.sh
RUN chmod 755 /usr/local/bin/start.sh

EXPOSE $SS_SERVER_PORT

#CMD ["sh", "-c", "/start.sh"]
ENTRYPOINT ["/usr/local/bin/ssserver"]
