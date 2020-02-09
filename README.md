# Vimpacks

## GitHub Pages
* [Vimpacks](https://ghsable.github.io/vimpacks/)

## Description
Vimpacks is Vim7later plugin management support tool.

## DEMO

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
Idempotency:

    # Add your Vim plugins URL
    $(echo ${EDITOR}) /path/to/vimpacks/vimpacks.txt
    # Idempotency Vim plugins
    /path/to/vimpacks/vimpacks.sh idempotency

Update:

    /path/to/vimpacks/vimpacks.sh update

