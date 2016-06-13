#!/bin/bash
rm -rf bower/
git clone https://github.com/bower/bower
cd bower/
git checkout 8b6c8eeaa93fa1533daf7485726f49155369bb22
npm install
grunt travis



