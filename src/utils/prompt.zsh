. ${CLI_CONFIG_ROOT}/src/utils/array.zsh

Prompt() {
  message=$1
  shift
  valid_opts=("$@")

  valid_opts_str=$(array_str "/" "${valid_opts[@]}")
  echo -n "${message} (${valid_opts_str}) " >/dev/tty
  read response

  isValid=$(array_contains "${response}" "${valid_opts[@]}")

  result=("${response}" "${isValid}")
  echo ${result}
}
