. "${CLI_CONFIG_ROOT}/src/utils/index.zsh"

typeset -A options=()

Install() {
  if [ -d "${TOOL_DIR}" ]; then
    Log 'Seems cli-config/ohmyzsh is already installed!'
  else
    Log "Installing ohmyzsh"

    curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh | ZSH=$CLI_CONFIG_ROOT/current/ohmyzsh bash -s -- --keep-zshrc
  fi
}

Configure() {
  echo -n >$CONF
  printf 'export ZSH="$CLI_CONFIG_ROOT/current/ohmyzsh"\n' >>$CONF
  printf 'source $ZSH/oh-my-zsh.sh' >>$CONF
}
