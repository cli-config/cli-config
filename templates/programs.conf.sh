# activate antigen
source $CLI_CONFIG_TOOLS_LOCATION/antigen.zsh

# use antigen to setup the terminal
antigen use oh-my-zsh
antigen bundle mafredri/zsh-async
antigen bundle lukechilds/zsh-nvm
antigen bundle zsh-users/zsh-autosuggestions
# Doesn't work on Mac without direnv and autojump installed with brew
# ptavares/zsh-direnv changed their default branch to main which broke antigen bundle - explicitly requesting main branch
antigen bundle ptavares/zsh-direnv@main
antigen bundle autojump
antigen bundle zsh-users/zsh-syntax-highlighting

# apply all antigen changes
antigen apply

export PATH=$NVM_DIR:$PATH

# use current node LTS version with nvm
# suppress output
nvm use --lts &> /dev/null

# .nvmrc support
autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

# alias cls to clear
alias cls=clear

# configure thefuck
eval $(thefuck --alias)

# init all cli-config tools
for tool in `ls -1 $CLI_CONFIG_CONF_LOCATION`; do
  . $CLI_CONFIG_CONF_LOCATION/$tool
done
