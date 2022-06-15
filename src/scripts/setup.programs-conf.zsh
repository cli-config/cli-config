# generate main config script
Log "Generating programs configuration"
printf "# [Autogenerated - do not edit: at $(date)] CLI-Config Install configuration --------" >$CLI_CONFIG_PROGRAMS_CONF
echo >>$CLI_CONFIG_PROGRAMS_CONF
cat $CLI_CONFIG_ROOT/src/templates/programs.conf.zsh >>$CLI_CONFIG_PROGRAMS_CONF
echo eval "\$(thefuck --alias)" >>$CLI_CONFIG_PROGRAMS_CONF
