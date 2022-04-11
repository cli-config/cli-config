namespace cliConfig

if [ -d "$CLI_CONFIG_ROOT/current/ohmyzsh" ]; then
    Log 'CLI-CONFIG: Seems cli-config/ohmyzsh is already installed!'
else
    Log "CLI-CONFIG: Installing ohmyzsh"

    curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh | ZSH=$CLI_CONFIG_ROOT/current/ohmyzsh bash -s -- --keep-zshrc
fi
