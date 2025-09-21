# Image de base contenant PostgreSQL 17 et l’extension TimescaleDB
FROM timescale/timescaledb:2.15.2-pg17

# Variables d’environnement – mot de passe du super‑utilisateur postgres
ENV POSTGRES_USER=postgres
ENV POSTGRES_PASSWORD=MyStrongPassword123
ENV POSTGRES_DB=main_db

# Copie des scripts d’initialisation (exécutés automatiquement au premier démarrage)
COPY ./src/init-db.sh /docker-entrypoint-initdb.d/init-db.sh
COPY ./src/schema.sql  /docker-entrypoint-initdb.d/schema.sql

# Le script doit être exécutable
RUN chmod +x /docker-entrypoint-initdb.d/init-db.sh
