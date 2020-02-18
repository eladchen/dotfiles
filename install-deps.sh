# Homebrew
# https://brew.sh
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# git-friendly
# https://github.com/jamiew/git-friendly
curl -sS https://raw.githubusercontent.com/jamiew/git-friendly/master/install.sh | bash -s $(brew --prefix)/bin

# Node Version Manager (NVM)
# https://github.com/nvm-sh/nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash

# SDKMAN
# https://sdkman.io/
curl -s "https://get.sdkman.io" | bash

# pip3 install pygments --upgrade
# sudo -H python -m ensurepip
