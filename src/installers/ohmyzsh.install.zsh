if [ -d "$CLI_CONFIG_ROOT/current/ohmyzsh" ]; then
    Log 'Seems cli-config/ohmyzsh is already installed!'
else
    Log "Installing ohmyzsh"

    curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh | ZSH=$CLI_CONFIG_ROOT/current/ohmyzsh bash -s -- --keep-zshrc
fi
