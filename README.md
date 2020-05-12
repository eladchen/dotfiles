This repo contains my personal dotfiles and are heavily based on [Addy Osmani](https://github.com/addyosmani/dotfiles).

#### Installation & Update

##### Setting up the shell
```shell
git clone https://github.com/eladchen/dotfiles.git && cd dotfiles && ./sync.sh
```
> To update later on, just run the sync again.

##### Setting up a new Mac

###### Core tools
```shell
sh installers/tools.sh
```
> The above will install / upgrade the core tools in use by the files in this repo (brew, nvm & sdkman).

###### Brew
```shell
sh installers/brew.sh
```
> The above will install various tools using brew.

###### OS X defaults:
```bash
sh osx-defaults
```

#### Private Config

Toss it into a file called `.extra` which you do not commit to this repo and just keep it in your `~/`

#### TODO:

- Fix auto complete for ssh, docker, and kubectl (for both zsh & bash)

#### Misc

##### Reuse an SSH connection
- http://stackoverflow.com/questions/20410252/how-to-reuse-an-ssh-connection

```shell
# This file goes under ~/.ssh/config
Host *
  # Always use SSH2.
  Protocol 2

  # http://stackoverflow.com/questions/20410252/how-to-reuse-an-ssh-connection
  ControlMaster auto
  ControlPath /tmp/ssh_mux_%h_%p_%r
  ControlPersist 1800

  Compression yes
  TCPKeepAlive yes
  ServerAliveInterval 20
  ServerAliveCountMax 10

Host some-host.com
  Hostname 127.0.0.1 (Can be a DNS record as well)
  User bender
  IdentityFile /some/private/key/path
```
