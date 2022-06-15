TOOL=pyenv
CONF=$CLI_CONFIG_CONF_LOCATION/$TOOL.conf.sh

echo -n >$CONF
printf "export PYENV_ROOT="$CLI_CONFIG_ROOT/current/pyenv"\n" >>$CONF
printf "export PATH="\$PYENV_ROOT/bin:\$PYENV_ROOT/shims:\$PATH"\n" >>$CONF
printf "eval \"\$(pyenv init -)\"\n" >>$CONF
printf "eval \"\$(pyenv virtualenv-init -)\"\n" >>$CONF
