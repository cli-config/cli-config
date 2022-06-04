if [ -d "$CLI_CONFIG_ROOT/current/tfenv" ]; then
    Log 'Seems cli-config/tfenv is already installed!'
else

    Log "Installing tfenv"

    CLI_CONFIG_TFENV_ROOT=$CLI_CONFIG_ROOT/current/tfenv

    git clone --depth=1 https://github.com/tfutils/tfenv.git $CLI_CONFIG_TFENV_ROOT
fi
