#!/bin/bash

PR_NUMBER="pr-$1"

cd $(dirname "$0")

kubectl delete deployments "myapp-pr-$PR_NUMBER"

# Substitute PR number in the deployment manifest
cat ./app-deployment.yaml | \
  sed "s/PR_NUMBER_PLACEHOLDER/$PR_NUMBER/g" | \
  kubectl apply -f -


# Wait for the deployment to be ready
kubectl wait --for=condition=Available deployment/myapp-pr-$PR_NUMBER