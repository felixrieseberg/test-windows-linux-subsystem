#!/bin/bash
>less.js.log
exec >  >(tee -a less.js.log)
exec 2> >(tee -a less.js.log >&2)

rm -rf less.js/
git clone https://github.com/less/less.js
cd less.js/

git checkout cc1a1436d0818fbb820ff4aa039c4c25c19677db
npm install
npm run test