. ${CLI_CONFIG_ROOT}/src/utils/array.zsh

Prompt() {
  if [ "${CONSOLE}" = '' ]; then
    console='/dev/tty'
  else
    console="${CONSOLE}"
  fi

  message=$1
  shift
  caseInsensitive=$1
  shift
  valid_opts=("$@")

  valid_opts_str=$(array_str "/" "${valid_opts[@]}")
  echo -n "${message} (${valid_opts_str}) " >$console
  read response

  if [ "${caseInsensitive}" = "true" ]; then
    valid_opts_lowered=()
    for opt in "${valid_opts[@]}"; do valid_opts_lowered+=($(echo "${opt}" | tr 'A-Z' 'a-z')); done
    responseLowered=$(echo "${response}" | tr 'A-Z' 'a-z')
    isValid=$(array_contains "${responseLowered}" "${valid_opts_lowered[@]}")
  else
    isValid=$(array_contains "${response}" "${valid_opts[@]}")
  fi

  response="${response} \0 ${isValid}"
  echo "${response}"
}
