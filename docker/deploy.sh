#!/bin/bash
docker login -e $DOCKER_EMAIL -u $DOCKER_USERNAME -p $DOCKER_PASSWORD
TAG=`if [ "$TRAVIS_BRANCH" == "master" ]; then echo "latest"; else echo $TRAVIS_BRANCH ; fi`
docker tag $REPO:${TRAVIS_COMMIT} $REPO:${TAG}
docker tag $REPO:${TRAVIS_COMMIT} $REPO:travis-$TRAVIS_BUILD_NUMBER
docker push $REPO
