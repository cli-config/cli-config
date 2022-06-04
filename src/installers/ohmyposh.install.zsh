TOOL=ohmyposh
CONF=$CLI_CONFIG_CONF_LOCATION/$TOOL.conf.sh
INSTALL_DIR=$CLI_CONFIG_ROOT/current/ohmyposh

if [ -d $INSTALL_DIR ]; then
    Log 'Seems cli-config/ohmyposh is already installed!'
else
    Log "Installing ohmyposh"
    mkdir $INSTALL_DIR
    wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-`uname -s | tr 'A-Z' 'a-z'`-amd64 -O $INSTALL_DIR/oh-my-posh
    chmod +x $INSTALL_DIR/oh-my-posh

    Log "Setting up ohmyposh themes"
    git clone https://github.com/JanDeDobbeleer/oh-my-posh --depth=1 $INSTALL_DIR/themes-tmp
    mv $INSTALL_DIR/themes-tmp/themes $INSTALL_DIR
    rm -rf $INSTALL_DIR/themes-tmp/

fi
