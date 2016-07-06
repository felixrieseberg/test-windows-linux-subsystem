#!/bin/bash
>hello-world.log
exec >  >(tee -a hello-world.log)
exec 2> >(tee -a hello-world.log >&2)

echo Hello World