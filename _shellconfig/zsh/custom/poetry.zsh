if [ ! -d $XDG_CONFIG_HOME/poetry ]; then
    echo "Installing Poetry..."
    curl -sSL https://install.python-poetry.org | POETRY_HOME=$XDG_CONFIG_HOME/poetry python3 -
fi
if [[ -o login ]]; then
  export PATH="$XDG_CONFIG_HOME/poetry/bin:$PATH"
  poetry completions zsh > $XDG_CONFIG_HOME/zsh/completions/_poetry
fi
