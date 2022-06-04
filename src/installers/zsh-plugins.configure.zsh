

CONF=${CLI_CONFIG_ROOT}/current/conf/0-zsh-plugins.conf.sh

defaultPlugins=(
  "qoomon/zsh-lazyload"
  "zsh-users/zsh-autosuggestions"
  "ptavares/zsh-direnv"
  "ohmyzsh/ohmyzsh plugins/git"
)

mkdir -p ${CLI_CONFIG_ROOT}/current/zsh-plugins 2> /dev/null

echo -n > $CONF
for plugin in "${defaultPlugins[@]}"; do
  repo=$( echo $plugin | awk '{ print $1 }' )
  folder=$( echo $plugin | awk '{ print $2 }' )
  
  repoPath=${CLI_CONFIG_ROOT}/current/zsh-plugins/${repo}
  if [ ! -d "${repoPath}" ]; then
    git clone --depth=1 https://github.com/${repo} ${repoPath}
  fi

  pluginPath=$( echo "${repo}/${folder}" | sed 's|/$||' )
  pluginName=$( echo $pluginPath | awk -F '/' '{print $NF}' )
  echo "source \${CLI_CONFIG_ROOT}/current/zsh-plugins/${pluginPath}/${pluginName}.plugin.zsh" >> $CONF
done