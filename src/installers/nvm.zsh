. "${CLI_CONFIG_ROOT}/src/utils/index.zsh"
. "${CLI_CONFIG_ROOT}/src/installers/${TOOL_LOWERED}.options.zsh"

typeset -A options=()
MergeOptions "${TOOL_PREFIX}" "defaultOptions" "options"

Install() {
  if [ -d "$CLI_CONFIG_ROOT/current/nvm" ]; then
  Log 'Seems cli-config/nvm is already installed!'
  else
  Log "Installing nvm"
  Log "Installing node.js with nvm (${options[NODE_VERSION]})"

  NVM_DIR=$CLI_CONFIG_ROOT/current/nvm
  mkdir $NVM_DIR
  wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | PROFILE=/dev/null NVM_DIR=$CLI_CONFIG_ROOT/current/nvm bash

  . $NVM_DIR/nvm.sh
  nvm install ${options[NODE_VERSION]}
  fi
}

Configure() {
  echo -n >$CONF
  printf 'export NVM_DIR="$CLI_CONFIG_ROOT/current/nvm"\n' >>$CONF
  printf "# add nvm to path\n" >>$CONF
  printf 'export PATH="$NVM_DIR:$PATH"\n' >>$CONF
  printf "lazyload ${defaultOptions[EXTRA_LAZY_COMMANDS]} ${options[EXTRA_LAZY_COMMANDS]} -- \"source $NVM_DIR/nvm.sh\"" >>$CONF
}
