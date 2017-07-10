#!/usr/bin/env bash

echo "*****************Start upload_to_bintray.sh*****************"

if ! [ -z ${PYTHON_2_VERSION+x} ]; then
    echo "Uploading python2 binary tarball to bintray..."
    curl -v -u $BINTRAY_USER_NAME:$BINTRAY_API_KEY --upload-file $TRAVIS_BUILD_DIR/dist/$PYTHON_2_TARBALL_SAVE_NAME "https://api.bintray.com/content/athrunsun/pyenv_python_build/python2/stable/$PYTHON_2_TARBALL_SAVE_NAME?publish=1&override=1"
fi

if ! [ -z ${PYTHON_3_VERSION+x} ]; then
    echo "Uploading python3 binary tarball to bintray..."
    curl -v -u $BINTRAY_USER_NAME:$BINTRAY_API_KEY --upload-file $TRAVIS_BUILD_DIR/dist/$PYTHON_3_TARBALL_SAVE_NAME "https://api.bintray.com/content/athrunsun/pyenv_python_build/python3/stable/$PYTHON_3_TARBALL_SAVE_NAME?publish=1&override=1"
fi

echo "-----------------Done upload_to_bintray.sh-----------------"
