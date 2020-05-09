# Elad's dotfiles.

This repo contains my personal dotfiles and are heavily based on [Addy Osmani](https://github.com/addyosmani/dotfiles).

## Installation & Update

### Setting up the shell
```shell
git clone https://github.com/eladchen/dotfiles.git && cd dotfiles && ./sync.sh
```
> To update later on, just run the sync again.

### Fresh OSX tools


## Private Config

Toss it into a file called `.extra` which you do not commit to this repo and just keep it in your `~/`

### Sensible OS X defaults

When setting up a new Mac, you may want to set some sensible OS X defaults:

```bash
./.osx
```

## Overview of files

* `.vimrc`, `.vim` - vim config

* `.aliases`
* `.bash_profile`
* `.bash_prompt`
* `.bashrc`
* `.exports`
* `.functions`
* `.extra` - not included, explained above

#### manual run
* `install-deps.sh` - random apps i need installed
* `.osx` - run on a fresh osx machine
* `.brew` - homebrew intialization

#### git, brah
* `.git`
* `.gitattributes`
* `.gitconfig`
* `.gitignore`

* `.inputrc` - config for bash readline


## Installation

```bash
git clone https://github.com/addyosmani/dotfiles.git && cd dotfiles && ./sync.sh
```

To update later on, just run the sync again.

### Useful links
- http://stackoverflow.com/questions/20410252/how-to-reuse-an-ssh-connection
