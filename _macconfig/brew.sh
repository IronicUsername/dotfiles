echo "==> Running brew.sh"

current_relative_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )

echo "Installing Homebrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "Init brew."
# For WSL Ubuntu
# (echo; echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"') >> /home/deniz/.profile
# eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
eval "$(/opt/homebrew/bin/brew shellenv)"

# For WSL Ubunbu
# sudo apt-get install build-essential
# brew install gcc

echo "Installing dependencies from Brewfile..."
sudo -v
# NOTE: auto-skips casks for WSL Ubuntu / Linux (as prompt says)
brew bundle --file=$current_relative_path/Brewfile
