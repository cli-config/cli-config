namespace cliConfig

if [ -d "$CLI_CONFIG_ROOT/current/dotnet" ]; then
    Log 'CLI-CONFIG: Seems cli-config/dotnet is already installed!'
else
    Log "CLI-CONFIG: Installing dotnet"

    mkdir $CLI_CONFIG_ROOT/current/dotnet

    dotnetInstallerLocation=$CLI_CONFIG_TOOLS_LOCATION/dotnet-install.sh 
    wget -O $dotnetInstallerLocation https://dot.net/v1/dotnet-install.sh
    bash $dotnetInstallerLocation --install-dir $CLI_CONFIG_ROOT/current/dotnet --channel Current
fi
