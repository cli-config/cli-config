. "${CLI_CONFIG_ROOT}/src/utils/index.zsh"

typeset -A options=()

Install() {
  DEFAULT_PYTHON_VERSION=3.10.2

  if [ -d "${TOOL_DIR}" ]; then
    Log 'Seems cli-config/pyenv is already installed!'
  else

    Log "Installing pyenv"

    CLI_CONFIG_PYENV_ROOT=${TOOL_DIR}

    git clone --depth=1 https://github.com/pyenv/pyenv.git $CLI_CONFIG_PYENV_ROOT

    currentOs=$(uname -s)
    if [ $currentOs = "Linux" ]; then
      # TODO: check if we are specifically on Ubuntu
      Log "Setting up dependencies for pyenv"
      cmd="$CCOPT_DEBIAN_FRONTEND $CCOPT_NO_SUDO apt install --yes --no-install-recommends make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev"
      Log "$cmd"
      eval $cmd
    elif [ $currentOs = "Darwin" ]; then
      Log 'No macOS specific customization need for pyenv'
    fi

    Log "Installing pyenv virtualenv"
    git clone https://github.com/pyenv/pyenv-virtualenv.git ${TOOL_DIR}/plugins/pyenv-virtualenv

    Log "Installing python-$DEFAULT_PYTHON_VERSION with pyenv"
    $CLI_CONFIG_PYENV_ROOT/bin/pyenv install $DEFAULT_PYTHON_VERSION
    Log "Installing python-$DEFAULT_PYTHON_VERSION to be used globally"
    $CLI_CONFIG_PYENV_ROOT/bin/pyenv global $DEFAULT_PYTHON_VERSION
  fi
}

Configure() {
  echo -n >$CONF
  printf "export PYENV_ROOT="$CLI_CONFIG_ROOT/current/pyenv"\n" >>$CONF
  printf "export PATH="\$PYENV_ROOT/bin:\$PYENV_ROOT/shims:\$PATH"\n" >>$CONF
  printf "eval \"\$(pyenv init -)\"\n" >>$CONF
  printf "eval \"\$(pyenv virtualenv-init -)\"\n" >>$CONF
}
