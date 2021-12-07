# vimpacks
[vimpacks](https://ghsable.github.io/vimpacks/) is a plugin management tool for [Vim7 and later](https://github.com/vim/vim).

    <HOME>
    ├─ .vim
    │  └─ pack
    │     └─ vimpacks
    │        ├─ start
    │        │ └─ *          : plugins(autoload)
    │        └─ opt
    │          └─ *          : plugins(lazyload)
    └─ .config
       └─ vimpacks
          ├─ start.list : config-file(start)
          └─ opt.list   : config-file(opt)

![README.gif](https://raw.githubusercontent.com/ghsable/vimpacks/main/README.gif)

## Dependency
This script depends on following commands :
* [Bash](https://www.gnu.org/software/bash/)
* [Git](https://github.com/git/git)

## Installation

    # Download
    git clone --depth=1 https://github.com/ghsable/vimpacks.git
    # Deploy config-files
    cp -r vimpacks/.config ~/
    # Set env
    export EDITOR='your text editor'
    export PATH=${PATH}:/path/to/vimpacks
    # Edit config-files
    vimpacks -e start
    vimpacks -e opt

## Usage
INSTALL/UNINSTALL :

    vimpacks -i

UPDATE :

    vimpacks -u

EDIT :

    vimpacks -e start
    vimpacks -e opt

HELP :

    vimpacks -h

## Thanks
I referred to the following philosophy :
> * [NixOS](https://nixos.org/)
