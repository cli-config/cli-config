

TOOL=tfenv
CONF=$CLI_CONFIG_CONF_LOCATION/$TOOL.conf.sh

echo -n > $CONF
printf "export TFENV_ROOT="$CLI_CONFIG_ROOT/current/tfenv"\n" >> $CONF
printf "export PATH="\$TFENV_ROOT/bin:\$PATH"\n" >> $CONF
