#!/usr/bin/bash

cd backend
docker build . -t trivia-backend:latest
docker image tag trivia-backend:latest docker.io/hilmandroid/trivia-backend:latest
docker push docker.io/hilmandroid/trivia-backend:latest
cd ../frontend
docker build . -t trivia-frontend:latest
docker image tag trivia-frontend:latest docker.io/hilmandroid/trivia-frontend:latest
docker push docker.io/hilmandroid/trivia-frontend:latest