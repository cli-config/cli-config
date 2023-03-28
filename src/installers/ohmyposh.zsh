. "${CLI_CONFIG_ROOT}/src/utils/index.zsh"
. "${CLI_CONFIG_ROOT}/src/installers/${TOOL_LOWERED}.options.zsh"

typeset -A options=(MergeOptions "${TOOL_PREFIX}" "${(@kv)defaultOptions[@]}")

Install() {
  if [ -d ${TOOL_DIR} ]; then
    Log 'Seems cli-config/ohmyposh is already installed!'
  else
    Log "Installing ohmyposh"
    mkdir ${TOOL_DIR}
    wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-$(uname -s | tr 'A-Z' 'a-z')-amd64 -O ${TOOL_DIR}/oh-my-posh
    chmod +x ${TOOL_DIR}/oh-my-posh

    Log "Setting up ohmyposh themes"
    git clone https://github.com/JanDeDobbeleer/oh-my-posh --depth=1 ${TOOL_DIR}/themes-tmp
    mv ${TOOL_DIR}/themes-tmp/themes ${TOOL_DIR}
    rm -rf ${TOOL_DIR}/themes-tmp/

  fi
}

Configure() {
  echo -n >$CONF
  printf 'eval "$($CLI_CONFIG_ROOT/current/ohmyposh/oh-my-posh init zsh --config $CLI_CONFIG_ROOT/current/ohmyposh/themes/$CLI_CONFIG_THEME.omp.json)"\n' >>$CONF
}
