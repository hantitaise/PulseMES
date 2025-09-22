FROM python:3.13-slim

# Installer les outils essentiels
RUN apt-get update && apt-get install -y \
    git \
    curl \
    tar \
    postgresql-client \
    libpq-dev \
    python3-dev \
    unixodbc \
    unixodbc-dev \
    libodbc2 \
    wget \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copier uniquement les fichiers essentiels
COPY ./app/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Ajouter un script d'entrée
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Point d'entrée
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
#CMD ["python", "main.py"]
