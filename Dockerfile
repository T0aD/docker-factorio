FROM ubuntu:14.04

COPY ./usr /usr
COPY ./factorio /usr/local/factorio

EXPOSE 34197

ENTRYPOINT ["/usr/sbin/entry.sh"]

