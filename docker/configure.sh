#!/bin/bash

if [ $(cat /home/config.json | wc -l) -eq 0 ]; then
	export PAIR=$(./ck-server -k)
	IFS=',' read -r PUBLIC_KEY PRIVATE_KEY <<< $PAIR
	export CKUID=$(./ck-server -u)
	export PRIVATE_KEY=$PRIVATE_KEY
	echo "PUBLIC_KEY: ${PUBLIC_KEY}" > /home/connection.yaml
	echo "UID: ${CKUID}" >> /home/connection.yaml
	envsubst < config.json.template > /home/config.json
fi
