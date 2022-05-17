namespace cliConfig

if [[ -f "$CLI_CONFIG_ROOT/current/tools/antigen.zsh" ]]; then
    Log 'CLI-CONFIG: Seems cli-config/tools/antigen is already installed!'
else
    Log "CLI-CONFIG: Installing antigen plugin manager"
    wget https://git.io/antigen -O $CLI_CONFIG_TOOLS_LOCATION/antigen.zsh
fi