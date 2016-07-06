#!/bin/bash

# Basics for, well, development
sudo apt-get update
sudo apt-get install -y git
sudo apt-get install -y subversion

# Gets us: gcc/g++/libc/make/cmake
sudo apt-get install -y build-essential
sudo apt-get install -y cmake

sudo apt-get install -y pkg-config
sudo apt-get install -y libtool
sudo apt-get install -y automake

# Databases
sudo apt-get install -y libmysqlclient-dev
sudo apt-get install -y libsqlite3-dev
sudo apt-get install -y libpq-dev

# Runs setup for each of the following languages and programming environments.
source setup_node.sh
source setup_ruby.sh
source setup_python.sh