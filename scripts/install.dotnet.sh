namespace cliConfig

source $CLI_CONFIG_ROOT/scripts/env.sh

Log "CLI-CONFIG: Installing dotnet"

mkdir $CLI_CONFIG_ROOT/current/dotnet

dotnetInstallerLocation=$CLI_CONFIG_TOOLS_LOCATION/dotnet-install.sh 
wget -O $dotnetInstallerLocation https://dot.net/v1/dotnet-install.sh
bash $dotnetInstallerLocation --install-dir $CLI_CONFIG_ROOT/current/dotnet --channel Current

printf "# dotnet configuration\n" >> $CLI_CONFIG_PROGRAMS_CONF
printf 'export DOTNET_ROOT="$CLI_CONFIG_ROOT/current/dotnet"\n' >> $CLI_CONFIG_PROGRAMS_CONF
printf 'export PATH="$CLI_CONFIG_ROOT/current/dotnet:$PATH"\n' >> $CLI_CONFIG_PROGRAMS_CONF
printf '\n\n# --------' >> $CLI_CONFIG_PROGRAMS_CONF