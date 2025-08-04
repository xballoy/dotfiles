# Basic environment variables
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# History configuration
HISTFILE="${HOME}/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000

# ls colors
export LSCOLORS="exfxcxdxbxegedabagacad"
export CLICOLOR=true

# Homebrew
export HOMEBREW_NO_ENV_HINTS=true

# Storybook - Disable telemetry
export STORYBOOK_DISABLE_TELEMETRY=1

# GPG
export GPG_TTY=$(tty)

# pyenv setup (path components)
export PYENV_ROOT="${HOME}/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"

# NVM configuration
export NVM_COMPLETION=true
