. ${CLI_CONFIG_ROOT}/src/utils/log.zsh

remove() {
  for tool in "${CCOPT_TOOLS[@]}"; do
    Log "Running uninstall script for '${tool}'..."
    uninstallScriptPath="${CLI_CONFIG_ROOT}/src/installers/${tool}.uninstall.zsh"
    if [ -f "${uninstallScriptPath}" ]; then
      . ${uninstallScriptPath}
    else
      rm -rf ${CLI_CONFIG_ROOT}/current/${tool} 2>/dev/null
      rm -rf ${CLI_CONFIG_ROOT}/current/conf/${tool}.conf.sh
    fi

  done
}
