TOOL='zsh-plugins'

if [ -d "$CLI_CONFIG_ROOT/current/${TOOL}" ]; then
    Log "CLI-CONFIG: Seems cli-config/${TOOL} is already installed!"
else
    Log "CLI-CONFIG: Installing ${TOOL}"
    TOOL_DIR=${CLI_CONFIG_ROOT}/current/${TOOL}
    mkdir ${TOOL_DIR}
fi