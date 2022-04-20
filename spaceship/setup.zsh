
ZSH_THEME="spaceship"
source $ZSH_CUSTOM/spaceship/yarn.zsh

SPACESHIP_PACKAGE_SYMBOL="${SPACESHIP_PACKAGE_SYMBOL="📦 "}"
SPACESHIP_NODE_PREFIX="${SPACESHIP_NODE_PREFIX="and "}"

SPACESHIP_PROMPT_ORDER=(
    time
    user
    dir
    host
    git
    hg
    line_sep
    package
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
