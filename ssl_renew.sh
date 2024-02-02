#!/bin/bash

COMPOSE="/usr/local/bin/docker-compose --ansi never"
DOCKER="/usr/bin/docker"

cd /root/Wordpress_multiple

$COMPOSE run myrootdevcertbot renew && $COMPOSE kill -s SIGHUP nginx
$DOCKER system prune -af

sleep 120

$COMPOSE run gyqrebeldecertbot renew && $COMPOSE kill -s SIGHUP nginx
$DOCKER system prune -af

sleep 120

$COMPOSE run cristinaweilcertbot renew && $COMPOSE kill -s SIGHUP nginx
$DOCKER system prune -af
