#!/bin/bash

kubectl config use-context demo-workload-cluster1
kubectl delete -f nginx-lbsvc.yml
kubectl config use-context demo1
kubectl delete -f ./guest-cluster.yml
kubectl delete -f ./enable-policy.yml
kubectl delete -f ./ghost.yml
kubectl delete -f ./ghost-claim.yml
rm -rf /etc/docker/certs.d/
