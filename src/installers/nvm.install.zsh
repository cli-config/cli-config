TOOL=nvm
CONF=$CLI_CONFIG_CONF_LOCATION/$TOOL.conf.sh

typeset -A options=(
  DEFAULT_VERSION '--lts'
  EXTRA_LAZY_COMMANDS 'node npm npx'
)

if [ -d "$CLI_CONFIG_ROOT/current/nvm" ]; then
  Log 'Seems cli-config/nvm is already installed!'
else
  Log "Installing nvm"
  Log "Installing node.js with nvm"

  NVM_DIR=$CLI_CONFIG_ROOT/current/nvm
  mkdir $NVM_DIR
  wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | PROFILE=/dev/null NVM_DIR=$CLI_CONFIG_ROOT/current/nvm bash

  . $NVM_DIR/nvm.sh
  nvm install ${options[DEFAULT_VERSION]}
fi
