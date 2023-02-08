#!/bin/bash

# Build node project
echo '🏗️  Build'
npm install
npm run build

# Build docker image
PACKAGE_VERSION=$(cat package.json \
  | grep version \
  | head -1 \
  | awk -F: '{ print $2 }' \
  | sed 's/[",]//g' \
  | tr -d '[[:space:]]')

REGISTRY='ghcr.io'
OWNER='phucphanblogic'
IMAGE_NAME='kiosk-wiki'

echo '🐳  Build docker image with tag' "$PACKAGE_VERSION"

# ghcr.io/phucphanblogic/kiosk-wiki:latest
docker build -t "$REGISTRY/$OWNER/$IMAGE_NAME:$PACKAGE_VERSION" -t "$REGISTRY/$OWNER/$IMAGE_NAME:latest" .

echo '🚀  Build done!'
echo ''
echo '🌏  Publish image to Github registry'

USERNAME='phucphanblogic'
CR_PAT='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'

# login to github registry
echo $CR_PAT | docker login ghcr.io -u $USERNAME --password-stdin

# push image to github registry
docker push $REGISTRY/$OWNER/$IMAGE_NAME:$PACKAGE_VERSION
docker push $REGISTRY/$OWNER/$IMAGE_NAME:latest