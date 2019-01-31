#!/bin/bash
timestamp=$(date +%s)
imagever=myanees/aneesm:v$timestamp
APIKEY=${clogin}
KUBECONFIG=${kubeconfig}
DLOGIN=${dlogin}
DPASS=${dpass}
docker login --username $DLOGIN --password $DPASS
docker build -t $imagever .
docker push $imagever
ibmcloud login --apikey $APIKEY -r eu-de
ibmcloud ks cluster-config mycluster
export $KUBECONFIG
#export DEPNAME=$(kubectl get deployment -o json | jq '.items[0].metadata.name')
export DEPNAME=$(kubectl get deployment --selector=$sel --output=jsonpath={.items..metadata.name})
echo $DEPNAME
if [[ $DEPNAME == *"helmsample"* ]]
then
  echo "Updating container IMAGE"
  helm upgrade love local/test --set=$imagever
else
  echo "Creating HELM PACKAGE"
helm package test1
helm install test1-0.1.1.tgz --name=helmsample
#  kubectl create -f exposeservice.yml
fi
