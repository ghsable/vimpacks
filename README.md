# Vimpacks

## GitHub Pages
* [Vimpacks](https://ghsable.github.io/vimpacks/)

## Description
This bash script is a simple Vim plugin manager.

## Requestment
* [Bash](https://www.gnu.org/software/bash/)
* [Git](https://github.com/git/git)
* [Vim](https://github.com/vim/vim)

## Installation

    git clone --depth=1 https://github.com/ghsable/vimpacks.git ~/vimpacks
    cd ~/vimpacks

## Tree Description

    <HOME>
    ├─ .vim
    │  └─ pack
    │     └─ mypackage
    │        ├─ start
    │        │  └─ *            : plugins(autoload)
    │        │     └─ *
    │        └─ opt
    │           └─ *            : plugins(:packadd)
    │              └─ *
    └─ vimpacks
       ├─ vimpacks.sh    : simple Vim plugin manager
       └─ vimpacks.txt   : your Vim plugins URL list

## Usage
Install:

      # add your vim plugins URL
      <editor> vimpacks.txt
      # install vim plugins
      ./vimpacks.sh install

Update:

      ./vimpacks.sh update


