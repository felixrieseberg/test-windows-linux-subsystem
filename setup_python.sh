#!/bin/bash

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