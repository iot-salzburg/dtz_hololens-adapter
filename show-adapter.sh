#!/usr/bin/env bash
echo "Printing 'docker service ls | grep hololens-adapter':"
docker service ls | grep hololens-adapter
echo ""
echo "Printing 'docker stack ps hololens-adapter':"
docker stack ps hololens-adapter --no-trunc

