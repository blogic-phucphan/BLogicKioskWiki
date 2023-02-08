#!/bin/bash

CURRENT_BRANCH=$(git name-rev --name-only HEAD)
DEPLOY_BRANCH='staging'

echo '🧱  Push current branch to host ' $CURRENT_BRANCH
git push origin $CURRENT_BRANCH

echo '🧱  Check out to deploy branch ' $DEPLOY_BRANCH
git checkout $DEPLOY_BRANCH

echo '🧱  Merge changes to deploy branch'
git merge $CURRENT_BRANCH

echo '🧱  Push changes to deploy branch ' $DEPLOY_BRANCH
git push origin $DEPLOY_BRANCH

echo '🧱  Check out back to current branch ' $CURRENT_BRANCH
git checkout $CURRENT_BRANCH

echo 'Done! 🎉'