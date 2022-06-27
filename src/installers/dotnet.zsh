. "${CLI_CONFIG_ROOT}/src/utils/index.zsh"
. "${CLI_CONFIG_ROOT}/src/installers/${TOOL_LOWERED}.options.zsh"

typeset -A options=(MergeOptions "${TOOL_PREFIX}" "${(@kv)defaultOptions[@]}")

Install() {
  if [ -d "${TOOL_DIR}" ]; then
    Log 'Seems cli-config/dotnet is already installed!'
  else
    Log "Installing dotnet"
    mkdir ${TOOL_DIR}

    dotnetInstallerLocation=$CLI_CONFIG_TOOLS_LOCATION/dotnet-install.sh
    wget -O $dotnetInstallerLocation https://dot.net/v1/dotnet-install.sh
    bash $dotnetInstallerLocation --install-dir ${TOOL_DIR} --channel Current
  fi
}

Configure() {
  echo -n >$CONF
  printf 'export DOTNET_ROOT="$CLI_CONFIG_ROOT/current/dotnet"\n' >>$CONF
  printf 'export PATH="$CLI_CONFIG_ROOT/current/dotnet:$PATH"\n' >>$CONF
}
