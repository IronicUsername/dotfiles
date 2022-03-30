#!/bin/bash
echo "==> Running python.sh"

echo "Installing and setting up poetry..."
curl -sSL https://install.python-poetry.org | POETRY_HOME=$XDG_CONFIG_HOME/poetry python3 -

export PATH="$XDG_CONFIG_HOME/poetry/bin:$PATH"
poetry completions zsh > $XDG_CONFIG_HOME/zsh/completions/_poetry
poetry config virtualenvs.in-project true

mkdir -p $XDG_CONFIG_HOME/zsh/custom/plugins/poetry
poetry completions zsh > $XDG_CONFIG_HOME/zsh/custom/plugins/poetry/_poetry

echo "Installing python, rust & node..."
. /opt/homebrew/opt/asdf/libexec/asdf.sh
export ASDF_CONFIG_FILE="${XDG_CONFIG_HOME}/asdf/asdfrc"
export ASDF_DATA_DIR="${XDG_DATA_HOME}/asdf"

asdf plugin-add python
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf plugin-add rust https://github.com/code-lever/asdf-rust.git

echo("Setting up python versions...")
asdf install python 2.7.18
asdf install python 3.7.13
asdf install python 3.8.13
asdf install python 3.9.12
asdf install python 3.10.2

echo("Set python/python3 to 3.9.12 and python2 to 2.7.18")
asdf global python 3.9.12 2.7.18

echo("Setting up nodejs versions...")
asdf install nodejs 17.8.0
asdf global nodejs 17.8.0

echo("Setting up rust versions...")
asdf install rust 1.59.0
asdf global rust 1.59.0
