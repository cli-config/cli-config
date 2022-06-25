. "${CLI_CONFIG_ROOT}/src/utils/index.zsh"

typeset -A options=(
  DEFAULT_VERSION '1.2.3'
)

Install() {
  if [ -d "$CLI_CONFIG_ROOT/current/tfenv" ]; then
    Log 'Seems cli-config/tfenv is already installed!'
  else

    Log "Installing tfenv"

    CLI_CONFIG_TFENV_ROOT=$CLI_CONFIG_ROOT/current/tfenv

    git clone --depth=1 https://github.com/tfutils/tfenv.git $CLI_CONFIG_TFENV_ROOT
    ${CLI_CONFIG_TFENV_ROOT}/bin/tfenv install ${options[DEFAULT_VERSION]}
    ${CLI_CONFIG_TFENV_ROOT}/bin/tfenv use ${options[DEFAULT_VERSION]}
  fi
}

Configure() {
  echo -n >$CONF
  printf "export TFENV_ROOT="$CLI_CONFIG_ROOT/current/tfenv"\n" >>$CONF
  printf "export PATH="\$TFENV_ROOT/bin:\$PATH"\n" >>$CONF
}
