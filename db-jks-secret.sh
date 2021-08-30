#!/usr/bin/env bash

cd /Users/akpatil@us.ibm.com/Documents/GESTS\ certs
kubectl create secret generic db-jks-secret --from-file=./ibm-ssl-truststore.jks -n demo