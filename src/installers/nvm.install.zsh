. "${CLI_CONFIG_ROOT}/src/utils/merge-options.zsh"

typeset -A options=(
  DEFAULT_NODE_VERSION '--lts'
  EXTRA_LAZY_COMMANDS 'node npm npx'
)
echo "prefix \`${TOOL_PREFIX}\`"
options=($(MergeOptions "${TOOL_PREFIX}" "${(@kv)options}"))
if [ -d "$CLI_CONFIG_ROOT/current/nvm" ]; then
  Log 'Seems cli-config/nvm is already installed!'
else
  Log "Installing nvm"
  Log "Installing node.js with nvm (${options[DEFAULT_NODE_VERSION]})"

  NVM_DIR=$CLI_CONFIG_ROOT/current/nvm
  mkdir $NVM_DIR
  wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | PROFILE=/dev/null NVM_DIR=$CLI_CONFIG_ROOT/current/nvm bash

  . $NVM_DIR/nvm.sh
  nvm install ${options[DEFAULT_NODE_VERSION]}
fi
