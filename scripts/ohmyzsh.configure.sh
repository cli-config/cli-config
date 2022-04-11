namespace cliConfig

TOOL=ohmyzsh
CONF=$CLI_CONFIG_CONF_LOCATION/$TOOL.conf.sh

echo -n > $CONF
printf 'export ZSH="$CLI_CONFIG_ROOT/current/ohmyzsh"\n' >> $CONF
printf 'source $ZSH/oh-my-zsh.sh' >> $CONF
