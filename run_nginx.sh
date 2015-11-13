#!/bin/bash

# copy the conf file so we don't override the original file later on (with sed)
cp /etc/nginx/conf.mount/service.conf /etc/nginx/conf.d/service.conf

# replace wsgi backend address with env vars values
/bin/sed -i "s/server<uwsgi_server_placeholder>/${WEB_PORT_44000_TCP_ADDR}:${WEB_PORT_44000_TCP_PORT}/" /etc/nginx/conf.d/service.conf

# now start nginx
exec nginx
