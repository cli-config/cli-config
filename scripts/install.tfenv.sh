namespace cliConfig

if [ -d "$CLI_CONFIG_ROOT/current/tfenv" ]; then
    Log 'CLI-CONFIG: Seems cli-config/tfenv is already installed!'
else

    Log "CLI-CONFIG: Installing tfenv"

    CLI_CONFIG_TFENV_ROOT=$CLI_CONFIG_ROOT/current/tfenv

    git clone --depth=1 https://github.com/tfutils/tfenv.git $CLI_CONFIG_TFENV_ROOT

    printf "\n\n# tfenv configuration\n" >> $CLI_CONFIG_PROGRAMS_CONF
    printf "export TFENV_ROOT="$CLI_CONFIG_ROOT/current/tfenv"\n" >> $CLI_CONFIG_PROGRAMS_CONF
    printf "export PATH="\$TFENV_ROOT/bin:\$PATH"\n" >> $CLI_CONFIG_PROGRAMS_CONF
    printf "\n\n# --------" >> $CLI_CONFIG_PROGRAMS_CONF
fi