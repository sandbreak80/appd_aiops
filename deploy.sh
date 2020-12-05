#!/bin/bash
#Please add your env details to appd.env prior to running this script.
#This script assumes the AppD cluster agent needs to be installed
#This script assumes the metrics-server needs to be installed

source appd.env

kubectl create namespace appdynamics
kubectl create -f cluster-agent-operator.yaml -n appdynamics
kubectl create -f metrics-server-components.yaml -n kube-default

kubectl create namespace teastore
kubectl create -f teastore-ribbon.yaml -n teastore
#kubectl create -f teastore-clusterip.yaml -n teastore

kubectl -n appdynamics create secret generic cluster-agent-secret --from-literal=controller-key=$appd_controller_secret
kubectl create -f cluster-agent-instr.yaml -n appdynamics