#!/bin/bash
>neovim.log
exec >  >(tee -a neovim.log)
exec 2> >(tee -a neovim.log >&2)

rm -rf neovim/
git clone https://github.com/neovim/neovim --depth 1
cd neovim

make unittest