namespace cliConfig

export GOROOT="${CLI_CONFIG_ROOT}/current/gvm"
TOOL=gvm
CONF=$CLI_CONFIG_CONF_LOCATION/$TOOL.conf.sh
DEFAULT_GO_VERSION=go1.17.7

if [ -d "$CLI_CONFIG_ROOT/current/$TOOL" ]; then
    Log 'CLI-CONFIG: Seems cli-config/gvm is already installed!'
else
    Log "CLI-CONFIG: Installing gvm"
    
    curl -sSL https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer | zsh -s -- master "$CLI_CONFIG_ROOT/current"

    currentOs=`uname -s`
    if [ $currentOs = "Linux" ]; then
        # TODO: check if we are specifically on Ubuntu
        Log "CLI-CONFIG: Setting up dependencies for gvm"
        cmd="$CCOPT_DEBIAN_FRONTEND $CCOPT_NO_SUDO apt install --yes --no-install-recommends curl git mercurial make binutils bison gcc build-essential"
        Log "CLI-CONFIG: $cmd"
        eval $cmd
    elif [ $currentOs = "Darwin" ]; then
        cmd="brew install mercurial"
        Log "CLI-CONFIG: $cmd"
        eval $cmd
    fi

    Log "CLI-CONFIG: Installing $DEFAULT_GO_VERSION with gvm"
    export GVM_DIR="$CLI_CONFIG_ROOT/current/gvm"
    . $GOROOT/scripts/gvm
    gvm install $DEFAULT_GO_VERSION -B
    Log "CLI-CONFIG: Setting up $DEFAULT_GO_VERSION to be used globally"
    gvm use $DEFAULT_GO_VERSION --default

    echo -n > $CONF
    printf 'export GVM_DIR="$CLI_CONFIG_ROOT/current/gvm"\n' >> $CONF
    printf "\n\n# add gvm to path\n" >> $CONF
    printf 'export PATH="$GVM_DIR:$PATH"\n' >> $CONF
    printf '. $GVM_DIR/scripts/gvm\n' >> $CONF
fi