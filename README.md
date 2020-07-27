# vimpacks.sh
[vimpacks.sh](https://ghsable.github.io/vimpacks.sh/) is a plugin management tool for [Vim7 and later](https://github.com/vim/vim).

Manage your plugins simply with a script and text.

    <HOME>
    ├─ .vim
    │  └─ pack
    │     └─ vimpacks
    │        └─ start
    │           └─ *            : plugins(autoload)
    └─ vimpacks
       ├─ vimpacks.sh    : script
       └─ vimpacks.list  : text

![README.gif](https://raw.githubusercontent.com/ghsable/vimpacks/master/README.gif)

## Dependency
This script depends on following commands :
* [Bash](https://www.gnu.org/software/bash/)
* [Git](https://github.com/git/git)

## Installation

    git clone --depth=1 https://github.com/ghsable/vimpacks.sh.git /path/to/vimpacks.sh

## Usage
Idempotent :

    # Add your Vim plugins URL
    $(echo ${EDITOR}) /path/to/vimpacks/vimpacks.list
    # Idempotent Vim plugins
    /path/to/vimpacks/vimpacks.sh idempotent

Update :

    /path/to/vimpacks/vimpacks.sh update

## Thanks
> * [NixOS](https://nixos.org/)

## TODO
* ~/.config/vimpacks.list
* opt directory(2config files)
* makefile
* README.md
* README.gif
