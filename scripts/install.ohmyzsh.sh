namespace cliConfig

TOOL=ohmyzsh
CONF=$CLI_CONFIG_CONF_LOCATION/$TOOL.conf.sh

if [ -d "$CLI_CONFIG_ROOT/current/ohmyzsh" ]; then
    Log 'CLI-CONFIG: Seems cli-config/ohmyzsh is already installed!'
else
    Log "CLI-CONFIG: Installing ohmyzsh"

    curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh | zsh -s -- --keep-zshrc

    echo -n > $CONF
    printf 'export ZSH="$CLI_CONFIG_ROOT/current/ohmyzsh"\n' >> $CONF
fi
