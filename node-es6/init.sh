#! /bin/bash

# check for Homebrew
brewInstalled=$(which brew | grep '/brew' | wc -l)

if [[ $brewInstalled -gt 0 ]]; then
	echo "Homebrew detected. Ensuring latest update..."
	brew update
else
	echo "Homebrew not detected on system. Aborting setup."
	exit 0
fi

echo ""
echo "Done. Checking for yarn..."
echo ""

# ensure yarn is installed and up-to-date
if [[ $(brew list | egrep '^yarn$' | wc -l) -eq 1 ]]; then
	echo "Yarn is already installed."
	echo ""
	echo "Ensuring latest version..."
	brew upgrade yarn
else
	echo "Yarn is not installed. Installing yarn for dependency management..."
	brew install yarn
	echo ""
	echo "Done. If you do not want yarn on your system, execute \"brew uninstall yarn\"."
	echo ""
fi

# install dependencies in yarn.lock
echo "Installing dependencies..."
yarn install
echo ""
echo "Done. Have fun."

exit 0

