#!/bin/bash
docker login localhost:8080
docker build -t $microserviceName .
docker tag $microserviceName $(frontend or backend):latest
docker push $(frontend or backend):latest
if [[ "$environment" == "frontend" ]]; then
  kubectl apply -f template/frontend-deployment.yaml
  kubectl apply -f template/frontend-service.yaml  
else [[ "$environment" == "backend" ]]; then
  kubectl apply -f template/backend-deployment.yaml
  kubectl apply -f template/backend-service.yaml
fi 