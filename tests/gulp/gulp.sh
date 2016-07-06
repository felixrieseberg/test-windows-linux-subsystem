#!/bin/bash
>gulp.log
exec >  >(tee -a gulp.log)
exec 2> >(tee -a gulp.log >&2)

#setup
rm -rf gulp/
git clone https://github.com/gulpjs/gulp --depth 1
cd gulp/

#test
npm install
npm test