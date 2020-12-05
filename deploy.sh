#!/bin/bash
source appd.env

kubectl create namespace appdynamics
kubectl create -f cluster-agent-operator.yaml -n appdynamics


kubectl create namespace teastore
kubectl create -f https://raw.githubusercontent.com/DescartesResearch/TeaStore/master/examples/kubernetes/teastore-ribbon.yaml -n teastore

kubectl -n appdynamics create secret generic cluster-agent-secret --from-literal=controller-key=$appd_controller_secret
kubectl create -f cluster-agent-instr.yaml -n appdynamics