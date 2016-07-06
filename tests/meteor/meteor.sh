#!/bin/bash
>meteor.log
exec >  >(tee -a meteor.log)
exec 2> >(tee -a meteor.log >&2)

rm -rf meteor/
git clone http://github.com/meteor/meteor --depth 1
cd meteor/

./scripts/generate-dev-bundle.sh
./meteor npm install -g phantomjs-prebuilt
./meteor self-test

TEST_PACKAGES_EXCLUDE="less" ./packages/test-in-console/run.sh