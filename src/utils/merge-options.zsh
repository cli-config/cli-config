. "${CLI_CONFIG_ROOT}/src/utils/log.zsh"

MergeOptions() {
  prefix=${1}
  shift
  
  typeset -A currentOptions=("$@")

  typeset -A modifiedOptions=()
  for key in "${(@k)currentOptions}";
  do
    value="${currentOptions[key]}"
    optionKey="${prefix}${key}"
    if [ ! "${(P)${optionKey}}" = "" ]; then
      modifiedOptions+=(${key} ${(P)${optionKey}})
    else
      modifiedOptions+=(${key} ${value})
    fi
  done
  
  echo "${(@kv)modifiedOptions[@]}"
}
