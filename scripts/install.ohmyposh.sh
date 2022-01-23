namespace cliConfig

INSTALL_DIR=$CLI_CONFIG_ROOT/current/ohmyposh

if [ -d $INSTALL_DIR ]; then
    Log 'CLI-CONFIG: Seems cli-config/ohmyposh is already installed!'
else
    Log "CLI-CONFIG: Installing ohmyposh"
    mkdir $INSTALL_DIR
    wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-`uname -s | tr 'A-Z' 'a-z'`-amd64 -O $INSTALL_DIR/oh-my-posh
    chmod +x $INSTALL_DIR/oh-my-posh

    Log "CLI-CONFIG: Setting up ohmyposh themes"
    git clone https://github.com/JanDeDobbeleer/oh-my-posh --depth=1 $INSTALL_DIR/themes-tmp
    mv $INSTALL_DIR/themes-tmp/themes $INSTALL_DIR
    rm -rf $INSTALL_DIR/themes-tmp/

    printf "\n\n# ohmyposh configuration\n" >> $CLI_CONFIG_PROGRAMS_CONF
    printf 'eval "$($CLI_CONFIG_ROOT/current/ohmyposh/oh-my-posh --init --shell zsh --config $CLI_CONFIG_ROOT/current/ohmyposh/themes/$CLI_CONFIG_THEME.omp.json)"\n' >> $CLI_CONFIG_PROGRAMS_CONF
    printf '\n\n# --------' >> $CLI_CONFIG_PROGRAMS_CONF
fi