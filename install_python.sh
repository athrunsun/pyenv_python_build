#!/usr/bin/env bash

echo "*****************Start install_python.sh*****************"

PYTHON_TARBALL_DIR=$TRAVIS_BUILD_DIR/dist
mkdir -p $PYTHON_TARBALL_DIR

echo "Configure environment variables..."
. $HOME/bedroom/script/osx/util/env_vars.sh
. $APP_SCRIPT_ROOT/dotfiles/home/.profile

echo "Install pyenv dependencies..."
. $SCRIPT_UTIL_ROOT/install_pyenv_dependencies.sh

echo "Install pyenv..."
. $SCRIPT_UTIL_SHARE/install_pyenv.sh

if ! [ -z ${PYTHON_2_VERSION+x} ]; then
    . $SCRIPT_UTIL_SHARE/pyenv_install_python.sh $PYTHON_2_VERSION true false
    PYTHON_2_TARBALL_SAVE_NAME=pyenv_python_${OS_NAME}_${PYTHON_2_VERSION}.tar.gz

    echo "Compressing python2 folder to '$PYTHON_2_TARBALL_SAVE_NAME'..."
    tar -czf $PYTHON_2_TARBALL_SAVE_NAME $PYENV_VERSIONS/$PYTHON_2_VERSION
    
    echo "Moving $PYTHON_2_TARBALL_SAVE_NAME to $PYTHON_TARBALL_DIR..."
    mv $PYTHON_2_TARBALL_SAVE_NAME $PYTHON_TARBALL_DIR/
else
    echo "PYTHON_2_VERSION is not set thus will not install python2."
fi

if ! [ -z ${PYTHON_3_VERSION+x} ]; then
    . $SCRIPT_UTIL_SHARE/pyenv_install_python.sh $PYTHON_3_VERSION true false
    PYTHON_3_TARBALL_SAVE_NAME=pyenv_python_${OS_NAME}_${PYTHON_3_VERSION}.tar.gz

    echo "Compressing python3 folder to '$PYTHON_3_TARBALL_SAVE_NAME'..."
    tar -czf $PYTHON_3_TARBALL_SAVE_NAME $PYENV_VERSIONS/$PYTHON_3_VERSION
    
    echo "Moving $PYTHON_3_TARBALL_SAVE_NAME to $PYTHON_TARBALL_DIR..."
    mv $PYTHON_3_TARBALL_SAVE_NAME $PYTHON_TARBALL_DIR/
else
    echo "PYTHON_3_VERSION is not set thus will not install python3."
fi

echo "Output of 'ls -alh $PYENV_VERSIONS':"
ls -alh $PYENV_VERSIONS

echo "Output of 'pyenv versions':"
pyenv versions

echo "Output of 'ls -alh $PYTHON_TARBALL_DIR':"
ls -alh $PYTHON_TARBALL_DIR

echo "-----------------Done install_python.sh-----------------"
