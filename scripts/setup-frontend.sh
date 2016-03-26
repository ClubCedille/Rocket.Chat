#!/bin/bash

FRONTEND_VERSION="stable"

pushd ~

cat > /tmp/conf.json <<EOF
{
    "api": "/api/v1/",
    "eventsUrl": null,
    "debug": "true",
    "publicRegisterEnabled": true,
    "feedbackEnabled": false,
    "privacyPolicyUrl": null,
    "termsOfServiceUrl": null,
    "maxUploadFileSize": null,
    "gitHubClientId": EDIT_ME,
    "contribPlugins": [
        "/plugins/github-auth/github-auth.json"
    ]
}
EOF


if [ ! -e ~/taiga-front ]; then
    # Initial clear
    git clone https://github.com/taigaio/taiga-front-dist.git taiga-front
    pushd ~/taiga-front
    git checkout -f stable

    mv /tmp/conf.json dist/

    popd
else
    pushd ~/taiga-front
    git fetch
    git checkout -f stable 
    git reset --hard origin/stable
    popd
fi

popd
