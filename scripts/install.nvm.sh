namespace cliConfig

TOOL=nvm
CONF=$CLI_CONFIG_CONF_LOCATION/$TOOL.conf.sh

if [ -d "$CLI_CONFIG_ROOT/current/nvm" ]; then
    Log 'CLI-CONFIG: Seems cli-config/nvm is already installed!'
else
    Log "CLI-CONFIG: Installing nvm"

    Log "CLI-CONFIG: Installing node.js with nvm"
    
    NVM_DIR=$CLI_CONFIG_ROOT/current/nvm
    mkdir $NVM_DIR
    wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

    . $NVM_DIR/nvm.sh
    nvm install --lts

    echo -n > $CONF
    printf 'export NVM_DIR="$CLI_CONFIG_ROOT/current/nvm"\n' >> $CONF
    printf "\n\n# add nvm to path\n" >> $CONF
    printf 'export PATH="$NVM_DIR:$PATH"\n' >> $CONF
    printf '. $NVM_DIR/nvm.sh\n' >> $CONF
fi
