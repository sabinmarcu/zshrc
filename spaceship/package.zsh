#
# Package
#
# Current package version.
# These package managers supported:
#   * npm
#   * lerna
#   * Cargo

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_PACKAGE_SHOW="${SPACESHIP_PACKAGE_SHOW=true}"
SPACESHIP_PACKAGE_PREFIX="${SPACESHIP_PACKAGE_PREFIX="is "}"
SPACESHIP_PACKAGE_SUFFIX="${SPACESHIP_PACKAGE_SUFFIX=" "}"
SPACESHIP_PACKAGE_SYMBOL="${SPACESHIP_PACKAGE_SYMBOL="📦 "}"
SPACESHIP_PACKAGE_COLOR="${SPACESHIP_PACKAGE_COLOR="red"}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

spaceship_package_extra() {
  [[ $SPACESHIP_PACKAGE_SHOW == false ]] && return

  # Show package version only when repository is a package
  local package_version
  local package_name

  if [[ -f package.json ]] && spaceship::exists npm; then
    if spaceship::exists jq; then
      package_version=$(jq -r '.version' package.json 2>/dev/null)
    elif spaceship::exists python; then
      package_version=$(python -c "import json; print(json.load(open('package.json'))['version'])" 2>/dev/null)
    elif spaceship::exists node; then
      package_version=$(node -p "require('./package.json').version" 2> /dev/null)
    fi
  fi

  if [[ -f package.json ]] && spaceship::exists npm; then
    if spaceship::exists jq; then
      package_name=$(jq -r '.name' package.json 2>/dev/null)
    elif spaceship::exists python; then
      package_name=$(python -c "import json; print(json.load(open('package.json'))['name'])" 2>/dev/null)
    elif spaceship::exists node; then
      package_name=$(node -p "require('./package.json').name" 2> /dev/null)
    fi
  fi

  [[ -z $package_name || "$package_name" == "null" || "$package_name" == "undefined" || -z $package_name || "$package_name" == "null" || "$package_name" == "undefined" ]] && return

  local package_prompt
  package_prompt="$package_name@$package_version"
  [[ -z $package_name || "$package_name" == "null" || "$package_name" == "undefined" ]] && package_prompt="v$package_version"
  [[ -z $package_version || "$package_version" == "null" || "$package_version" == "undefined" ]] && package_prompt="$package_name"

  spaceship::section \
    "$SPACESHIP_PACKAGE_COLOR" \
    "$SPACESHIP_PACKAGE_PREFIX" \
    "${SPACESHIP_PACKAGE_SYMBOL}${package_prompt}" \
    "$SPACESHIP_PACKAGE_SUFFIX"
}
