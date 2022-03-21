if [ ! -d $HOME/.config/poetry ]; then
    echo "Installing Poetry..."
    curl -sSL https://install.python-poetry.org | POETRY_HOME=$HOME/.config/poetry python3 -
fi
if [[ -o login ]]; then
  export PATH="$HOME/.config/poetry/bin:$PATH"
  poetry completions zsh > $HOME/.config/zsh/completions/_poetry
fi
