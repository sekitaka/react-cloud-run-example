#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0);pwd)
PROJECT=react_cloud_run_example

usage(){
  echo "Usage: docker_helper.sh command"
}

case $1 in
  "up" )
    docker-compose -p $PROJECT -f $SCRIPT_DIR/docker-compose.yml up -d
  ;;
  "stop" )
    docker-compose -p $PROJECT -f $SCRIPT_DIR/docker-compose.yml stop
  ;;
  "build" )
    docker-compose -p $PROJECT -f $SCRIPT_DIR/docker-compose.yml build
  ;;
  "attach" )
    docker exec -it `docker ps -q -f name=${PROJECT}_app` bash
  ;;
  * )
    usage
  ;;
esac
