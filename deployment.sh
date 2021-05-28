#!/bin/bash
if [[ "$environment" == "frontend" ]]; then
  cd frontend
  docker login localhost:8080
  docker build -t $microserviceName .
  docker tag $microserviceName frontend:latest
  docker push $frontend:latest
  cd ..
  kubectl apply -f template/frontend-deployment.yaml
  kubectl apply -f template/frontend-service.yaml  
else [[ "$environment" == "backend" ]]; then
  docker login localhost:8080
  docker build -t $microserviceName .
  docker tag $microserviceName backend:latest
  docker push $backend:latest
  kubectl apply -f template/backend-deployment.yaml
  kubectl apply -f template/backend-service.yaml
fi
