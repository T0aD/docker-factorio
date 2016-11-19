#! /bin/bash

VERSION=0.14.20

wget https://www.factorio.com/get-download/$VERSION/headless/linux64 -O factorio_headless_x64_$VERSION.tar.gz
tar xzvf factorio_headless_x64_$VERSION.tar.gz
rm -v factorio_headless_x64_$VERSION.tar.gz
du -sh ./factorio
strip ./factorio/bin/x64/factorio
du -sh ./factorio

docker build -t factorio .
docker build -t factorio:$VERSION .
docker images factorio
