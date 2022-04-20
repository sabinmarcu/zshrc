
ZSH_THEME="spaceship"

source $ZSH_CUSTOM/spaceship/package.zsh
source $ZSH_CUSTOM/spaceship/separator.zsh
source $ZSH_CUSTOM/spaceship/yarn.zsh

SPACESHIP_PACKAGE_SYMBOL="${SPACESHIP_PACKAGE_SYMBOL="📦 "}"
SPACESHIP_NODE_PREFIX="${SPACESHIP_NODE_PREFIX="and "}"

SPACESHIP_PROMPT_ORDER=(
    separator
    line_sep
    time
    user
    dir
    host
    git
    hg
    line_sep
    package_extra
    yarn
    node
    docker
    exec_time
    line_sep
    battery
    vi_mode
    jobs
    exit_code
    char
)
