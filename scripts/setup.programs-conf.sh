namespace cliConfig

if [[ -f "$CLI_CONFIG_ROOT/current/programs.conf.sh" ]]; then
    Log 'CLI-CONFIG: Seems cli-config/setup/programs-conf is already installed!'
else
    # generate main config script
    Log "CLI-CONFIG: Generating programs configuration"
    echo >> $CLI_CONFIG_PROGRAMS_CONF
    cat $CLI_CONFIG_ROOT/templates/programs.conf.sh >> $CLI_CONFIG_PROGRAMS_CONF
fi