. "${CLI_CONFIG_ROOT}/src/utils/log.zsh"

MergeOptions() {
  prefix=${1}
  source=${2}
  dest=${3}

  for key in "${(@k)${(P)source}}"; do
    optionKey="${prefix}${key}"
    if [ "${(P)optionKey}" = "" ]; then
      defaultValue="${${(P)source}[$key]}"
      typeset -A $dest
      export "${dest}[$key]=$defaultValue"
    else
      modifiedValue="${(P)optionKey}"
      # https://stackoverflow.com/a/63473551/5640343
      export "${dest}[$key]=$modifiedValue"
    fi
  done
}
