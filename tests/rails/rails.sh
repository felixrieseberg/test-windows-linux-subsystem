#!/bin/bash

rm -rf rails/
git clone https://github.com/rails/rails --depth 1
cd rails/

gem install bcrypt -v '3.1.11'
gem install curses -v '1.0.2'
gem install eventmachine -v '1.2.0.1'
gem install http_parser.rb -v '0.6.0'
gem install byebug -v '8.2.5'
gem install hiredis -v '0.6.1'
gem install mysql2 -v '0.4.4'
gem install pg -v '0.18.4'
gem install puma -v '3.4.0'
gem install racc -v '1.4.14'
gem install redcarpet -v '3.2.3'
gem install sqlite3 -v '1.3.11'
gem install stackprof -v '0.2.9'
gem install websocket-driver -v '0.6.4'
gem install thin -v '1.7.0'

bundle install
bundle exec rake test