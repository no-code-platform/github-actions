#!/bin/bash

PR_NUMBER="pr-$1"

cd $(dirname "$0")

kubectl delete ingress "my-ingress-$PR_NUMBER"

# Substitute PR number in the deployment manifest
cat ./app-ingress.yaml | \
  sed "s/PR_NUMBER_PLACEHOLDER/$PR_NUMBER/g" | \
  kubectl apply -f -