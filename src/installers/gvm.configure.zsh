export GOROOT="${CLI_CONFIG_ROOT}/current/gvm"
TOOL=gvm
CONF=$CLI_CONFIG_CONF_LOCATION/$TOOL.conf.sh
DEFAULT_GO_VERSION=go1.17.7

echo -n > $CONF
printf 'export GVM_DIR="$CLI_CONFIG_ROOT/current/gvm"\n' >> $CONF
printf "# add gvm to path\n" >> $CONF
printf 'export PATH="$GVM_DIR:$PATH"\n' >> $CONF
printf 'lazyload gvm -- "source $GVM_DIR/scripts/gvm"' >> $CONF
