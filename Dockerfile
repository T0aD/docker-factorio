FROM ubuntu:14.04

ENV VERSION 0.12.35

WORKDIR /usr/local
RUN apt-get -y install wget && \
    wget https://www.factorio.com/get-download/$VERSION/headless/linux64 -O factorio_headless_x64_$VERSION.tar.gz && \
    tar xzvf factorio_headless_x64_$VERSION.tar.gz && \
    rm -v factorio_headless_x64_$VERSION.tar.gz && \
    apt-get -y purge wget && \
    apt-get -y autoclean

#RUN strip /usr/local/factorio/bin/x64/factorio

COPY ./usr /usr
#COPY ./factorio /usr/local/factorio

EXPOSE 34197

ENTRYPOINT ["/usr/sbin/entry.sh"]

