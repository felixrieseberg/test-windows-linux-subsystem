#!/bin/bash

# Basics for ruby testing
mkdir ruby_tools
pushd ruby_tools

# Downloads and installs ruby-install, which can find and install more recent versions of ruby.
# The version that ships with Trusty is *very* old.
wget -O ruby-install-0.6.0.tar.gz https://github.com/postmodern/ruby-install/archive/v0.6.0.tar.gz
tar -xzf ruby-install-0.6.0.tar.gz
pushd ruby-install-0.6.0/
sudo make install

popd

# Downloads and installs chruby, which can find installed versions of ruby,
# and allows us to switch between them.
wget -O chruby-0.3.9.tar.gz \
  https://github.com/postmodern/chruby/archive/v0.3.9.tar.gz
tar -xzf chruby-0.3.9.tar.gz
pushd chruby-0.3.9/
sudo make install

popd

# Remove intermediaries.
rm chruby-0.3.9.tar.gz
rm ruby-install-0.6.0.tar.gz

# Install latest stable ruby
RUBY_VERSION=2.3.1
ruby-install --latest ruby $RUBY_VERSION

# Make sure chruby can find ruby.
cat >> ~/.$(basename $SHELL)rc <<EOF
source /usr/local/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh
chruby ruby-$RUBY_VERSION
EOF

# Make sure chruby picks up the installed ruby
cat >> ~/.ruby-version <<EOF
ruby-$RUBY_VERSION
EOF

# Get ourselves a bundler
chruby ruby-$RUBY_VERSION
gem install bundler

popd