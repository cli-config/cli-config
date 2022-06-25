Install() {
  if [ -d "$CLI_CONFIG_ROOT/current/dotnet" ]; then
    Log 'Seems cli-config/dotnet is already installed!'
  else
    Log "Installing dotnet"

    mkdir $CLI_CONFIG_ROOT/current/dotnet

    dotnetInstallerLocation=$CLI_CONFIG_TOOLS_LOCATION/dotnet-install.sh
    wget -O $dotnetInstallerLocation https://dot.net/v1/dotnet-install.sh
    bash $dotnetInstallerLocation --install-dir $CLI_CONFIG_ROOT/current/dotnet --channel Current
  fi
}

Configure() {
  TOOL=dotnet
  CONF=$CLI_CONFIG_CONF_LOCATION/$TOOL.conf.sh

  echo -n >$CONF
  printf 'export DOTNET_ROOT="$CLI_CONFIG_ROOT/current/dotnet"\n' >>$CONF
  printf 'export PATH="$CLI_CONFIG_ROOT/current/dotnet:$PATH"\n' >>$CONF
}
