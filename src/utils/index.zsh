for util in $(find "${CLI_CONFIG_ROOT}/src/utils" -type f -regex '.*\.zsh' ! \(   -regex '.*index.zsh$' \)); do
  . "${util}"
done
