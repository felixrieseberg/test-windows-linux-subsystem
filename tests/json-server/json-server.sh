#!/bin/bash

rm -rf json-server/
git clone https://github.com/typicode/json-server
cd json-server/
npm install

npm test
