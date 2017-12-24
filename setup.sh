#!/bin/sh

sed -i "s/ssr_server_host/${SSR_SERVER_HOST}/g" /usr/local/share/shadowsocksr/config.json
sed -i "s/ssr_server_port/${SSR_SERVER_PORT}/g" /usr/local/share/shadowsocksr/config.json
sed -i "s/ssr_password/${SSR_PASSWORD}/g" /usr/local/share/shadowsocksr/config.json
sed -i "s/ssr_method/${SSR_METHOD}/g" /usr/local/share/shadowsocksr/config.json
sed -i "s/ssr_protocol/${SSR_PROTOCOL}/g" /usr/local/share/shadowsocksr/config.json
sed -i "s/ssr_obfs/${SSR_OBFS}/g" /usr/local/share/shadowsocksr/config.json

sed -i "s/privoxy_listen_host/${PRIVOXY_LISTEN_HOST}/g" /etc/privoxy/config
sed -i "s/privoxy_listen_port/${PRIVOXY_LISTEN_PORT}/g" /etc/privoxy/config
