echo "==> Running brew.sh"

echo "Installing Homebrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "Installing dependencies from Brewfile..."
sudo -v
brew bundle --file=./Brewfile
