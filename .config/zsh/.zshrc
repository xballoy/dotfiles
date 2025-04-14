# https://github.com/zsh-users/zsh-autosuggestions/
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# fzf (https://github.com/junegunn/fzf)
source <(fzf --zsh)

# Add Homebrew installed software to PATH
export PATH="/usr/local/sbin:$PATH"

## GPG
export GPG_TTY=`tty`

# Storybook - Disable telemetry (https://storybook.js.org/docs/configure/telemetry#how-to-opt-out)
export STORYBOOK_DISABLE_TELEMETRY=1

# https://github.com/lukechilds/zsh-nvm
export NVM_COMPLETION=true
export NVM_LAZY_LOAD=true
source ~/.config/zsh/.zsh-nvm/zsh-nvm.plugin.zsh

# pyenv (https://github.com/pyenv/pyenv)
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"

# pyenv-virtualenv (https://github.com/pyenv/pyenv-virtualenv)
eval "$(pyenv virtualenv-init -)"

# Alias
alias edit=code
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# zoxide (https://github.com/ajeetdsouza/zoxide)
eval "$(zoxide init zsh)"

# Should be last (https://starship.rs/guide/)
eval "$(starship init zsh)"
