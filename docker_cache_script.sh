#!/bin/bash

if [ ! -d ""$HOME"/goinfre/docker" ]; then
    mkdir "$HOME"/goinfre/docker
    rm -rf "$HOME"/Library/Containers/com.docker.docker
    ln -s "$HOME"/goinfre/docker "$HOME"/Library/Containers/com.docker.docker
    echo "The docker directory has been created and the cache has been cleared."
else
    echo "The cache is already cleared and the goinfre directory exists!"
fi