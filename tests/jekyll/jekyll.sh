#!/bin/bash

rm -rf jekyll/

git clone https://github.com/jekyll/jekyll
cd jekyll

# Nokogiri doesn't seem to like being installed through bundler.
gem install nokogiri

# Install all other dependencies.
bundle install --without benchmark:site:development

script/test