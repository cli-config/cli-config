configure () {
    namespace cliConfig

    # Create installation folder if not exists
    if [ ! -d "$CLI_CONFIG_ROOT/current" ]; then
        Log "CLI-CONFIG: Please run cli-config in 'install' mode first to update configuration."
        exit
    fi

    array programs=('antigen' 'ohmyzsh' 'ohmyposh' 'nvm' 'pyenv' 'dotnet' 'tfenv' 'gvm')
    @get programs | array.forEach 'namespace cliConfig; Log "CLI-CONFIG: Updating configuration for cli-config/$item"; if [ -d "$CLI_CONFIG_ROOT/current/$item" ]; then . $CLI_CONFIG_ROOT/src/installers/$item.configure.sh; fi'

    . $CLI_CONFIG_ROOT/src/scripts/setup.programs-conf.sh

    echo "$(UI.Color.Blue)CLI-CONFIG: Configuration updated! $(UI.Powerline.ThumbsUp)"
}
