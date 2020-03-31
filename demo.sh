#!/bin/bash

########################
# include the magic
########################
. demo-magic.sh

rm ~/.kube/config
# hide the evidence
clear

# Put your stuff here

pe "kubectl vsphere login --insecure-skip-tls-verify --server <Supervisor host ip> -u administrator@vsphere.local"
pe "cat ~/.kube/config"
pe "clear"
pe "kubectl config get-contexts"
pe "kubectl config use-context demo1"
pe "clear"
pe "kubectl get all"
pe "clear"
pe "mkdir -p /etc/docker/certs.d/<Harbor IP Address>"
pe "cd /etc/docker/certs.d/<Harbor IP Address>"
pe "wget https://<Harbor IP Address>/api/systeminfo/getcert -O ca.crt --no-check-certificate"
pe "ls -ltr"
pe "clear"
pe "docker login <Harbor IP Address>"
pe "docker pull ghost:latest"
pe "clear"
pe "docker tag ghost:latest <Harbor IP Address>/demo1/ghost:v1"
pe "docker push <Harbor IP Address>/demo1/ghost:v1"
pe "clear"
pe "cat ./ghost-claim.yml"
pe "clear"
pe "kubectl apply -f ./ghost-claim.yml"
pe "kubectl get pvc"
pe "clear"
pe "cat ./ghost.yml"
pe "clear"
pe "kubectl apply -f ./ghost.yml"
pe "kubectl get all"
pe "kubectl get all"
pe "clear"
pe "kubectl get svc -o wide"
pe "clear"
pe "cat ./enable-policy.yml"
pe "clear"
pe "kubectl apply -f ./enable-policy.yml"
pe "kubectl get all -o wide"
pe "echo 'TKG Clusters'"
pe "clear"
pe "kubectl config use-context demo2"
pe "cat ./guest-cluster.yml"
pe "clear"
pe "kubectl apply -f ./guest-cluster.yml"
pe "clear"
pe "kubectl get managedcluster,clusters.cluster.x-k8s.io,machine.cluster.x-k8s.io,virtualmachines"
pe "clear"
pe "kubectl describe managedcluster demo-workload-cluster2"
pe "clear"
pe "kubectl config use-context demo1"
pe "kubectl vsphere login --server <Supervisor host ip> --vsphere-username administrator@vsphere.local --managed-cluster-namespace demo1 --managed-cluster-name demo-workload-cluster1 --insecure-skip-tls-verify"
pe "clear"
pe "kubectl config use-context demo-workload-cluster1"
pe "clear"
pe "kubectl apply -f ./nginx-lbsvc.yml"
pe "kubectl get all"
pe "kubectl get service/nginx"
