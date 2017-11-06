#!/usr/bin/env bash

echo "*****************Start clone.sh*****************"

git clone -q https://x-token-auth:$(curl -X POST -u "$BIT_KEY:$BIT_SECRET" https://bitbucket.org/site/oauth2/access_token -d grant_type=client_credentials | perl -nle 'print $& if m{(?<="access_token": ")[^"]*}')@bitbucket.org/$BIT_USERNAME/$SCRIPT_REPO.git $SCRIPT_HOME

echo "-----------------Done clone.sh-----------------"
