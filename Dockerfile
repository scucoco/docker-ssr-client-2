FROM ubuntu:16.04

RUN apt-get update
RUN apt-get install -y privoxy
RUN apt-get install -y git
RUN apt-get install -y python

RUN git clone -b manyuser https://github.com/shadowsocksr-backup/shadowsocksr.git /usr/local/share/shadowsocksr

COPY ssr-client.json /usr/local/share/shadowsocksr/config.json
COPY privoxy-config /etc/privoxy/config
COPY setup.sh /entrypoint/setup.sh

ENV SSR_SERVER_HOST=13.76.46.29
ENV SSR_SERVER_PORT=2333
ENV SSR_PASSWORD=hiaewalle
ENV SSR_METHOD=AES-256-CFB
ENV SSR_PROTOCOL=auth_aes128_md5
ENV SSR_OBFS=tls1.2_ticket_auth
ENV PRIVOXY_LISTEN_HOST=0.0.0.0
ENV PRIVOXY_LISTEN_PORT=8123

CMD /bin/bash /entrypoint/setup.sh; python /usr/local/share/shadowsocksr/shadowsocks/local.py -c /usr/local/share/shadowsocksr/config.json -d start; privoxy --no-daemon /etc/privoxy/config
