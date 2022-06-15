. ${CLI_CONFIG_ROOT}/src/utils/array.zsh

prereqs() {
  requirements=('zsh' 'wget' 'curl' 'git' 'bash')

  missingRequirements=()

  for req in "${requirements[@]}"; do
    if [ "$(which ${req} > /dev/null; echo $?)" = "1" ]; then
      missingRequirements+=( $req )
    fi
  done

  if [ "${#missingRequirements[@]}" -gt "0" ]; then
    echo -n "Aborting due to missing dependencies - "
    echo `array_str ", " "${missingRequirements[@]}"`
    exit 1
  fi
}

