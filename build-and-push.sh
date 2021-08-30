#!/usr/bin/env bash

docker build -t kafka-connect-demo .
docker login -u iamapikey -p $MKTSYS_API_KEY us.icr.io
docker tag kafka-connect-demo us.icr.io/kafka-connect-demo/kc:v1
docker push us.icr.io/kafka-connect-demo/kc:v1