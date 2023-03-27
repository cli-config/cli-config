. "${CLI_CONFIG_ROOT}/src/utils/index.zsh"
. "${CLI_CONFIG_ROOT}/src/installers/${TOOL_LOWERED}.options.zsh"

typeset -A options=(MergeOptions "${TOOL_PREFIX}" "${(@kv)defaultOptions[@]}")

Install() {
  if [ -d "${TOOL_DIR}" ]; then
    Log 'Seems cli-config/tfenv is already installed!'
  else

    Log "Installing tfenv"

    CLI_CONFIG_TFENV_ROOT=${TOOL_DIR}

    git clone --depth=1 https://github.com/tfutils/tfenv.git $CLI_CONFIG_TFENV_ROOT
    ${CLI_CONFIG_TFENV_ROOT}/bin/tfenv install ${options[TF_VERSION]}
    ${CLI_CONFIG_TFENV_ROOT}/bin/tfenv use ${options[TF_VERSION]}
  fi
}

Configure() {
  echo -n >$CONF
  printf "export TFENV_ROOT="$CLI_CONFIG_ROOT/current/tfenv"\n" >>$CONF
  printf "export PATH="\$TFENV_ROOT/bin:\$PATH"\n" >>$CONF
}