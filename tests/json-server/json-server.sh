#!/bin/bash

rm -rf json-server/
git clone https://github.com/typicode/json-server
cd json-server/
npm install

# `npm run` doesn't work, so we have to compensate.
NODE_ENV=test mocha -R spec test/cli/*.js
NODE_ENV=test mocha -R spec test/server/*.js

cd ..
rm -rf json-server/
