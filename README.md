# Docker MongoDB Blog

## Description

Elle initialise automatiquement la base `blog_db` avec une collection `posts`.

## Prérequis

- Docker installé
- Un fichier `.env` basé sur `.env.example`

### Builder l'image

docker build -t mongo-blog:1.0.0 .

### Lancer le conteneur

docker run -d --name mongo-blog --env-file .env mongo-blog:1.0.0

### Vérifier que tout fonctionne

./check-status.sh

## Image Docker Hub

https://hub.docker.com/r/yasayapo/mongo-blog
