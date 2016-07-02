#!/bin/bash

# Basics for, well, development
sudo apt-get update
sudo apt-get install -y git
sudo apt-get install -y subversion

sudo apt-get install -y libmysqlclient-dev
sudo apt-get install -y libsqlite3-dev
sudo apt-get install -y libpq-dev

# Runs setup for each of the following languages and programming environments.
source setup_node.sh
source setup_ruby.sh
source setup_python.sh