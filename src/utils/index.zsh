for util in $(find "${CLI_CONFIG_ROOT}/src/utils" -type f -regex '.*\.zsh'); do
  . "${util}"
done
