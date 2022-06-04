TOOL=dotnet
CONF=$CLI_CONFIG_CONF_LOCATION/$TOOL.conf.sh

echo -n > $CONF
printf 'export DOTNET_ROOT="$CLI_CONFIG_ROOT/current/dotnet"\n' >> $CONF
printf 'export PATH="$CLI_CONFIG_ROOT/current/dotnet:$PATH"\n' >> $CONF
