MergeOptions() {
  prefix=${1}
  shift
  
  typeset -A currentOptions=("$@")

  typeset -A modifiedOptions=()
  for key value in "${(@kv)currentOptions}"; do
    optionKey="${prefix}${key}"
    if [ ! "${(P)${optionKey}}" = "" ]; then
      modifiedOptions+=(${key} ${(P)${optionKey}})
    else
      modifiedOptions+=(${key} ${value})
    fi
  done
  
  echo "${(@kv)modifiedOptions[@]}"
}
