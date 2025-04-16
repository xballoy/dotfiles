# Initialize Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# Initialize pyenv (login shell)
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init --path)"
fi
