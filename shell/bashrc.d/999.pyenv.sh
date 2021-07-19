export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
# eval "$(pyenv virtualenv-init -)"
eval "$(pyenv init --path)"
export PYENV_VIRTUALENV_DISABLE_PROMPT=1
