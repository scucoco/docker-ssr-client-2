FROM ubuntu:16.04

RUN apt-get update
RUN apt-get install -y privoxy
RUN apt-get install -y git
RUN apt-get install -y python

RUN git clone -b manyuser https://github.com/shadowsocksr-backup/shadowsocksr.git /usr/local/share/shadowsocksr

COPY ssr-client.json /usr/local/share/shadowsocksr/config.json
COPY privoxy-config /etc/privoxy/config
COPY setup.sh /entrypoint/setup.sh

ENV SSR_SERVER_HOST=0.0.0.0
ENV SSR_SERVER_PORT=8388
ENV SSR_PASSWORD=password
ENV SSR_METHOD=aes-128-ctr
ENV SSR_PROTOCOL==aes-128-ctr
ENV SSR_OBFS=tls1.2_ticket_auth_compatible
ENV PRIVOXY_LISTEN_HOST=0.0.0.0
ENV PRIVOXY_LISTEN_PORT=8123

CMD python /usr/local/share/shadowsocksr/shadowsocks/local.py -c /usr/local/share/shadowsocksr/config.json -d start; /bin/bash /entrypoint/setup.sh; privoxy --no-daemon /etc/privoxy/config