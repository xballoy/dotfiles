# Dotfiles

## Prerequisites

### zsh

Use zsh as default shell

1. Open Terminal
2. Check current shell

```sh
echo $SHELL
```
3. If it already shows `/bin/zsh`, then zsh is already your default shell
4. If you need to change it to zsh, use the chsh command:

```sh
chsh -s /bin/zsh
```
5. Close and reopen Terminal for the changes to take effect

### Homebrew

Install [Homebrew](https://brew.sh/)

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Install brew formulas:

```sh
brew install ffmpeg \
    findutils \
    fzf \
    gh \
    git \
    git-lfs \
    golangci-lint \
    jq \
    mkcert \
    nss \
    pinentry-mac \
    pnpm \
    pyenv-virtualenv \
    starship \
    yarn \
    zoxide \
    zsh-autosuggestions \
    zsh-history-substring-search
```

Install brew cask:

```sh
brew install 1password \
    1password-cli \
    adobe-acrobat-reader \
    alfred \
    android-file-transfer \
    appcleaner \
    bartender \
    bruno \
    claude \
    cloudflare-warp \
    cryptomator \
    cursor \
    cyberduck \
    dbeaver-community \
    discord \
    docker \
    dropbox \
    firefox \
    font-fira-code \
    font-fira-code-nerd-font \
    font-open-sans \
    font-source-code-pro \
    fuse-t \
    google-chrome \
    google-cloud-sdk \
    gpg-suite-no-mail \
    imageoptim \
    insomnia \
    intellij-idea \
    istat-menus \
    iterm2 \
    keepassxc \
    keka \
    linear-linear \
    loom \
    lunar \
    macupdater \
    messenger \
    microsoft-auto-update \
    microsoft-teams \
    mitmproxy \
    mmex \
    mongodb-compass \
    namechanger \
    ngrok \
    notion \
    obsidian \
    onedrive \
    qlmarkdown \
    shottr \
    signal \
    slack \
    soulver \
    spotify \
    synologyassistant \
    transmission \
    visual-studio-code \
    vlc \
    whatsapp \
    zoom
```

### Manual installations

Install the following:

- [Boxy SVG](https://apps.apple.com/ca/app/boxy-svg/id611658502)
- [Lunar](https://static.lunar.fyi/releases/Lunar.dmg)
- [Magnet](https://apps.apple.com/ca/app/magnet/id441258766)
- [NordVPN](https://apps.apple.com/ca/app/nordvpn-vpn-for-privacy/id905953485)
- [nvm](https://github.com/nvm-sh/nvm?tab=readme-ov-file#installing-and-updating)
- [pyenv-virtualenv](https://github.com/pyenv/pyenv-virtualenv)
- [Reeder](https://apps.apple.com/ca/app/reeder-classic/id1529448980)
- [Wireguard](https://apps.apple.com/ca/app/wireguard/id1451685025)

## Install

1. Clone this project in your home folder `~`.
2. You may need to temporary rename the existing `.config` folder and merge them manually.
