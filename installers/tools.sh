# Homebrew
# https://brew.sh
if command -v brew > /dev/null 2>&1; then
  brew update
else
	# This assumes ruby is available :)
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

# Node Version Manager (NVM)
# https://github.com/nvm-sh/nvm
# Installing / Upgrading is the same
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash

if ! command -v gcloud > /dev/null 2>&1; then
	curl https://sdk.cloud.google.com | bash -s -- --disable-prompts
fi

# SDKMAN
# https://sdkman.io/
if command -v sdk > /dev/null 2>&1; then
  sdk selfupdate
else
  curl -s "https://get.sdkman.io" | bash
fi
