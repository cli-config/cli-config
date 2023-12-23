. ${CLI_CONFIG_ROOT}/src/utils/array.zsh
. ${CLI_CONFIG_ROOT}/src/utils/log.zsh
. ${CLI_CONFIG_ROOT}/src/utils/prompt.zsh

uninstall() {
  responseYesToAll=false
  confirmationOptions=('y' 'N' 'a')

  for tool in "${CCOPT_TOOLS[@]}"; do
    if [ "${responseYesToAll}" = "false" ]; then
      while true; do
        response=($(echo $(Prompt "Are you sure you want to uninstall '${tool}'?" true "${confirmationOptions[@]}")))
        receivedValidResponse="${response[2]}"

        enteredOption=$(echo "${response[1]}" | tr 'A-Z' 'a-z')

        if [ "${enteredOption}" = "a" ]; then
          responseYesToAll=true
          break
        elif [ "${enteredOption}" = "" ] || [ "${receivedValidResponse}" = "true" ]; then
          break
        fi
      done
    else
      enteredOption="a"
    fi

    if [ "${enteredOption}" = "" ] || [ "${enteredOption}" = "n" ]; then
      Log "Skipping uninstall of ${tool}."
      continue
    fi

    if [ "${enteredOption}" = "y" ] || [ "${enteredOption}" = "a" ]; then
      Log "Running uninstall script for '${tool}'..."
      uninstallScriptPath="${CLI_CONFIG_ROOT}/src/installers/${tool}.uninstall.zsh"
      if [ -f "${uninstallScriptPath}" ]; then
        . ${uninstallScriptPath}
      else
        rm -rf ${CLI_CONFIG_ROOT}/current/${tool} 2>/dev/null
        rm -rf ${CLI_CONFIG_ROOT}/current/conf/${tool}.conf.sh
      fi
      Log "Done."
    fi
  done
}
