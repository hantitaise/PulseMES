#!/bin/bash

docker stop pulse_mes_db || true
docker rm pulse_mes_db || true
docker rmi pulse_mes_db || true
