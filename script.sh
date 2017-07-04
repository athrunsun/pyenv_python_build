#!/usr/bin/env bash

. $HOME/bedroom/script/$OS_NAME/util/env_vars.sh
. $APP_SCRIPT_ROOT/dotfiles/home/.profile

if [[ $OS_NAME == 'osx' ]]; then
    brew fetch --retry --force-bottle --deps openssl readline xz
    brew reinstall openssl readline xz
elif [[ $OS_NAME == 'ubuntu' ]]; then
    apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev xz-utils
fi

. $SCRIPT_HOME/$OS_NAME/util/share/install_pyenv.sh

. $SCRIPT_HOME/$OS_NAME/util/share/pyenv_install_python.sh $PYTHON_2_VERSION false false
. $SCRIPT_HOME/$OS_NAME/util/share/pyenv_install_python.sh $PYTHON_3_VERSION false false

ls -alh $PYENV_VERSIONS

mkdir -p $CI_HOME/dist

PYTHON_2_TARBALL_SAVE_NAME=pyenv_python_${OS_NAME}_${PYTHON_2_VERSION}.tar.gz
PYTHON_3_TARBALL_SAVE_NAME=pyenv_python_${OS_NAME}_${PYTHON_3_VERSION}.tar.gz

tar -czf $PYTHON_2_TARBALL_SAVE_NAME $PYENV_VERSIONS/$PYTHON_2_VERSION
mv $PYTHON_2_TARBALL_SAVE_NAME $CI_HOME/dist/

tar -czf $PYTHON_3_TARBALL_SAVE_NAME $PYENV_VERSIONS/$PYTHON_3_VERSION
mv $PYTHON_3_TARBALL_SAVE_NAME $CI_HOME/dist/

ls -alh $CI_HOME/dist
