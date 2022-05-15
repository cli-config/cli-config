# activate antigen
source $CLI_CONFIG_TOOLS_LOCATION/antigen.zsh

# use antigen to setup the terminal

antigen bundle qoomon/zsh-lazyload
antigen bundle zsh-users/zsh-autosuggestions
# Doesn't work on Mac without direnv and autojump installed with brew
# ptavares/zsh-direnv changed their default branch to main which broke antigen bundle - explicitly requesting main branch
antigen bundle ptavares/zsh-direnv@main
antigen bundle autojump
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle ohmyzsh/ohmyzsh plugins/git

# apply all antigen changes
antigen apply

# init all cli-config tools
for tool in `ls -1 $CLI_CONFIG_CONF_LOCATION`; do
  . $CLI_CONFIG_CONF_LOCATION/$tool
done

# alias cls to clear
alias cls=clear

# configure thefuck
eval "$(thefuck --alias)"
