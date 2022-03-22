echo "==> Running brew.sh"

current_relative_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )

echo "Installing Homebrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "Init brew."
eval "$(/opt/homebrew/bin/brew shellenv)"

echo "Installing dependencies from Brewfile..."
export PYENV_ROOT=$HOME/.config/pyenv
sudo -v
brew bundle --file=$current_relative_path/Brewfile
