#!/usr/bin/env zsh

. ${CLI_CONFIG_ROOT}/src/utils/array.zsh

install() {
  # START INSTALL
  Log "Starting install..."

  # load cli-config env variables
  . $CLI_CONFIG_ROOT/src/scripts/env.zsh

  # Try and clean old installation
  if [[ -n $CCOPT_CLEAN ]]; then
    Log "Trying to clean old installation: $CLI_CONFIG_ROOT/current"
    rm -rf "$CLI_CONFIG_ROOT/current" >/dev/null 2>/dev/null || true
  fi

  # Create installation folder if not exists
  if [ ! -d "$CLI_CONFIG_ROOT/current" ]; then
    Log "Creating new installation location: $CLI_CONFIG_ROOT/current"
    (mkdir "$CLI_CONFIG_ROOT/current" >/dev/null 2>&1) || true
  fi

  (mkdir $CLI_CONFIG_TOOLS_LOCATION >/dev/null 2>&1) || true
  (mkdir $CLI_CONFIG_CONF_LOCATION >/dev/null 2>&1) || true

  Log "Installing programs"

  for tool in ${CCOPT_TOOLS[@]}; do
    TOOL="$(echo ${tool} | tr 'a-z' '[:upper:]')"
    TOOL_LOWERED="$(echo ${tool} | tr 'a-z' '[:lower:]')"
    TOOL_PREFIX="CCOPT_${TOOL}_"
    TOOL_DIR="${CLI_CONFIG_ROOT}/current/${tool}"
    CONF="${CLI_CONFIG_CONF_LOCATION}/${tool}.conf.sh"
    . ${CLI_CONFIG_ROOT}/src/installers/${tool}.zsh

    Install
    Configure
  done

  . ${CLI_CONFIG_ROOT}/src/scripts/setup.programs-conf.zsh

  currentOs=$(uname -s)
  Log "Running OS specific settings..."
  if [ $currentOs = "Linux" ]; then
    # Log 'You are on linux'
    # TODO: check if we are specifically on Ubuntu
    . $CLI_CONFIG_ROOT/src/scripts/os-specific-setup.ubuntu.zsh

  elif [ $currentOs = "Darwin" ]; then
    # Log 'Mac huh'
    . $CLI_CONFIG_ROOT/src/scripts/os-specific-setup.darwin.zsh
  else
    Log 'what realm is this?'
  fi

  zshPath=$(which zsh)
  # set ~/.zshrc to selected profile
  (rm -f ~/.zshrc ~/.zshrc.zwc 2>/dev/null || true) && ln -s $CLI_CONFIG_ROOT/profiles/$CCOPT_PROFILE/.zshrc ~/.zshrc

  echo
  Log "Installation complete!"
  echo "You are using cli-config now!"
  echo "Symlinked ~/.zshrc to the '$CCOPT_PROFILE' cli-config profile."
  echo "Note: Your default shell should be '$zshPath'. (Use chsh to change it)"

  printf "\n\nEnjoy! Made with love\n- Saurav\n"
}
