#! /bin/bash

port=${1:-34196}
path=${2:-/home/toad/factorio/saves}
save=${3:-toad}

docker run -v ${path}:/usr/local/factorio/saves -p ${port}:34197/udp -d factorio ${save}

docker_id=`docker ps | grep factorio | awk '{print $1}'`
docker logs -f $docker_id
