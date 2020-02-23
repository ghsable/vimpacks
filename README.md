# Vimpacks

## GitHub Pages
* [Vimpacks](https://ghsable.github.io/vimpacks/)

## Description
Vimpacks is Vim7later plugin management support tool.
Make `vimpacks.txt` the same as `~/.vim/pack/mypackage/start/*`.

## DEMO
<img src="https://raw.githubusercontent.com/ghsable/vimpacks/master/README.gif" alt="README.gif">

## Requestment
* [Bash](https://www.gnu.org/software/bash/) or [ZSH](http://www.zsh.org/)
* [Git](https://github.com/git/git)
* [Vim](https://github.com/vim/vim)

## Installation

    git clone --depth=1 https://github.com/ghsable/vimpacks.git /path/to/vimpacks

## Tree Description

    <HOME>
    ├─ .vim
    │  └─ pack
    │     └─ mypackage
    │        └─ start
    │           └─ *            : plugins(autoload)
    │              └─ *
    └─ vimpacks
       ├─ vimpacks.sh    : Vim plugin manager
       └─ vimpacks.txt   : vimpacks.sh needs this text(your Vim plugins URL list)

## Usage
Idempotent:

    # Add your Vim plugins URL
    $(echo ${EDITOR}) /path/to/vimpacks/vimpacks.txt
    # Idempotent Vim plugins
    /path/to/vimpacks/vimpacks.sh idempotent

Update:

    /path/to/vimpacks/vimpacks.sh update

## Concept
* [NixOS](https://nixos.org/)
