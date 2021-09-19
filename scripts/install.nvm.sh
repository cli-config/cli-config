namespace cliConfig

Log "CLI-CONFIG: Installing nvm"

Log "CLI-CONFIG: Installing node.js with nvm"
zsh -c "
. $CLI_CONFIG_ROOT/scripts/env.sh
# Load antigen
. $CLI_CONFIG_TOOLS_LOCATION/antigen.zsh
NVM_DIR=$CLI_CONFIG_ROOT/current/nvm
antigen bundle lukechilds/zsh-nvm
antigen apply
nvm install --lts
"

printf '\n\n# nvm configuration\n' >> $CLI_CONFIG_PROGRAMS_CONF
printf 'export NVM_DIR="$CLI_CONFIG_ROOT/current/nvm"\n' >> $CLI_CONFIG_PROGRAMS_CONF

printf "\n\n# add nvm to path\n" >> $CLI_CONFIG_PROGRAMS_CONF
printf 'export PATH="$NVM_DIR:$PATH"\n' >> $CLI_CONFIG_PROGRAMS_CONF
printf '\n\n# --------' >> $CLI_CONFIG_PROGRAMS_CONF
