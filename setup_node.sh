#!/bin/bash

# Basics for Node testing
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
sudo apt-get install -y nodejs
sudo apt-get install -y build-essential
npm install -g grunt-cli
npm install -g mocha

# NPM setup and cleanup.
npm set registry https://registry.npmjs.org/
npm cache clean