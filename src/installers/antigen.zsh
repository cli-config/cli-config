. "${CLI_CONFIG_ROOT}/src/utils/index.zsh"

typeset -A options=()

Install() {
  if [ -d "$CLI_CONFIG_ROOT/current/antigen" ]; then
    Log 'Seems cli-config/tools/antigen is already installed!'
  else
    Log "Installing antigen plugin manager"
    wget https://git.io/antigen -O $CLI_CONFIG_TOOLS_LOCATION/antigen.zsh
    mkdir $CLI_CONFIG_ROOT/current/antigen 2>/dev/null
  fi
}

Configure() {
  echo -n >$CONF
  tee $CONF >/dev/null <<EOF
ADOTDIR=\${CLI_CONFIG_ROOT}/current/antigen
source \${CLI_CONFIG_TOOLS_LOCATION}/antigen.zsh

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
EOF
}
