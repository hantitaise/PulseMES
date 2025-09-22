#!/bin/bash

# Strict mode: exit on error, undefined variables
set -euo pipefail

# Configuration Variables
IMAGE_NAME="pulse_mes_db"
CONTAINER_NAME="pulse_mes_db"
POSTGRES_PORT=5432

# Secure Password Generation (Optional)
generate_password() {
    # Generate a strong 32-character password
    openssl rand -base64 24 | tr -dc 'A-Za-z0-9!@#$%^&*()_+' | head -c 32
}

# Use generated or predefined password
POSTGRES_PASSWORD="${POSTGRES_PASSWORD:-$(generate_password)}"

# Logging Configuration
LOG_FILE="docker_build_log.txt"
ERROR_LOG_FILE="docker_error_log.txt"

# Color Output
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Cleanup Function
cleanup() {
    echo -e "${RED}Cleaning up existing Docker resources...${NC}"
    docker stop "${CONTAINER_NAME}" 2>/dev/null || true
    docker rm "${CONTAINER_NAME}" 2>/dev/null || true
    docker rmi "${IMAGE_NAME}" 2>/dev/null || true
}

# Build Docker Image
build_image() {
    echo -e "${GREEN}Building Docker image...${NC}"
    if ! docker build -t "${IMAGE_NAME}" . > "${LOG_FILE}" 2>"${ERROR_LOG_FILE}"; then
        echo -e "${RED}Error: Docker build failed.${NC}"
        echo "Build logs in ${LOG_FILE}"
        echo "Error logs in ${ERROR_LOG_FILE}"
        exit 1
    fi
}

# Run Docker Container
run_container() {
    echo -e "${GREEN}Running Docker container...${NC}"
    docker run -d \
        -e POSTGRES_PASSWORD="${POSTGRES_PASSWORD}" \
        -e POSTGRES_USER=postgres \
        -e POSTGRES_DB=main_db \
        -p "${POSTGRES_PORT}:${POSTGRES_PORT}" \
        --name "${CONTAINER_NAME}" \
        "${IMAGE_NAME}"
}

# Verify Container Status
verify_container() {
    sleep 2  # Wait for container to start
    if docker ps | grep -q "${CONTAINER_NAME}"; then
        echo -e "${GREEN}Container ${CONTAINER_NAME} started successfully!${NC}"
        docker ps | grep "${CONTAINER_NAME}"
    else
        echo -e "${RED}Error: Failed to start container.${NC}"
        docker logs "${CONTAINER_NAME}"
        exit 1
    fi
}

# Main Execution
main() {
    # Trap to ensure cleanup on script exit
    trap cleanup EXIT

    # Execute steps
    cleanup
    build_image
    run_container
    verify_container

    # Optional: Show container logs
    echo -e "${GREEN}Container Logs:${NC}"
    docker logs "${CONTAINER_NAME}"
}

# Store password securely (optional)
store_password() {
    # Create a secure password file (600 permissions)
    echo "${POSTGRES_PASSWORD}" > .db_password
    chmod 600 .db_password
}

# Run main function
main

# Optional password storage
# Uncomment if you want to store the password
# store_password
