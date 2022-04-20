#
# Yarn

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_YARN_SHOW="${SPACESHIP_YARN_SHOW=true}"
SPACESHIP_YARN_PREFIX="${SPACESHIP_YARN_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
SPACESHIP_YARN_SUFFIX="${SPACESHIP_YARN_SUFFIX=" "}"
SPACESHIP_YARN_SYMBOL="${SPACESHIP_YARN_SYMBOL="🧶 "}"
SPACESHIP_YARN_DEFAULT_VERSION="${SPACESHIP_YARN_DEFAULT_VERSION=""}"
SPACESHIP_YARN_COLOR="${SPACESHIP_YARN_COLOR="green"}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

# Show current version of YARN, exception system.
spaceship_yarn() {
  [[ $SPACESHIP_YARN_SHOW == false ]] && return

  # Show YARN status only for JS-specific folders
  [[ -f package.json || -d node_modules || -d .yarn || -f .yarn.lock ]] || return

  local 'yarn_version'

  if  spaceship::exists YARN; then
    yarn_version=$(yarn -v 2>/dev/null)
  else
    return
  fi

  [[ $yarn_version == $SPACESHIP_YARN_DEFAULT_VERSION ]] && return

  spaceship::section \
    "$SPACESHIP_YARN_COLOR" \
    "$SPACESHIP_YARN_PREFIX" \
    "${SPACESHIP_YARN_SYMBOL}${yarn_version}" \
    "$SPACESHIP_YARN_SUFFIX"
}
