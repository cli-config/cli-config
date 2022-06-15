#!/usr/bin/env zsh

. ${CLI_CONFIG_ROOT}/src/utils/array.zsh

install() {
  # DEFAULT OPTIONS
  CCOPT_PROFILE=default
  CCOPT_NO_SUDO='sudo'
  CCOPT_DEBIAN_FRONTEND=''
  CCOPT_TOOLS=('antigen' 'ohmyposh' 'nvm' 'pyenv' 'dotnet' 'tfenv' 'gvm')

  # READ OPTIONS
  # Todo: Move to separate file
  while [[ $# -gt 0 ]]; do
    case $1 in
    -h | --help)
      . $CLI_CONFIG_ROOT/src/defs/usage.zsh
      usage
      exit
      ;;
    -c | --clean)
      CCOPT_CLEAN=true
      shift
      ;;
    -p | --profile)
      profiles=($(ls -1 $CLI_CONFIG_ROOT/profiles))
      CCOPT_PROFILE=$2
      if [ "$(array_contains "$CCOPT_PROFILE" "${profiles[@]}")" = "false" ]; then
        echo "The specified profile '$CCOPT_PROFILE' does not exist. "
        echo "Available profiles: $(array_str ' | ' ${profiles[@]})"
        exit
      fi
      shift
      shift
      ;;
    -n | --no-sudo)
      CCOPT_NO_SUDO=''
      shift
      ;;
    -t | --tools)
      allowedPrograms=($(ls -1 $CLI_CONFIG_ROOT/src/installers | sed 's/\..*$//g' | sort | uniq))

      if [ "$2" = "" ]; then
        Log "\"-t|--tools\" No tool selected, skipping installation."
        exit
      fi

      CCOPT_TOOLS=($(echo $2 | sed 's/,/\n/g'))
      invalidPrograms=()
      for program in "${CCOPT_TOOLS[@]}"; do
        (! test -f $CLI_CONFIG_ROOT/src/installers/${program}.install.zsh) && invalidPrograms+=($program)
      done

      if [ "${#invalidPrograms[@]}" -ne 0 ]; then
        Log "\"-t|--tools\" Found invalid tools, skipping installation - '$(array_str ',' ${invalidPrograms[@]})'"
        exit
      fi
      shift
      shift
      ;;
    --ci)
      CCOPT_DEBIAN_FRONTEND='DEBIAN_FRONTEND=noninteractive'
      shift
      ;;
    *)
      # Unrecognized option
      shift
      ;;
    esac
  done

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
    . ${CLI_CONFIG_ROOT}/src/installers/${tool}.install.zsh && . ${CLI_CONFIG_ROOT}/src/installers/${tool}.configure.zsh
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
