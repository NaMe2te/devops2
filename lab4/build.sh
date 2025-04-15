#!/bin/bash

set -e

if [ -f .env ]; then
    export $(cat .env | sed 's/\r//g' | xargs)
else
    echo ".env file not found!"
    exit 1
fi

echo "Building with NODE_VERSION=$NODE_VERSION"
echo "Building with NODE_PORT=$NODE_PORT"

if [ -z "$NODE_VERSION" ]; then
    echo "Error: NODE_VERSION is not set."
    exit 1
fi

docker build --build-arg NODE_VERSION=$NODE_VERSION -t myapp-system -f ./system.dockerfile .

docker docker build -t myapp-build -f ./build.dockerfile .

docker build -t myapp-final --build-arg NODE_PORT=$NODE_PORT -f ./final.dockerfile .