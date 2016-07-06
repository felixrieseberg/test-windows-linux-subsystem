#!/bin/bash
>rust.log
exec >  >(tee -a rust.log)
exec 2> >(tee -a rust.log >&2)

rm -rf rust
git clone --depth 1 https://github.com/rust-lang/rust

cd rust/
./configure
make test