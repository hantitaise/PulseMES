#!/usr/bin/env bash
# Construire l’image
docker build -t pulseMES_DB .

# Lancer le conteneur
docker run -d \
    -e POSTGRES_PASSWORD=MyStrongPassword123 \
    -p 5432:5432 \
    --name pulseMES_DB
