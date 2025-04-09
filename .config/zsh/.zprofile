
eval "$(/opt/homebrew/bin/brew shellenv)"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# https://storybook.js.org/docs/configure/telemetry#how-to-opt-out
STORYBOOK_DISABLE_TELEMETRY=1

# npm
npm set fund false
npm set audit false

# pyenv (https://github.com/pyenv/pyenv)
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"

# pyenv-virtualenv (https://github.com/pyenv/pyenv-virtualenv)
eval "$(pyenv virtualenv-init -)"
