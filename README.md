# vimpacks
[vimpacks](https://ghsable.github.io/vimpacks/) is a plugin management tool for [Vim7 and later](https://github.com/vim/vim).  
Manage your plugins simply with a script and text.

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

![README.gif](https://raw.githubusercontent.com/ghsable/vimpacks/master/README.gif)

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
    export PATH=${PATH}:/path/to/vimpacks
    # Edit config-files
    $(echo ${EDITOR}) ~/.config/vimpacks/start.list
    $(echo ${EDITOR}) ~/.config/vimpacks/opt.list

## Usage
idempotent :

    vimpacks -i

update :

    vimpacks -u

## Thanks
I referred to the following philosophy :
> * [NixOS](https://nixos.org/)
