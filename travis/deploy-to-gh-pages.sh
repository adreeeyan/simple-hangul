#!/bin/bash
# See https://medium.com/@nthgergo/publishing-gh-pages-with-travis-ci-53a8270e87db
set -o errexit

# config
git config --global user.email "nobody@nobody.org"
git config --global user.name "Travis CI"

# clean output folder
rm -rf www/

# build
echo Building
ionic build --prod

# deploy
echo Deploying
cd www
git init
git add .
echo Committing
git commit -m "Deploy to Github Pages"
echo Pushing
git push --force --quiet "https://${GITHUB_TOKEN}@$github.com/${GITHUB_REPO}.git" master:gh-pages > /dev/null 2>&1