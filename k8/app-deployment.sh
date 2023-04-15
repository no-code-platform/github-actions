#!/bin/bash

PR_NUMBER=$1

# Substitute PR number in the deployment manifest
cat app-deployment.yaml | \
  sed "s/PR_NUMBER_PLACEHOLDER/$PR_NUMBER/g" | \
  kubectl apply -f -

# Wait for the deployment to be ready
kubectl wait --for=condition=Available deployment/myapp-pr-$PR_NUMBER