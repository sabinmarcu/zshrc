# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

if [ -e ~/.zshrc.init ]; then
    source ~/.zshrc.init
fi

# Example aliases
alias zshc="$EDITOR ~/.zshrc"
alias zshr="source ~/.zshrc"

ZSH_THEME="materialshell-dark"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to disable command auto-correction.
# DISABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(
    git
    macos
    brew
    coffee
    github
    node
    jsontools
    meteor
    npm
    pip
    sudo
    themes
    tmux
    vundle
    xcode
    tmuxinator
    lg
    psg
    killz
    zsh-nvm
    zsh-syntax-highlighting
    gitignore
    zsh-history-substring-search
    zsh-z
    zsh-vi-mode
)

if command -v autoenv &> /dev/null; then
    plugins+=(autoenv)
fi
if command -v direnv &> /dev/null; then
    plugins+=(direnv)
fi

source $HOME/.zshaliases
source $ZSH/oh-my-zsh.sh

# User configuration

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:~/.npmfiles/bin"
# export MANPATH="/usr/local/man:$MANPATH"

if command -v code &> /dev/null; then
    export EDITOR="code --wait"
else 
    export EDITOR='vim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

if [ -e ~/.zshrc.local ]; then
    source ~/.zshrc.local
fi

if [[ ! $(command -v pbcopy) &&  $(command -v xclip) ]]; then
    alias pbcopy="xclip -sel clip"
fi

if [ $(command -v nvm) ]; then
    nvm use default &> /dev/null
fi

if [ $(command -v gh) ]; then
    eval "$(gh completion -s zsh)"
fi

if [ -d ~/.bin ]; then
    export PATH="$HOME/.bin:$PATH"
fi

export LANG="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_MESSAGES="en_US.UTF-8"
export LC_MONETARY="en_US.UTF-8"
export LC_NUMERIC="en_US.UTF-8"
export LC_TIME="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export PATH="/usr/local/opt/docker-virtualbox/bin:$PATH"
export PATH="/usr/local/opt/docker-machine/bin:$PATH"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

if command -v starship &> /dev/null; then
    eval "$(starship init zsh)"
fi

alias gwho="git rev-parse --abbrev-ref HEAD"
export GPG_TTY=$(tty)

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

if command -v nvim &> /dev/null; then
    alias nvimconfig="nvim ~/.config/nvim/lua/user"
fi

set -o vi
