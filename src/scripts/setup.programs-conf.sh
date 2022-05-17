namespace cliConfig

# generate main config script
Log "CLI-CONFIG: Generating programs configuration"
printf "# [Autogenerated - do not edit: at `date`] CLI-Config Install configuration --------" > $CLI_CONFIG_PROGRAMS_CONF
echo >> $CLI_CONFIG_PROGRAMS_CONF
cat $CLI_CONFIG_ROOT/src/templates/programs.conf.sh >> $CLI_CONFIG_PROGRAMS_CONF