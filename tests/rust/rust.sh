#!/bin/bash
>rust.log
exec >  >(tee -a rust.log)
exec 2> >(tee -a rust.log >&2)

rm -rf rust
git clone https://github.com/rust-lang/rust --depth 1
cd rust/

./configure
make test