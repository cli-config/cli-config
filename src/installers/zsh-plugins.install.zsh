TOOL='zsh-plugins'

if [ -d "$CLI_CONFIG_ROOT/current/${TOOL}" ]; then
  Log "Seems cli-config/${TOOL} is already installed!"
else
  Log "Installing ${TOOL}"
  TOOL_DIR=${CLI_CONFIG_ROOT}/current/${TOOL}
  mkdir ${TOOL_DIR}
fi
