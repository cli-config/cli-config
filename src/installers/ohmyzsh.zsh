. "${CLI_CONFIG_ROOT}/src/utils/index.zsh"

Install() {
  if [ -d "$CLI_CONFIG_ROOT/current/ohmyzsh" ]; then
    Log 'Seems cli-config/ohmyzsh is already installed!'
  else
    Log "Installing ohmyzsh"

    curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh | ZSH=$CLI_CONFIG_ROOT/current/ohmyzsh bash -s -- --keep-zshrc
  fi
}

Configure() {
  TOOL=ohmyzsh
  CONF=$CLI_CONFIG_CONF_LOCATION/$TOOL.conf.sh

  echo -n >$CONF
  printf 'export ZSH="$CLI_CONFIG_ROOT/current/ohmyzsh"\n' >>$CONF
  printf 'source $ZSH/oh-my-zsh.sh' >>$CONF
}
