#!/bin/bash

docker-compose -f docker-compose.yml up -d namenode hive-metastore-postgresql
docker-compose -f docker-compose.yml up -d datanode hive-metastore
docker-compose -f docker-compose.yml up -d resourcemanager
docker-compose -f docker-compose.yml up -d nodemanager
docker-compose -f docker-compose.yml up -d historyserver
sleep 5
docker-compose -f docker-compose.yml up -d hive-server
docker-compose -f docker-compose.yml up -d spark-master spark-worker
docker-compose -f docker-compose.yml up -d mysql-server
docker-compose -f docker-compose.yml up -d elasticsearch
docker-compose -f docker-compose.yml up -d kibana


docker-compose exec spark-master bash -c "./copy-jar.sh && exit"
