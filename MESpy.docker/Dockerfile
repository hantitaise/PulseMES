# Use the latest stable Debian (13) – fallback to 12 if you prefer
FROM debian:13-slim AS base
# FROM debian:12-slim   # uncomment this line and comment the above to use Debian 12

# Install Python 3.13 and required system packages
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        ca-certificates \
        wget \
        build-essential \
        libssl-dev \
        libffi-dev \
        zlib1g-dev && \
    # Download and install Python 3.13
    wget https://www.python.org/ftp/python/3.13.0/Python-3.13.0.tgz && \
    tar -xzf Python-3.13.0.tgz && \
    cd Python-3.13.0 && \
    ./configure --enable-optimizations && \
    make -j$(nproc) && \
    make altinstall && \
    cd .. && rm -rf Python-3.13.0* && \
    # Clean up apt caches
    apt-get purge -y wget build-essential && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/*

# Create a non‑root user for running the app
ARG APP_USER=appuser
RUN useradd -m -s /bin/bash $APP_USER

# Set working directory
WORKDIR /app

# Copy the Python application code
COPY ./app/ .

# Install Python dependencies (if a requirements.txt exists)
RUN if [ -f requirements.txt ]; then \
        /usr/local/bin/python3.13 -m pip install --no-cache-dir -r requirements.txt; \
    fi

# Switch to non‑root user
USER $APP_USER

# Define the default command (adjust as needed)
CMD ["/usr/local/bin/python3.13", "main.py"]
