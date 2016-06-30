#!/bin/bash

#setup
rm -rf gulp/

git clone https://github.com/gulpjs/gulp
cd gulp/
npm install
npm test