#build
#FROM kong:2.0.4-alpine
FROM kong:latest
USER root
MAINTAINER AAVASH
RUN apk update && apk add ca-certificates && rm -rf /var/cache/apk/*
COPY .certi/ca.crt /usr/local/share/ca-certificates/
#COPY ./nginx_certi/* /home/kong/
COPY .certi/kong-admin.key /home/kong/
COPY .certi/kong-admin.crt /home/kong/

RUN chmod 644 /home/kong/kong-admin.key
RUN chmod 644 /home/kong/kong-admin.crt
RUN update-ca-certificates
COPY nginx-kong.conf /usr/local/kong/nginx-kong.conf
USER kong
