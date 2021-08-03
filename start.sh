#!/bin/bash

cd /usr/src/app

if [ "${LIBDRIVE_VERSION}" != "dev" ]; then
    if [ ! -z "${LIBDRIVE_VERSION}" ]; then
        if [ "${LIBDRIVE_VERSION}" = "latest" ]; then
            VER="latest"
        else
            VER="tags/${LIBDRIVE_VERSION}"
        fi
    else
        VER="latest"
    fi

    if [ ! -z "${RYOO1_REPOSITRY}" ]; then
        REPO=${RYOO1_REPOSITRY}
    else
        REPO="Ryoo1/libDrive"
    fi

    curl -L -s $(curl -s "https://api.github.com/repos/${REPO}/releases/${VER}" | grep -Po '"browser_download_url": "\K.*?(?=")') | tar xf - -C .

    pip3 install -r requirements.txt -q --no-cache-dir
else
    cd ./dev
fi

pip3 install -r requirements.txt -q --no-cache-dir
gunicorn main:app
