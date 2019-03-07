#!/bin/sh

set -e

while [ ! -f ${REGISTRY_HTTP_TLS_CERTIFICATE} ];
do
	echo "SSL Certificate from letsencrypt not received, waiting 5 seconds";
	sleep 5;
done

case "$1" in
	*.yaml|*.yml) set -- registry serve "$@" ;;
	serve|garbage-collect|help|-*) set -- registry "$@" ;;
esac

exec "$@"

