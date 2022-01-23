namespace cliConfig

if [ -d "$CLI_CONFIG_ROOT/current/pyenv" ]; then
    Log 'CLI-CONFIG: Seems cli-config/pyenv is already installed!'
else

    Log "CLI-CONFIG: Installing pyenv"

    CLI_CONFIG_PYENV_ROOT=$CLI_CONFIG_ROOT/current/pyenv

    git clone --depth=1 https://github.com/pyenv/pyenv.git $CLI_CONFIG_PYENV_ROOT

    currentOs=`uname -s`
    if [ $currentOs = "Linux" ]; then
        # TODO: check if we are specifically on Ubuntu
        Log "CLI-CONFIG: Setting up dependencies for pyenv"
        cmd='sudo apt-get --yes install --no-install-recommends make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev'
        Log "CLI-CONFIG: $cmd"
        eval $cmd
    elif [ $currentOs = "Darwin" ]; then
        Log 'CLI-CONFIG: No macOS specific customization need for pyenv'
    fi

    Log "CLI-CONFIG: Installing pyenv virtualenv"
    git clone https://github.com/pyenv/pyenv-virtualenv.git $CLI_CONFIG_ROOT/current/pyenv/plugins/pyenv-virtualenv

    printf "\n\n# pyenv configuration\n" >> $CLI_CONFIG_PROGRAMS_CONF
    printf "export PYENV_ROOT="$CLI_CONFIG_ROOT/current/pyenv"\n" >> $CLI_CONFIG_PROGRAMS_CONF
    printf "export PATH="\$PYENV_ROOT/bin:\$PYENV_ROOT/shims:\$PATH"\n" >> $CLI_CONFIG_PROGRAMS_CONF
    printf "eval \"\$(pyenv init -)\"\n" >> $CLI_CONFIG_PROGRAMS_CONF
    printf "eval \"\$(pyenv virtualenv-init -)\"\n" >> $CLI_CONFIG_PROGRAMS_CONF
    printf "\n\n# --------" >> $CLI_CONFIG_PROGRAMS_CONF
fi