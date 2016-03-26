#!/bin/bash


pushd ~

if [ ! -e ~/taiga-contrib-github-auth ]; then
    git clone  https://github.com/taigaio/taiga-contrib-github-auth.git taiga-contrib-github-auth
    
## NEEDED for npm
apt-install-if-needed nodejs

mkvirtualenv-if-needed taiga

# Settings
workon taiga
pip install taiga-contrib-github-auth
    
#####BACKEND#####
# Make sure you have edit script-backend.sh in ->
#    /setting/local.py for ->
#       clientid
#       clientsecret

####FRONTEND####
# Make sure you have edit script-frontend.sh in ->
#    dist/conf.js for ->
#       clientid
#       contribplugin

if [ ! -e ~/taiga-front/dist/plugins ]; then
    mkdir -p ~/taiga-front/dist/plugins

ln -s ~/taiga-contrib-github-auth/dist ~/taiga-front/dist/plugins/github-auth

pushd ~/taiga-contrib-github-auth/front
npm install

deactivate
popd
