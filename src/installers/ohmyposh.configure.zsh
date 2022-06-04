

TOOL=ohmyposh
CONF=$CLI_CONFIG_CONF_LOCATION/$TOOL.conf.sh

echo -n > $CONF
printf 'eval "$($CLI_CONFIG_ROOT/current/ohmyposh/oh-my-posh init zsh --config $CLI_CONFIG_ROOT/current/ohmyposh/themes/$CLI_CONFIG_THEME.omp.json)"\n' >> $CONF
