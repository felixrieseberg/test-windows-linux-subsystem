#!/bin/bash

# Basics for, well, development
sudo apt-get update
sudo apt-get install git
sudo apt-get install subversion

# Basics for Node
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
sudo apt-get install -y nodejs
sudo apt-get install -y build-essential
npm install -g grunt-cli

# Cleanup
npm set registry https://registry.npmjs.org/
npm cache clean
