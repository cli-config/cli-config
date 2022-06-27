. "${CLI_CONFIG_ROOT}/src/utils/index.zsh"
. "${CLI_CONFIG_ROOT}/src/installers/${TOOL_LOWERED}.options.zsh"

typeset -A options=(MergeOptions "${TOOL_PREFIX}" "${(@kv)defaultOptions[@]}")

Install() {
  if [ -d "${TOOL_DIR}" ]; then
    Log "Seems cli-config/${TOOL} is already installed!"
  else
    Log "Installing ${TOOL}"
    mkdir ${TOOL_DIR}
  fi
}

Configure() {
  defaultPlugins=(
    "qoomon/zsh-lazyload"
    "zsh-users/zsh-autosuggestions"
    "ptavares/zsh-direnv"
    "ohmyzsh/ohmyzsh plugins/git"
  )

  mkdir -p ${TOOL_DIR} 2>/dev/null

  echo -n >$CONF
  for plugin in "${defaultPlugins[@]}"; do
    repo=$(echo $plugin | awk '{ print $1 }')
    folder=$(echo $plugin | awk '{ print $2 }')

    repoPath=${TOOL_DIR}/${repo}
    if [ ! -d "${repoPath}" ]; then
      git clone --depth=1 https://github.com/${repo} ${repoPath}
    fi

    pluginPath=$(echo "${repo}/${folder}" | sed 's|/$||')
    pluginName=$(echo $pluginPath | awk -F '/' '{print $NF}')
    echo "source \${CLI_CONFIG_ROOT}/current/zsh-plugins/${pluginPath}/${pluginName}.plugin.zsh" >>$CONF
  done
}
