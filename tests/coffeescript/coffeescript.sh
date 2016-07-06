#!/bin/bash
>coffeescript.log
exec >  >(tee -a coffeescript.log)
exec 2> >(tee -a coffeescript.log >&2)

rm -rf coffeescript/
git clone https://github.com/jashkenas/coffeescript
cd coffeescript/

npm install
npm test