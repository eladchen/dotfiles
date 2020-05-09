# Homebrew
# https://brew.sh
if command -v brew > /dev/null 2>&1; then
  brew update
else
	# This assumes ruby is available :)
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Node Version Manager (NVM)
# https://github.com/nvm-sh/nvm
# Installing / Upgrading is the same
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash

# SDKMAN
# https://sdkman.io/
if command -v sdk > /dev/null 2>&1; then
  sdk selfupdate
else
  curl -s "https://get.sdkman.io" | bash
fi
