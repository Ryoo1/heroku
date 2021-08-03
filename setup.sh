#!/bin/bash

cd /usr/src/app

mkdir ./dev
cd ./dev
mkdir ./tmp
cd ./tmp
git clone "https://github.com/Ryoo1/server.git" --depth 1 server
git clone "https://github.com/Ryoo1/web.git" --depth 1 web
mkdir ./Ryoo1.Server
mkdir ./Ryoo1.Server/build
mkdir ./Ryoo1.Server/src
mkdir ./Ryoo1.Server/templates
cd ./web
yarn install
yarn run build
mv ./build/* ../Ryoo1.Server/build
cd ../server
mv main.py requirements.txt ../Ryoo1.Server
mv ./src/* ../Ryoo1.Server/src
mv ./templates/* ../Ryoo1.Server/templates
cd ..
cp ../../README.md ../../LICENSE ./Ryoo1.Server
cd Ryoo1.Server
mv ./* ../..
cd ../../..
