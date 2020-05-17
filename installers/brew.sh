#!/bin/bash -e

# Usage: source .brew
# The above usage could is very simple
# An advanvce usage could be a 'Brewfile'
# https://github.com/Homebrew/homebrew-bundle#usage
#
# TIP: brew search [Something] (brew search --casks)
sudo -v

# Make sure we’re using the latest Homebrew
brew update

# Upgrade any already-installed formulae
brew upgrade

# Install GNU utilities (those that come with OS X are outdated)
brew install coreutils findutils

# Use updated shells
brew install bash
brew install zsh

echo $(brew --prefix bash)/bin/bash | sudo tee -a /etc/shells
echo $(brew --prefix zsh)/bin/zsh | sudo tee -a /etc/shells

# The tool of the gods
# https://github.com/zsh-users/antigen
brew install antigen

# https://github.com/nvbn/thefuck
brew install thefuck

# https://github.com/git-friendly/git-friendly
brew install git-friendly/git-friendly/git-friendly

brew install wget
brew install ack
brew install git
brew install rename
brew install tree
brew install kubectl kubectx kubens derailed/k9s/k9s
brew install fzf
brew install jq

# Browsers
brew cask install google-chrome
brew cask install google-chrome-canary
brew cask install firefox
brew cask install firefox-developer-edition
brew cask install opera

# Everything else
brew cask install iterm2 sublime-text the-unarchiver tor-browser transmission hyper whatsapp slack docker

# Remove outdated versions from the cellar
brew cleanup
