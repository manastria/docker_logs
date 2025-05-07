# ./rsyslog/Dockerfile
FROM alpine:3.19
RUN apk add --no-cache rsyslog rsyslog-mysql
COPY rsyslog.conf /etc/rsyslog.conf
EXPOSE 514/udp
CMD ["rsyslogd","-n"]
