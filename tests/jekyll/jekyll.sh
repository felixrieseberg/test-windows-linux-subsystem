#!/bin/bash
>jekyll.log
exec >  >(tee -a jekyll.log)
exec 2> >(tee -a jekyll.log >&2)

rm -rf jekyll/
git clone https://github.com/jekyll/jekyll --depth 1
cd jekyll

# Nokogiri doesn't seem to like being installed through bundler.
gem install nokogiri

# Install all other dependencies.
bundle install --without benchmark:site:development

script/test