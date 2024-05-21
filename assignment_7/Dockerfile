FROM alpine:latest
LABEL maintainer="crane khavari <crane.khavari.4012@mail.linnbenton.edu"

RUN apk -U add nodejs

COPY src/server.js /srv/server.js
COPY src/hello_world.png /srv/hello_world.png

EXPOSE 8080
