#!/bin/bash
echo "==> Running python.sh"

echo "Installing and setting up poetry..."
curl -sSL https://raw.githubusercontent.com/sdispater/poetry/master/get-poetry.py | python
source $HOME/.poetry/env
poetry completions zsh > $HOME/.zsh/completions/_poetry
poetry config virtualenvs.in-project true

mkdir -p $HOME/.zsh/custom/plugins/poetry
poetry completions zsh > $HOME/.zsh/custom/plugins/poetry/_poetry

echo "Installing python..."
PYTHON27_VERSION="2.7.18" # Needed for npm
pyenv install "$PYTHON27_VERSION"
echo "Python 3.6.8 ..."
pyenv install 3.6.8
echo "Python 3.7.5 ..."
pyenv install 3.7.5
echo "Python 3.9.5 ..."
pyenv install 3.9.5
echo "Set Python globally"
pyenv global 3.9.5

# echo 'eval "$(pyenv init --path)"' >> $HOME/.zprofile  # probably not needed?
