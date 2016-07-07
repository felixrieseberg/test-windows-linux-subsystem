#!/bin/bash
>redis.log
exec >  >(tee -a redis.log)
exec 2> >(tee -a redis.log >&2)

rm -rf redis/
git clone https://github.com/antirez/redis
cd redis/

make
make test