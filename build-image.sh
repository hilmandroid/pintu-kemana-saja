#!/usr/bin/bash

cd backend
docker build . -t trivia-backend:1.0
docker image tag trivia-backend:1.0 docker.io/hilmandroid/trivia-backend:1.0
docker push docker.io/hilmandroid/trivia-backend:1.0
cd ../frontend
docker build . -t trivia-frontend:1.0
docker image tag trivia-frontend:1.0 docker.io/hilmandroid/trivia-frontend:1.0
docker push docker.io/hilmandroid/trivia-frontend:1.0