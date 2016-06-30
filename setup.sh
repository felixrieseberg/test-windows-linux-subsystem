#!/bin/bash

# Basics for, well, development
sudo apt-get update
sudo apt-get install git
sudo apt-get install subversion

# Basics for Node testing
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
sudo apt-get install -y nodejs
sudo apt-get install -y build-essential
npm install -g grunt-cli
npm install -g mocha

# NPM setup and cleanup.
npm set registry https://registry.npmjs.org/
npm cache clean

# Basics for python testing
sudo apt-get install -y python-dev
sudo apt-get install -y python-pip
sudo pip install virtualenv

# Django needs the following
sudo apt-get install -y libffi-dev
sudo apt-get install -y libjpeg-dev
sudo apt-get install -y zlib1g-dev

# The version of six that comes with trusty is old, and doesn't work so well with unittest.mock
sudo pip install six --upgrade