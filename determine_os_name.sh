#!/usr/bin/env bash

echo "*****************Start install_python.sh*****************"

if [[ $TRAVIS_OS_NAME == 'osx' ]]; then
    export OS_NAME=osx
elif [[ $TRAVIS_OS_NAME == 'linux' ]]; then
    export OS_NAME=ubuntu
else
    echo "Unsupported os: ${TRAVIS_OS_NAME}"
    exit 1
fi

echo "-----------------Done install_python.sh-----------------"
