namespace cliConfig

Log "CLI-CONFIG: Installing ohmyzsh"

export ZSH="$CLI_CONFIG_ROOT/current/ohmyzsh"
curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh | zsh -s -- --keep-zshrc

printf "\n\n# ohmyzsh configuration\n" >> $CLI_CONFIG_PROGRAMS_CONF
printf 'export ZSH="$CLI_CONFIG_ROOT/current/ohmyzsh"\n' >> $CLI_CONFIG_PROGRAMS_CONF
printf '\n\n# --------' >> $CLI_CONFIG_PROGRAMS_CONF