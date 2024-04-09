FROM alpine:latest

RUN apk add bash

RUN apk add --no-cache postgresql-client

RUN mkdir -p /home/temp/db-backups/

RUN mkdir -p /home/temp/scripts/

RUN apk add bash && apk add tzdata

RUN cp /usr/share/zoneinfo/Asia/Kolkata /etc/localtime
