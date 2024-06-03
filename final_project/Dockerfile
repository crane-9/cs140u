FROM  nginx:stable-alpine-otel
LABEL maintainer="crane khavari <crane.khavari.4012@mail.linnbenton.edu>"

# Get NodeJS
RUN apk -U add nodejs openrc

# Log dir.
RUN mkdir logs

# Set up resources for RC.
RUN mkdir /run/openrc && touch /run/openrc/softlevel
RUN openrc
RUN rc-service nginx start


# Super important config file.
COPY nginx/nginx.conf /etc/nginx/nginx.conf
COPY nginx/proxy_params.conf /etc/nginx/proxy_params.conf

# Site data.
COPY site1/*  /srv/site1/
COPY site2/*  /srv/site2/
COPY static/* /srv/static/

# Run sub-servers
CMD node /srv/site1/server.js & node /srv/site2/server.js

EXPOSE 80
