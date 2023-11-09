#!/bin/bash
ns="$1"
echo "$ns"

kubectl create ns "${ns}"
cd elasticsearch
make secrets
helm install elasticsearch . -n "${ns}"

cd ../logstash
helm install logstash . -n "${ns}"

cd ../kibana
make secrets
helm install --debug kibana . -n "${ns}"
