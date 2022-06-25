read_options() {
  # DEFAULT OPTIONS
  export CCOPT_PROFILE=default
  export CCOPT_NO_SUDO='sudo'
  export CCOPT_DEBIAN_FRONTEND=''
  export CCOPT_TOOLS=('antigen' 'ohmyposh' 'nvm' 'pyenv' 'dotnet' 'tfenv' 'gvm')

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
      export CCOPT_CLEAN=true
      shift
      ;;
    -p | --profile)
      profiles=($(ls -1 $CLI_CONFIG_ROOT/profiles))
      export CCOPT_PROFILE=$2
      if [ "$(array_contains "$CCOPT_PROFILE" "${profiles[@]}")" = "false" ]; then
        echo "The specified profile '$CCOPT_PROFILE' does not exist. "
        echo "Available profiles: $(array_str ' | ' ${profiles[@]})"
        exit
      fi
      shift
      shift
      ;;
    -n | --no-sudo)
      export CCOPT_NO_SUDO=''
      shift
      ;;
    -t | --tools)
      allowedPrograms=($(ls -1 $CLI_CONFIG_ROOT/src/installers | sed 's/\..*$//g' | sort | uniq))

      if [ "$2" = "" ]; then
        Log "\"-t|--tools\" No tool selected, skipping installation."
        exit
      fi

      export CCOPT_TOOLS=($(echo $2 | sed 's/,/\n/g'))
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
      export CCOPT_DEBIAN_FRONTEND='DEBIAN_FRONTEND=noninteractive'
      shift
      ;;
    *)
      # Tool specific options
      optionKey="${1}"

      if [ ! "$(echo "${optionKey}" | grep '^-')" ]; then
        shift
        continue
      fi

      optionKey="CCOPT_$(echo "${optionKey}" | sed -e 's/^\-*//' -e 's/\-/_/g' | tr 'a-z' '[:upper:]')"
      optionValue="${2}"
      export ${optionKey}="${optionValue}"
      shift
      shift
      ;;
    esac
  done
}
