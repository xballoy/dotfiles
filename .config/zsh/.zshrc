# https://github.com/zsh-users/zsh-history-substring-search
source $(brew --prefix)/share/zsh-history-substring-search/zsh-history-substring-search.zsh
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# https://github.com/zsh-users/zsh-autosuggestions/
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# fzf (https://github.com/junegunn/fzf)
source <(fzf --zsh)

# Add Homebrew installed software to PATH
export PATH="/usr/local/sbin:$PATH"

## GPG
export GPG_TTY=`tty`

# npm
npm config set fund=false
npm config set audit=false
npm config set save-exact=true

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# nvm - Swich node version based on .nvmrc
autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

# pyenv (https://github.com/pyenv/pyenv?tab=readme-ov-file#b-set-up-your-shell-environment-for-pyenv)
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"

# pyenv-virtualenv (https://github.com/pyenv/pyenv-virtualenv?tab=readme-ov-file#installing-as-a-pyenv-plugin)
eval "$(pyenv virtualenv-init -)"

# Storybook - Disable telemetry (https://storybook.js.org/docs/configure/telemetry#how-to-opt-out)
STORYBOOK_DISABLE_TELEMETRY=1

# Alias
alias edit=code
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# zoxide (https://github.com/ajeetdsouza/zoxide)
eval "$(zoxide init zsh)"

# Should be last (https://starship.rs/guide/)
eval "$(starship init zsh)"
