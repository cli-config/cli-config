#!/usr/bin/env zsh

. ${CLI_CONFIG_ROOT}/src/utils/log.zsh

configure() {
  # Create installation folder if not exists
  if [ ! -d "${CLI_CONFIG_ROOT}/current" ]; then
    Log ": Please run cli-config in 'install' mode first to update configuration."
    exit
  fi

  # load cli-config env variables
  . ${CLI_CONFIG_ROOT}/src/scripts/env.zsh

  # programs=('antigen' 'ohmyzsh' 'ohmyposh' 'nvm' 'pyenv' 'dotnet' 'tfenv' 'gvm' 'zsh-plugins')
  for tool in ${CCOPT_TOOLS[@]}; do
    Log "Updating configuration for cli-config/${tool}"
    if [ -d "${CLI_CONFIG_ROOT}/current/${tool}" ]; then
      TOOL="$(echo ${tool} | tr 'a-z' '[:upper:]')"
      TOOL_LOWERED="$(echo ${tool} | tr 'a-z' '[:lower:]')"
      TOOL_PREFIX="CCOPT_${TOOL}_"
      TOOL_DIR="${CLI_CONFIG_ROOT}/current/${tool}"
      CONF="${CLI_CONFIG_CONF_LOCATION}/${tool}.conf.sh"
      . ${CLI_CONFIG_ROOT}/src/installers/${tool}.zsh
      Configure
    fi
  done
  . ${CLI_CONFIG_ROOT}/src/scripts/setup.programs-conf.zsh

  echo "Configuration updated!"
}
