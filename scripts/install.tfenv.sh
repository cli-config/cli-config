namespace cliConfig

TOOL=tfenv
CONF=$CLI_CONFIG_CONF_LOCATION/$TOOL.conf.sh

if [ -d "$CLI_CONFIG_ROOT/current/tfenv" ]; then
    Log 'CLI-CONFIG: Seems cli-config/tfenv is already installed!'
else

    Log "CLI-CONFIG: Installing tfenv"

    CLI_CONFIG_TFENV_ROOT=$CLI_CONFIG_ROOT/current/tfenv

    git clone --depth=1 https://github.com/tfutils/tfenv.git $CLI_CONFIG_TFENV_ROOT

    echo -n > $CONF
    printf "export TFENV_ROOT="$CLI_CONFIG_ROOT/current/tfenv"\n" >> $CONF
    printf "export PATH="\$TFENV_ROOT/bin:\$PATH"\n" >> $CONF
fi
