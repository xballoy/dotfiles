# Init completion system once per day: https://scottspence.com/posts/speeding-up-my-zsh-shell#fixing-the-completion-system-3076--10
autoload -Uz compinit
if [ "$(date +'%j')" != "$(stat -f '%Sm' -t '%j' ~/.zcompdump 2>/dev/null)" ]; then
    compinit
else
    compinit -C
fi

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

# Path setup (essential paths that should be available everywhere)
export PATH="/usr/local/sbin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="/Applications/IntelliJ IDEA.app/Contents/MacOS:$PATH"

# Alias
alias edit=code
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias zshrc='edit ${HOME}/.zshrc'
alias claude-yolo='claude --dangerously-skip-permissions'
alias wclaude-yolo='wclaude --dangerously-skip-permissions'

# Usage: bu [cleanup]
# Updates Homebrew and upgrades all outdated formulas with cleanup option.
bu() {
  local auto_cleanup=0
  if [[ "$1" == "cleanup" ]]; then
    auto_cleanup=1
  fi

  brew update
  outdated_formulas=$(brew outdated)

  if [ -n "$outdated_formulas" ]; then
    echo "$outdated_formulas"
    echo "\nUpgrading formulas..."
    brew upgrade
  else
    echo "No outdated formulas found."
  fi

  if [ $auto_cleanup -eq 1 ]; then
      brew cleanup --prune=all
      echo "Cleanup complete."
  fi
}

# Usage: gch
# Displays all git branches in an interactive fuzzy finder, allowing quick filtering and selection for checkout.
gch() {
  local branches branch
  branches=$(git branch --all | grep -v HEAD) &&
  branch=$(echo "$branches" | fzf -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
  git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/origin/##")
}

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

