#!/bin/bash
>json-server.log
exec >  >(tee -a json-server.log)
exec 2> >(tee -a json-server.log >&2)

rm -rf json-server/
git clone https://github.com/typicode/json-server
cd json-server/

npm install
npm test
