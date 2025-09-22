@echo off
setlocal enabledelayedexpansion

:: Configuration Variables
set IMAGE_NAME=pulse_mes_db
set CONTAINER_NAME=pulse_mes_db
set POSTGRES_PORT=5432

:: Secure Password (Recommendation: Use more complex password)
set POSTGRES_PASSWORD=MyStrongPassword123!

:: Logging
set LOG_FILE=docker_build_log.txt

:: Clean up existing container and image if they exist
echo Cleaning up existing resources...
docker stop %CONTAINER_NAME% 2>nul
docker rm %CONTAINER_NAME% 2>nul
docker rmi %IMAGE_NAME% 2>nul

:: Build Docker Image with Logging
echo Building Docker image...
docker build -t %IMAGE_NAME% . > "%LOG_FILE%" 2>&1

:: Check Build Status
if %ERRORLEVEL% NEQ 0 (
    echo Error: Docker build failed. Check %LOG_FILE% for details.
    pause
    exit /b 1
)

:: Run Docker Container
echo Running Docker container...
docker run -d ^
    -e POSTGRES_PASSWORD=%POSTGRES_PASSWORD% ^
    -e POSTGRES_USER=postgres ^
    -e POSTGRES_DB=main_db ^
    -p %POSTGRES_PORT%:%POSTGRES_PORT% ^
    --name %CONTAINER_NAME% ^
    %IMAGE_NAME%

:: Verify Container Status
docker ps | findstr %CONTAINER_NAME%

if %ERRORLEVEL% EQU 0 (
    echo Container %CONTAINER_NAME% started successfully!
) else (
    echo Error: Failed to start container.
)

:: Optional: Show container logs
docker logs %CONTAINER_NAME%

pause
