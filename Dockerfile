# shadowsocks
#
# VERSION 0.0.3

FROM ubuntu:14.04.2
MAINTAINER ashui from ashui.net <admin@ashui.net>

RUN apt-get update && \
    apt-get install -y python-pip python-m2crypto
RUN pip install shadowsocks==2.6.11

# Configure container to run as an executable
ENTRYPOINT ["/usr/local/bin/ssserver -s 0.0.0.0 -p 8090 -k ashui.net -m aes-256-cfb"]
