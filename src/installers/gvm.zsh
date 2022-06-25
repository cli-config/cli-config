. "${CLI_CONFIG_ROOT}/src/utils/index.zsh"

typeset -A options=()

Install() {
  export GOROOT="${CLI_CONFIG_ROOT}/current/gvm"
  DEFAULT_GO_VERSION=go1.17.7

  if [ -d "$CLI_CONFIG_ROOT/current/$TOOL" ]; then
    Log 'Seems cli-config/gvm is already installed!'
  else
    Log "Installing gvm"

    curl -sSL https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer | zsh -s -- master "$CLI_CONFIG_ROOT/current"

    currentOs=$(uname -s)
    if [ $currentOs = "Linux" ]; then
      # TODO: check if we are specifically on Ubuntu
      Log "Setting up dependencies for gvm"
      cmd="$CCOPT_DEBIAN_FRONTEND $CCOPT_NO_SUDO apt install --yes --no-install-recommends curl git mercurial make binutils bison gcc build-essential"
      Log "$cmd"
      eval $cmd
    elif [ $currentOs = "Darwin" ]; then
      cmd="brew install mercurial"
      Log "$cmd"
      eval $cmd
    fi

    Log "Installing $DEFAULT_GO_VERSION with gvm"
    export GVM_DIR="$CLI_CONFIG_ROOT/current/gvm"
    . $GOROOT/scripts/gvm
    gvm install $DEFAULT_GO_VERSION -B
    Log "Setting up $DEFAULT_GO_VERSION to be used globally"
    gvm use $DEFAULT_GO_VERSION --default
  fi
}

Configure() {
  export GOROOT="${CLI_CONFIG_ROOT}/current/gvm"
  DEFAULT_GO_VERSION=go1.17.7

  echo -n >$CONF
  printf 'export GVM_DIR="$CLI_CONFIG_ROOT/current/gvm"\n' >>$CONF
  printf "# add gvm to path\n" >>$CONF
  printf 'export PATH="$GVM_DIR:$PATH"\n' >>$CONF
  printf 'lazyload gvm -- "source $GVM_DIR/scripts/gvm"' >>$CONF
}
