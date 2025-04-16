# Shell options
# Prevents background jobs from having their priority lowered
setopt NO_BG_NICE
# Prevents the shell from sending the HUP (hangup) signal to running jobs when the shell exits.
setopt NO_HUP
# Disables the beep sound that normally occurs when tab completion has ambiguous matches
setopt NO_LIST_BEEP
# When using history expansion (like !$ or !!), this shows the expanded command for editing before executing it.
setopt HIST_VERIFY
# Allows history to be shared between different zsh sessions.
setopt SHARE_HISTORY
# Saves additional information with history entries, such as timestamps for when commands were started and how long they ran.
setopt EXTENDED_HISTORY
# Adds new history entries by appending to the history file rather than replacing it.
setopt APPEND_HISTORY
# Prevents duplicate commands from being saved in the history.
setopt HIST_IGNORE_ALL_DUPS
# Removes superfluous blanks from commands before adding them to the history, making the history more compact.
setopt HIST_REDUCE_BLANKS
# Expand aliases before attempting to complete them
setopt complete_aliases

# Alias
alias edit=code
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias zshrc='edit ${HOME}/.zshrc'

# Tool initializations (for interactive shells)
# https://github.com/zsh-users/zsh-autosuggestions/
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# fzf (https://github.com/junegunn/fzf)
source <(fzf --zsh)

# zsh-nvm (https://github.com/lukechilds/zsh-nvm)
source "${HOME}/.zsh-nvm/zsh-nvm.plugin.zsh"

# pyenv (https://github.com/pyenv/pyenv)
eval "$(pyenv init - zsh)"
# pyenv-virtualenv (https://github.com/pyenv/pyenv-virtualenv) (interactive shell components)
eval "$(pyenv virtualenv-init -)"

# zoxide
eval "$(zoxide init zsh)"

# Starship prompt (should be last)
eval "$(starship init zsh)"
